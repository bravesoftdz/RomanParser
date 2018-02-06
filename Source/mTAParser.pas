unit mTAParser;

interface

uses
  API_HTTP,
  API_MVC_DB,
  eGroup,
  eLink;

type
  TEachGroupRef = reference to procedure(const aArrRow: string; var aGroup: TGroup);

  TModelTAParser = class(TModelDB)
  private
    FHTTP: THTTP;
    function GetNextLink: TLink;
    procedure AddInEachGroup(aLink: TLink; aDataArr: TArray<string>; aEachGroupProc: TEachGroupRef);
    procedure AddLink(const aLevel: Integer; const aURL: string);
    procedure AddZeroLink;
    procedure ProcessLink(aLink: TLink);
    procedure ProcessPage(const aPage: string; var aLink: TLink);
  protected
    procedure AfterCreate; override;
    procedure BeforeDestroy; override;
  public
    inDomen: string;
    inJobID: Integer;
    procedure Start; override;
  published
    procedure ProcessPageCategories(const aPage: string; var aLink: TLink);
    procedure ProcessPageCountries(const aPage: string; var aLink: TLink);
  end;

implementation

uses
  API_Strings,
  eJob,
  FireDAC.Comp.Client;

procedure TModelTAParser.ProcessPageCategories(const aPage: string; var aLink: TLink);
begin
  //aLink.BodyGroup.AddRecord();
  //AddLink;
end;

procedure TModelTAParser.AddLink(const aLevel: Integer; const aURL: string);
var
  Link: TLink;
begin
  Link := TLink.Create(FDBEngine);
  try
    Link.JobID := inJobID;
    Link.Level := aLevel;
    Link.Link := aURL;
    Link.HandledTypeID := 1;

    Link.Store;
  finally
    Link.Free;
  end;
end;

procedure TModelTAParser.AddInEachGroup(aLink: TLink; aDataArr: TArray<string>; aEachGroupProc: TEachGroupRef);
var
  ArrRow: string;
  Group: TGroup;
begin
  for ArrRow in aDataArr do
    begin
      Group := TGroup.Create(FDBEngine);
      aEachGroupProc(ArrRow, Group);
      aLink.GroupList.Add(Group);
    end;
end;

procedure TModelTAParser.ProcessPageCountries(const aPage: string; var aLink: TLink);
var
  CountriesBlock: string;
  Country: string;
  CountryLink: string;
  CountryArr: TArray<string>;
  Group: TGroup;
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

procedure TModelTAParser.ProcessPage(const aPage: string; var aLink: TLink);
begin
  case aLink.Level of
    0: ProcessPageCountries(aPage, aLink);
    1: ProcessPageCategories(aPage, aLink);
  end;
end;

procedure TModelTAParser.BeforeDestroy;
begin
  FHTTP.Free;
end;

procedure TModelTAParser.AfterCreate;
begin
  FHTTP := THTTP.Create;
end;

procedure TModelTAParser.ProcessLink(aLink: TLink);
var
  Page: string;
begin
  Page := FHTTP.Get(aLink.Link);

  ProcessPage(Page, aLink);
end;

procedure TModelTAParser.AddZeroLink;
var
  Job: TJob;
  Link: TLink;
begin
  Job := TJob.Create(FDBEngine, inJobID);
  Link := TLink.Create(FDBEngine);
  try
    Link.JobID := Job.ID;
    Link.Level := 0;
    Link.Link := Job.ZeroLink;
    Link.HandledTypeID := 1;

    Link.Store;
  finally
    Job.Free;
    Link.Free;
  end;
end;

function TModelTAParser.GetNextLink: TLink;
var
  dsQuery: TFDQuery;
  SQL: string;
begin
  dsQuery := TFDQuery.Create(nil);
  try
    SQL := 'select Id from links t where t.job_id = :JobID and t.handled_type_id = 1 order by t.level desc, t.id limit 1 ';
    dsQuery.SQL.Text := SQL;
    dsQuery.ParamByName('JobID').AsInteger := inJobID;
    FDBEngine.OpenQuery(dsQuery);

    if dsQuery.IsEmpty then
      begin
        AddZeroLink;
        Result := GetNextLink;
      end
    else
      Result := TLink.Create(FDBEngine, dsQuery.Fields[0].AsInteger);
  finally
    dsQuery.Free;
  end;
end;

procedure TModelTAParser.Start;
var
  Link: Tlink;
begin
  Link := GetNextLink;

  Link.HandledTypeID := 2;
  Link.Store;

  ProcessLink(Link);

  Link.StoreAll;

  Link.Free;
end;

end.
