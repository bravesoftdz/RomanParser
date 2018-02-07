unit mTAParser;

interface

uses
  eLink,
  mParserBase;

type
  TModelTAParser = class(TModelParser)
  private
    procedure ProcessPageCategories(const aPage: string; var aLink: TLink);
    procedure ProcessPageCountries(const aPage: string; var aLink: TLink);
  protected
    procedure ProcessPageRoute(const aPage: string; var aLink: TLink); override;
  end;

implementation

uses
  API_Strings,
  eGroup;

procedure TModelTAParser.ProcessPageRoute(const aPage: string; var aLink: TLink);
begin
  case aLink.Level of
    0: ProcessPageCountries(aPage, aLink);
    1: ProcessPageCategories(aPage, aLink);
  end;
end;

procedure TModelTAParser.ProcessPageCategories(const aPage: string; var aLink: TLink);
begin
  //aLink.BodyGroup.AddRecord();
  //AddLink;
end;

procedure TModelTAParser.ProcessPageCountries(const aPage: string; var aLink: TLink);
var
  CountriesBlock: string;
  Country: string;
  CountryLink: string;
  CountryArr: TArray<string>;
begin
  CountriesBlock := TStrTool.CutByKey(aPage, 'div class="world_destinations container"', '</div>');
  CountryArr := TStrTool.CutArrayByKey(CountriesBlock, '<a href="', '</a>');

  AddInEachGroup(aLink, CountryArr,
    procedure(const aArrRow: string; var aGroup: TGroup)
      begin
        Country := TStrTool.CutByKey(aArrRow, '>', '');
        aGroup.AddRecord('ru_country', Country);

        CountryLink := inDomen + TStrTool.CutByKey(aArrRow, '', '"');
        AddLink(1, CountryLink);
      end
  );
end;

end.
