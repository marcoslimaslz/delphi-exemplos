unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SpeechLib_TLB, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    btnFalar: TButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edtFalar: TEdit;
    procedure btnFalarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
    fContClique: integer;
    procedure falarClique;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnFalarClick(Sender: TObject);
var gpIVTxt: ISpVoice;
     Pool: LongWord;
begin
  btnFalar.Enabled := False;
  gpIVTxt := CoSpVoice.Create as ISpVoice;
  gpIVTxt.Speak(PChar(edtFalar.Text), SVSFDefault, Pool);
  btnFalar.Enabled := True;
end;

procedure TfrmPrincipal.falarClique;
  var gpIVTxt: ISpVoice;
       Pool: LongWord;
begin
  if (fContClique >= 50) then
  begin
    gpIVTxt := CoSpVoice.Create as ISpVoice;
    gpIVTxt.Speak(PChar('CLICAR VÀRIAS VEZES, NÃO VAI ACELERAR O PROCESSO.'), SVSFDefault, Pool);
    fContClique := 0;
  end;
end;

procedure TfrmPrincipal.FormClick(Sender: TObject);
begin
  inc(fContClique);
  StatusBar1.Panels[0].Text := 'Clique: '+IntToStr(fContClique);
  falarClique;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fContClique := 0;
end;

end.
