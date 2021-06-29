program ConfiguracaoGeralApp;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {ufrmPrincipal},
  uSombra in 'uSombra.pas' {frmSombra},
  uDica in 'uDica.pas' {frmDica};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Configuração Geral';
  Application.CreateForm(TufrmPrincipal, ufrmPrincipal);
  Application.CreateForm(TfrmSombra, frmSombra);
  Application.CreateForm(TfrmDica, frmDica);
  Application.Run;
end.
