unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Client, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON,
  Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    Consultar: TButton;
    edtCEP: TEdit;
    lblCEP: TLabel;
    pgcGeral: TPageControl;
    TabResultado: TTabSheet;
    tabJSON: TTabSheet;
    mmResultado: TMemo;
    mmJSON: TMemo;
    procedure ConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ConsultarCEP(ACEP: string): TStringList;
    function ConsultarCEPJSON(ACEP: string): String;
    procedure Inicializar;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ConsultarClick(Sender: TObject);
begin
  mmResultado.Lines := ConsultarCEP(edtCEP.Text);
  mmJSON.Lines.Text := ConsultarCEPJSON(edtCEP.Text);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TfrmPrincipal.Inicializar;
begin
  mmResultado.Clear;
  edtCEP.Text := '70150-900';
  pgcGeral.TabIndex := 0;
end;

function TfrmPrincipal.ConsultarCEP(ACEP: string): TStringList;
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  Endereco: TStringList;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + ACEP + '/json';
  RESTRequest1.Execute;
  data := RESTResponse1.JSONValue as TJSONObject;
  try
    Endereco := TStringList.Create;
    if Assigned(data) then
    begin
        try
          Endereco.Add(data.Values['logradouro'].Value);
        except
          on Exception do
            Endereco.Add('');
        end;

        try
          Endereco.Add(data.Values['bairro'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;

        try
          Endereco.Add(data.Values['uf'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;

        try
          Endereco.Add(data.Values['localidade'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;

        try
          Endereco.Add(data.Values['complemento'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
      end;
  finally
    FreeAndNil(data);
  end;
  Result := Endereco;
end;

function TfrmPrincipal.ConsultarCEPJSON(ACEP: string): string;
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + ACEP + '/json';
  RESTRequest1.Execute;
  data := RESTResponse1.JSONValue as TJSONObject;
  try
    if Assigned(data) then
    begin
      Result := data.ToString;
    end;
  finally
    FreeAndNil(data);
  end;
end;

end.
