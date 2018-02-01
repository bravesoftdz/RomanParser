unit cController;

interface

uses
  API_DB,
  API_DB_MySQL,
  API_DB_SQLite,
  API_MVC_VCLDB,
  mWikiConvert;

type
  TController = class(TControllerVCLDB)
  private
    FSQLiteEngine: TSQLiteEngine;
    procedure InitDB(var aDBEngineClass: TDBEngineClass; out aConnectParams: TConnectParams;
      out aConnectOnCreate: Boolean); override;
  protected
    procedure AfterCreate; override;
    procedure BeforeDestroy; override;
  published
    procedure OnModelWikiConvertInit(aModel: TModelWikiConvert);
    procedure StartWikiConvert;
  end;

var
  DBEngine: TDBEngine;
  ExtDBEngine: TDBEngine;

implementation

procedure TController.OnModelWikiConvertInit(aModel: TModelWikiConvert);
begin
  aModel.inExtDBEngine := FSQLiteEngine;
  aModel.inJobCatFilePath := 'D:\Git\RomanParser\DB\ext_jobs.json';
end;

procedure TController.StartWikiConvert;
begin
  CallModel<TModelWikiConvert>;
end;

procedure TController.BeforeDestroy;
begin
  FSQLiteEngine.CloseConnection;
  FSQLiteEngine.Free;
end;

procedure TController.AfterCreate;
var
  ConnectParams: TConnectParams;
begin
  ConnectParams.DataBase := 'D:\Git\RomanParser\DB\local_wiki.db';

  FSQLiteEngine := TSQLiteEngine.Create(ConnectParams);
  FSQLiteEngine.OpenConnection;

  cController.DBEngine := Self.DBEngine;
  cController.ExtDBEngine := FSQLiteEngine;
end;

procedure TController.InitDB(var aDBEngineClass: TDBEngineClass; out aConnectParams: TConnectParams;
      out aConnectOnCreate: Boolean);
begin
  aDBEngineClass := TMySQLEngine;
  aConnectOnCreate := True;
  aConnectParams.GetFromFile('Settings\MySQL.ini');
end;

end.
