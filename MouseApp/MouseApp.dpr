program MouseApp;

uses
  Vcl.Forms,
  uPrincipal in 'C:\Users\Marcos\Documents\Embarcadero\Studio\Projects\uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
