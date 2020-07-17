unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtA: TEdit;
    edtB: TEdit;
    edtResultado: TEdit;
    btnSomar: TButton;
    btnSubtrair: TButton;
    btnMultiplicar: TButton;
    btnDividir: TButton;
    procedure edtAKeyPress(Sender: TObject; var Key: Char);
    procedure btnSomarClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnDividirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function somar(a, b: String): String;
    function subtrair(a, b: String): String;
    function multiplicar(a, b: String): String;
    function dividirr(a, b: String): String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.edtAKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',', #8]) then
    key := #0
end;

procedure TfrmPrincipal.btnDividirClick(Sender: TObject);
begin
  edtResultado.Text := dividirr(edtA.Text, edtB.Text);
end;

procedure TfrmPrincipal.btnMultiplicarClick(Sender: TObject);
begin
  edtResultado.Text := multiplicar(edtA.Text, edtB.Text);
end;

procedure TfrmPrincipal.btnSomarClick(Sender: TObject);
begin
  edtResultado.Text := somar(edtA.Text, edtB.Text);
end;

procedure TfrmPrincipal.btnSubtrairClick(Sender: TObject);
begin
  edtResultado.Text := subtrair(edtA.Text, edtB.Text);
end;

function TfrmPrincipal.dividirr(a, b: String): String;
  var va, vb: Double;
  vres: String;
begin
  try
    va := StrToFloat(a);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vb := StrToFloat(b);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vres := FloatToStr(va/vb);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  Result := vres;
end;

function TfrmPrincipal.multiplicar(a, b: String): String;
  var va, vb: Double;
  vres: String;
begin
  try
    va := StrToFloat(a);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vb := StrToFloat(b);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vres := FloatToStr(va*vb);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  Result := vres;
end;

function TfrmPrincipal.somar(a, b: String): String;
  var va, vb: Double;
  vres: String;
begin
  try
    va := StrToFloat(a);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vb := StrToFloat(b);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vres := FloatToStr(va+vb);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  Result := vres;
end;

function TfrmPrincipal.subtrair(a, b: String): String;
  var va, vb: Double;
  vres: String;
begin
  try
    va := StrToFloat(a);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vb := StrToFloat(b);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  try
    vres := FloatToStr(va-vb);
  except
    on E: Exception do
      raise Exception.Create('Error Message: ['+E.ClassName+'] - '+E.Message);
  end;

  Result := vres;
end;

end.
