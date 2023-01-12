object frmPrincipal: TfrmPrincipal
  Left = 439
  Top = 229
  Width = 799
  Height = 534
  Caption = 'Download - v1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pbprogresso: TProgressBar
    Left = 0
    Top = 478
    Width = 783
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 783
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    object btnBaixar: TButton
      Left = 0
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Baixar'
      TabOrder = 0
      OnClick = btnBaixarClick
    end
    object btnExplorar: TButton
      Left = 75
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Abrir pasta...'
      TabOrder = 2
      OnClick = btnExplorarClick
    end
    object ToolButton1: TToolButton
      Left = 150
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object btnExemplo: TButton
      Left = 158
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Exemplo'
      TabOrder = 3
      OnClick = btnExemploClick
    end
    object ToolButton2: TToolButton
      Left = 233
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsDivider
    end
    object btnFechar: TButton
      Left = 241
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 783
    Height = 449
    ActivePage = tabDownload
    Align = alClient
    TabOrder = 2
    TabPosition = tpBottom
    object tabDownload: TTabSheet
      Caption = 'Download'
      object mmLista: TMemo
        Left = 0
        Top = 0
        Width = 775
        Height = 423
        Align = alClient
        TabOrder = 0
      end
    end
    object tabLog: TTabSheet
      Caption = 'Log'
      ImageIndex = 1
      object mmLog: TMemo
        Left = 0
        Top = 0
        Width = 775
        Height = 423
        Align = alClient
        TabOrder = 0
      end
    end
    object tabConfig: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 2
      object Label1: TLabel
        Left = 10
        Top = 9
        Width = 32
        Height = 13
        Caption = 'Prefixo'
      end
      object edtPrefixo: TEdit
        Left = 10
        Top = 25
        Width = 361
        Height = 21
        TabOrder = 0
      end
    end
  end
end
