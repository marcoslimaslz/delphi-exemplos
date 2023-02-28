object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = 'CEP - REST'
  ClientHeight = 431
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblCEP: TLabel
      Left = 10
      Top = 10
      Width = 24
      Height = 15
      Caption = 'CEP:'
    end
    object Consultar: TButton
      Left = 146
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = ConsultarClick
    end
    object edtCEP: TEdit
      Left = 40
      Top = 10
      Width = 100
      Height = 23
      MaxLength = 9
      TabOrder = 0
      Text = '70150-900'
    end
  end
  object pgcGeral: TPageControl
    Left = 0
    Top = 41
    Width = 614
    Height = 390
    ActivePage = TabResultado
    Align = alClient
    TabOrder = 1
    object TabResultado: TTabSheet
      Caption = 'TabResultado'
      object mmResultado: TMemo
        Left = 0
        Top = 0
        Width = 606
        Height = 360
        Align = alClient
        Lines.Strings = (
          'mmResultado')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object tabJSON: TTabSheet
      Caption = 'Json'
      ImageIndex = 1
      object mmJSON: TMemo
        Left = 0
        Top = 0
        Width = 606
        Height = 360
        Align = alClient
        Lines.Strings = (
          'mmResultado')
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
end
