unit mTAParser;

interface

uses
  eGroup,
  eLink,
  IdCookieManager,
  mParserOnRequests;

type
  TModelTAParser = class(TModelParserOnRequests)
  private
    FCookie: string;
    procedure AddContent(var aContent: string; aContentBlock: string);
    procedure L0ProcessPageCountries(const aPage: string; var aBodyGroup: TGroup);
    procedure L1ProcessPageCategories(const aPage: string; var aBodyGroup: TGroup);
    procedure L2ProcessPageRegion(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
    procedure L3ProcessPageRegions(const aPage: string; var aBodyGroup: TGroup);
    procedure L4ProcessPageObjectRU(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
    procedure L6ProcessPageEmail(const aPage: string; var aBodyGroup: TGroup);
    procedure L7ProcessPageSite(var aBodyGroup: TGroup);
    procedure L8ProcessPageAboutRU(const aPage: string; var aBodyGroup: TGroup);
    procedure L5ProcessPageObjectEN(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
    procedure L9ProcessPageAboutEN(const aPage: string; var aBodyGroup: TGroup);
  protected
    procedure AfterCreate; override;
    //procedure BeforePageLoad(aIdCookieManager: TIdCookieManager; aLink: TLink); override;
    //procedure ProcessPageRoute(const aPage: string; aLink: TLink; var aBodyGroup: TGroup); override;
  end;

implementation

uses
  API_Files,
  API_Strings,
  IdCookie,
  IdURI,
  System.Classes,
  System.SysUtils;

procedure TModelTAParser.L9ProcessPageAboutEN(const aPage: string; var aBodyGroup: TGroup);
begin

end;

procedure TModelTAParser.L5ProcessPageObjectEN(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
begin

end;

procedure TModelTAParser.AddContent(var aContent: string; aContentBlock: string);
begin
  aContentBlock := aContentBlock.Replace('<div', #13#10'<div');
  aContentBlock := aContentBlock.Replace('<DIV', #13#10'<div');
  aContentBlock := TStrTool.RemoveHTMLTags(aContentBlock);
  aContentBlock := aContentBlock.Replace(#13#10#13#10, #13#10, [rfReplaceAll, rfIgnoreCase]);

  if not aContent.isEmpty then
    aContent := aContent + #13#10#13#10;

  aContent := aContent + aContentBlock.Trim;
end;

procedure TModelTAParser.L8ProcessPageAboutRU(const aPage: string; var aBodyGroup: TGroup);
var
  Content: string;
  ContentBlock: string;
  ContentBlockArr: TArray<string>;
begin
  ContentBlock := TStrTool.CutByKey(aPage, '">������</div>', '<div class="is-hidden-desktop');
  ContentBlockArr := TStrTool.CutArrayByKey(ContentBlock, 'class="sub_title">', '</DIV></div></div>');
  for ContentBlock in ContentBlockArr do
    AddContent(Content, ContentBlock);

  ContentBlock := TStrTool.CutByKey(aPage, '">��������� </div>', '</DIV></div>');
  AddContent(Content, ContentBlock);

  ContentBlock := TStrTool.CutByKey(aPage, '">���� �������', '</DIV></div>');
  if not ContentBlock.IsEmpty then
    AddContent(Content, '���� �������'#10#13 + ContentBlock);

  ContentBlock := TStrTool.CutByKey(aPage, '">���������� �������', '</DIV></div>');
  if not ContentBlock.IsEmpty then
    AddContent(Content, '���������� �������'#10#13 + ContentBlock);

  aBodyGroup.AddRecord('ru_content', Content);
end;

procedure TModelTAParser.AfterCreate;
begin
  FCookie := TFilesEngine.GetTextFromFile('Settings\Cookie.txt');

  inherited;
end;

{procedure TModelTAParser.BeforePageLoad(aIdCookieManager: TIdCookieManager; aLink: TLink);
var
  IdCookie: TIdCookie;
  IdURI: TIdURI;
begin
  IdURI := TIdURI.Create(aLink.URL);
  try
    IdCookie := TIdCookie.Create(nil);
    IdCookie.ParseServerCookie(FCookie, IdURI);

    aIdCookieManager.CookieCollection.AddCookie(IdCookie, IdURI);
  finally
    IdURI.Free;
  end;
end; }

procedure TModelTAParser.L7ProcessPageSite(var aBodyGroup: TGroup);
begin
  //aBodyGroup.AddRecord('site_url', FHTTP.URL);
end;

procedure TModelTAParser.L6ProcessPageEmail(const aPage: string; var aBodyGroup: TGroup);
var
  Email: string;
begin
  Email := TStrTool.CutByKey(aPage, 'class="ui_input_text disabled', '>');
  Email := TStrTool.CutByKey(Email, 'value="', '"');
  aBodyGroup.AddRecord('email', Email);
end;

procedure TModelTAParser.L4ProcessPageObjectRU(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
var
  Address: string;
  City: string;
  Country: string;
  Headers: string;
  EmailURL: string;
  EnLink: string;
  Phone: string;
  PostData: string;
  SiteURL: string;
  Title: string;
  TitleAlt: string;
  TitleBlock: string;
  XPuid: string;
begin
  TitleBlock := TStrTool.CutByKey(aPage, '<h1 id="HEADING"', '</h1>');
  Title := TStrTool.CutByKey(TitleBlock, '>', '<').Trim;
  TitleAlt := TStrTool.CutByKey(TitleBlock, 'is-hidden-mobile">', '<').Trim;

  aBodyGroup.AddRecord('title', Title);
  if not TitleAlt.IsEmpty then
    aBodyGroup.AddRecord('title_alt', TitleAlt);

  City := TStrTool.CutByKey(aPage, 'class="ui_pill', '<');
  City := TStrTool.CutByKey(City, '>', '');
  aBodyGroup.AddRecord('city', City);

  Country := TStrTool.CutByKey(aPage, 'class="country-name">', '<');
  aBodyGroup.AddRecord('ru_country', Country);

  Address := TStrTool.CutByKey(aPage, 'class="street-address">', '<div');
  Address := TStrTool.RemoveHTMLTags(Address);
  aBodyGroup.AddRecord('address', Address);

  if aPage.Contains('"ui_icon email"') then
    begin
      EmailURL := 'https://www.tripadvisor.ru/EmailHotel?detail=%s&guests=2&isOfferEmail=false&rooms=1';
      EmailURL := Format(EmailURL, [TStrTool.CutByKey(aLink.URL, '-d', '-')]);
      //aBodyGroup.AddLink(inJobID, 6, EmailURL);
    end;

  Phone := TStrTool.CutByKey(aPage, 'class="ui_icon phone"', '</div>');
  Phone := TStrTool.CutByKey(Phone, '">', '<');
  if not Phone.IsEmpty then
    aBodyGroup.AddRecord('phone', Phone);

  if aPage.Contains('class= "ui_icon laptop"') then
    begin
      SiteURL := 'https://www.tripadvisor.ru/ShowUrl?&excludeFromVS=false&odc=BusinessListingsUrl&d=%s&url=1';
      SiteURL := Format(SiteURL, [TStrTool.CutByKey(aLink.URL, '-d', '-')]);
      //aBodyGroup.AddLink(inJobID, 7, SiteURL);
    end;

  {if aPage.Contains('m+="&needContent') then
    begin
      AddPostOrHeaderData(PostData, 'haveJses', 'earlyRequireDefine,amdearly,global_error,long_lived_global,apg-Hotel_Review,apg-Hotel_Review-in,bootstrap,desktop-rooms-guests-dust-ru,responsive-calendar-templates-dust-ru,taevents');
      AddPostOrHeaderData(PostData, 'haveCsses', 'apg-Hotel_Review-in,responsive_calendars_classic');
      AddPostOrHeaderData(PostData, 'needJses', '');
      AddPostOrHeaderData(PostData, 'needCsses', '');
      AddPostOrHeaderData(PostData, 'needDusts', '');
      AddPostOrHeaderData(PostData, 'needContent', '$prp/resp_hr_about/placement?occur=0');
      AddPostOrHeaderData(PostData, 'metaReferer', 'Hotel_Review');

      AddPostOrHeaderData(Headers, 'origin', 'https://www.tripadvisor.ru');
      AddPostOrHeaderData(Headers, 'referer', aLink.URL);

      XPuid := TStrTool.CutByKey(aPage, 'uid":"', '"');
      AddPostOrHeaderData(Headers, 'x-puid', XPuid);
      AddPostOrHeaderData(Headers, 'x-requested-with', 'XMLHttpRequest');

      aBodyGroup.AddLink(inJobID, 8, 'https://www.tripadvisor.ru/DemandLoadAjax', PostData, Headers);
    end;}

  EnLink := aLink.URL.Replace('.ru', '.com');
  //aBodyGroup.AddLink(inJobID, 5, EnLink);
end;

procedure TModelTAParser.L3ProcessPageRegions(const aPage: string; var aBodyGroup: TGroup);
var
  NextListLink: string;
  RegionBlockArr: TArray<string>;
  RegionLink: string;
begin
  {RegionBlockArr := TStrTool.CutArrayByKey(aPage, 'class="geo_wrap"', '</a>');

  AddAsEachGroup(aBodyGroup, RegionBlockArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        RegionLink := TStrTool.CutByKey(aArrRow, 'href="', '"');
        aGroup.AddLink(inJobID, 2, inDomain + RegionLink);
      end
  );

  NextListLink := TStrTool.CutByKeyRearward(aPage, '#LOCATION_LIST" class="nav next', '"');
  if not NextListLink.IsEmpty then
    aBodyGroup.AddLink(inJobID, 3, inDomain + NextListLink);  }
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
  {HotelBlockArr := TStrTool.CutArrayByKey(aPage, '<div class="listing_title', '</a>');

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
      Geo := TStrTool.CutByKey(aLink.URL, '-g', '-');
      if Geo.IsEmpty then
        begin
          //Geo := aLink.PostDataItem['geo'];
          //XPuid := aLink.HeaderItem['x-puid'];
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
    aBodyGroup.AddLink(inJobID, 3, inDomain + RegionListLink);  }
end;

{procedure TModelTAParser.ProcessPageRoute(const aPage: string; aLink: TLink; var aBodyGroup: TGroup);
begin
  case aLink.Level of
    0: L0ProcessPageCountries(aPage, aBodyGroup);
    1: L1ProcessPageCategories(aPage, aBodyGroup);
    2: L2ProcessPageRegion(aPage, aLink, aBodyGroup);
    3: L3ProcessPageRegions(aPage, aBodyGroup);
    4: L4ProcessPageObjectRU(aPage, aLink, aBodyGroup);
    5: L5ProcessPageObjectEN(aPage, aLink, aBodyGroup);
    6: L6ProcessPageEmail(aPage, aBodyGroup);
    7: L7ProcessPageSite(aBodyGroup);
    8: L8ProcessPageAboutRU(aPage, aBodyGroup);
    9: L9ProcessPageAboutEN(aPage, aBodyGroup);
  end;
end;}

procedure TModelTAParser.L1ProcessPageCategories(const aPage: string; var aBodyGroup: TGroup);
var
  HotelsLink: string;
begin     {
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
    end;   }

  //Group := aBodyGroup.CreateChildGroup;
  //aBodyGroup.AddRecord('test', 'fdsfdsf');
  //AddLink;
end;

procedure TModelTAParser.L0ProcessPageCountries(const aPage: string; var aBodyGroup: TGroup);
var
  CountriesBlock: string;
  CountryLink: string;
  CountryArr: TArray<string>;
begin
  {CountriesBlock := TStrTool.CutByKey(aPage, 'div class="world_destinations container"', '</div>');
  CountryArr := TStrTool.CutArrayByKey(CountriesBlock, '<a href="', '</a>');

  AddAsEachGroup(aBodyGroup, CountryArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        CountryLink := inDomain + TStrTool.CutByKey(aArrRow, '', '"');
        aGroup.AddLink(inJobID, 1, CountryLink);
      end
  );   }
end;

end.
