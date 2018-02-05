unit mWikiConvert;

interface

uses
  API_DB,
  API_MVC_DB,
  API_Yandex,
  eExtLink,
  System.JSON,
  System.SyncObjs;

type
  TTransCacheItem = record
    Destination: string;
    Source: string;
    TransDirection: TTransDirection;
  end;

  TTransCache = TArray<TTransCacheItem>;

  TTransCacheHelper = record helper for TTransCache
  public
    function TryToGet(aTransDirection: TTransDirection; const aSource: string): string;
    procedure Add(aTransDirection: TTransDirection; const aSource, aDestination: string);
  end;

  TModelWikiConvert = class(TModelDB)
  private
    FjsnJobCats: TJSONArray;
    FTransCache: TTransCache;
    FYaTranslater: TYaTranslater;
    function GetCategoryIdentifier(aCaption: string): string;
    function GetExtLink(aMaxExtLinkID: Integer): TExtLink;
    function GetMaxExtLink: Integer;
    function GetOrTranslate(aChildExtLink: TExtLink; const aKey: string;
      aTransDirection: TTransDirection; const aOrigValue: string): string;
    function TryGet(aChildExtLink: TExtLink; const aKey: string): string;
    procedure ConvertExtLink(aExtLink: TExtLink);
  public
    inExtDBEngine: TDBEngine;
    inJobCatFilePath: string;
    procedure Start; override;
  end;

var
  CriticalSection: TCriticalSection;

implementation

uses
  API_Files,
  eConvertedLinks,
  eOutput,
  FireDAC.Comp.Client,
  System.SysUtils;

function TModelWikiConvert.TryGet(aChildExtLink: TExtLink; const aKey: string): string;
begin
  Result := aChildExtLink.ExtRecordValue[aKey];

  if Result.IsEmpty and
     (aChildExtLink.ChildExtLink[3] <> nil)
  then
    Result := aChildExtLink.ChildExtLink[3].ExtRecordValue[aKey];

  if Result.IsEmpty and
     (aChildExtLink.ChildExtLink[4] <> nil)
  then
    Result := aChildExtLink.ChildExtLink[4].ExtRecordValue[aKey];
end;

procedure TTransCacheHelper.Add(aTransDirection: TTransDirection; const aSource, aDestination: string);
var
  TransCacheItem: TTransCacheItem;
begin
  TransCacheItem.Destination := aDestination;
  TransCacheItem.Source := aSource;
  TransCacheItem.TransDirection := aTransDirection;

  Self := Self + [TransCacheItem];
end;

function TTransCacheHelper.TryToGet(aTransDirection: TTransDirection; const aSource: string): string;
var
  TransCacheItem: TTransCacheItem;
begin
  Result := '';

  for TransCacheItem in Self do
    if (TransCacheItem.TransDirection = aTransDirection) and
       (TransCacheItem.Source = aSource)
    then
      Exit(TransCacheItem.Destination);
end;

function TModelWikiConvert.GetOrTranslate(aChildExtLink: TExtLink; const aKey: string;
  aTransDirection: TTransDirection; const aOrigValue: string): string;
begin
  Result := '';

  if aChildExtLink <> nil then
    Result := aChildExtLink.ExtRecordValue[aKey];

  if Result.IsEmpty and
     (aOrigValue.Length <= 255)
  then
    Result := FTransCache.TryToGet(aTransDirection, aOrigValue);

  if not aOrigValue.IsEmpty and
     Result.IsEmpty
  then
    begin
      Result := FYaTranslater.Translate(aTransDirection, aOrigValue);
      if Result.Length <= 255 then
        FTransCache.Add(aTransDirection, aOrigValue, Result);
    end;

