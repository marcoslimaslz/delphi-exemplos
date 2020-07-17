unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.Math, Vcl.Imaging.jpeg, Vcl.AppEvnts, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Data.DB, Datasnap.DBClient, System.UITypes;

type
  TfrmPrincipal = class(TForm)
    btnEStringListError: TButton;
    ApplicationEvents1: TApplicationEvents;
    btnEAccessViolation: TButton;
    btnEConvertError: TButton;
    btnEInOutError: TButton;
    btnEDivByZero: TButton;
    btnEIntOverFlow: TButton;
    btnERangeError: TButton;
    btnEZeroDivide: TButton;
    btnEDatabaseError: TButton;
    ActionList1: TActionList;
    actEStringListError: TAction;
    actEAccessViolation: TAction;
    actEConvertError: TAction;
    actEDivByZero: TAction;
    actEInOutError: TAction;
    actEIntOverFlow: TAction;
    actEOverflow: TAction;
    actERangeError: TAction;
    actEUnderflow: TAction;
    actEZeroDivide: TAction;
    actEDatabaseError: TAction;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure actEConvertErrorExecute(Sender: TObject);
    procedure actEDivByZeroExecute(Sender: TObject);
    procedure actEAccessViolationExecute(Sender: TObject);
    procedure actEIntOverFlowExecute(Sender: TObject);
    procedure actEDatabaseErrorExecute(Sender: TObject);
    procedure actEStringListErrorExecute(Sender: TObject);
    procedure actERangeErrorExecute(Sender: TObject);
    procedure actEZeroDivideExecute(Sender: TObject);
    procedure actEInOutErrorExecute(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GravarErroLog(E: Exception; Sender: TObject);
    function ObterVersaoWindows: string;
    function ObterNomeUsuario: string;
    procedure GravarImagemFormulario(const NomeArquivo: string);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uSecundario;

procedure TfrmPrincipal.actEAccessViolationExecute(Sender: TObject);
begin
  //Chamando um Form que não foi criado
  frmSecundario.Show;
end;

procedure TfrmPrincipal.actEConvertErrorExecute(Sender: TObject);
begin
  StrToInt('1.1314');
end;

procedure TfrmPrincipal.actEDatabaseErrorExecute(Sender: TObject);
  var ttyClientDataSet: TClientDataSet;
begin
  ttyClientDataSet := TClientDataSet.Create(nil);
  try
    ttyClientDataSet.Open;
  finally
    ttyClientDataSet.Free;
  end;
end;

procedure TfrmPrincipal.actEDivByZeroExecute(Sender: TObject);
  var a, b: Integer;
begin
  a := 0;
  b := 1;
  b := b div a;
  ShowMessage('1 / 0 = '+IntToStr(b));
end;

procedure TfrmPrincipal.actEInOutErrorExecute(Sender: TObject);
  var ttyArquivo: TextFile;
begin
  try
    // Abrindo o arquivo
    AssignFile(ttyArquivo, GetCurrentDir+'\EInOutErrorExecute.txt');
    ReWrite(ttyArquivo);
    // Escrevendo algo no arquivo
    WriteLn(ttyArquivo, 'Escrevendo algo no arquivo');
    // Fechando o arquivo
    CloseFile(ttyArquivo);
  finally
    // Apagando o arquivo
    erase(ttyArquivo);
  end;
  // Aqui gera a exceção, pois já foi excluido
  erase(ttyArquivo);
end;

procedure TfrmPrincipal.actEIntOverFlowExecute(Sender: TObject);
  var iNum : Byte;
begin
  // Habilitada a verificação da exceção 'OverFlowChecks'
  {$OverFlowChecks On}
  iNum := 255;
  Inc(iNum);

  //Apenas alocando a variável para não ter Hint
  actEIntOverFlow.Hint := IntToStr(iNum);
  {$OverFlowChecks Off}
end;

procedure TfrmPrincipal.actERangeErrorExecute(Sender: TObject);
var
  myArray: array[0..5] of string;
  i: Integer;
begin
  // Habilitada a verificação da exceção 'RangeChecks'
  {$RangeChecks On}
  for i := 0 to 6 do
  begin
    myArray[i] := 'Element '+IntToStr(i);
  end;
end;

procedure TfrmPrincipal.actEStringListErrorExecute(Sender: TObject);
  var  ttyStringList: TStringList;
begin
  ttyStringList := TStringList.Create;
  try
    ttyStringList.Clear;
    ttyStringList.Add('Item 1');
    ttyStringList.Add('Item 2');
    ttyStringList.Add('Item 3');

    //Aqui essta o eerro, pois não existe a posição '3'
    ttyStringList.Strings[3] := 'Item 4';
  finally
    ttyStringList.Free;
  end;
end;

procedure TfrmPrincipal.actEZeroDivideExecute(Sender: TObject);
  var a, b: Integer;
      c: Double;
begin
  a := 1;
  b := 0;
  c := a/b;
end;

procedure TfrmPrincipal.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  MessageDlg('[' + E.ClassName + '] ' + #13 + #13 + E.Message, mtError, [mbOk], MB_ICONERROR);
  GravarErroLog(E, Sender);
end;

procedure TfrmPrincipal.ApplicationEvents1Hint(Sender: TObject);
begin
  Caption := 'Exceptions';
  if Application.hint <> EmptyStr then
    Caption := Caption + ' -> ' + Application.hint;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
  var i: Integer;
begin
  // Aqui eu coloco Hint nos botões
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TButton) then
      (Components[i] as TButton).Hint := (Components[i] as TButton).Caption;
  end;
end;

procedure TfrmPrincipal.GravarErroLog(E: Exception; Sender: TObject);
var
  sCaminhoArquivoLog, sDataHora: string;
  ttyArquivoLog: TextFile;
begin
  // Obtém o caminho do arquivo de log
  sCaminhoArquivoLog := GetCurrentDir+'\Exception\';

  if not DirectoryExists(sCaminhoArquivoLog) then
    ForceDirectories(sCaminhoArquivoLog);

  sCaminhoArquivoLog := sCaminhoArquivoLog+'LogExcecoes.txt';

  // Associa o arquivo à variável "ArquivoLog"
  AssignFile(ttyArquivoLog, sCaminhoArquivoLog);

  // Se o arquivo existir, abre para edição,
  // Caso contrário, cria o arquivo
  if FileExists(sCaminhoArquivoLog) then
    Append(ttyArquivoLog)
  else
    ReWrite(ttyArquivoLog);

  sDataHora := FormatDateTime('dd-mm-yyyy_hh-nn-ss', Now);

  GravarImagemFormulario(sDataHora);

  WriteLn(ttyArquivoLog, 'Data/Hora............: ' + DateTimeToStr(Now));
  WriteLn(ttyArquivoLog, 'Imagem...............: ' + sDataHora+'.jpg');
  WriteLn(ttyArquivoLog, 'Mensagem.............: ' + E.Message);
  WriteLn(ttyArquivoLog, 'Classe Exceção.......: ' + E.ClassName);
  WriteLn(ttyArquivoLog, 'Formulário...........: ' + Screen.ActiveForm.Name);
  WriteLn(ttyArquivoLog, 'Unit.................: ' + Sender.UnitName);
  WriteLn(ttyArquivoLog, 'Controle Visual......: ' + Screen.ActiveControl.Name);
  WriteLn(ttyArquivoLog, 'Classe Ctrl. Visual..: ' + Screen.ActiveControl.ClassName);
  WriteLn(ttyArquivoLog, 'Usuário..............: ' + ObterNomeUsuario);
  WriteLn(ttyArquivoLog, 'Versão Windows.......: ' + ObterVersaoWindows);
  WriteLn(ttyArquivoLog, StringOfChar('-', 70));

  CloseFile(ttyArquivoLog);
end;

function TfrmPrincipal.ObterNomeUsuario: string;
var
  Size: DWord;
begin
  Size := 1024;
  SetLength(result, Size);
  GetUserName(PChar(result), Size);
  SetLength(result, Size - 1);
end;

function TfrmPrincipal.ObterVersaoWindows: string;
begin
  case System.SysUtils.Win32MajorVersion of
    5:
      case System.SysUtils.Win32MinorVersion of
        1: result := 'Windows XP';
      end;
    6:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows Vista';
        1: result := 'Windows 7';
        2: result := 'Windows 8';
        3: result := 'Windows 8.1';
      end;
    10:
      case System.SysUtils.Win32MinorVersion of
        0: result := 'Windows 10';
      end;
  end;
end;

procedure TfrmPrincipal.GravarImagemFormulario(const NomeArquivo: string);
var
  ttyBitmap: TBitmap;
  ttyJPEG: TJpegImage;
begin
  ttyJPEG := TJpegImage.Create;
  ttyBitmap := frmPrincipal.GetFormImage;
  try
    ttyJPEG.Assign(ttyBitmap);
    ttyJPEG.SaveToFile(Format('%s\%s.jpg', [GetCurrentDir+'\Exception', NomeArquivo]));
  finally
    ttyJPEG.Free;
    ttyBitmap.Free;
  end;
end;

end.


