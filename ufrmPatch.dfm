object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 410
  ClientWidth = 599
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
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 599
    Height = 369
    Align = alClient
    Lines.Strings = (
      '>project1.exe'
      '0012F57C:C8->4B'
      '0012F57D:54->6D'
      '0012F57E:C8->D5'
      '0012F57F:54->8B'
      '0012F580:C8->28'
      '0012F581:54->75')
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 369
    Width = 599
    Height = 41
    Align = alBottom
    Caption = 'pnl1'
    TabOrder = 1
    object btn1: TButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Patch'
      TabOrder = 0
      OnClick = btn1Click
    end
  end
end