end;

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
  Output := TOutput.Create(FDBEngine);
  try
    Output.CategoryIdentifier := GetCategoryIdentifier(aExtLink.Job.Caption);
    Output.CTime := aExtLink.HandleTime;

    Output.RuTitle := aExtLink.ExtRecordValue['ru_title'];
    Output.EnTitle := GetOrTranslate(aExtLink.ChildExtLink[3], 'en_title', tdRuEn, Output.RuTitle);
    Output.UaTitle := GetOrTranslate(aExtLink.ChildExtLink[4], 'ua_title', tdRuUa, Output.RuTitle);

    Output.RuCountry := aExtLink.ExtRecordValue['ru_country'];
    Output.EnCountry := GetOrTranslate(aExtLink.ChildExtLink[3], 'en_country', tdRuEn, Output.RuCountry);
    Output.UaCountry := GetOrTranslate(aExtLink.ChildExtLink[4], 'ua_country', tdRuUa, Output.RuCountry);

    Output.RuCity := aExtLink.ExtRecordValue['ru_city'];
    Output.EnCity := GetOrTranslate(aExtLink.ChildExtLink[3], 'en_city', tdRuEn, Output.RuCity);
    Output.UaCity := GetOrTranslate(aExtLink.ChildExtLink[4], 'ua_city', tdRuUa, Output.RuCity);

    Output.RuAddress := aExtLink.ExtRecordValue['ru_address'];
    Output.EnAddress := GetOrTranslate(aExtLink.ChildExtLink[3], 'en_address', tdRuEn, Output.RuAddress);
    Output.UaAddress := GetOrTranslate(aExtLink.ChildExtLink[4], 'ua_address', tdRuUa, Output.RuAddress);

    Output.Email := TryGet(aExtLink, 'email');
    Output.Skype := TryGet(aExtLink, 'skype');
    Output.Phone := TryGet(aExtLink, 'phone');
    Output.SiteURL := TryGet(aExtLink, 'site_url');

    Output.RuContent := aExtLink.ExtRecordValue['ru_content'];
    Output.EnContent := GetOrTranslate(aExtLink.ChildExtLink[3], 'en_content', tdRuEn, Output.RuContent);
    Output.UaContent := GetOrTranslate(aExtLink.ChildExtLink[4], 'ua_content', tdRuUa, Output.RuContent);

    Output.RuContacts := aExtLink.ExtRecordValue['ru_contacts'];
    Output.EnContacts := TryGet(aExtLink, 'en_contacts');
    Output.UaContacts := TryGet(aExtLink, 'ua_contacts');

    Output.RuSource := aExtLink.Link;
    if aExtLink.ChildExtLink[3] <> nil then
      Output.EnSource := aExtLink.ChildExtLink[3].Link
    else
      Output.EnSource := Output.RuSource;
    if aExtLink.ChildExtLink[4] <> nil then
      Output.UaSource := aExtLink.ChildExtLink[4].Link
    else
      Output.UaSource := Output.RuSource;

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

    Result := TExtLink.Create(inExtDBEngine, ExtLinkID);
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
  ExtLinkID: Integer;
  MaxExtLinkID: Integer;
  strJobCats: string;
begin
  strJobCats := TFilesEngine.GetTextFromFile(inJobCatFilePath);
  FYaTranslater := TYaTranslater.Create;
  FjsnJobCats := TJSONObject.ParseJSONValue(strJobCats) as TJSONArray;

  try
    repeat
      try
        CriticalSection.Enter;

        MaxExtLinkID := GetMaxExtLink;
        ExtLink := GetExtLink(MaxExtLinkID);
        ExtLinkID := ExtLink.ID;

        ConvertedLink := TConvertedLink.Create(FDBEngine);
        ConvertedLink.ExtLinkID := ExtLinkID;
        ConvertedLink.Store;

        CriticalSection.Leave;

        try
          ConvertExtLink(ExtLink);
        except
          on E: Exception do
            begin
              ConvertedLink.Error := True;
              ConvertedLink.ErrorMsg := E.Message;
              ConvertedLink.Store;
            end;
        end;
      finally
        ConvertedLink.Free;
        ExtLink.Free;
      end;
    until ExtLinkID = 0;

  finally
    FjsnJobCats.Free;
    FYaTranslater.Free;
  end;
end;

initialization
  CriticalSection := TCriticalSection.Create;

finalization
  CriticalSection.Free;

end.
