unit mWikiConvert;

interface

uses
  API_DB,
  API_MVC_DB,
  eExtLink,
  System.JSON;

type
  TModelWikiConvert = class(TModelDB)
  private
    FjsnJobCats: TJSONArray;
    function GetCategoryIdentifier(aCaption: string): string;
    function GetExtLink(aMaxExtLinkID: Integer): TExtLink;
    function GetMaxExtLink: Integer;
    procedure ConvertExtLink(aExtLink: TExtLink);
  public
    inExtDBEngine: TDBEngine;
    inJobCatFilePath: string;
    procedure Start; override;
  end;

implementation

uses
  API_Files,
  eConvertedLinks,
  eOutput,
  FireDAC.Comp.Client,
  System.SysUtils;

function TModelWikiConvert.GetCategoryIdentifier(aCaption: string): string;
var
  CatCaption: string;
  jsnCatValue: TJSONValue;
begin
  for jsnCatValue in FjsnJobCats do
    begin
      CatCaption := (jsnCatValue as TJSONObject).GetValue('FIELD1').Value;

      if aCaption.Contains(CatCaption) then
        Exit((jsnCatValue as TJSONObject).GetValue('FIELD2').Value);
    end;
end;

procedure TModelWikiConvert.ConvertExtLink(aExtLink: TExtLink);
var
  Output: TOutput;
begin
  Output := TOutput.Create;
  try
    Output.CategoryIdentifier := GetCategoryIdentifier(aExtLink.Job.Caption);
    Output.CTime := aExtLink.HandleTime;
    Output.RuTitle := aExtLink.ExtRecordValue['ru_title'];

    Output.EnTitle := aExtLink.ChildExtLink[3].ExtRecordValue['en_title'];

    Output.Store;
  finally
    Output.Free;
  end;
end;

function TModelWikiConvert.GetExtLink(aMaxExtLinkID: Integer): TExtLink;
var
  dsQuery: TFDQuery;
  ExtLinkID: Integer;
begin
  dsQuery := TFDQuery.Create(nil);
  try
    dsQuery.SQL.Text := 'select min(id) from links t where t.level = 2 and handled = 2 and t.Id > :MaxExtLinkID';
    dsQuery.ParamByName('MaxExtLinkID').AsInteger := aMaxExtLinkID;
    inExtDBEngine.OpenQuery(dsQuery);

    ExtLinkID := dsQuery.Fields[0].AsInteger;

    Result := TExtLink.Create(ExtLinkID);
  finally
    dsQuery.Free;
  end;
end;

function TModelWikiConvert.GetMaxExtLink: Integer;
var
  dsQuery: TFDQuery;
begin
  dsQuery := TFDQuery.Create(nil);
  try
    dsQuery.SQL.Text := 'select max(ext_link_id) from converted_links';
    FDBEngine.OpenQuery(dsQuery);

    Result := dsQuery.Fields[0].AsInteger;
  finally
    dsQuery.Free;
  end;
end;

procedure TModelWikiConvert.Start;
var
  ConvertedLink: TConvertedLink;
  ExtLink: TExtLink;
  MaxExtLinkID: Integer;
  strJobCats: string;
begin
  strJobCats := TFilesEngine.GetTextFromFile(inJobCatFilePath);
  FjsnJobCats := TJSONObject.ParseJSONValue(strJobCats) as TJSONArray;

  MaxExtLinkID := GetMaxExtLink;

  ExtLink := GetExtLink(MaxExtLinkID);
  try
    ConvertExtLink(ExtLink);

    ConvertedLink := TConvertedLink.Create;
    try
      ConvertedLink.ExtLinkID := ExtLink.ID;
      ConvertedLink.Store;
    finally
      ConvertedLink.Free;
    end;
  finally
    ExtLink.Free;
  end;

  FjsnJobCats.Free;
end;

end.
