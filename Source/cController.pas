unit cController;

interface

uses
  API_DB,
  API_DB_MySQL,
  API_DB_SQLite,
  API_MVC_VCLDB,
  mTAParser,
  mWikiConvert;

type
  TController = class(TControllerVCLDB)
  private
    function CreateSQLiteEngine: TSQLiteEngine;
    procedure InitDB(var aDBEngineClass: TDBEngineClass; out aConnectParams: TConnectParams;
      out aConnectOnCreate: Boolean); override;
  published
    procedure OnModelTAParserInit(aModel: TModelTAParser);
    procedure OnModelWikiConvertInit(aModel: TModelWikiConvert);
    procedure StartTAParser;
    procedure StartWikiConvert;
  end;

const
  JOBID_TA = 1;
  TA_DOMEN = 'https://www.tripadvisor.ru';

implementation

procedure TController.OnModelTAParserInit(aModel: TModelTAParser);
begin
  aModel.inJobID := JOBID_TA;
  aModel.inDomen := TA_DOMEN;
end;

procedure TController.StartTAParser;
begin
  CallModel<TModelTAParser>;
end;

function TController.CreateSQLiteEngine: TSQLiteEngine;
var
  ConnectParams: TConnectParams;
begin
  ConnectParams.DataBase := 'D:\Git\RomanParser\DB\local_wiki.db';

  Result := TSQLiteEngine.Create(ConnectParams);
  Result.OpenConnection;
end;

procedure TController.OnModelWikiConvertInit(aModel: TModelWikiConvert);
var
  SQLiteEngine: TDBEngine;
begin
  aModel.inExtDBEngine := CreateSQLiteEngine;
  aModel.inJobCatFilePath := 'D:\Git\RomanParser\DB\ext_jobs.json';
end;

procedure TController.StartWikiConvert;
begin
  CallModel<TModelWikiConvert>(10);
end;

procedure TController.InitDB(var aDBEngineClass: TDBEngineClass; out aConnectParams: TConnectParams;
      out aConnectOnCreate: Boolean);
begin
  aDBEngineClass := TMySQLEngine;
  aConnectOnCreate := True;
  aConnectParams.GetFromFile('Settings\MySQL.ini');
end;

end.
