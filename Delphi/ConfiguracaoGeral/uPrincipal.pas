unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList, ToolWin, IniFiles, Menus,
  AppEvnts, Buttons, FileCtrl;

type
  TufrmPrincipal = class(TForm)
    grpArquivo: TGroupBox;
    lbxDiretorio: TDirectoryListBox;
    lbxArquivo: TFileListBox;
    Splitter1: TSplitter;
    Splitter4: TSplitter;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    A1: TMenuItem;
    Panel1: TPanel;
    grpSessao: TGroupBox;
    lbxSessao: TListBox;
    Splitter3: TSplitter;
    grpChave: TGroupBox;
    lbxChave: TListBox;
    Splitter2: TSplitter;
    grpValor: TGroupBox;
    mmValor: TMemo;
    StatusBar2: TStatusBar;
    PopupMenu2: TPopupMenu;
    AdicionarSessao1: TMenuItem;
    RemoverSessao1: TMenuItem;
    PopupMenu3: TPopupMenu;
    AdicionarChave1: TMenuItem;
    RemoverChave1: TMenuItem;
    RemovertodasChaves1: TMenuItem;
    RemovertodasSessoes1: TMenuItem;
    procedure lbxArquivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbxSessaoClick(Sender: TObject);
    procedure lbxChaveClick(Sender: TObject);
    procedure mmValorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure A1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure lbxArquivoEnter(Sender: TObject);
    procedure lbxArquivoExit(Sender: TObject);
    procedure lbxSessaoEnter(Sender: TObject);
    procedure lbxSessaoExit(Sender: TObject);
    procedure mmValorEnter(Sender: TObject);
    procedure mmValorExit(Sender: TObject);
    procedure RemoverSessao1Click(Sender: TObject);
    procedure AdicionarSessao1Click(Sender: TObject);
    procedure AdicionarChave1Click(Sender: TObject);
    procedure RemoverChave1Click(Sender: TObject);
    procedure lbxDiretorioChange(Sender: TObject);
    procedure RemovertodasChaves1Click(Sender: TObject);
    procedure RemovertodasSessoes1Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure lbxArquivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    ttyIniFile: TIniFile;
    ttyIniAjuda: TIniFile;
    iMonitor: Integer;
    procedure setChaveSessao;
    procedure setArquivo;
  public
    { Public declarations }
  end;

var
  ufrmPrincipal: TufrmPrincipal;

implementation

uses
  uDica, uSombra;

{$R *.dfm}

procedure TufrmPrincipal.lbxArquivoClick(Sender: TObject);
begin
  setArquivo;
end;

procedure TufrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(ttyIniFile) then
    ttyIniFile.Free;
end;

procedure TufrmPrincipal.lbxSessaoClick(Sender: TObject);
begin
  if lbxSessao.ItemIndex <> -1 then
  begin
    ttyIniFile.ReadSection(lbxSessao.Items.Strings[lbxSessao.ItemIndex], lbxChave.Items);
    lbxChave.Sorted := True;
    mmValor.Color := clWindow;

    if lbxChave.Items.Count = 1 then
    begin
      mmValor.OnChange := nil;
      lbxChave.ItemIndex := 0;
      mmValor.Lines.Text := ttyIniFile.ReadString(lbxSessao.Items.Strings[lbxSessao.ItemIndex], lbxChave.Items.Strings[lbxChave.ItemIndex], EmptyStr);
      mmValor.OnChange := mmValorChange;
    end
    else
    begin
      mmValor.OnChange := nil;
      mmValor.Lines.Clear;
      mmValor.OnChange := mmValorChange;
    end;

    setChaveSessao;
  end;
end;

procedure TufrmPrincipal.lbxChaveClick(Sender: TObject);
begin
  mmValor.Enabled := False;
  if lbxChave.ItemIndex <> -1 then
  begin
    mmValor.Lines.Clear;
    mmValor.Lines.Text := ttyIniFile.ReadString(lbxSessao.Items.Strings[lbxSessao.ItemIndex], lbxChave.Items.Strings[lbxChave.ItemIndex], EmptyStr);
    mmValor.Enabled := True;

    setChaveSessao;
  end;
end;

