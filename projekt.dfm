object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 437
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 270
    Top = 53
    Width = 6
    Height = 13
    Caption = 'x'
  end
  object Label2: TLabel
    Left = 342
    Top = 53
    Width = 4
    Height = 13
    Caption = 'f'
  end
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 73
    Height = 21
    Alignment = taCenter
    TabOrder = 0
    Text = 'n'
    OnChange = Edit1Change
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 55
    Width = 201
    Height = 362
    Color = clBtnFace
    ColCount = 3
    RowCount = 6
    TabOrder = 1
    ColWidths = (
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24
      24)
  end
  object Button1: TButton
    Left = 392
    Top = 72
    Width = 81
    Height = 35
    Caption = 'Dodaj'
    TabOrder = 2
    OnClick = Button1Click
  end
  object MaskEdit1: TMaskEdit
    Left = 248
    Top = 72
    Width = 44
    Height = 21
    TabOrder = 3
    Text = ''
  end
  object MaskEdit2: TMaskEdit
    Left = 320
    Top = 72
    Width = 47
    Height = 21
    TabOrder = 4
    Text = ''
  end
  object Button2: TButton
    Left = 408
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Oblicz'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 281
    Top = 298
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 246
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'xx'
  end
end
