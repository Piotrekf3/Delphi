object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 437
  ClientWidth = 744
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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
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
  object Button2: TButton
    Left = 320
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Oblicz'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 215
    Top = 186
    Width = 99
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 215
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'xx'
  end
  object StringGrid2: TStringGrid
    Left = 401
    Top = 55
    Width = 328
    Height = 362
    Color = clBtnFace
    RowCount = 6
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 5
    ColWidths = (
      64
      64
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
end
