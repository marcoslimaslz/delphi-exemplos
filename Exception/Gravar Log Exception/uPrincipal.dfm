object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Exceptions'
  ClientHeight = 311
  ClientWidth = 194
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
  object btnEStringListError: TButton
    Left = 20
    Top = 20
    Width = 150
    Height = 25
    Action = actEStringListError
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object btnEAccessViolation: TButton
    Left = 20
    Top = 50
    Width = 150
    Height = 25
    Action = actEAccessViolation
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object btnEConvertError: TButton
    Left = 20
    Top = 80
    Width = 150
    Height = 25
    Action = actEConvertError
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object btnEInOutError: TButton
    Left = 20
    Top = 140
    Width = 150
    Height = 25
    Action = actEInOutError
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object btnEDivByZero: TButton
    Left = 20
    Top = 110
    Width = 150
    Height = 25
    Action = actEDivByZero
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object btnEIntOverFlow: TButton
    Left = 20
    Top = 170
    Width = 150
    Height = 25
    Action = actEIntOverFlow
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object btnERangeError: TButton
    Left = 20
    Top = 200
    Width = 150
    Height = 25
    Action = actERangeError
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object btnEZeroDivide: TButton
    Left = 20
    Top = 230
    Width = 150
    Height = 25
    Action = actEZeroDivide
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object btnEDatabaseError: TButton
    Left = 20
    Top = 260
    Width = 150
    Height = 25
    Action = actEDatabaseError
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    OnHint = ApplicationEvents1Hint
    Left = 147
    Top = 93
  end
  object ActionList1: TActionList
    Left = 144
    Top = 147
    object actEStringListError: TAction
      Caption = 'EStringListError'
      OnExecute = actEStringListErrorExecute
    end
    object actEAccessViolation: TAction
      Caption = 'EAccessViolation'
      OnExecute = actEAccessViolationExecute
    end
    object actEConvertError: TAction
      Caption = 'EConvertError'
      OnExecute = actEConvertErrorExecute
    end
    object actEDivByZero: TAction
      Caption = 'EDivByZero'
      OnExecute = actEDivByZeroExecute
    end
    object actEInOutError: TAction
      Caption = 'EInOutError'
      OnExecute = actEInOutErrorExecute
    end
    object actEIntOverFlow: TAction
      Caption = 'EIntOverFlow'
      OnExecute = actEIntOverFlowExecute
    end
    object actEOverflow: TAction
      Caption = 'EOverflow'
    end
    object actERangeError: TAction
      Caption = 'ERangeError'
      OnExecute = actERangeErrorExecute
    end
    object actEUnderflow: TAction
      Caption = 'EUnderflow'
    end
    object actEZeroDivide: TAction
      Caption = 'EZeroDivide'
      OnExecute = actEZeroDivideExecute
    end
    object actEDatabaseError: TAction
      Caption = 'EDatabaseError'
      OnExecute = actEDatabaseErrorExecute
    end
  end
end
