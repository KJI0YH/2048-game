object frmMain: TfrmMain
  Left = 448
  Top = 108
  BorderStyle = bsSingle
  Caption = 'Main menu'
  ClientHeight = 560
  ClientWidth = 500
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 368
    Width = 500
    Height = 192
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object lblSize: TLabel
      Left = 243
      Top = 21
      Width = 21
      Height = 21
      Caption = '3x3'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'ISOCPEUR'
      Font.Style = []
      ParentFont = False
    end
    object lblAuthor: TLabel
      Left = 304
      Top = 152
      Width = 189
      Height = 17
      Caption = 'Developed by Aliaksei Kryzhanouski'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ISOCPEUR'
      Font.Style = []
      ParentFont = False
    end
    object lblUniversity: TLabel
      Left = 432
      Top = 168
      Width = 59
      Height = 17
      Caption = 'BSUIR 2021'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ISOCPEUR'
      Font.Style = []
      ParentFont = False
    end
    object btnLeft: TButton
      Left = 201
      Top = 17
      Width = 25
      Height = 25
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnLeftClick
    end
    object btnRecords: TButton
      Left = 209
      Top = 121
      Width = 89
      Height = 25
      Caption = 'Records'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'ISOCPEUR'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnRecordsClick
    end
    object btnRight: TButton
      Left = 281
      Top = 17
      Width = 25
      Height = 25
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRightClick
    end
    object btnStartGame: TButton
      Left = 209
      Top = 73
      Width = 89
      Height = 25
      Caption = 'Start Game'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'ISOCPEUR'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnStartGameClick
    end
  end
  object pnlField: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object pbField: TPaintBox
      Left = 0
      Top = 0
      Width = 500
      Height = 368
      Align = alClient
      Color = clWhite
      ParentColor = False
      OnPaint = pbFieldPaint
    end
  end
end
