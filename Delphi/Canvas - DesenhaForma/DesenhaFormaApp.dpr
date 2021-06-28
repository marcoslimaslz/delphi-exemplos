program DesenhaFormaApp;

uses
  Forms,
  uDesenhaForma in 'uDesenhaForma.pas' {frmDesenhaForma};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDesenhaForma, frmDesenhaForma);
  Application.Run;
end.
