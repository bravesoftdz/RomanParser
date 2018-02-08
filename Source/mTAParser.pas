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
  protected
    procedure ProcessPageRoute(const aPage: string; aLink: TLink; var aBodyGroup: TGroup); override;
  end;

implementation

uses
  API_Strings,
  System.Classes,
  System.SysUtils;

procedure TModelTAParser.L2ProcessPageRegion(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
var
  Geo: string;
  Headers: string;
  HotelBlockArr: TArray<string>;
  HotelLink: string;
  NextOffset: Integer;
  PostData: string;
  sNextOffset: string;
  XPuid: string;
begin
  HotelBlockArr := TStrTool.CutArrayByKey(aPage, '<div class="listing_title', '</a>');

  AddAsEachGroup(aBodyGroup, HotelBlockArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        HotelLink := TStrTool.CutByKey(aArrRow, 'href="', '"');
        //aGroup.AddLink(inJobID, 4, inDomain + HotelLink);
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
end;

procedure TModelTAParser.ProcessPageRoute(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
begin
  case aLink.Level of
    0: L0ProcessPageCountries(aPage, aBodyGroup);
    1: L1ProcessPageCategories(aPage, aBodyGroup);
    2: L2ProcessPageRegion(aPage, aLink, aBodyGroup);
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
