object isblEditorForm: TisblEditorForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088
  ClientHeight = 462
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvToolBar1: TJvToolBar
    Left = 0
    Top = 0
    Width = 785
    Height = 23
    ButtonHeight = 21
    ButtonWidth = 63
    Caption = 'JvToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 0
    end
  end
  object JvStatusBar1: TJvStatusBar
    Left = 0
    Top = 443
    Width = 785
    Height = 19
    Panels = <>
  end
  object isbl_dev_edit: TSynEdit
    Left = 0
    Top = 23
    Width = 785
    Height = 342
    Align = alClient
    Ctl3D = True
    ParentCtl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Consolas'
    Font.Pitch = fpFixed
    Font.Style = []
    TabOrder = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Terminal'
    Gutter.Font.Style = []
    OnProcessCommand = isbl_dev_editProcessCommand
    RemovedKeystrokes = <
      item
        Command = ecContextHelp
        ShortCut = 112
      end>
    AddedKeystrokes = <
      item
        Command = ecContextHelp
        ShortCut = 16496
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 365
    Width = 785
    Height = 78
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 3
    object Button1: TButton
      Left = 625
      Top = 11
      Width = 150
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1081
      TabOrder = 0
      OnClick = Button1Click
    end
    object lexerMini: TButton
      Left = 5
      Top = 6
      Width = 150
      Height = 25
      Caption = #1052#1080#1085#1080' '#1083#1077#1082#1089#1077#1088
      TabOrder = 1
      OnClick = lexerMiniClick
    end
  end
  object MainMenu: TMainMenu
    Left = 475
    Top = 45
    object J1: TMenuItem
      Caption = #1054#1090#1083#1072#1076#1082#1072
    end
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
    end
    object N3: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
    end
    object N4: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1082#1072
    end
    object N5: TMenuItem
      Caption = #1042#1080#1076
    end
    object N6: TMenuItem
      Caption = #1055#1086#1080#1089#1082
    end
    object N7: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
    end
    object N8: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
    end
  end
  object SynCompletionProposal: TSynCompletionProposal
    Options = [scoLimitToMatchedText, scoUseInsertList, scoUsePrettyText, scoUseBuiltInTimer, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter]
    ClTitleBackground = clCaptionText
    Width = 450
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        BiggestWord = 'CONSTRUCTOR'
      end>
    OnExecute = SynCompletionProposalExecute
    ShortCut = 16416
    Editor = isbl_dev_edit
    TimerInterval = 10
    Left = 321
    Top = 190
  end
  object AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler
    Style = bsOffice2010Silver
    AutoThemeAdapt = True
    BorderColor = 9224369
    BorderColorHot = 15590880
    ButtonAppearance.Color = clWhite
    ButtonAppearance.ColorTo = 15590880
    ButtonAppearance.ColorChecked = 7131391
    ButtonAppearance.ColorCheckedTo = 7131391
    ButtonAppearance.ColorDown = 7131391
    ButtonAppearance.ColorDownTo = 8122111
    ButtonAppearance.ColorHot = 9102333
    ButtonAppearance.ColorHotTo = 14285309
    ButtonAppearance.BorderDownColor = 3181250
    ButtonAppearance.BorderHotColor = 5819121
    ButtonAppearance.BorderCheckedColor = 3181250
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Tahoma'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = 15921133
    CaptionAppearance.CaptionColorTo = 15921133
    CaptionAppearance.CaptionTextColor = 6774616
    CaptionAppearance.CaptionBorderColor = 15921133
    CaptionAppearance.CaptionColorHot = 16250355
    CaptionAppearance.CaptionColorHotTo = 16250355
    CaptionAppearance.CaptionTextColorHot = 6774616
    CaptionAppearance.CaptionBorderColorHot = 16117737
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = clWhite
    Color.ColorTo = 15590880
    Color.Direction = gdVertical
    Color.Mirror.Color = 16777214
    Color.Mirror.ColorTo = 16777214
    Color.Mirror.ColorMirror = 16777214
    Color.Mirror.ColorMirrorTo = 15921133
    ColorHot.Color = 16777214
    ColorHot.ColorTo = 16777214
    ColorHot.Direction = gdVertical
    ColorHot.Mirror.Color = 16777214
    ColorHot.Mirror.ColorTo = 16777214
    ColorHot.Mirror.ColorMirror = 16777214
    ColorHot.Mirror.ColorMirrorTo = 16250355
    CompactGlowButtonAppearance.BorderColor = 13815240
    CompactGlowButtonAppearance.BorderColorHot = 5819121
    CompactGlowButtonAppearance.BorderColorDown = 3181250
    CompactGlowButtonAppearance.BorderColorChecked = 3181250
    CompactGlowButtonAppearance.ColorTo = 15590880
    CompactGlowButtonAppearance.ColorChecked = 14285309
    CompactGlowButtonAppearance.ColorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorDisabled = clNone
    CompactGlowButtonAppearance.ColorDisabledTo = clNone
    CompactGlowButtonAppearance.ColorDown = 7131391
    CompactGlowButtonAppearance.ColorDownTo = 8122111
    CompactGlowButtonAppearance.ColorHot = 9102333
    CompactGlowButtonAppearance.ColorHotTo = 14285309
    CompactGlowButtonAppearance.ColorMirror = 15590880
    CompactGlowButtonAppearance.ColorMirrorTo = 15590880
    CompactGlowButtonAppearance.ColorMirrorHot = 14285309
    CompactGlowButtonAppearance.ColorMirrorHotTo = 9102333
    CompactGlowButtonAppearance.ColorMirrorDown = 8122111
    CompactGlowButtonAppearance.ColorMirrorDownTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorChecked = 7131391
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    CompactGlowButtonAppearance.ColorMirrorDisabled = clNone
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = clNone
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = 15590880
    DockColor.ColorTo = clWhite
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    FloatingWindowBorderColor = 13486790
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GlowButtonAppearance.BorderColor = 13815240
    GlowButtonAppearance.BorderColorHot = 5819121
    GlowButtonAppearance.BorderColorDown = 3181250
    GlowButtonAppearance.BorderColorChecked = 3181250
    GlowButtonAppearance.ColorTo = 15590880
    GlowButtonAppearance.ColorChecked = 14285309
    GlowButtonAppearance.ColorCheckedTo = 7131391
    GlowButtonAppearance.ColorDisabled = clNone
    GlowButtonAppearance.ColorDisabledTo = clNone
    GlowButtonAppearance.ColorDown = 7131391
    GlowButtonAppearance.ColorDownTo = 8122111
    GlowButtonAppearance.ColorHot = 9102333
    GlowButtonAppearance.ColorHotTo = 14285309
    GlowButtonAppearance.ColorMirror = 15590880
    GlowButtonAppearance.ColorMirrorTo = 15590880
    GlowButtonAppearance.ColorMirrorHot = 14285309
    GlowButtonAppearance.ColorMirrorHotTo = 9102333
    GlowButtonAppearance.ColorMirrorDown = 8122111
    GlowButtonAppearance.ColorMirrorDownTo = 7131391
    GlowButtonAppearance.ColorMirrorChecked = 7131391
    GlowButtonAppearance.ColorMirrorCheckedTo = 7131391
    GlowButtonAppearance.ColorMirrorDisabled = clNone
    GlowButtonAppearance.ColorMirrorDisabledTo = clNone
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = 1340927
    GroupAppearance.Color = 4636927
    GroupAppearance.ColorTo = 4636927
    GroupAppearance.ColorMirror = 4636927
    GroupAppearance.ColorMirrorTo = 4636927
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Tahoma'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clWhite
    GroupAppearance.CaptionAppearance.CaptionColor = 15921133
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15921133
    GroupAppearance.CaptionAppearance.CaptionTextColor = 6774616
    GroupAppearance.CaptionAppearance.CaptionBorderColor = 15921133
    GroupAppearance.CaptionAppearance.CaptionColorHot = 16250355
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 16250355
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = 6774616
    GroupAppearance.CaptionAppearance.CaptionBorderColorHot = 16117737
    GroupAppearance.PageAppearance.BorderColor = 15921133
    GroupAppearance.PageAppearance.Color = 16777214
    GroupAppearance.PageAppearance.ColorTo = 16777214
    GroupAppearance.PageAppearance.ColorMirror = 16777214
    GroupAppearance.PageAppearance.ColorMirrorTo = 15921133
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.PageAppearance.ShadowColor = clGray
    GroupAppearance.PageAppearance.HighLightColor = clSilver
    GroupAppearance.TabAppearance.BorderColor = 13815240
    GroupAppearance.TabAppearance.BorderColorHot = 1340927
    GroupAppearance.TabAppearance.BorderColorSelected = 1340927
    GroupAppearance.TabAppearance.BorderColorSelectedHot = 1340927
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = 14404026
    GroupAppearance.TabAppearance.Color = clWhite
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 16777214
    GroupAppearance.TabAppearance.ColorSelectedTo = 16777214
    GroupAppearance.TabAppearance.ColorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorDisabledTo = 15921906
    GroupAppearance.TabAppearance.ColorHot = 16777214
    GroupAppearance.TabAppearance.ColorHotTo = 16777214
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 16777214
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 16777214
    GroupAppearance.TabAppearance.ColorMirrorSelected = 16777214
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 16777214
    GroupAppearance.TabAppearance.ColorMirrorDisabled = 15921906
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = 15921906
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = 6381406
    GroupAppearance.TabAppearance.TextColorHot = 6774616
    GroupAppearance.TabAppearance.TextColorSelected = 6774616
    GroupAppearance.TabAppearance.TextColorDisabled = clGray
    GroupAppearance.TabAppearance.ShadowColor = 12565174
    GroupAppearance.TabAppearance.HighLightColor = 16775871
    GroupAppearance.TabAppearance.HighLightColorHot = 16777214
    GroupAppearance.TabAppearance.HighLightColorSelected = 13815240
    GroupAppearance.TabAppearance.HighLightColorSelectedHot = 15590880
    GroupAppearance.TabAppearance.HighLightColorDown = 16119026
    GroupAppearance.ToolBarAppearance.BorderColor = 15921133
    GroupAppearance.ToolBarAppearance.BorderColorHot = 13092807
    GroupAppearance.ToolBarAppearance.Color.Color = 16777214
    GroupAppearance.ToolBarAppearance.Color.ColorTo = 15921133
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 16777214
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 16250355
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = 15921133
    PageAppearance.Color = 16777214
    PageAppearance.ColorTo = 16777214
    PageAppearance.ColorMirror = 16777214
    PageAppearance.ColorMirrorTo = 15921133
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PageAppearance.ShadowColor = clGray
    PageAppearance.HighLightColor = clSilver
    PagerCaption.BorderColor = 13815240
    PagerCaption.Color = 13946827
    PagerCaption.ColorTo = 13946827
    PagerCaption.ColorMirror = 13946827
    PagerCaption.ColorMirrorTo = 13946827
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clGray
    PagerCaption.TextColorExtended = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -13
    PagerCaption.Font.Name = 'Tahoma'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = 13815240
    QATAppearance.Color = clWhite
    QATAppearance.ColorTo = 15590880
    QATAppearance.FullSizeBorderColor = 13815240
    QATAppearance.FullSizeColor = clWhite
    QATAppearance.FullSizeColorTo = 15590880
    RightHandleColor = clWhite
    RightHandleColorTo = 15590880
    RightHandleColorHot = 14285309
    RightHandleColorHotTo = 9102333
    RightHandleColorDown = 8122111
    RightHandleColorDownTo = 7131391
    TabAppearance.BorderColor = 13815240
    TabAppearance.BorderColorHot = 12236209
    TabAppearance.BorderColorSelected = 12565174
    TabAppearance.BorderColorSelectedHot = 12236209
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = 14404026
    TabAppearance.Color = clWhite
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = 16777214
    TabAppearance.ColorSelectedTo = 16777214
    TabAppearance.ColorDisabled = 15921906
    TabAppearance.ColorDisabledTo = 15921906
    TabAppearance.ColorHot = 16777214
    TabAppearance.ColorHotTo = 16777214
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 16777214
    TabAppearance.ColorMirrorHotTo = 16777214
    TabAppearance.ColorMirrorSelected = 16777214
    TabAppearance.ColorMirrorSelectedTo = 16777214
    TabAppearance.ColorMirrorDisabled = 15921906
    TabAppearance.ColorMirrorDisabledTo = 15921906
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Tahoma'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = 6381406
    TabAppearance.TextColorHot = 6774616
    TabAppearance.TextColorSelected = 6774616
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.ShadowColor = 12565174
    TabAppearance.HighLightColor = 16775871
    TabAppearance.HighLightColorHot = 16777214
    TabAppearance.HighLightColorSelected = 13815240
    TabAppearance.HighLightColorSelectedHot = 15590880
    TabAppearance.HighLightColorDown = 16119026
    TabAppearance.BackGround.Color = 16446701
    TabAppearance.BackGround.ColorTo = 16710906
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 105
    Top = 190
  end
  object JvDockVSNetStyle: TJvDockVSNetStyle
    AlwaysShowGrabber = False
    TabServerOption.ActiveFont.Charset = DEFAULT_CHARSET
    TabServerOption.ActiveFont.Color = clWindowText
    TabServerOption.ActiveFont.Height = -11
    TabServerOption.ActiveFont.Name = 'Tahoma'
    TabServerOption.ActiveFont.Style = []
    TabServerOption.InactiveFont.Charset = DEFAULT_CHARSET
    TabServerOption.InactiveFont.Color = 5395794
    TabServerOption.InactiveFont.Height = -11
    TabServerOption.InactiveFont.Name = 'Tahoma'
    TabServerOption.InactiveFont.Style = []
    TabServerOption.ShowCloseButtonOnTabs = False
    Left = 145
    Top = 50
  end
  object JvDockServer: TJvDockServer
    LeftSplitterStyle.Cursor = crHSplit
    LeftSplitterStyle.ParentColor = False
    RightSplitterStyle.Cursor = crHSplit
    RightSplitterStyle.ParentColor = False
    TopSplitterStyle.Cursor = crVSplit
    TopSplitterStyle.ParentColor = False
    BottomSplitterStyle.Cursor = crVSplit
    BottomSplitterStyle.ParentColor = False
    DockStyle = JvDockVSNetStyle
    Left = 270
    Top = 50
  end
end