object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 307
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Add Exp'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 254
    Top = 8
    Width = 185
    Height = 291
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 168
    Width = 33
    Height = 25
    Caption = 'HP+'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 63
    Top = 168
    Width = 33
    Height = 25
    Caption = 'HP-'
    TabOrder = 3
    OnClick = Button3Click
  end
end
