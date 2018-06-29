object options_form: Toptions_form
  Left = 300
  Top = 187
  Caption = #1054#1087#1094#1080#1080
  ClientHeight = 444
  ClientWidth = 702
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
  object Panel1: TsPanel
    Left = 0
    Top = 403
    Width = 702
    Height = 41
    Align = alBottom
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object Button1: TsButton
      Left = 608
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 2
      SkinData.SkinSection = 'BUTTON'
    end
    object Button2: TsButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button2Click
      SkinData.SkinSection = 'BUTTON'
    end
    object Button3: TsButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1082
      TabOrder = 0
      OnClick = Button3Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object Panel2: TsPanel
    Left = 168
    Top = 0
    Width = 534
    Height = 403
    Align = alRight
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object pagecontrol: TJvPageControl
      Left = 1
      Top = 1
      Width = 532
      Height = 401
      ActivePage = config_page
      Align = alClient
      MultiLine = True
      TabOrder = 0
      ClientBorderWidth = 0
      HideAllTabs = True
      object cover_page: TTabSheet
        Caption = #1054#1073#1083#1086#1078#1082#1080
        object sLabel2: TsLabel
          Left = 6
          Top = 93
          Width = 60
          Height = 13
          Caption = #1041#1080#1073#1083#1080#1086#1090#1077#1082#1072
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object sLabel1: TsLabel
          Left = 5
          Top = 13
          Width = 25
          Height = 13
          Caption = #1055#1091#1090#1100
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
        end
        object skintree: TVirtualStringTree
          Left = 5
          Top = 59
          Width = 329
          Height = 285
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 17
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.MainColumn = -1
          TabOrder = 2
          OnDblClick = skintreeDblClick
          OnGetText = skintreeGetText
          Columns = <>
        end
        object sk_path: TsEdit
          Left = 5
          Top = 32
          Width = 329
          Height = 21
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'C:\delphi components\AlphaControls\Skins\'
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object Button4: TButton
          Left = 340
          Top = 30
          Width = 75
          Height = 25
          Caption = #1055#1086#1083#1091#1095#1080#1090#1100
          TabOrder = 0
          OnClick = Button4Click
        end
        object CheckBox1: TCheckBox
          Left = 340
          Top = 61
          Width = 97
          Height = 17
          Caption = #1040#1082#1090#1080#1074#1085#1086
          TabOrder = 3
          OnClick = CheckBox1Click
        end
      end
      object config_page: TTabSheet
        Caption = #1050#1086#1085#1092#1080#1075
        ImageIndex = 1
        object config_editor: TSynEdit
          Left = 0
          Top = 0
          Width = 532
          Height = 344
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Highlighter = SynXMLSyn1
          Lines.Strings = (
            '<Settings>'
            '<Filters>'
            '<Filters>'
            '</Settings>')
        end
        object Panel4: TPanel
          Left = 0
          Top = 344
          Width = 532
          Height = 37
          Align = alBottom
          TabOrder = 1
          object Button5: TButton
            Left = 4
            Top = 6
            Width = 75
            Height = 25
            Caption = #1057#1086#1079#1076#1072#1090#1100
            TabOrder = 0
            OnClick = Button5Click
          end
          object Button6: TButton
            Left = 85
            Top = 7
            Width = 172
            Height = 25
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1095#1090#1086' '#1074' '#1087#1072#1084#1103#1090#1080
            TabOrder = 1
            OnClick = Button6Click
          end
        end
      end
      object helper_page: TTabSheet
        Caption = #1055#1086#1084#1086#1097#1085#1080#1082
        ImageIndex = 2
      end
    end
  end
  object Panel3: TsPanel
    Left = 0
    Top = 0
    Width = 168
    Height = 403
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object JvNavigationPane: TJvNavigationPane
      Left = 1
      Top = 1
      Width = 166
      Height = 401
      ActivePage = options_navpage
      Align = alClient
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'JvNavigationPane'
      MaximizedCount = 1
      object options_navpage: TJvNavPanelPage
        Left = 0
        Top = 0
        Width = 164
        Height = 336
        Background.Stretch = False
        Background.Proportional = False
        Background.Center = False
        Background.Tile = False
        Background.Transparent = False
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        object JvNavPanelButton3: TJvNavPanelButton
          Left = 3
          Top = 3
          Width = 156
          Caption = #1050#1086#1085#1092#1080#1075
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = [fsBold]
          ParentFont = False
          ImageIndex = 0
          OnClick = JvNavPanelButton3Click
        end
        object JvNavPanelButton2: TJvNavPanelButton
          Left = 3
          Top = 37
          Width = 157
          Caption = #1054#1073#1083#1086#1078#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = [fsBold]
          ParentFont = False
          ImageIndex = 0
          OnClick = JvNavPanelButton2Click
        end
        object JvNavPanelButton1: TJvNavPanelButton
          Left = 3
          Top = 71
          Width = 157
          Caption = #1055#1086#1084#1086#1097#1085#1080#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = [fsBold]
          ParentFont = False
          ImageIndex = 0
          OnClick = JvNavPanelButton1Click
        end
      end
    end
  end
  object sPathDialog1: TsPathDialog
    Root = 'rfDesktop'
    Left = 524
    Top = 112
  end
  object SynXMLSyn1: TSynXMLSyn
    WantBracesParsed = False
    Left = 432
    Top = 48
  end
  object IBDatabaseINI1: TIBDatabaseINI
    UseAppPath = ipoPathToServer
    Section = 'Database Settings'
    Left = 128
    Top = 88
  end
end
