object frmNickName: TfrmNickName
  Left = 485
  Top = 277
  Align = alCustom
  BorderStyle = bsDialog
  Caption = 'Add nickname to record table'
  ClientHeight = 149
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTop: TLabel
    Left = 0
    Top = 0
    Width = 194
    Height = 21
    Caption = 'Now you are entering the top: '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'ISOCPEUR'
    Font.Style = []
    ParentFont = False
  end
  object lblScore: TLabel
    Left = 0
    Top = 24
    Width = 99
    Height = 21
    Caption = 'with the score: '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'ISOCPEUR'
    Font.Style = []
    ParentFont = False
  end
  object leNickname: TLabeledEdit
    Left = 0
    Top = 72
    Width = 377
    Height = 29
    EditLabel.Width = 134
    EditLabel.Height = 21
    EditLabel.Caption = 'Enter your nickname: '
    EditLabel.Font.Charset = RUSSIAN_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'ISOCPEUR'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'ISOCPEUR'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = leNicknameChange
  end
  object btnAdd: TButton
    Left = 152
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Add'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'ISOCPEUR'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnAddClick
  end
end
