unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    btnCarregar: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    mmHTML: TMemo;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    procedure btnCarregarClick(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const [Ref] URL: OleVariant);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPathPagina: String;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCarregarClick(Sender: TObject);
begin
  mmHTML.Lines.SaveToFile(FPathPagina);
  WebBrowser1.Navigate(FPathPagina);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPathPagina := ExtractFilePath(ParamStr(0))+'pagina.htm';

  if FileExists(FPathPagina) then
    mmHTML.Lines.LoadFromFile(FPathPagina)
  else
  begin
    mmHTML.Lines.Clear;
    mmHTML.Lines.Add('<html>');
    mmHTML.Lines.Add('<body>');
    mmHTML.Lines.Add('<title> Página </title>');
    mmHTML.Lines.Add(EmptyStr);
    mmHTML.Lines.Add('<form name="form1">');
    mmHTML.Lines.Add(EmptyStr);
    mmHTML.Lines.Add('<input type="text" value="valor 1" id="idvalor1" name="valor1"/>');
    mmHTML.Lines.Add('<input type="button" value="Clique 1" id="idclique1" name="clique1"/>');
    mmHTML.Lines.Add('<br>');
    mmHTML.Lines.Add('<input type="text" value="valor 2" id="idvalor2" name="valor2"/>');
    mmHTML.Lines.Add('<input type="button" value="Clique 2" id="idclique2" name="clique2"/>');
    mmHTML.Lines.Add('<br>');
    mmHTML.Lines.Add('<input type="text" value="valor 3" id="idvalor3" name="valor3"/>');
    mmHTML.Lines.Add('<input type="button" value="Clique 3" id="idclique3" name="clique3"/>');
    mmHTML.Lines.Add(EmptyStr);
    mmHTML.Lines.Add('<form>');
    mmHTML.Lines.Add(EmptyStr);
    mmHTML.Lines.Add('</body>');
    mmHTML.Lines.Add('</html>');
  end;
end;

procedure TfrmPrincipal.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const [Ref] URL: OleVariant);
var
 FormItem, Field: Variant;
 i,j: integer;
begin
  Memo1.Lines.Clear;

  for i := 0 to WebBrowser1.OleObject.Document.forms.Length -1 do
  begin
    FormItem := WebBrowser1.OleObject.Document.forms.Item(I);
    for j := 0 to FormItem.Length - 1 do
    begin
      Field := FormItem.Item(j);
      Memo1.Lines.Add(Field.Name);
    end;
  end;
end;

end.