procedure TufrmPrincipal.mmValorChange(Sender: TObject);
begin
  if lbxChave.ItemIndex <> -1 then
    ttyIniFile.WriteString(lbxSessao.Items.Strings[lbxSessao.ItemIndex], lbxChave.Items.Strings[lbxChave.ItemIndex], mmValor.Text)
  else
  begin
    mmValor.Clear;
    MessageDlg('Selecione uma chave antes de inserir/alterar um valor.', mtError, [mbOk], 0);
  end;
end;

procedure TufrmPrincipal.FormCreate(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'ajuda.tip') then
  begin
    if Assigned(ttyIniAjuda) then
      ttyIniAjuda.Free;

    ttyIniAjuda := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'ajuda.tip');
    ttyIniAjuda.WriteString('EXIBIR', 'DICA', '1');
  end;

  lbxDiretorio.FileList := lbxArquivo;
  iMonitor := 0;
  mmValor.Hint := 'Aqui você informa o valor da chave. Não é aceito textos ' + #13 + 'muito longos e pressionar a tecla enter para quebrar o texto.';
end;

procedure TufrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Screen.MonitorCount > 0) then
  begin
    if (ssCtrl in Shift) and (Key in [VK_LEFT, VK_RIGHT]) then
    begin
      if iMonitor < Screen.MonitorCount - 1 then
        inc(iMonitor)
      else if iMonitor = (Screen.MonitorCount - 1) then
        iMonitor := 0;

      Self.Top := Screen.Monitors[iMonitor].Top;
      Self.Left := Screen.Monitors[iMonitor].Left;
    end;
  end;
end;

procedure TufrmPrincipal.A1Click(Sender: TObject);
begin
  if FileExists(lbxArquivo.FileName) then
    WinExec(PChar('notepad.exe ' + lbxArquivo.FileName), SW_NORMAL);
end;

procedure TufrmPrincipal.PopupMenu1Popup(Sender: TObject);
begin
  if not FileExists(lbxArquivo.FileName) then
    Abort;
end;

procedure TufrmPrincipal.lbxArquivoEnter(Sender: TObject);
begin
  lbxArquivo.Color := $00FFFFD9;
end;

procedure TufrmPrincipal.lbxArquivoExit(Sender: TObject);
begin
  lbxArquivo.Color := clWindow;
end;

procedure TufrmPrincipal.lbxSessaoEnter(Sender: TObject);
begin
  (Sender as TListBox).Color := $00FFFFD9;
end;

procedure TufrmPrincipal.lbxSessaoExit(Sender: TObject);
begin
  (Sender as TListBox).Color := clWindow;
end;

procedure TufrmPrincipal.mmValorEnter(Sender: TObject);
begin
  mmValor.Color := $00FFFFD9;
end;

procedure TufrmPrincipal.mmValorExit(Sender: TObject);
begin
  mmValor.Color := clWindow;
end;

procedure TufrmPrincipal.setChaveSessao;
begin
  if (lbxSessao.ItemIndex <> -1) then
    StatusBar2.Panels[1].Text := lbxSessao.Items.Strings[lbxSessao.ItemIndex];

  if (lbxChave.ItemIndex <> -1) then
    StatusBar2.Panels[3].Text := lbxChave.Items.Strings[lbxChave.ItemIndex];

  StatusBar2.Panels[5].Text := mmValor.Lines.Text;
end;

procedure TufrmPrincipal.AdicionarSessao1Click(Sender: TObject);
var
  sSessao: string;
begin
  sSessao := Trim(InputBox(Application.Title, 'Informe a sessão:', EmptyStr));

  if (sSessao = EmptyStr) then
    Exit;

  if lbxSessao.Items.IndexOf(sSessao) <> -1 then
  begin
    MessageDlg('Sessão já existe!', mtWarning, [mbok], 0);
    Exit;
  end;

  ttyIniFile.WriteString(sSessao, 'Exemplo', EmptyStr);
  ttyIniFile.DeleteKey(sSessao, 'Exemplo');
  lbxSessao.Items.Add(sSessao);
  lbxChave.Items.Clear;
  mmValor.Clear;
end;

procedure TufrmPrincipal.RemoverSessao1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja remover a Sessão?', PChar(Application.Title), 4) = 6 then
  begin
    ttyIniFile.EraseSection(lbxSessao.Items.Strings[lbxSessao.ItemIndex]);
    lbxSessao.DeleteSelected;
    lbxChave.Clear;
  end;
