unit mTAParser;

interface

uses
  eGroup,
  eLink,
  mParserBase;

type
  TModelTAParser = class(TModelParser)
  private
    procedure L0ProcessPageCountries(const aPage: string; var aBodyGroup: TGroup);
    procedure L1ProcessPageCategories(const aPage: string; var aBodyGroup: TGroup);
    procedure L2ProcessPageRegion(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
    procedure L3ProcessPageRegions(const aPage: string; var aBodyGroup: TGroup);
    procedure L4ProcessPageObject(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
  protected
    procedure ProcessPageRoute(const aPage: string; aLink: TLink; var aBodyGroup: TGroup); override;
  end;

implementation

uses
  API_Strings,
  System.Classes,
  System.SysUtils;

procedure TModelTAParser.L4ProcessPageObject(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
var
  Address: string;
  City: string;
  Title: string;
  TitleAlt: string;
  TitleBlock: string;
begin
  TitleBlock := TStrTool.CutByKey(aPage, '<h1 id="HEADING"', '</h1>');
  Title := TStrTool.CutByKey(TitleBlock, '>', '<').Trim;
  TitleAlt := TStrTool.CutByKey(TitleBlock, 'is-hidden-mobile">', '<').Trim;

  aBodyGroup.AddRecord('title', Title);
  aBodyGroup.AddRecord('title_alt', TitleAlt);

  City := TStrTool.CutByKey(aPage, 'class="ui_pill', '<');
  City := TStrTool.CutByKey(City, '>', '');
  aBodyGroup.AddRecord('city', City);

  Address := TStrTool.CutByKey(aPage, 'class="street-address">', '<div');
  Address := TStrTool.RemoveHTMLTags(Address);
  aBodyGroup.AddRecord('address', Address);
end;

procedure TModelTAParser.L3ProcessPageRegions(const aPage: string; var aBodyGroup: TGroup);
var
  NextListLink: string;
  RegionBlockArr: TArray<string>;
  RegionLink: string;
begin
  RegionBlockArr := TStrTool.CutArrayByKey(aPage, 'class="geo_wrap"', '</a>');

  AddAsEachGroup(aBodyGroup, RegionBlockArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        RegionLink := TStrTool.CutByKey(aArrRow, 'href="', '"');
        aGroup.AddLink(inJobID, 2, inDomain + RegionLink);
      end
  );

  NextListLink := TStrTool.CutByKeyRearward(aPage, '#LOCATION_LIST" class="nav next', '"');
  if not NextListLink.IsEmpty then
    aBodyGroup.AddLink(inJobID, 3, inDomain + NextListLink);
end;

procedure TModelTAParser.L2ProcessPageRegion(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
var
  Geo: string;
  Headers: string;
  HotelBlockArr: TArray<string>;
  HotelLink: string;
  NextOffset: Integer;
  PostData: string;
  RegionBlockArr: TArray<string>;
  RegionLink: string;
  RegionListLink: string;
  sNextOffset: string;
  XPuid: string;
begin
  HotelBlockArr := TStrTool.CutArrayByKey(aPage, '<div class="listing_title', '</a>');

  AddAsEachGroup(aBodyGroup, HotelBlockArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        HotelLink := TStrTool.CutByKey(aArrRow, 'href="', '"');
        aGroup.AddLink(inJobID, 4, inDomain + HotelLink);
      end
  );

  sNextOffset := TStrTool.CutByKeyRearward(aPage, 'class="nav next', '=');
  sNextOffset := TStrTool.CutByKey(sNextOffset, '"', '"');
  NextOffset := StrToIntDef(sNextOffset, 0);

  if NextOffset > 0 then
    begin
      Geo := TStrTool.CutByKey(aLink.Link, '-g', '-');
      if Geo.IsEmpty then
        begin
          Geo := aLink.PostDataItem['geo'];
          XPuid := aLink.HeaderItem['x-puid'];
        end
      else
        XPuid := TStrTool.CutByKey(aPage, 'setRequestHeader(''X-Puid'', ''', '''');

      AddPostOrHeaderData(PostData, 'seen', '0');
      AddPostOrHeaderData(PostData, 'sequence', '1');
      AddPostOrHeaderData(PostData, 'geo', Geo);
      AddPostOrHeaderData(PostData, 'requestingServlet', 'Hotels');
      AddPostOrHeaderData(PostData, 'refineForm', 'true');
      AddPostOrHeaderData(PostData, 'hs', '');
      AddPostOrHeaderData(PostData, 'adults', '2');
      AddPostOrHeaderData(PostData, 'rooms', '1');
      AddPostOrHeaderData(PostData, 'o', 'a' + sNextOffset);
      AddPostOrHeaderData(PostData, 'pageSize', '');
      AddPostOrHeaderData(PostData, 'rad', '0');
      AddPostOrHeaderData(PostData, 'dateBumped', 'NONE');
      AddPostOrHeaderData(PostData, 'displayedSortOrder', 'recommended');

      AddPostOrHeaderData(Headers, 'x-puid', XPuid);
      AddPostOrHeaderData(Headers, 'x-requested-with', 'XMLHttpRequest');

      aBodyGroup.AddLink(inJobID, 2, 'https://www.tripadvisor.ru/Hotels', PostData, Headers);
    end;

  RegionBlockArr := TStrTool.CutArrayByKey(aPage, 'class="geo_wrap"', '</a>');

  AddAsEachGroup(aBodyGroup, RegionBlockArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        RegionLink := TStrTool.CutByKey(aArrRow, 'href="', '"');
        aGroup.AddLink(inJobID, 2, inDomain + RegionLink);
      end
  );

  RegionListLink := TStrTool.CutByKey(aPage, 'leaf_geo_pagination', '#LEAF_GEO_LIST');
  RegionListLink := TStrTool.CutByKey(RegionListLink, '<a href="', '');
  if not RegionListLink.IsEmpty then
    aBodyGroup.AddLink(inJobID, 3, inDomain + RegionListLink);
end;

procedure TModelTAParser.ProcessPageRoute(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
begin
  case aLink.Level of
    0: L0ProcessPageCountries(aPage, aBodyGroup);
    1: L1ProcessPageCategories(aPage, aBodyGroup);
    2: L2ProcessPageRegion(aPage, aLink, aBodyGroup);
    3: L3ProcessPageRegions(aPage, aBodyGroup);
    4: L4ProcessPageObject(aPage, aLink, aBodyGroup);
  end;
end;

procedure TModelTAParser.L1ProcessPageCategories(const aPage: string; var aBodyGroup: TGroup);
var
  HotelsLink: string;
begin
  HotelsLink := TStrTool.CutByKey(aPage, '-hotels"><a href="', '"');
  if not HotelsLink.isEmpty then
    begin
      AddAsEachGroup(aBodyGroup, [HotelsLink],
        procedure(const aArrRow: string; var aGroup: TGroup)
          begin
            aGroup.AddRecord('category_identifier', 'Hotels');
            aGroup.AddLink(inJobID, 2, inDomain + aArrRow);
          end
      );
    end;

  //Group := aBodyGroup.CreateChildGroup;
  //aBodyGroup.AddRecord('test', 'fdsfdsf');
  //AddLink;
end;

procedure TModelTAParser.L0ProcessPageCountries(const aPage: string; var aBodyGroup: TGroup);
var
  CountriesBlock: string;
  Country: string;
  CountryLink: string;
  CountryArr: TArray<string>;
begin
  CountriesBlock := TStrTool.CutByKey(aPage, 'div class="world_destinations container"', '</div>');
  CountryArr := TStrTool.CutArrayByKey(CountriesBlock, '<a href="', '</a>');

  AddAsEachGroup(aBodyGroup, CountryArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        Country := TStrTool.CutByKey(aArrRow, '>', '');
        aGroup.AddRecord('ru_country', Country);

        CountryLink := inDomain + TStrTool.CutByKey(aArrRow, '', '"');
        aGroup.AddLink(inJobID, 1, CountryLink);
      end
  );
end;

end.
