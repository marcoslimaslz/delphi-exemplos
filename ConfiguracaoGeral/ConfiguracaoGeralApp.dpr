program ConfiguracaoGeralApp;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {ufrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TufrmPrincipal, ufrmPrincipal);
  Application.Run;
end.
