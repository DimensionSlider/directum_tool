object log_message_form: Tlog_message_form
  Left = 0
  Top = 0
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
  ClientHeight = 283
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 7
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 570
  end
  object Panel6: TPanel
    Left = 398
    Top = 7
    Width = 6
    Height = 270
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 163
    ExplicitTop = 4
    ExplicitHeight = 272
  end
  object Panel7: TPanel
    Left = 0
    Top = 277
    Width = 574
    Height = 6
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    ExplicitLeft = 1
    ExplicitTop = 276
    ExplicitWidth = 168
  end
  object Panel8: TPanel
    Left = 0
    Top = 7
    Width = 6
    Height = 270
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -232
    ExplicitTop = 311
  end
  object Panel1: TPanel
    Left = 404
    Top = 7
    Width = 170
    Height = 270
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = 400
    ExplicitTop = 0
    ExplicitHeight = 283
    object GroupBox1: TGroupBox
      Left = 6
      Top = 3
      Width = 158
      Height = 261
      Align = alRight
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      ExplicitLeft = 0
      object Button3: TButton
        Left = 11
        Top = 46
        Width = 138
        Height = 25
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1086#1096#1080#1073#1082#1091
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button1: TButton
        Left = 11
        Top = 16
        Width = 138
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 11
        Top = 105
        Width = 138
        Height = 25
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 11
        Top = 76
        Width = 138
        Height = 25
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1077#1082
        TabOrder = 2
        OnClick = Button4Click
      end
    end
    object Panel2: TPanel
      Left = 164
      Top = 3
      Width = 6
      Height = 261
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 170
      Height = 3
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 0
      Top = 264
      Width = 170
      Height = 6
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object message_text: TSynEdit
    Left = 6
    Top = 7
    Width = 392
    Height = 270
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.Visible = False
    Gutter.Width = 0
    WordWrap = True
  end
end
