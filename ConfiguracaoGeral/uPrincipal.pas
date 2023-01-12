unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList, ToolWin, IniFiles,
  FileCtrl;

type
  TufrmPrincipal = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    grpArquivo: TGroupBox;
    lbxDiretorio: TDirectoryListBox;
    lbxArquivo: TFileListBox;
    Splitter1: TSplitter;
    grpSessao: TGroupBox;
    lbxSessao: TListBox;
    grpChave: TGroupBox;
    lbxChave: TListBox;
    grpValor: TGroupBox;
    mmValor: TMemo;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    StatusBar1: TStatusBar;
    procedure lbxArquivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbxSessaoClick(Sender: TObject);
    procedure lbxChaveClick(Sender: TObject);
    procedure mmValorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    ttyIniFile: TIniFile;
    iMonitor: Integer;    
  public
    { Public declarations }
  end;

var
  ufrmPrincipal: TufrmPrincipal;

implementation

{$R *.dfm}

procedure TufrmPrincipal.lbxArquivoClick(Sender: TObject);
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

procedure TufrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
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
      mmValor.Lines.Text := ttyIniFile.ReadString(lbxSessao.Items.Strings[lbxSessao.ItemIndex],
                            lbxChave.Items.Strings[lbxChave.ItemIndex],
                            EmptyStr);
      mmValor.OnChange := mmValorChange;
      mmValor.Color := $00EFEFEF;
    end
    else
    begin
      mmValor.OnChange := nil;
      mmValor.Lines.Clear;
      mmValor.OnChange := mmValorChange;
    end;
  end;
end;

procedure TufrmPrincipal.lbxChaveClick(Sender: TObject);
begin
  if lbxChave.ItemIndex <> -1 then
  begin
    mmValor.Lines.Clear;
    mmValor.Lines.Text := ttyIniFile.ReadString(lbxSessao.Items.Strings[lbxSessao.ItemIndex],
                          lbxChave.Items.Strings[lbxChave.ItemIndex],
                          EmptyStr);
    mmValor.Color := $00EFEFEF;
  end
  else
    mmValor.Color := clWindow;
end;

procedure TufrmPrincipal.mmValorChange(Sender: TObject);
begin
  ttyIniFile.WriteString(lbxSessao.Items.Strings[lbxSessao.ItemIndex],
                         lbxChave.Items.Strings[lbxChave.ItemIndex],
                         mmValor.Text);
end;

procedure TufrmPrincipal.FormCreate(Sender: TObject);
begin
  lbxDiretorio.FileList := lbxArquivo;
  iMonitor := 0;
end;

procedure TufrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

end.