end;

procedure TufrmPrincipal.AdicionarChave1Click(Sender: TObject);
var
  sChave: string;
begin
  sChave := Trim(InputBox(Application.Title, 'Informe a chave:', EmptyStr));

  if (sChave = EmptyStr) then
    Exit;

  if lbxChave.Items.IndexOf(sChave) <> -1 then
  begin
    MessageDlg('Chave já existe!', mtWarning, [mbok], 0);
    Exit;
  end;

  ttyIniFile.WriteString(lbxSessao.Items.Strings[lbxSessao.ItemIndex], sChave, EmptyStr);
  lbxChave.Items.Add(sChave);
end;

procedure TufrmPrincipal.RemoverChave1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja remover a Chave?', PChar(Application.Title), 4) = 6 then
  begin
    ttyIniFile.DeleteKey(lbxSessao.Items.Strings[lbxSessao.ItemIndex], lbxChave.Items.Strings[lbxChave.ItemIndex]);
    lbxChave.DeleteSelected;
    mmValor.Clear;
  end;
end;

procedure TufrmPrincipal.lbxDiretorioChange(Sender: TObject);
begin
  lbxSessao.Clear;
  lbxChave.Clear;
  mmValor.Clear;
  StatusBar2.Panels[0].Text := EmptyStr;
end;

procedure TufrmPrincipal.setArquivo;
begin
  if Assigned(ttyIniFile) then
    ttyIniFile.Free;

  if FileExists(lbxArquivo.FileName) then
  begin
    ttyIniFile := TIniFile.Create(lbxArquivo.FileName);
    ttyIniFile.ReadSections(lbxSessao.Items);
    lbxSessao.Sorted := True;
    StatusBar1.Panels[1].Text := lbxArquivo.FileName;
  end;
end;

procedure TufrmPrincipal.RemovertodasChaves1Click(Sender: TObject);
var
  i: Integer;
begin
  if Application.MessageBox('Deseja remover todas as Chaves?', PChar(Application.Title), 4) = 6 then
  begin
    for i := 0 to lbxChave.Items.Count - 1 do
    begin
      ttyIniFile.DeleteKey(lbxSessao.Items.Strings[lbxSessao.ItemIndex], lbxChave.Items.Strings[i]);
    end;
    lbxChave.Clear;
    mmValor.Clear;
  end;
end;

procedure TufrmPrincipal.RemovertodasSessoes1Click(Sender: TObject);
var
  i: Integer;
begin
  if Application.MessageBox('Deseja remover todas as Sessões?', PChar(Application.Title), 4) = 6 then
  begin
    for i := 0 to lbxSessao.Items.Count - 1 do
    begin
      ttyIniFile.EraseSection(lbxSessao.Items.Strings[i]);
    end;
    lbxSessao.Clear;
    lbxChave.Clear;
    mmValor.Clear;
  end;
end;

procedure TufrmPrincipal.StatusBar1Click(Sender: TObject);
begin
  InputBox('E-mail', 'Mande um mensagem p/ o fabricante:', 'marcosbew2@hotmail.com');
end;

procedure TufrmPrincipal.lbxArquivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_F1..VK_F12] then
  begin
    if (Sender is TFileListBox) then
      Application.MessageBox(PChar((Sender as TFileListBox).Hint), 'Ajuda', MB_ICONQUESTION);
    if (Sender is TListBox) then
      Application.MessageBox(PChar((Sender as TListBox).Hint), 'Ajuda', MB_ICONQUESTION);
    if (Sender is TMemo) then
      Application.MessageBox(PChar((Sender as TMemo).Hint), 'Ajuda', MB_ICONQUESTION);
  end;
end;

procedure TufrmPrincipal.FormActivate(Sender: TObject);
begin
  if Assigned(ttyIniAjuda) then
    ttyIniAjuda.Free;

  ttyIniAjuda := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'ajuda.tip');

  if ttyIniAjuda.ReadString('EXIBIR', 'DICA', '0') = '1' then
  begin
    frmSombra.Show;
    frmDica.ShowModal;
    frmSombra.Close;
    ttyIniAjuda.WriteString('EXIBIR', 'DICA', '0');
  end;
end;

end.

