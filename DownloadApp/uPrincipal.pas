unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ComCtrls, IdIOHandler, IdIOHandlerSocket,
  IdSSLOpenSSL, Urlmon, ToolWin, ShellAPI;

type
  TfrmPrincipal = class(TForm)
    pbprogresso: TProgressBar;
    ToolBar1: TToolBar;
    btnBaixar: TButton;
    btnFechar: TButton;
    ToolButton1: TToolButton;
    btnExplorar: TButton;
    PageControl1: TPageControl;
    tabDownload: TTabSheet;
    tabLog: TTabSheet;
    mmLista: TMemo;
    mmLog: TMemo;
    ToolButton2: TToolButton;
    btnExemplo: TButton;
    tabConfig: TTabSheet;
    Label1: TLabel;
    edtPrefixo: TEdit;
    procedure btnBaixarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExplorarClick(Sender: TObject);
    procedure btnExemploClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecutarDownload;
    procedure RemoverTagOk;
    function TrocaBarraInvertida(ATexto: String): String;
    function RetornaDataHoraStr: String;
    function RetornaPrefixo: String;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnBaixarClick(Sender: TObject);
begin
  if Trim(mmLista.Lines.Text) <> EmptyStr then
  begin
    try
      ExecutarDownload;
      mmLista.Enabled := False;
    finally
      ShowMessage('Download concluído com sucesso!');
      mmLista.Enabled := True;
    end;
  end
  else
  begin
    MessageDlg('Informe um link para download.', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmPrincipal.ExecutarDownload;
var
  sPath, sExt: String;
  iCont, i: Integer;

  function _DownloadFile(Source, Dest: string): Boolean;
  begin
    try
      Result := UrlDownloadToFile(nil, PChar(source), PChar(Dest), 0, nil) = 0;
    except
      Result := False;
    end;
  end;
begin
  iCont := 0;
  pbprogresso.Max := mmLista.Lines.Count;
  pbprogresso.Position := 0;
  btnBaixar.Enabled := False;
  mmLog.Lines.Clear;
  RemoverTagOk;
  try
    for i := 0 to Pred(mmLista.Lines.Count) do
    begin
      Application.ProcessMessages;
      pbprogresso.Position := i + 1;
      sPath := ExtractFilePath(ParamStr(0)) + 'baixado\';

      if not DirectoryExists(sPath) then
      begin
        ForceDirectories(sPath);
      end;

      sPath := sPath + ExtractFileName(TrocaBarraInvertida(mmLista.Lines.Strings[i]));

        sExt  := ExtractFileExt(sPath);
        sPath := ExtractFilePath(sPath) + ExtractFileName(sPath);
        sPath := StringReplace(sPath, sExt, EmptyStr, [rfReplaceAll]);
        sPath := sPath + '_' + RetornaPrefixo + '_' + RetornaDataHoraStr + sExt;      

      while FileExists(sPath) do
      begin
        Inc(iCont);
        sExt  := ExtractFileExt(sPath);
        sPath := ExtractFilePath(sPath) + ExtractFileName(sPath);
        sPath := StringReplace(sPath, sExt, EmptyStr, [rfReplaceAll]);
        sPath := sPath + '_' + RetornaPrefixo + '_' + RetornaDataHoraStr + sExt;

        Application.ProcessMessages;
      end;

      try
        if _DownloadFile(mmLista.Lines.Strings[i], sPath) then
        begin
          mmLog.Lines.Append('[OK] - ' + mmLista.Lines.Strings[i]);
        end
        else
        begin
          mmLog.Lines.Append('[ERRO] - ' + mmLista.Lines.Strings[i]);
        end;
      except
        btnBaixar.Enabled := True;
      end;
    end;
  finally
    btnBaixar.Enabled := True;
  end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.RemoverTagOk;
var
  i: Integer;
begin
  for i := 0 to Pred(mmLista.Lines.Count) do
  begin
     mmLista.Lines.Strings[i] := StringReplace(mmLista.Lines.Strings[i], '[OK] - ', EmptyStr, [rfReplaceAll]);
  end;
end;

procedure TfrmPrincipal.btnExplorarClick(Sender: TObject);
  function ExecExplorer(OpenAtPath: string;
    OpenWithExplorer, OpenAsRoot: Boolean): Boolean;
  var
    s : string;
  begin
    if OpenWithExplorer then
    begin
      if OpenAsRoot then
        s := ' /e,/root,"' + OpenAtPath + '"'
      else
        s := ' /e,"' + OpenAtPath + '"';
    end
    else
      s := '"' + OpenAtPath + '"';

    Result := ShellExecute(Application.Handle, PChar('open'),
      PChar('explorer.exe'), PChar(s), nil, SW_NORMAL) > 32;
  end;
begin
  ExecExplorer(ExtractFilePath(ParamStr(0)), True, True)
end;

procedure TfrmPrincipal.btnExemploClick(Sender: TObject);
begin
  mmLista.Lines.Clear;
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-522200013.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-543591766.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-584216120.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-588604776.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-601901056.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-603171864.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-612854308.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-621988456.jpg');
  mmLista.Lines.Append('https://ciclovivo.com.br/wp-content/uploads/2018/10/iStock-536613027.jpg');
end;

function TfrmPrincipal.TrocaBarraInvertida(ATexto: String): String;
begin
  ATexto := StringReplace(ATexto, '/', '\', [rfReplaceAll]);
  ATexto := StringReplace(ATexto, '\\', '\', [rfReplaceAll]);
  Result := Trim(ATexto);
end;

function TfrmPrincipal.RetornaDataHoraStr: String;
var
  sTexto: String; 
begin
  DateSeparator := '_';
  TimeSeparator := '_';
  sTexto := DateTimeToStr(Now);
  sTexto := StringReplace(sTexto, '_', EmptyStr, [rfReplaceAll]);
  sTexto := StringReplace(sTexto, ' ', EmptyStr, [rfReplaceAll]);
  Result := Trim(sTexto);
  DateSeparator := '/';
  TimeSeparator := ':';
end;

function TfrmPrincipal.RetornaPrefixo: String;
begin
  if Trim(edtPrefixo.Text) = EmptyStr then
    Result := EmptyStr
  else
    Result := edtPrefixo.Text;
end;

end.
