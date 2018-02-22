program RomanParser;

uses
  Vcl.Forms,
  vMain in 'vMain.pas' {ViewMain},
  API_MVC in '..\..\Libs\Delphi\API_MVC.pas',
  cController in 'cController.pas',
  API_MVC_DB in '..\..\Libs\Delphi\API_MVC_DB.pas',
  API_DB in '..\..\Libs\Delphi\API_DB.pas',
  API_MVC_VCLDB in '..\..\Libs\Delphi\API_MVC_VCLDB.pas',
  API_ORM in '..\..\Libs\Delphi\API_ORM.pas',
  API_Crypt in '..\..\Libs\Delphi\API_Crypt.pas',
  API_MVC_VCL in '..\..\Libs\Delphi\API_MVC_VCL.pas' {ViewVCLBase},
  API_DB_MySQL in '..\..\Libs\Delphi\API_DB_MySQL.pas',
  API_DB_SQLite in '..\..\Libs\Delphi\API_DB_SQLite.pas',
  mWikiConvert in 'mWikiConvert.pas',
  eConvertedLinks in 'eConvertedLinks.pas',
  eCommon in '..\..\Libs\DelphiTemplates\Parser_Core\eCommon.pas',
  eExtLink in 'eExtLink.pas',
  eExtJob in 'eExtJob.pas',
  eOutput in 'eOutput.pas',
  API_Files in '..\..\Libs\Delphi\API_Files.pas',
  eExtRecord in 'eExtRecord.pas',
  API_Yandex in '..\..\Libs\Delphi\API_Yandex.pas',
  API_HTTP in '..\..\Libs\Delphi\API_HTTP.pas',
  API_Strings in '..\..\Libs\Delphi\API_Strings.pas',
  mTAParser in 'mTAParser.pas',
  eLink in '..\..\Libs\DelphiTemplates\Parser_Core\eLink.pas',
  eJob in '..\..\Libs\DelphiTemplates\Parser_Core\eJob.pas',
  eGroup in '..\..\Libs\DelphiTemplates\Parser_Core\eGroup.pas',
  eRecord in '..\..\Libs\DelphiTemplates\Parser_Core\eRecord.pas',
  mParserBase in '..\..\Libs\DelphiTemplates\Parser_Core\mParserBase.pas',
  mTestParser in 'mTestParser.pas',
  eIternalRequests in '..\..\Libs\DelphiTemplates\Parser_OnRequests\eIternalRequests.pas',
  mParserCore in '..\..\Libs\DelphiTemplates\Parser_Core\mParserCore.pas',
  mParserOnRequests in '..\..\Libs\DelphiTemplates\Parser_OnRequests\mParserOnRequests.pas';

{$R *.res}

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF DEBUG}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
