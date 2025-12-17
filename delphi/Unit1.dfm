object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'The Best Calculator Ever'
  ClientHeight = 492
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  StyleElements = [seFont, seClient]
  PixelsPerInch = 96
  TextHeight = 25
  object sevenButton: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 73
    Caption = '7'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = numberButtonClick
  end
  object eightButton: TButton
    Left = 89
    Top = 168
    Width = 75
    Height = 73
    Caption = '8'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = numberButtonClick
  end
  object nineButton: TButton
    Left = 170
    Top = 168
    Width = 75
    Height = 73
    Caption = '9'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = numberButtonClick
  end
  object fourButton: TButton
    Left = 8
    Top = 247
    Width = 75
    Height = 73
    Caption = '4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = numberButtonClick
  end
  object fiveButton: TButton
    Left = 89
    Top = 247
    Width = 75
    Height = 73
    Caption = '5'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = numberButtonClick
  end
  object sixButton: TButton
    Left = 170
    Top = 247
    Width = 75
    Height = 73
    Caption = '6'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = numberButtonClick
  end
  object oneButton: TButton
    Left = 8
    Top = 326
    Width = 75
    Height = 73
    Caption = '1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = numberButtonClick
  end
  object twoButton: TButton
    Left = 89
    Top = 326
    Width = 75
    Height = 73
    Caption = '2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = numberButtonClick
  end
  object threeButton: TButton
    Left = 170
    Top = 326
    Width = 75
    Height = 73
    Caption = '3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = numberButtonClick
  end
  object zeroButton: TButton
    Left = 89
    Top = 405
    Width = 75
    Height = 73
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = numberButtonClick
  end
  object decimalButton: TButton
    Left = 170
    Top = 405
    Width = 75
    Height = 73
    Caption = '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = decimalButtonClick
  end
  object signButton: TButton
    Left = 8
    Top = 405
    Width = 75
    Height = 73
    Caption = #177
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = signButtonClick
  end
  object equalsButton: TButton
    Left = 251
    Top = 405
    Width = 75
    Height = 73
    Caption = '='
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = equalsButtonClick
  end
  object plusButton: TButton
    Left = 251
    Top = 326
    Width = 75
    Height = 73
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = plusButtonClick
  end
  object minusButton: TButton
    Left = 251
    Top = 247
    Width = 75
    Height = 73
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = minusButtonClick
  end
  object multButton: TButton
    Left = 251
    Top = 168
    Width = 75
    Height = 73
    Caption = '*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = multButtonClick
  end
  object divButton: TButton
    Left = 251
    Top = 89
    Width = 75
    Height = 73
    Caption = '/'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = divButtonClick
  end
  object clearButton: TButton
    Left = 8
    Top = 89
    Width = 156
    Height = 73
    Caption = 'clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = clearButtonClick
  end
  object backButton: TButton
    Left = 170
    Top = 89
    Width = 75
    Height = 73
    Caption = #9003
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = backButtonClick
  end
  object screen: TEdit
    Left = 8
    Top = 8
    Width = 318
    Height = 58
    Alignment = taRightJustify
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end
