object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'WebNavigatorOle'
  ClientHeight = 492
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 45
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 573
    object btnCarregar: TButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Carregar'
      TabOrder = 0
      OnClick = btnCarregarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 45
    Width = 884
    Height = 447
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitWidth = 573
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 882
      Height = 445
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 571
      object TabSheet1: TTabSheet
        Caption = 'Visualizar'
        ExplicitWidth = 563
        object Splitter1: TSplitter
          Left = 489
          Top = 0
          Width = 5
          Height = 417
          ExplicitLeft = 656
          ExplicitTop = 24
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 417
          Align = alLeft
          Caption = 'Panel3'
          TabOrder = 0
          object WebBrowser1: TWebBrowser
            Left = 1
            Top = 1
            Width = 487
            Height = 415
            Align = alClient
            TabOrder = 0
            OnDocumentComplete = WebBrowser1DocumentComplete
            ExplicitLeft = -420
            ExplicitWidth = 605
            ExplicitHeight = 39
            ControlData = {
              4C00000001220000952A00000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126208000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 497
          Top = 3
          Width = 374
          Height = 411
          Align = alClient
          Caption = 'Panel3'
          TabOrder = 1
          ExplicitLeft = 176
          ExplicitTop = 186
          ExplicitWidth = 185
          ExplicitHeight = 41
          object Memo1: TMemo
            Left = 1
            Top = 1
            Width = 372
            Height = 409
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            HideSelection = False
            Lines.Strings = (
              'Memo1')
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            ExplicitTop = 0
            ExplicitWidth = 183
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'HTML'
        ImageIndex = 1
        ExplicitWidth = 563
        object mmHTML: TMemo
          Left = 0
          Top = 0
          Width = 874
          Height = 417
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HideSelection = False
          Lines.Strings = (
            '<html>'
            ''
            #9'<body>   '
            ''
            #9#9'<form name="form1">'
            #9#9
            #9#9#9'<table border="1" width="100%">'
            #9#9#9#9'<tr> <td> Nome </td> <td> Componente </td> </tr>'#9
            
              #9#9#9#9'<tr> <td> button </td> <td> <input type="button" name="butto' +
              'n1" value="button"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> checkbox </td> <td> <input type="checkbox" name="c' +
              'heckbox1" checked> </td> </tr>'
            
              #9#9#9#9'<tr> <td> color </td> <td> <input type="color" name="color1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> date </td> <td> <input type="date" name="date1"> <' +
              '/td> </tr>'
            
              #9#9#9#9'<tr> <td> datetime-local </td> <td> <input type="datetime-lo' +
              'cal" name="name-local1"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> email </td> <td> <input type="email" name="email1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> file </td> <td> <input type="file" name="file1"> <' +
              '/td> </tr>'
            
              #9#9#9#9'<tr> <td> hidden </td> <td> <input type="hidden" name="hidde' +
              'n1"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> image </td> <td> <input type="image" name="image1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> month </td> <td> <input type="month" name="month1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> number </td> <td> <input type="number" name="numbe' +
              'r1"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> password </td> <td> <input type="password" name="p' +
              'assword1"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> radio </td> <td> <input type="radio" name="radio1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> range </td> <td> <input type="range" name="range1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> reset </td> <td> <input type="reset" name="reset1"' +
              '> </td> </tr>'
            
              #9#9#9#9'<tr> <td> search </td> <td> <input type="search" name="searc' +
              'h1"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> submit </td> <td> <input type="submit" name="submi' +
              't1"> </td> </tr>'
            
              #9#9#9#9'<tr> <td> tel </td> <td> <input type="tel" name="tel1"> </td' +
              '> </tr>'
            
              #9#9#9#9'<tr> <td> text </td> <td> <input type="text" name="text1"> <' +
              '/td> </tr>'
            
              #9#9#9#9'<tr> <td> time </td> <td> <input type="time" name="time1"> <' +
              '/td> </tr>'
            
              #9#9#9#9'<tr> <td> url </td> <td> <input type="url" name="url1"> </td' +
              '> </tr>'
            
              #9#9#9#9'<tr> <td> week </td> <td> <input type="week" name="week1"> <' +
              '/td> </tr>'
            #9#9#9'</table>'
            #9#9'</form>'
            #9
            #9'</body>      '
            #9#9#9#9#9#9
            '</html>')
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          ExplicitWidth = 563
        end
      end
    end
  end
end
