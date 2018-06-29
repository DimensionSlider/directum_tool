object test_form: Ttest_form
  Left = 76
  Top = 178
  Caption = #1052#1072#1089#1090#1077#1088#1089#1082#1072#1103
  ClientHeight = 555
  ClientWidth = 1282
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
  object Label1: TsLabel
    Left = 8
    Top = 16
    Width = 92
    Height = 13
    Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object Label2: TsLabel
    Left = 8
    Top = 384
    Width = 134
    Height = 13
    Caption = #1053#1072#1081#1076#1077#1085#1085#1099#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object lbl1: TsLabel
    Left = 720
    Top = 16
    Width = 41
    Height = 13
    Caption = #1047#1072#1087#1088#1086#1089
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object lbl2: TsLabel
    Left = 720
    Top = 384
    Width = 72
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object Label3: TsLabel
    Left = 904
    Top = 16
    Width = 90
    Height = 13
    Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' DFM'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object SpeedButton1: TsSpeedButton
    Left = 688
    Top = 32
    Width = 23
    Height = 22
    Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1105
    Caption = #1050
    OnClick = SpeedButton1Click
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object Label4: TsLabel
    Left = 720
    Top = 184
    Width = 83
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080':'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object SpeedButton2: TsSpeedButton
    Left = 688
    Top = 400
    Width = 23
    Height = 22
    Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1105
    Caption = #1050
    OnClick = SpeedButton2Click
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object Label5: TsLabel
    Left = 720
    Top = 248
    Width = 83
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1088#1086#1082#1080':'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object Button1: TsButton
    Left = 8
    Top = 352
    Width = 185
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1082#1086#1076#1099' '#1074#1089#1077#1093' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074
    TabOrder = 12
    OnClick = Button1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Memo2: TsMemo
    Left = 8
    Top = 400
    Width = 673
    Height = 177
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 15
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object query_memo: TsMemo
    Left = 720
    Top = 32
    Width = 177
    Height = 145
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'select  '
      '  MBVidAnView.Dfm  '
      'from'
      '  MBVidAnView MBVidAnView'
      'where'
      '  MBVidAnView.Vid = 3174'
      'and Name like '#39'%'#1074#1085#1091#1090#1088'%'#39)
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
    Text = 
      'select  '#13#10'  MBVidAnView.Dfm  '#13#10'from'#13#10'  MBVidAnView MBVidAnView'#13#10 +
      'where'#13#10'  MBVidAnView.Vid = 3174'#13#10'and Name like '#39'%'#1074#1085#1091#1090#1088'%'#39#13#10
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object ListBox1: TsListBox
    Left = 720
    Top = 400
    Width = 545
    Height = 177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 16
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object Button2: TsButton
    Left = 424
    Top = 344
    Width = 97
    Height = 25
    Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 8
    OnClick = Button2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Button4: TsButton
    Left = 528
    Top = 344
    Width = 75
    Height = 25
    Caption = #1055#1072#1088#1089#1080#1090#1100
    TabOrder = 9
    SkinData.SkinSection = 'BUTTON'
  end
  object stat1: TsStatusBar
    Left = 0
    Top = 536
    Width = 1282
    Height = 19
    Panels = <>
    SkinData.SkinSection = 'STATUSBAR'
    ExplicitTop = 577
    ExplicitWidth = 1266
  end
  object TreeView1: TsTreeView
    Left = 904
    Top = 32
    Width = 361
    Height = 313
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentFont = False
    TabOrder = 2
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
  end
  object Edit1: TsEdit
    Left = 720
    Top = 200
    Width = 177
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object Button5: TsButton
    Left = 824
    Top = 224
    Width = 75
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 4
    OnClick = Button5Click
    SkinData.SkinSection = 'BUTTON'
  end
  object memo1: TSynEdit
    Left = 8
    Top = 32
    Width = 673
    Height = 305
    Ctl3D = True
    ParentCtl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.BorderColor = clBlack
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffset = 0
    Gutter.ShowLineNumbers = True
    Highlighter = SynDfmSyn1
  end
  object Edit2: TsEdit
    Left = 992
    Top = 352
    Width = 273
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
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
  object Button6: TsButton
    Left = 904
    Top = 352
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1091#1079#1077#1083
    TabOrder = 13
    OnClick = Button6Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Button7: TsButton
    Left = 608
    Top = 344
    Width = 75
    Height = 25
    Caption = #1060#1086#1088#1084#1072
    TabOrder = 10
    OnClick = Button7Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Button8: TsButton
    Left = 816
    Top = 288
    Width = 81
    Height = 25
    Caption = #1055#1077#1088#1077#1081#1090#1080
    TabOrder = 6
    OnClick = Button8Click
    SkinData.SkinSection = 'BUTTON'
  end
  object Edit3: TsEdit
    Left = 720
    Top = 264
    Width = 177
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
  object Button9: TsButton
    Left = 344
    Top = 344
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 7
    OnClick = Button9Click
    SkinData.SkinSection = 'BUTTON'
  end
  object pgc1: TsPageControl
    Left = 752
    Top = 344
    Width = 289
    Height = 193
    TabOrder = 11
    SkinData.SkinSection = 'PAGECONTROL'
  end
  object SynDfmSyn1: TSynDfmSyn
    Left = 608
    Top = 48
  end
end
