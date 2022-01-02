object frmGame: TfrmGame
  Left = 464
  Top = 128
  BorderStyle = bsSingle
  Caption = 'Play!'
  ClientHeight = 565
  ClientWidth = 500
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGame: TPanel
    Left = 0
    Top = 65
    Width = 500
    Height = 500
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object pbGame: TPaintBox
      Left = 1
      Top = 1
      Width = 498
      Height = 498
      Align = alClient
      OnPaint = pbGamePaint
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 65
    Align = alTop
    Color = clWhite
    TabOrder = 1
    object pnlButtons: TPanel
      Left = 1
      Top = 1
      Width = 498
      Height = 63
      Align = alClient
      AutoSize = True
      TabOrder = 0
      DesignSize = (
        498
        63)
      object btnRestart: TButton
        Left = 415
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Restart'
        TabOrder = 0
        TabStop = False
        OnClick = btnRestartClick
      end
      object pnlPoints: TPanel
        Left = 122
        Top = 1
        Width = 105
        Height = 61
        Align = alLeft
        AutoSize = True
        TabOrder = 1
        object lblPoints: TLabel
          Left = 1
          Top = 0
          Width = 47
          Height = 21
          Caption = 'Points: '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'ISOCPEUR'
          Font.Style = []
          ParentFont = False
        end
        object lblRecord: TLabel
          Left = 1
          Top = 36
          Width = 103
          Height = 21
          Caption = 'All-time record: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'ISOCPEUR'
          Font.Style = []
          ParentFont = False
        end
        object lblSteps: TLabel
          Left = 1
          Top = 18
          Width = 44
          Height = 21
          Caption = 'Steps: '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'ISOCPEUR'
          Font.Style = []
          ParentFont = False
        end
      end
      object pnlSteps: TPanel
        Left = 1
        Top = 1
        Width = 121
        Height = 61
        Align = alLeft
        AutoSize = True
        TabOrder = 2
        object lblSpeedrun: TLabel
          Left = 1
          Top = 36
          Width = 119
          Height = 21
          Caption = 'All-time speedrun: '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'ISOCPEUR'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
