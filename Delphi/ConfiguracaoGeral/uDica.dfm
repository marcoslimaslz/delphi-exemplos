object frmDica: TfrmDica
  Left = -972
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Dicas'
  ClientHeight = 363
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo3: TMemo
    Left = 0
    Top = 0
    Width = 642
    Height = 363
    Align = alClient
    Color = 8454143
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      'Seja bem vindo ao meu programa.'
      ''
      
        'Ele se chama "Configura'#231#227'o Geral" e foi criado para ajudar no ma' +
        'nuseio de arquivos de '
      
        'par'#226'metros do tipos INI (*.ini) e CONF (*.conf), espero que ele ' +
        'seja '#250'til, abaixo uma '
      'breve explica'#231#227'o e meu e-mail e GIT para sugest'#245'es.'
      
        '----------------------------------------------------------------' +
        '----------------------'
      '1) Ajuda:'
      ''
      
        '1.1) Da esquerda voc'#234' ver'#225' o grupo "Arquivo" '#233' selecionado o arq' +
        'uivo a ser editado.'
      ''
      
        '1.2) O grupo "Sess'#227'o" se refere a parte do arquivo que tem o col' +
        'chetes, exemplo:'
      ''
      '[SESSAO]'
      ''
      
        '1.3) O grupo "Chave" se refere ao item dentro da sess'#227'o, exemplo' +
        ':'
      ''
      '[SESSAO]'
      'CHAVE=VALOR'
      ''
      
        '1.4) O grupo "Valor" se refere ao valor propriamente dito, exemp' +
        'los:'
      ''
      'Exemplo 1:'
      ''
      '[SESSAO]'
      'CHAVE=VALOR'
      ''
      '1.5) Veja um exemplo completo de  sess'#227'o com chaves e valores:'
      ''
      '[IMPRESSORA]'
      'MARCA=EPSON'
      'PORTA=COM1'
      'TIPO=TERMICA'
      ''
      
        'Obs: Arquivo tempos a sess'#227'o "IMPRESSORA" sempre dentro de colch' +
        'etes a chave "MARCA" '
      'com valor "EPSON" e assim por diante.'
      ''
      
        'O programa ajuda no caso o arquivo seja muito grande. No grupo "' +
        'Sess'#227'o" e "Chave" eles '
      
        'ficam em ordem alfab'#233'tica, facilitando na busca. No grupo "Valor' +
        '" o programa n'#227'o considera '
      
        'pressionar a tecla "ENTER" do teclado, pois os valores devem ser' +
        ' digitados na mesma linha, '
      
        'voc'#234' ver'#225' que existe uma quebra de linha, ent'#227'o evite pressioner' +
        ' "ENTER."'
      
        '----------------------------------------------------------------' +
        '----------------------'
      '2) Contato:'
      ''
      'E-mail: marcosbew2@hotmail.com'
      
        '----------------------------------------------------------------' +
        '----------------------'
      '3) GIT:'
      ''
      'https://github.com/marcoslimaslz')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
