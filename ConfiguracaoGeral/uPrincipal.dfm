object ufrmPrincipal: TufrmPrincipal
  Left = 262
  Top = 139
  Width = 830
  Height = 510
  Hint = 'D'#234' un clique nessa barra de status'
  Caption = 'Configura'#231#227'o - v1.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter4: TSplitter
    Left = 185
    Top = 0
    Width = 5
    Height = 452
  end
  object grpArquivo: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 452
    Align = alLeft
    Caption = 'Arquivo'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 2
      Top = 136
      Width = 181
      Height = 5
      Cursor = crVSplit
      Align = alTop
    end
    object lbxDiretorio: TDirectoryListBox
      Left = 2
      Top = 15
      Width = 181
      Height = 121
      Hint = 'Selecione a pasta'
      Align = alTop
      Ctl3D = False
      FileList = lbxArquivo
      ItemHeight = 16
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = lbxDiretorioChange
    end
    object lbxArquivo: TFileListBox
      Left = 2
      Top = 141
      Width = 181
      Height = 309
      Hint = 'Selecione o arquivo de configura'#231#227'o'
      Align = alClient
      Ctl3D = False
      ItemHeight = 13
      Mask = '*.conf;*.ini'
      ParentCtl3D = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 1
      OnClick = lbxArquivoClick
      OnEnter = lbxArquivoEnter
      OnExit = lbxArquivoExit
      OnKeyDown = lbxArquivoKeyDown
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 452
    Width = 814
    Height = 19
    Panels = <
      item
        Text = 'By Marcos Lima (marcosbew2@hotmail.com)'
        Width = 270
      end
      item
        Width = 50
      end>
    OnClick = StatusBar1Click
  end
  object Panel1: TPanel
    Left = 190
    Top = 0
    Width = 624
    Height = 452
    Align = alClient
    TabOrder = 2
    object Splitter3: TSplitter
      Left = 186
      Top = 1
      Width = 5
      Height = 431
    end
    object Splitter2: TSplitter
      Left = 376
      Top = 1
      Width = 5
      Height = 431
    end
    object grpSessao: TGroupBox
      Left = 1
      Top = 1
      Width = 185
      Height = 431
      Align = alLeft
      Caption = ' Sess'#227'o '
      TabOrder = 0
      object lbxSessao: TListBox
        Left = 2
        Top = 15
        Width = 181
        Height = 414
        Hint = 'Selecione a sess'#227'o'
        Align = alClient
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        ParentShowHint = False
        PopupMenu = PopupMenu2
        ShowHint = True
        TabOrder = 0
        OnClick = lbxSessaoClick
        OnEnter = lbxSessaoEnter
        OnExit = lbxSessaoExit
        OnKeyDown = lbxArquivoKeyDown
      end
    end
    object grpChave: TGroupBox
      Left = 191
      Top = 1
      Width = 185
      Height = 431
      Align = alLeft
      Caption = ' Chave '
      TabOrder = 1
      object lbxChave: TListBox
        Left = 2
        Top = 15
        Width = 181
        Height = 414
        Hint = 'Selecione a chave'
        Align = alClient
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        ParentShowHint = False
        PopupMenu = PopupMenu3
        ShowHint = True
        TabOrder = 0
        OnClick = lbxChaveClick
        OnEnter = lbxSessaoEnter
        OnExit = lbxSessaoExit
        OnKeyDown = lbxArquivoKeyDown
      end
    end
    object grpValor: TGroupBox
      Left = 381
      Top = 1
      Width = 242
      Height = 431
      Align = alClient
      Caption = ' Valor '
      TabOrder = 2
      object mmValor: TMemo
        Left = 2
        Top = 15
        Width = 238
        Height = 414
        Align = alClient
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = mmValorChange
        OnEnter = mmValorEnter
        OnExit = mmValorExit
        OnKeyDown = lbxArquivoKeyDown
      end
    end
    object StatusBar2: TStatusBar
      Left = 1
      Top = 432
      Width = 622
      Height = 19
      Panels = <
        item
          Text = 'Sess'#227'o'
          Width = 50
        end
        item
          Width = 120
        end
        item
          Text = 'Chave'
          Width = 50
        end
        item
          Width = 120
        end
        item
          Text = 'Valor'
          Width = 50
        end
        item
          Width = 50
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 96
    Top = 328
    object A1: TMenuItem
      Caption = 'Abrir...'
      OnClick = A1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 263
    Top = 313
    object AdicionarSessao1: TMenuItem
      Caption = 'Adicionar Sess'#227'o'
      OnClick = AdicionarSessao1Click
    end
    object RemoverSessao1: TMenuItem
      Caption = 'Remover Sess'#227'o'
      OnClick = RemoverSessao1Click
    end
    object RemovertodasSessoes1: TMenuItem
      Caption = 'Remover todas as Sess'#245'es'
      OnClick = RemovertodasSessoes1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 453
    Top = 313
    object AdicionarChave1: TMenuItem
      Caption = 'Adicionar Chave'
      OnClick = AdicionarChave1Click
    end
    object RemoverChave1: TMenuItem
      Caption = 'Remover Chave'
      OnClick = RemoverChave1Click
    end
    object RemovertodasChaves1: TMenuItem
      Caption = 'Remover todas as Chaves'
      OnClick = RemovertodasChaves1Click
    end
  end
end
