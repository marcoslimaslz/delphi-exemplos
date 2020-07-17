unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.MPlayer, mmSystem, Vcl.ComCtrls, Vcl.ExtCtrls, DateUtils,
  Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlCentro: TPanel;
    btnGravar: TBitBtn;
    btnParar: TBitBtn;
    btnSalvar: TBitBtn;
    tmTempoDecorrido: TTimer;
    pnlInferior: TPanel;
    lblContaTempo: TLabel;
    pbProgresso: TProgressBar;
    Bevel1: TBevel;
    procedure btnGravarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure tmTempoDecorridoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fTempo: Integer;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  try
    pbProgresso.Max := StrToInt(InputBox(frmPrincipal.Caption, 'Tempo em segundos:', '100'));
  except
    on e: Exception do
      raise Exception.Create('Error Message: '+e.Message);
  end;

  if pbProgresso.Max < 1 then
  begin
    raise Exception.Create('Error Message: Informe um tempo válido! O mínimo é 01 segundo.');
  end;

  btnGravar.Enabled := False;
  Caption := 'Gravando';
  btnParar.Enabled := True;
  btnSalvar.Enabled := False;

  fTempo := 0;
  tmTempoDecorrido.Enabled := True;

  mciSendString('OPEN NEW TYPE WAVEAUDIO ALIAS mysound', nil, 0, Handle);
   mciSendString('SET mysound TIME FORMAT MS ' +     // set time
     'BITSPERSAMPLE 8 ' +                // 8 Bit
     'CHANNELS 1 ' +                     // MONO
     'SAMPLESPERSEC 8000 ' +             // 8 KHz
     'BYTESPERSEC 8000',                // 8000 Bytes/s
     nil, 0, Handle);
   mciSendString('RECORD mysound', nil, 0, Handle)
end;

procedure TfrmPrincipal.btnPararClick(Sender: TObject);
begin
  mciSendString('STOP mysound', nil, 0, Handle);
  btnGravar.Enabled := False;
  btnParar.Enabled := False;
  btnSalvar.Enabled := True;
  tmTempoDecorrido.Enabled := False;
  fTempo := 0;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  verz, sArquivo: String;
  ttyTextFile: TextFile;
  ttyNow: TDateTime;
begin
  GetDir(0, verz);

  ttyNow := Now;
  sArquivo := IntToStr(YearOf(ttyNow)) +
              IntToStr(MonthOf(ttyNow)) +
              IntToStr(DayOf(ttyNow));
  sArquivo := sArquivo + '_' + TimeToStr(Time);
  sArquivo := StringReplace(sArquivo, ':', '', [rfReplaceAll]);

  mciSendString(PChar('SAVE mysound ' + verz + '/test.wav'), nil, 0, Handle);
  mciSendString('CLOSE mysound', nil, 0, Handle);

  //Renomeando arquivo
  AssignFile(ttyTextFile, verz + '/test.wav');
  RenameFile(verz + '/test.wav', sArquivo + '.wav');

  btnGravar.Enabled := True;
  btnParar.Enabled := False;
  btnSalvar.Enabled := False;
  Caption := 'Gravar';

  fTempo := 0;
  pbProgresso.Position := 0;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tmTempoDecorrido.Enabled := False;
end;

procedure TfrmPrincipal.tmTempoDecorridoTimer(Sender: TObject);
begin
  Inc(fTempo);
  pbProgresso.Position := fTempo;
  lblContaTempo.Caption := ' '+IntToStr(fTempo) + 's/' + IntToStr(pbProgresso.Max)+'s';

  if pbProgresso.Position >=  pbProgresso.Max then
  begin
    btnParar.Click;
    btnSalvar.Click;
    tmTempoDecorrido.Enabled := False;
  end;
end;

end.
