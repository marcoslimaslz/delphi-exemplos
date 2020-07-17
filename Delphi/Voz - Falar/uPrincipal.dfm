object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Voz'
  ClientHeight = 131
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  OnCreate = FormCreate
  OnDblClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 329
    Height = 32
    Align = alTop
    Caption = 
      ' Clique v'#225'rias vezes e rapidamente no formul'#225'rio at'#233' chegar cont' +
      'ar 50 ou mais cliques.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = FormClick
    ExplicitWidth = 307
  end
  object btnFalar: TButton
    Left = 103
    Top = 76
    Width = 105
    Height = 25
    Caption = 'Falar'
    TabOrder = 1
    OnClick = btnFalarClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 112
    Width = 329
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object edtFalar: TEdit
    Left = 8
    Top = 49
    Width = 313
    Height = 21
    MaxLength = 255
    TabOrder = 0
    Text = 'Ol'#225' mundo'
  end
end
