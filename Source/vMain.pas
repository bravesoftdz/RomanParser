unit vMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  API_MVC,
  API_MVC_VCL, Vcl.StdCtrls, FireDAC.Moni.Base, FireDAC.Moni.RemoteClient;

type
  TViewMain = class(TViewVCLBase)
    btnWikiConvert: TButton;
    btnTAParse: TButton;
    btnParserTest: TButton;
    procedure btnWikiConvertClick(Sender: TObject);
    procedure btnTAParseClick(Sender: TObject);
    procedure btnParserTestClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitMVC(var aControllerClass: TControllerClass); override;
  public
    { Public declarations }
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses
  cController;

procedure TViewMain.btnParserTestClick(Sender: TObject);
begin
  inherited;

  SendMessage('StartTestParser');
end;

procedure TViewMain.btnTAParseClick(Sender: TObject);
begin
  inherited;

  SendMessage('StartTAParser');
end;

procedure TViewMain.btnWikiConvertClick(Sender: TObject);
begin
  inherited;

  SendMessage('StartWikiConvert');
end;

procedure TViewMain.InitMVC(var aControllerClass: TControllerClass);
begin
  aControllerClass := TController;
end;

end.
