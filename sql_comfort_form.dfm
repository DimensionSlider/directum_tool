object query_form: Tquery_form
  Left = 292
  Top = 113
  Caption = #1052#1072#1089#1090#1077#1088#1089#1082#1072#1103' SQL '#1079#1072#1087#1088#1086#1089#1086#1074
  ClientHeight = 736
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl5: TsLabel
    Left = 56
    Top = 360
    Width = 206
    Height = 13
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object lbl6: TsLabel
    Left = 448
    Top = 360
    Width = 208
    Height = 13
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1087#1077#1088#1077#1095#1077#1085#1100' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1081
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object PageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 911
    Height = 736
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object TabSheet1: TsTabSheet
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074' '#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object PageControl2: TsPageControl
        Left = 0
        Top = 0
        Width = 903
        Height = 708
        ActivePage = TabSheet8
        Align = alClient
        TabOrder = 0
        SkinData.SkinSection = 'PAGECONTROL'
        object TabSheet8: TsTabSheet
          Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1079#1076#1077#1083#1086#1074
          ImageIndex = 1
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object Label7: TsLabel
            Left = 8
            Top = 8
            Width = 195
            Height = 13
            Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1079#1076#1077#1083#1086#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label9: TsLabel
            Left = 432
            Top = 8
            Width = 186
            Height = 13
            Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1079#1076#1077#1083#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object query_section_list: TSynEdit
            Left = 3
            Top = 22
            Width = 393
            Height = 641
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
            Lines.Strings = (
              '/* '#1087#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1079#1076#1077#1083#1086#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'*/'
              ''
              '/*'
              ''
              
                #1047#1072#1075#1088#1091#1078#1072#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1088#1072#1079#1076#1077#1083#1072#1093' '#1091#1078#1077' '#1074' '#1075#1086#1090#1086#1074#1086#1084' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1086#1084' '#1076#1083#1103' '#1087#1088#1086 +
                #1075#1088#1072#1084#1084#1099' '#1074#1080#1076#1077' '#1095#1090#1086#1073#1099' '#1073#1099#1083#1086' '#1084#1077#1085#1100#1096#1077' '#1086#1073#1088#1072#1073#1086#1090#1086#1082
              #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1102#1090#1089#1103' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1077' '#1080#1084#1077#1085#1072', '#1085#1086#1084#1077#1088#1072', '#1092#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1080#1084#1077#1085#1072' '#1080#1090#1076
              ''
              '*/'
              ''
              'SELECT'
              #9'DISTINCT '#9
              #9'vidrecv.Razd '#39#1050#1086#1076#39','#9
              #9'CASE vidrecv.Razd'
              #9#9#9#9'WHEN '#39#1050#39
              '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1103#39#9
              '                WHEN '#39#1064#39
              '                THEN '#39#1050#1072#1088#1090#1086#1095#1082#1072#39#9
              '                WHEN '#39#1058#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072#39#9#9
              '                WHEN '#39#1057#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 2'#39#9
              '                WHEN '#39#1056#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 3'#39#9
              '                WHEN '#39#1054#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 4'#39
              '                WHEN '#39#1053#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 5'#39#9
              '                WHEN '#39#1052#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 6'#39#9#9
              '                '
              '                WHEN '#39'Q'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 7'#39#9#9
              '      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 8'#39#9#9
              '                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 9'#39
              '                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 10'#39
              ''
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 11'#39
              ''
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 12'#39
              ''
              '                '
              '                '
              '                '
              '                '
              '                '
              '    END       '#39#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077#39','
              ''
              #9'CASE vidrecv.Razd'
              '                WHEN '#39#1064#39
              '                THEN '#39#39
              '                WHEN '#39#1058#39
              '                THEN '#39'Table'#39
              '                WHEN '#39#1057#39
              '                THEN '#39'Table2'#39
              '                WHEN '#39#1056#39
              '                THEN '#39'Table3'#39
              '                WHEN '#39#1054#39
              '                THEN '#39'Table4'#39
              '                WHEN '#39#1053#39
              '                THEN '#39'Table5'#39
              '                WHEN '#39#1052#39
              '                THEN '#39'Table6'#39
              '               '
              '                WHEN '#39'Q'#39
              '                THEN '#39'Table7'#39#9#9'      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39'Table8'#39#9#9'                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39'Table9'#39'                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39'Table10'#39
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39'Table11'#39
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39'Table12'#39
              '                                                '
              '                WHEN '#39#1050#39
              '                THEN '#39#39
              '    END       '#39'Preproc'#1048#1084#1103#39','
              ''
              #9'CASE vidrecv.Razd'
              '                WHEN '#39#1064#39' '
              '                THEN '#39#1053#39'                '
              '                WHEN '#39#1050#39
              '                THEN '#39#1053#39
              '                ELSE '#39#1044#39
              '    END                            '#39#1058#1072#1073#1083#1080#1094#1072#1044#1072#1053#1077#1090#39','
              ''
              #9'CASE vidrecv.Razd'
              '                WHEN '#39#1064#39
              '                THEN '#39'0'#39#9
              '                WHEN '#39#1058#39
              '                THEN '#39'1'#39#9#9
              '                WHEN '#39#1057#39
              '                THEN '#39'2'#39#9
              '                WHEN '#39#1056#39
              '                THEN '#39'3'#39#9
              '                WHEN '#39#1054#39
              '                THEN '#39'4'#39
              '                WHEN '#39#1053#39
              '                THEN '#39'5'#39#9
              '                WHEN '#39#1052#39
              '                THEN '#39'6'#39
              #9#9#9#9
              #9#9#9#9'WHEN '#39'Q'#39
              '                THEN '#39'7'#39#9#9'      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39'8'#39#9#9'                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39'9'#39'                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39'10'#39
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39'11'#39
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39'12'#39'                '
              '                '#9#9
              '                WHEN '#39#1050#39
              '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1077#39
              '    END                            '#39#1048#1085#1076#1077#1082#1089#39','
              ' '
              'CASE vidrecv.Razd'
              '                WHEN '#39#1064#39
              '                THEN '#39'MBAnalit'#39#9
              '                '
              '                WHEN '#39#1058#39
              '                THEN '#39'MBAnValR'#39#9#9
              '                '
              '                WHEN '#39#1057#39
              '                THEN '#39'MBAnValR2'#39#9
              '                '
              '                WHEN '#39#1056#39
              '                THEN '#39'MBAnValR3'#39#9
              '                '
              '                WHEN '#39#1054#39
              '                THEN '#39'MBAnValR4'#39
              '                '
              '                WHEN '#39#1053#39
              '                THEN '#39'MBAnValR5'#39#9
              '                '
              '                WHEN '#39#1052#39
              '                THEN '#39'MBAnValR6'#39#9
              '                '
              #9#9#9#9'WHEN '#39'Q'#39
              '                THEN '#39'MBAnValR7'#39#9#9'      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39'MBAnValR8'#39#9#9'                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39'MBAnValR9'#39'                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39'MBAnValR10'#39
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39'MBAnValR11'#39
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39'MBAnValR12'#39'                '
              '                '#9
              '                WHEN '#39#1050#39
              '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1077#39
              '    END                            '#39#1060#1080#1079#1048#1084#1103#39','
              '    vid.Kod '#39#1050#1086#1076#1054#1073#1098#1077#1082#1090#1072#39
              '    '
              '     '
              'FROM '
              '    MBVidAn vid'
              '    INNER JOIN MBVidAnRecv vidrecv'
              '    INNER JOIN MBRecvAn recvan ON'
              '    vidrecv.Kod = recvan.Kod ON '
              '    vid.Vid'#9'    = <'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'
              '')
          end
          object query_document_section_list: TSynEdit
            Left = 432
            Top = 22
            Width = 449
            Height = 641
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Lines.Strings = (
              '/* '#1087#1077#1088#1077#1095#1077#1085#1100' '#1088#1072#1079#1076#1077#1083#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' */'
              ''
              'SELECT'
              #9'DISTINCT '
              ''
              #9'doc_recv.Razd '#39#1050#1086#1076#39','
              ''
              #9'CASE doctype_recv.Razd'
              'WHEN '#39#1050#39
              '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1103#39#9
              '                WHEN '#39#1064#39
              '                THEN '#39#1050#1072#1088#1090#1086#1095#1082#1072#39#9
              '                WHEN '#39#1058#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072#39#9#9
              '                WHEN '#39#1057#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 2'#39#9
              '                WHEN '#39#1056#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 3'#39#9
              '                WHEN '#39#1054#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 4'#39
              '                WHEN '#39#1053#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 5'#39#9
              '                WHEN '#39#1052#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 6'#39#9#9
              '                '
              '                WHEN '#39'Q'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 7'#39#9#9
              '      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 8'#39#9#9
              '                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 9'#39
              '                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 10'#39
              ''
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 11'#39
              ''
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 12'#39
              '    END       '#39#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077#39','
              ''
              #9'CASE doctype_recv.Razd'
              '  WHEN '#39#1064#39
              '                THEN '#39#39
              '                WHEN '#39#1058#39
              '                THEN '#39'Table'#39
              '                WHEN '#39#1057#39
              '                THEN '#39'Table2'#39
              '                WHEN '#39#1056#39
              '                THEN '#39'Table3'#39
              '                WHEN '#39#1054#39
              '                THEN '#39'Table4'#39
              '                WHEN '#39#1053#39
              '                THEN '#39'Table5'#39
              '                WHEN '#39#1052#39
              '                THEN '#39'Table6'#39
              '               '
              '                WHEN '#39'Q'#39
              '                THEN '#39'Table7'#39#9#9'      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39'Table8'#39#9#9'                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39'Table9'#39'                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39'Table10'#39
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39'Table11'#39
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39'Table12'#39
              '                                                '
              '                WHEN '#39#1050#39
              '                THEN '#39#39
              '    END       '#39'Preproc'#1048#1084#1103#39','
              ''
              #9'CASE doctype_recv.Razd'
              '                  WHEN '#39#1064#39' '
              '                THEN '#39#1053#39'                '
              '                WHEN '#39#1050#39
              '                THEN '#39#1053#39
              '                ELSE '#39#1044#39
              '    END                            '#39#1058#1072#1073#1083#1080#1094#1072#1044#1072#1053#1077#1090#39','
              ''
              #9'CASE doctype_recv.Razd'
              '            WHEN '#39#1064#39
              '                THEN '#39'0'#39#9
              '                WHEN '#39#1058#39
              '                THEN '#39'1'#39#9#9
              '                WHEN '#39#1057#39
              '                THEN '#39'2'#39#9
              '                WHEN '#39#1056#39
              '                THEN '#39'3'#39#9
              '                WHEN '#39#1054#39
              '                THEN '#39'4'#39
              '                WHEN '#39#1053#39
              '                THEN '#39'5'#39#9
              '                WHEN '#39#1052#39
              '                THEN '#39'6'#39
              #9#9#9#9
              #9#9#9#9'WHEN '#39'Q'#39
              '                THEN '#39'7'#39#9#9'      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39'8'#39#9#9'                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39'9'#39'                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39'10'#39
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39'11'#39
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39'12'#39'                '
              '                '#9#9
              '                WHEN '#39#1050#39
              '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1077#39
              '    END                            '#39#1048#1085#1076#1077#1082#1089#39','
              ' '
              'CASE doctype_recv.Razd'
              '                WHEN '#39#1064#39
              '                THEN '#39'MBAnalit'#39#9
              '                '
              '                WHEN '#39#1058#39
              '                THEN '#39'MBAnValR'#39#9#9
              '                '
              '                WHEN '#39#1057#39
              '                THEN '#39'MBAnValR2'#39#9
              '                '
              '                WHEN '#39#1056#39
              '                THEN '#39'MBAnValR3'#39#9
              '                '
              '                WHEN '#39#1054#39
              '                THEN '#39'MBAnValR4'#39
              '                '
              '                WHEN '#39#1053#39
              '                THEN '#39'MBAnValR5'#39#9
              '                '
              '                WHEN '#39#1052#39
              '                THEN '#39'MBAnValR6'#39#9
              '                '
              #9#9#9#9'WHEN '#39'Q'#39
              '                THEN '#39'MBAnValR7'#39#9#9'      '
              #9#9#9#9'WHEN '#39'W'#39
              '                THEN '#39'MBAnValR8'#39#9#9'                '
              #9#9#9#9'WHEN '#39'U'#39
              '                THEN '#39'MBAnValR9'#39'                '
              #9#9#9#9'WHEN '#39'R'#39
              '                THEN '#39'MBAnValR10'#39
              #9#9#9#9'WHEN '#39'I'#39
              '                THEN '#39'MBAnValR11'#39
              #9#9#9#9'WHEN '#39'Y'#39
              '                THEN '#39'MBAnValR12'#39'      '
              '                '#9
              '                WHEN '#39#1050#39
              '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1077#39
              '    END                            '#39#1060#1080#1079#1048#1084#1103#39','
              '    doctype.Kod '#39#1050#1086#1076#1054#1073#1098#1077#1082#1090#1072#39
              '    '
              '     '
              'FROM '
              '    MBEDocType doctype'
              
                '    INNER JOIN MBEDocTypeRecv doctype_recv ON doctype.TypeID = d' +
                'octype_recv.TypeID'
              
                '    INNER JOIN MBRecvEDoc doc_recv ON  doctype_recv.Kod = doc_re' +
                'cv.Kod '
              '    WHERE doctype.TypeID = '#39'<'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'#39)
          end
        end
        object TabSheet7: TsTabSheet
          Caption = #1055#1077#1088#1077#1095#1085#1080' '#1086#1073#1098#1077#1082#1090#1086#1074
          ImageIndex = 1
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object Label5: TsLabel
            Left = 0
            Top = 8
            Width = 142
            Height = 13
            Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label8: TsLabel
            Left = 456
            Top = 10
            Width = 170
            Height = 13
            Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1090#1080#1087#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object query_get_reference_list: TSynEdit
            Left = 0
            Top = 24
            Width = 449
            Height = 377
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
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'SELECT'
              'Vid '#39#1048#1044#39','
              'Kod '#39#1050#1086#1076#39','
              'NameEd '#39'NameEd'#39','
              'TypeConcept '#39#1054#1090#1086#1073#1088#1072#1078#1072#1077#1084#1099#1081#1056#1077#1082#1074#1080#1079#1080#1090#39','
              'SposNum '#39'SposNum'#39','
              'HighLvl '#39'HighLvl'#39','
              'XRecID '#39'XRecID'#39','
              #39'MBAnalit'#39' '#39'Tablename'#39','
              'Comment '#39'Comment'#39','
              'LastUpd '#39'LastUpd'#39','
              'Name '#39'Name'#39','
              'AddParams '#39'AddParams'#39','
              'CommonSettings '#39#1053#1072#1089#1090#1088#1086#1081#1082#1080#1060#1086#1088#1084#1099#1057#1087#1080#1089#1082#1072#39','
              'NameLocalizeID '#39'NameLocalizeID'#39','
              'NameEdLocalizeID '#39'NameEdLocalizeID'#39','
              #39'reference'#39' '#39'ObjectType'#39
              ''
              'FROM MBVidAn')
          end
          object query_get_document_list: TSynEdit
            Left = 456
            Top = 24
            Width = 417
            Height = 377
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              ''
              'SELECT'
              'TypeID '#39#1048#1044#39','
              '[Kod] '#39#1050#1086#1076#39','
              '[NameEd] '#39'NameEd'#39','
              #39'-'#39' '#39#1054#1090#1086#1073#1088#1072#1078#1072#1077#1084#1099#1081#1056#1077#1082#1074#1080#1079#1080#1090#39','
              '[SposNum] '#39'SposNum'#39','
              #39'-'#39' '#39'HighLvl'#39','
              '[XRecID] '#39'XRecID'#39','
              #39'SBEDoc'#39' '#39'Tablename'#39','
              '[Comment] '#39'Comment'#39','
              '[LastUpd] '#39'LastUpd'#39','
              '[Name] '#39'Name'#39','
              '[AddParams] '#39'AddParams'#39','
              #39'-'#39' '#39#1053#1072#1089#1090#1088#1086#1081#1082#1080#1060#1086#1088#1084#1099#1057#1087#1080#1089#1082#1072#39','
              '[NameLocalizeID] '#39'NameLocalizeID'#39','
              '[NameEdLocalizeID] '#39'NameEdLocalizeID'#39','
              #39'document'#39' '#39'ObjectType'#39
              ''
              'FROM MBEDocType ')
          end
        end
        object TabSheet9: TsTabSheet
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1086#1073#1098#1077#1082#1090#1086#1074
          ImageIndex = 2
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object Label6: TsLabel
            Left = 0
            Top = 0
            Width = 262
            Height = 13
            Caption = #1047#1072#1087#1088#1086#1089' '#1082' '#1086#1087#1080#1089#1072#1085#1080#1102' '#1088#1077#1082#1074#1080#1079#1080#1090#1072' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label11: TsLabel
            Left = 432
            Top = 0
            Width = 230
            Height = 13
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1082#1086#1085#1082#1088#1077#1090#1085#1086#1075#1086' '#1090#1080#1087#1072' '#1082#1072#1088#1090#1086#1095#1082#1080
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object lbl3: TsLabel
            Left = 3
            Top = 320
            Width = 141
            Height = 13
            Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object lbl7: TsLabel
            Left = 432
            Top = 320
            Width = 132
            Height = 13
            Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object query_get_reference_reqlist: TSynEdit
            Left = 0
            Top = 16
            Width = 417
            Height = 290
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
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'SELECT'
              'vidrecv.Name,'
              'recvan.Kod,'
              'vidrecv.IsNull, --'#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1081
              'vidrecv.IsKlass,'#9#9'--'#39#1060#1080#1083#1100#1090#1088#1072#1090#1086#1088#39
              'vidrecv.IsHigh,'#9#9#9'--'#39#1042#1077#1076#1091#1097#1080#1081#39
              'vidrecv.InpExprn,'#9#9'--'#39#1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39
              'vidrecv.IsSources,'#9#9'-- '#39#1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1085#1072#1095#1077#1085#1080#1103#39
              'vidrecv.NameLocalizeID, --'#39#1051#1086#1082#1072#1083#1080#1079#1086#1074#1072#1085#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1079#1072#1075#1086#1083#1086#1074#1082#1072#39
              'vidrecv.NumRecv,'#9#9#9'--'#39#1053#1086#1084#1077#1088' '#1088#1077#1082#1074#1080#1079#1080#1090#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1077#39
              'recvan.Razd,'
              'vidrecv.Exprn'
              ''
              'FROM '
              '    MBVidAn vid'
              '    INNER JOIN MBVidAnRecv vidrecv '
              '    INNER JOIN MBRecvAn recvan ON'
              '    vidrecv.Kod = recvan.Kod ON '
              '    vid.Vid'#9'    = vidrecv.Vid '
              'WHERE'
              
                '     vid.Vid = '#39'<'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'#39' and recvan.Razd = '#39'<'#1082#1086#1076'_'#1088#1072#1079#1076#1077#1083 +
                #1072'>'#39
              ''
              ''
              'ORDER BY'
              '      vid.Name ASC, recvan.Razd DESC, vidrecv.Name ASC'
              ' '
              ' ')
          end
          object query_document_get_reqlist: TSynEdit
            Left = 423
            Top = 16
            Width = 417
            Height = 290
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'SELECT'
              'vidrecv.Name,'
              'recvan.Kod,'
              'vidrecv.IsNull, --'#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1081
              #39#1053#39' '#39'IsKlass'#39','#9#9'--'#39#1060#1080#1083#1100#1090#1088#1072#1090#1086#1088#39
              'vidrecv.IsHigh,'#9#9#9'--'#39#1042#1077#1076#1091#1097#1080#1081#39
              'vidrecv.InpExprn,'#9#9'--'#39#1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39
              #39#1053#39' '#39'IsSources'#39','#9#9'-- '#39#1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1085#1072#1095#1077#1085#1080#1103#39
              'vidrecv.NameLocalizeID, --'#39#1051#1086#1082#1072#1083#1080#1079#1086#1074#1072#1085#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1079#1072#1075#1086#1083#1086#1074#1082#1072#39
              'vidrecv.NumRecv,'#9#9#9'--'#39#1053#1086#1084#1077#1088' '#1088#1077#1082#1074#1080#1079#1080#1090#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1077#39
              'recvan.Razd,'
              'vidrecv.Exprn'
              ''
              'FROM '
              '    MBEDocType vid'
              '    INNER JOIN MBEDocTypeRecv vidrecv '
              '    INNER JOIN MBRecvEDoc recvan ON'
              '    vidrecv.Kod = recvan.Kod ON '
              '    vid.TypeID'#9'    = vidrecv.TypeID '
              'WHERE'
              
                '     vid.TypeID = '#39'<'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'#39' and recvan.Razd = '#39'<'#1082#1086#1076'_'#1088#1072#1079 +
                #1076#1077#1083#1072'>'#39
              ''
              'ORDER BY'
              '      vid.Name ASC, recvan.Razd DESC, vidrecv.Name ASC'
              ' ')
          end
          object query_reference_action_list: TSynEdit
            Left = -4
            Top = 339
            Width = 421
            Height = 318
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 2
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'SELECT'
              'vidrecv.Name,'
              'vidrecv.Kod,'
              'vidrecv.IsNull, --'#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1081
              'vidrecv.IsKlass,'#9#9'--'#39#1060#1080#1083#1100#1090#1088#1072#1090#1086#1088#39
              'vidrecv.IsHigh,'#9#9#9'--'#39#1042#1077#1076#1091#1097#1080#1081#39
              'vidrecv.InpExprn,'#9#9'--'#39#1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39
              'vidrecv.IsSources,'#9#9'-- '#39#1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1085#1072#1095#1077#1085#1080#1103#39
              'vidrecv.NameLocalizeID, --'#39#1051#1086#1082#1072#1083#1080#1079#1086#1074#1072#1085#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1079#1072#1075#1086#1083#1086#1074#1082#1072#39
              'vidrecv.NumRecv,'#9#9#9'--'#39#1053#1086#1084#1077#1088' '#1088#1077#1082#1074#1080#1079#1080#1090#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1077#39
              'vidrecv.Razd,'
              'vidrecv.Exprn'
              ''
              'FROM '
              '   MBVidAnRecv vidrecv'
              'WHERE'
              
                '     vidrecv.Vid = '#39'<'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'#39' and vidrecv.Razd = '#39'<'#1082#1086#1076'_'#1088 +
                #1072#1079#1076#1077#1083#1072'>'#39
              ''
              'ORDER BY'
              '      vidrecv.Name ASC, vidrecv.Razd DESC '
              ' '
              ' ')
          end
          object query_document_action_list: TSynEdit
            Left = 432
            Top = 339
            Width = 417
            Height = 318
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 3
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Lines.Strings = (
              'SELECT'
              'vidrecv.Name,'
              'vidrecv.Kod,'
              'vidrecv.IsNull, --'#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1081
              #39#1053#39' '#39'IsKlass'#39','#9#9'--'#39#1060#1080#1083#1100#1090#1088#1072#1090#1086#1088#39
              'vidrecv.IsHigh,'#9#9#9'--'#39#1042#1077#1076#1091#1097#1080#1081#39
              'vidrecv.InpExprn,'#9#9'--'#39#1042#1099#1073#1086#1088' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39
              #39#1053#39' '#39'IsSources'#39','#9#9'-- '#39#1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1085#1072#1095#1077#1085#1080#1103#39
              'vidrecv.NameLocalizeID, --'#39#1051#1086#1082#1072#1083#1080#1079#1086#1074#1072#1085#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1079#1072#1075#1086#1083#1086#1074#1082#1072#39
              'vidrecv.NumRecv,'#9#9#9'--'#39#1053#1086#1084#1077#1088' '#1088#1077#1082#1074#1080#1079#1080#1090#1072' '#1074' '#1090#1072#1073#1083#1080#1094#1077#39
              'vidrecv.Razd,'
              'vidrecv.Exprn'
              ''
              'FROM '
              '    MBEDocTypeRecv vidrecv             '
              'WHERE'
              
                '     vidrecv.TypeID = '#39'<'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'#39' and vidrecv.Razd = '#39'<'#1082#1086 +
                #1076'_'#1088#1072#1079#1076#1077#1083#1072'>'#39
              ''
              'ORDER BY'
              '      vid.Name ASC, recvan.Razd DESC'
              ' ')
          end
        end
        object TabSheet10: TsTabSheet
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1086#1074
          ImageIndex = 3
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object Label4: TsLabel
            Left = 8
            Top = 8
            Width = 174
            Height = 13
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1083#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
            ParentFont = False
            WordWrap = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label10: TsLabel
            Left = 320
            Top = 8
            Width = 165
            Height = 13
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1083#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object query_RecvAn: TSynEdit
            Left = 3
            Top = 27
            Width = 273
            Height = 337
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
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'SELECT '
              #9'Kod,'
              #9'FldName,'
              #9'Name,'
              #9'Razd,'
              #9'Stored,'
              #9'Type,'
              #9'Align,'
              #9'Len,'
              #9'Toch,'
              #9'VidAn,'
              #9'ViewID,'
              #9'PriznValues,'
              #9'ExistFld,'
              #9'XRecID,'
              'case Type '
              #9'WHEN '#39#1044#39
              #9'THEN '#39#1044#1072#1090#1072#39
              #9'WHEN '#39#1063#39
              #9'THEN '#39#1044#1088#1086#1073#1085#1086#1077' '#1095#1080#1089#1083#1086#39#9
              #9'WHEN '#39#1055#39
              #9'THEN '#39#1055#1088#1080#1079#1085#1072#1082#39#9#9
              #9'WHEN '#39#1040#39
              #9'THEN '#39#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#39#9#9#9
              #9'WHEN '#39#1057#39
              #9'THEN '#39#1057#1090#1088#1086#1082#1072#39#9#9
              #9'WHEN '#39#1052#39
              #9'THEN '#39#1058#1077#1082#1089#1090#39#9#9
              #9'WHEN '#39#1062#39
              #9'THEN '#39#1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086#39#9#9
              'END '#39#1058#1080#1087#1057#1090#1088#1086#1082#1086#1081#39','
              
                '( SELECT Name FROM MBVidAn WHERE Vid = VidAn ) '#39#1058#1080#1087#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1057#1090 +
                #1088#1086#1082#1086#1081#39
              ''
              ''
              'FROM MBRecvAn'#9)
          end
          object query_RecvEDoc: TSynEdit
            Left = 320
            Top = 27
            Width = 273
            Height = 337
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'SELECT '
              #9'Kod,'
              #9'FldName,'
              #9'Name,'
              #9'Razd,'
              #9'Stored,'
              #9'Type,'
              #9'Align,'
              #9'Len,'
              #9'Toch,'
              #9'VidAn,'
              #9'ViewID,'
              #9'PriznValues,'
              #9'ExistFld,'
              #9'XRecID,'
              'case Type '
              #9'WHEN '#39#1044#39
              #9'THEN '#39#1044#1072#1090#1072#39
              #9'WHEN '#39#1063#39
              #9'THEN '#39#1044#1088#1086#1073#1085#1086#1077' '#1095#1080#1089#1083#1086#39#9
              #9'WHEN '#39#1055#39
              #9'THEN '#39#1055#1088#1080#1079#1085#1072#1082#39#9#9
              #9'WHEN '#39#1040#39
              #9'THEN '#39#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#39#9#9#9
              #9'WHEN '#39#1057#39
              #9'THEN '#39#1057#1090#1088#1086#1082#1072#39#9#9
              #9'WHEN '#39#1052#39
              #9'THEN '#39#1058#1077#1082#1089#1090#39#9#9
              #9'WHEN '#39#1062#39
              #9'THEN '#39#1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086#39#9#9
              'END '#39#1058#1080#1087#1057#1090#1088#1086#1082#1086#1081#39','
              
                '( SELECT Name FROM MBVidAn WHERE Vid = VidAn ) '#39#1058#1080#1087#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1057#1090 +
                #1088#1086#1082#1086#1081#39
              ''
              ''
              'FROM MBRecvEDoc'#9)
          end
        end
        object ts1: TsTabSheet
          Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
          ImageIndex = 4
          SkinData.CustomColor = False
          SkinData.CustomFont = False
          object lbl4: TsLabel
            Left = 8
            Top = 32
            Width = 206
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label12: TsLabel
            Left = 8
            Top = 304
            Width = 206
            Height = 13
            Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label14: TsLabel
            Left = 8
            Top = 8
            Width = 75
            Height = 13
            Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object Label15: TsLabel
            Left = 8
            Top = 272
            Width = 70
            Height = 13
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object bvl1: TsBevel
            Left = 8
            Top = 256
            Width = 881
            Height = 17
            Shape = bsTopLine
          end
          object query_reference_views: TSynEdit
            Left = 8
            Top = 48
            Width = 529
            Height = 177
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
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'select  '
              '*'
              'from'
              '  MBVidAnView MBVidAnView'
              'where'
              '  MBVidAnView.Vid = <'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>')
          end
          object query_document_views: TSynEdit
            Left = 8
            Top = 320
            Width = 529
            Height = 177
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 1
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynSQLSyn1
            Lines.Strings = (
              'select  '
              '*'
              'from'
              '  MBEDocTypeView'
              'where'
              '  MBEDocTypeView.TypeID = <'#1080#1076'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>')
          end
        end
      end
    end
    object TabSheet3: TsTabSheet
      Caption = #1055#1072#1088#1089#1080#1085#1075' '#1089#1093#1077#1084#1099' '#1058#1052
      ImageIndex = 2
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object get_routexml_from_task: TsMemo
        Left = 0
        Top = 16
        Width = 489
        Height = 169
        Align = alCustom
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'DECLARE @step integer'
          'DECLARE @data varchar( 8000 )'
          'SET @step = <'#1090#1077#1082#1091#1097#1080#1081'_'#1096#1072#1075'>'
          'SELECT @data = '#39'11'#39
          'SELECT @data = ('
          
            '        SELECT convert( varchar( 8000 ), substring( workflowdesc' +
            'ription, @step*8000+1, 8000 ) )'
          '        FROM                '
          '                SBTask task'
          '        WHERE'
          '                task.XRecID = <'#1085#1086#1084#1077#1088'_'#1079#1072#1076#1072#1095#1080'> )'
          'SELECT @data'
          '')
        ParentFont = False
        TabOrder = 0
        Text = 
          'DECLARE @step integer'#13#10'DECLARE @data varchar( 8000 )'#13#10'SET @step ' +
          '= <'#1090#1077#1082#1091#1097#1080#1081'_'#1096#1072#1075'>'#13#10'SELECT @data = '#39'11'#39#13#10'SELECT @data = ('#13#10'        ' +
          'SELECT convert( varchar( 8000 ), substring( workflowdescription,' +
          ' @step*8000+1, 8000 ) )'#13#10'        FROM                '#13#10'         ' +
          '       SBTask task'#13#10'        WHERE'#13#10'                task.XRecID =' +
          ' <'#1085#1086#1084#1077#1088'_'#1079#1072#1076#1072#1095#1080'> )'#13#10'SELECT @data'#13#10#13#10
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
      object get_route_xml_from_route_reference: TsMemo
        Left = 0
        Top = 215
        Width = 489
        Height = 258
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'DECLARE @step integer'
          'DECLARE @data varchar( 8000 )'
          'SET @step = <'#1090#1077#1082#1091#1097#1080#1081'_'#1096#1072#1075'>'
          'SELECT @data = '#39'11'#39
          ''
          'SELECT @data = ('
          'SELECT'
          
            '        convert( varchar( 8000 ), substring( SearchCondition, @s' +
            'tep*8000+1, 8000 ) )'
          'FROM MBText txt'
          'INNER JOIN MBAnalit tmt ON txt.SrcRecID = tmt.Analit'
          'WHERE'
          'Vid = ( SELECT Vid FROM MBVidAn WHERE Kod = '#39#1058#1052#1058#39' )'
          'and SrcRecID = tmt.Analit'
          'and tmt.NameAn = '#39'<'#1080#1084#1103'_'#1084#1072#1088#1096#1088#1091#1090#1072'>'#39' )'
          ''
          'SELECT @data'
          ''
          '')
        ParentFont = False
        TabOrder = 1
        Text = 
          'DECLARE @step integer'#13#10'DECLARE @data varchar( 8000 )'#13#10'SET @step ' +
          '= <'#1090#1077#1082#1091#1097#1080#1081'_'#1096#1072#1075'>'#13#10'SELECT @data = '#39'11'#39#13#10#13#10'SELECT @data = ('#13#10'SELECT' +
          #13#10'        convert( varchar( 8000 ), substring( SearchCondition, ' +
          '@step*8000+1, 8000 ) )'#13#10'FROM MBText txt'#13#10'INNER JOIN MBAnalit tmt' +
          ' ON txt.SrcRecID = tmt.Analit'#13#10'WHERE'#13#10'Vid = ( SELECT Vid FROM MB' +
          'VidAn WHERE Kod = '#39#1058#1052#1058#39' )'#13#10'and SrcRecID = tmt.Analit'#13#10'and tmt.Na' +
          'meAn = '#39'<'#1080#1084#1103'_'#1084#1072#1088#1096#1088#1091#1090#1072'>'#39' )'#13#10#13#10'SELECT @data'#13#10#13#10#13#10
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
    end
    object TabSheet4: TsTabSheet
      Caption = #1060#1086#1088#1084#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103
      ImageIndex = 3
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Label1: TsLabel
        Left = 8
        Top = 16
        Width = 109
        Height = 13
        Caption = #1048#1076' '#1090#1080#1087#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      end
      object Memo1: TsMemo
        Left = 8
        Top = 32
        Width = 433
        Height = 161
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'select  '
          '  Kod, Name, Comment, Main, Dfm, NameLocalizeID'
          'from'
          '  MBVidAnView MBVidAnView'
          'where'
          '  MBVidAnView.Vid = <'#1080#1076'_'#1090#1080#1087#1072'_'#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'
          '')
        ParentFont = False
        TabOrder = 0
        Text = 
          'select  '#13#10'  Kod, Name, Comment, Main, Dfm, NameLocalizeID'#13#10'from'#13 +
          #10'  MBVidAnView MBVidAnView'#13#10'where'#13#10'  MBVidAnView.Vid = <'#1080#1076'_'#1090#1080#1087#1072'_' +
          #1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072'>'#13#10#13#10
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
    end
    object TabSheet5: TsTabSheet
      Caption = #1055#1088#1080#1079#1085#1072#1082#1080
      ImageIndex = 4
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Memo2: TsMemo
        Left = 24
        Top = 32
        Width = 825
        Height = 401
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'SELECT PriznValues FROM MBRecvAn'
          'WHERE kod = '#39#1083#1057#1086#1089#1090#1086#1103#1085#1080#1077#1047#1072#1076#1072#1095#1080#39
          ''
          #1056'='#1042' '#1088#1072#1073#1086#1090#1077'|'#1042' '#1088#1072#1073#1086#1090#1077';'
          #1042'='#1042#1099#1087#1086#1083#1085#1077#1085#1086'|'#1042#1099#1087#1086#1083#1085#1077#1085#1086';'
          #1053'='#1053#1072' '#1082#1086#1085#1090#1088#1086#1083#1077'|'#1053#1072' '#1082#1086#1085#1090#1088#1086#1083#1077';'
          #1055'='#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086'|'#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086';'
          #1054'='#1054#1090#1082#1072#1079'|'#1054#1090#1082#1072#1079';'
          #1045'='#1042#1099#1085#1077#1089#1077#1085#1080#1077' '#1088#1077#1079#1086#1083#1102#1094#1080#1080'|'#1042#1099#1085#1077#1089#1077#1085#1080#1077' '#1088#1077#1079#1086#1083#1102#1094#1080#1080)
        ParentFont = False
        TabOrder = 0
        Text = 
          'SELECT PriznValues FROM MBRecvAn'#13#10'WHERE kod = '#39#1083#1057#1086#1089#1090#1086#1103#1085#1080#1077#1047#1072#1076#1072#1095#1080#39 +
          #13#10#13#10#1056'='#1042' '#1088#1072#1073#1086#1090#1077'|'#1042' '#1088#1072#1073#1086#1090#1077';'#13#10#1042'='#1042#1099#1087#1086#1083#1085#1077#1085#1086'|'#1042#1099#1087#1086#1083#1085#1077#1085#1086';'#13#10#1053'='#1053#1072' '#1082#1086#1085#1090#1088#1086#1083#1077'|' +
          #1053#1072' '#1082#1086#1085#1090#1088#1086#1083#1077';'#13#10#1055'='#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086'|'#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086';'#13#10#1054'='#1054#1090#1082#1072#1079'|'#1054#1090#1082#1072#1079';'#13#10#1045'='#1042#1099#1085#1077#1089#1077 +
          #1085#1080#1077' '#1088#1077#1079#1086#1083#1102#1094#1080#1080'|'#1042#1099#1085#1077#1089#1077#1085#1080#1077' '#1088#1077#1079#1086#1083#1102#1094#1080#1080#13#10
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
    end
    object TabSheet2: TsTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' '#1041#1044
      ImageIndex = 4
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object Label2: TsLabel
        Left = 8
        Top = 8
        Width = 200
        Height = 13
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' Delphi XE'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object Label3: TsLabel
        Left = 464
        Top = 8
        Width = 195
        Height = 13
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' Delphi 7'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object SynMemo1: TSynMemo
        Left = 8
        Top = 24
        Width = 441
        Height = 377
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
        Lines.Strings = (
          'SchemaOverride=%.dbo'
          'DriverUnit=DBXMSSQL'
          
            'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver150.' +
            'bpl'
          
            'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
            'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
            'eyToken=91d62ebb5b0d1b1b'
          
            'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
            'iver150.bpl'
          
            'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
            'ory,Borland.Data.DbxMSSQLDriver,Version=15.0.0.0,Culture=neutral' +
            ',PublicKeyToken=91d62ebb5b0d1b1b'
          'GetDriverFunc=getSQLDriverMSSQL'
          'LibraryName=dbxmss.dll'
          'VendorLib=sqlncli10.dll'
          'HostName=ServerName'
          'Database=Database Name'
          'MaxBlobSize=-1'
          'LocaleCode=0000'
          'IsolationLevel=ReadCommitted'
          'OSAuthentication=False'
          'PrepareSQL=True'
          'User_Name=user'
          'Password=password'
          'BlobSize=-1'
          'ErrorResourceFile='
          'OS Authentication=False'
          'Prepare SQL=False')
      end
      object db_params_delphi7: TSynEdit
        Left = 464
        Top = 24
        Width = 441
        Height = 377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Lines.Strings = (
          'DriverName=MSSQL'
          'HostName=ServerName'
          'DataBase=Database Name'
          'User_Name=user'
          'Password=password'
          'BlobSize=-1'
          'ErrorResourceFile='
          'LocaleCode=0000'
          'MSSQL TransIsolation=ReadCommited'
          'OS Authentication=False')
      end
    end
    object TabSheet6: TsTabSheet
      Caption = #1059#1089#1090#1072#1088#1077#1074#1072#1077#1090
      ImageIndex = 5
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object lbl2: TsLabel
        Left = 19
        Top = 22
        Width = 128
        Height = 13
        Caption = #1047#1072#1087#1088#1086#1089' '#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object lbl1: TsLabel
        Left = 267
        Top = 21
        Width = 137
        Height = 13
        Caption = #1047#1072#1087#1088#1086#1089' '#1082' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#1084
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object doc_query: TSynEdit
        Left = 19
        Top = 41
        Width = 238
        Height = 206
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Highlighter = SynSQLSyn1
        Lines.Strings = (
          'SELECT'
          #9'NameEd                         '#39#1048#1084#1103' '#1090#1080#1087#1072' '#1082#1072#1088#1090#1086#1095#1082#1080#39','
          #9'doc_type.Kod                   '#39#1050#1086#1076' '#1090#1080#1087#1072' '#1082#1072#1088#1090#1086#1095#1082#1080#39','
          #9'doctype_recv.Name              '#39#1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#39','
          '        recv_edoc.Name                 '#39#1048#1084#1103' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#39','
          #9'recv_edoc.Kod                  '#39#1050#1086#1076' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#39','
          #9'recv_edoc.FldName              '#39#1048#1084#1103' '#1087#1086#1083#1103' '#1074' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093#39','
          #9'CASE doctype_recv.Razd'
          '                WHEN '#39#1064#39
          '                THEN '#39#1050#1072#1088#1090#1086#1095#1082#1072#39#9
          '                WHEN '#39#1058#39
          '                THEN '#39#1058#1072#1073#1083#1080#1094#1072#39#9#9
          '                WHEN '#39#1057#39
          '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 2'#39#9
          '                WHEN '#39#1056#39
          '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 3'#39#9
          '                WHEN '#39#1054#39
          '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 4'#39
          '                WHEN '#39#1053#39
          '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 5'#39#9
          '                WHEN '#39#1052#39
          '                THEN '#39#1058#1072#1073#1083#1080#1094#1072' 6'#39#9#9
          '                WHEN '#39#1050#39
          '                THEN '#39#1044#1077#1081#1089#1090#1074#1080#1077#39
          '        end                            '#39#1056#1072#1079#1076#1077#1083#39','
          '        '#39'SBEDoc'#39'                       '#39#1048#1084#1103' '#1041#1044#39','
          '        CASE recv_edoc.Type'
          '               WHEN '#39#1044#39
          '               THEN '#39#1044#1072#1090#1072#39
          '               WHEN '#39#1063#39
          '               THEN '#39#1044#1088#1086#1073#1085#1086#1077' '#1095#1080#1089#1083#1086#39
          '               WHEN '#39#1055#39
          '               THEN '#39#1055#1088#1080#1079#1085#1072#1082#39
          '               WHEN '#39#1040#39
          '               THEN '#39#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#39
          '               WHEN '#39#1057#39
          '               THEN '#39#1057#1090#1088#1086#1082#1072#39
          '               WHEN '#39#1052#39
          '               THEN '#39#1058#1077#1082#1089#1090#39
          '               WHEN '#39#1062#39
          '               THEN '#39#1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086#39
          '        END                     '#39#1058#1080#1087#39',                   --8,'
          ''
          'case recv_edoc.Stored'
          'WHEN '#39#1044#39
          'THEN '#39'-1'#39
          'WHEN '#39#1053#39
          'THEN '#39'0'#39
          'end  '#39#1057#1086#1093#1088#1072#1085#1103#1090#1100#39', --9'
          ''
          'recv_edoc.PriznValues '#39#1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1088#1080#1079#1085#1072#1082#1072#39', --10'
          ''
          'case doctype_recv.IsNull '
          'WHEN '#39#1044#39
          'THEN '#39'-1'#39
          'WHEN '#39#1053#39
          'THEN '#39'0'#39
          'end  '#39#1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1081#39' --11'
          ''
          'FROM'
          #9'MBEDocType doc_type'
          
            #9'INNER JOIN MBEDocTypeRecv doctype_recv ON doc_type.TypeID = doc' +
            'type_recv.TypeID'#9
          
            #9'INNER JOIN MBRecvEDoc recv_edoc ON doctype_recv.Kod = recv_edoc' +
            '.Kod'
          ''
          'WHERE'
          
            '        ( NameEd like '#39'%<'#1095#1072#1089#1090#1100'_'#1080#1084#1077#1085#1080'>%'#39'      or doc_type.Kod lik' +
            'e '#39'%<'#1095#1072#1089#1090#1100'_'#1080#1084#1077#1085#1080'>%'#39' )'
          '        and'
          
            '        ( doctype_recv.Name  like '#39'%<'#1095#1072#1089#1090#1100'_'#1088#1077#1082#1074#1080#1079#1080#1090#1072'>%'#39'  or  rec' +
            'v_edoc.Name like '#39'%<'#1095#1072#1089#1090#1100'_'#1088#1077#1082#1074#1080#1079#1080#1090#1072'>%'#39' )'
          ''
          'ORDER BY ['#1048#1084#1103' '#1090#1080#1087#1072' '#1082#1072#1088#1090#1086#1095#1082#1080'], '#1056#1072#1079#1076#1077#1083', ['#1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1088#1077#1082#1074#1080#1079#1080#1090#1072']'
          ' '
          ' '
          ' ')
      end
      object ref_query: TSynEdit
        Left = 267
        Top = 40
        Width = 238
        Height = 209
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
        Highlighter = SynSQLSyn1
        Lines.Strings = (
          'SELECT'
          'vid.Name                '#39#1048#1084#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39','#9'--0'
          'vid.Kod                 '#39#1050#1086#1076' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39','#9'--1'
          'vidrecv.Name            '#39#1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#39',  --2'
          'recvan.Name             '#39#1048#1084#1103' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#39',        --3'
          'recvan.Kod              '#39#1050#1086#1076' '#1088#1077#1082#1074#1080#1079#1080#1090#1072#39',        --4'
          'recvan.FldName          '#39#1048#1084#1103' '#1087#1086#1083#1103' '#1074' '#1073#1076#39',        --5'
          'CASE recvan.Razd'
          '        WHEN '#39#1064#39
          '        THEN '#39#1050#1072#1088#1090#1086#1095#1082#1072#39
          '        WHEN '#39#1058#39
          '        THEN '#39#1058#1072#1073#1083#1080#1094#1072#39
          '        WHEN '#39#1057#39
          '        THEN '#39#1058#1072#1073#1083#1080#1094#1072' 2'#39
          '        WHEN '#39#1056#39
          '        THEN '#39#1058#1072#1073#1083#1080#1094#1072' 3'#39
          '        WHEN '#39#1054#39
          '        THEN '#39#1058#1072#1073#1083#1080#1094#1072' 4'#39
          '        WHEN '#39#1053#39
          '        THEN '#39#1058#1072#1073#1083#1080#1094#1072' 5'#39
          '        WHEN '#39#1052#39
          '        THEN '#39#1058#1072#1073#1083#1080#1094#1072' 6'#39
          '        WHEN '#39#1050#39
          '        THEN '#39#1044#1077#1081#1089#1090#1074#1080#1077#39
          'end '#39#1056#1072#1079#1076#1077#1083#39',                                   --6'
          #39'MBAnalit'#39'              '#39#1060#1080#1079' '#1080#1084#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072#39',  --7'
          ''
          'CASE recvan.Type'
          '       WHEN '#39#1044#39
          '       THEN '#39#1044#1072#1090#1072#39
          '       WHEN '#39#1063#39
          '       THEN '#39#1044#1088#1086#1073#1085#1086#1077' '#1095#1080#1089#1083#1086#39
          '       WHEN '#39#1055#39
          '       THEN '#39#1055#1088#1080#1079#1085#1072#1082#39
          '       WHEN '#39#1040#39
          '       THEN '#39#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#39
          '       WHEN '#39#1057#39
          '       THEN '#39#1057#1090#1088#1086#1082#1072#39
          '       WHEN '#39#1052#39
          '       THEN '#39#1058#1077#1082#1089#1090#39
          '       WHEN '#39#1062#39
          '       THEN '#39#1062#1077#1083#1086#1077' '#1095#1080#1089#1083#1086#39
          'END                     '#39#1058#1080#1087#39',                   --8'
          ''
          'case recvan.Stored'
          '  WHEN '#39#1044#39
          '  THEN '#39'-1'#39
          '  WHEN '#39#1053#39
          '  THEN '#39'0'#39
          'end  '#39#1057#1086#1093#1088#1072#1085#1103#1090#1100#39', --9'
          ''
          'recvan.PriznValues '#39#1047#1085#1072#1095#1077#1085#1080#1103' '#1087#1088#1080#1079#1085#1072#1082#1072#39', --10'
          'case vidrecv.IsNull '
          'WHEN '#39#1044#39
          'THEN '#39'-1'#39
          'WHEN '#39#1053#39
          'THEN '#39'0'#39
          'end  '#39#1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1099#1081#39' --11'
          ''
          'FROM '
          '        MBVidAn vid'
          '        INNER JOIN MBVidAnRecv vidrecv '
          '        INNER JOIN MBRecvAn recvan ON'
          '        vidrecv.Kod = recvan.Kod ON '
          '        vid.Vid = vidrecv.Vid '
          ''
          'WHERE'
          
            '      (  vid.Name like '#39'%<'#1095#1072#1089#1090#1100'_'#1080#1084#1077#1085#1080'>%'#39' or vid.Kod like '#39'%<'#1095#1072#1089#1090 +
            #1100'_'#1080#1084#1077#1085#1080'>%'#39' )'
          '      and'
          
            '      (  recvan.Name like '#39'%<'#1095#1072#1089#1090#1100'_'#1088#1077#1082#1074#1080#1079#1080#1090#1072'>%'#39' or vidrecv.Name ' +
            'like '#39'%<'#1095#1072#1089#1090#1100'_'#1088#1077#1082#1074#1080#1079#1080#1090#1072'>%'#39'  )'
          ''
          'ORDER BY'
          '        vid.Name ASC, recvan.Razd DESC, vidrecv.Name ASC'
          ' '
          ' ')
      end
    end
    object TabSheet11: TsTabSheet
      Caption = 'ISB '#1054#1073#1098#1077#1082#1090#1099
      ImageIndex = 6
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object isb_object: TSynEdit
        Left = 8
        Top = 8
        Width = 633
        Height = 489
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
        Lines.Strings = (
          'Version=ISB7'
          'SystemCode=consult'
          'ComponentType=1'
          'ComponentCode=COMPONENT_TOKEN'
          'ID=555'
          'ViewCode=')
      end
    end
  end
  object SynSQLSyn1: TSynSQLSyn
    Left = 1092
    Top = 40
  end
end
