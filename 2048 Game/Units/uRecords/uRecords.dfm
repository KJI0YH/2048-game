object frmRecords: TfrmRecords
  Left = 369
  Top = 199
  Width = 672
  Height = 320
  Caption = 'Records'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcRecords: TPageControl
    Left = 0
    Top = 0
    Width = 656
    Height = 281
    ActivePage = tsPoints
    Align = alClient
    TabOrder = 0
    object tsPoints: TTabSheet
      Caption = 'Points'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ISOCPEUR'
      Font.Style = []
      ParentFont = False
      OnShow = tsPointsShow
      object lvPoints: TListView
        Left = 0
        Top = 0
        Width = 648
        Height = 253
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Top'
            MaxWidth = 40
            MinWidth = 40
          end
          item
            AutoSize = True
            Caption = 'Nickname'
            MinWidth = 125
          end
          item
            AutoSize = True
            Caption = 'Points'
            MinWidth = 100
          end
          item
            AutoSize = True
            Caption = 'Steps'
            MinWidth = 80
          end
          item
            AutoSize = True
            Caption = 'Time spent'
            MinWidth = 100
          end
          item
            AutoSize = True
            Caption = 'Date'
          end>
        ColumnClick = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'ISOCPEUR'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object tsSpeedrun: TTabSheet
      Caption = 'SpeedRun 2048'
      ImageIndex = 1
      OnShow = tsSpeedrunShow
      object lvSpeedRun: TListView
        Left = 0
        Top = 0
        Width = 648
        Height = 253
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'Top'
            MaxWidth = 40
            MinWidth = 40
          end
          item
            AutoSize = True
            Caption = 'Nickname'
            MinWidth = 125
          end
          item
            AutoSize = True
            Caption = 'Time spent'
            MinWidth = 100
          end
          item
            Caption = 'Points'
            MinWidth = 100
            Width = 122
          end
          item
            Caption = 'Steps'
            MinWidth = 80
            Width = 80
          end
          item
            Caption = 'Date'
            MinWidth = 100
            Width = 120
          end>
        ColumnClick = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'ISOCPEUR'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
end
