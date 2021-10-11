object Form2: TForm2
  Left = 225
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Auto Replacer 1.3'
  ClientHeight = 674
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label6: TLabel
    Left = 245
    Top = 4
    Width = 54
    Height = 16
    Caption = #1060#1072#1081#1083#1099':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 10
    Top = 4
    Width = 110
    Height = 16
    Caption = #1044#1080#1089#1082#1080' '#1080' '#1087#1072#1087#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 9
    Top = 489
    Width = 277
    Height = 16
    Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1084#1077#1085#1099': '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1086' 0 '#1092#1072#1081#1083#1086#1074' '#1080#1079' 0'
  end
  object Label2: TLabel
    Left = 448
    Top = 60
    Width = 95
    Height = 16
    Caption = #1042#1089#1077#1075#1086' '#1092#1072#1081#1083#1086#1074':'
  end
  object Label3: TLabel
    Left = 448
    Top = 79
    Width = 138
    Height = 16
    Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1092#1072#1081#1083#1086#1074':'
  end
  object Label8: TLabel
    Left = 572
    Top = 489
    Width = 166
    Height = 16
    Alignment = taRightJustify
    Caption = #1053#1077' '#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1086' '#1079#1072#1084#1077#1085': 0'
  end
  object Button1: TButton
    Left = 448
    Top = 137
    Width = 289
    Height = 24
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1089#1090#1088#1086#1082#1080
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object FileListBox1: TFileListBox
    Left = 233
    Top = 55
    Width = 208
    Height = 426
    ItemHeight = 16
    Mask = '*.htm'
    MultiSelect = True
    TabOrder = 8
    OnChange = FileListBox1Change
    OnClick = FileListBox1Click
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 0
    Top = 55
    Width = 225
    Height = 426
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 7
    OnChange = DirectoryListBox1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 0
    Top = 23
    Width = 225
    Height = 22
    DirList = DirectoryListBox1
    TabOrder = 5
  end
  object FilterComboBox1: TFilterComboBox
    Left = 233
    Top = 23
    Width = 208
    Height = 24
    FileList = FileListBox1
    Filter = 
      'Web pages (*.htm)|*.htm|Web pages (*.html)|*.html|PHP (*.php)|*.' +
      'php|Perl (*.pl)|*.pl|CSS (*.css)|*.css|JavaScript (*.js)|*.js|XM' +
      'L (*.xml)|*.xml|Text (*.txt)|*.txt|All files (*.*)|*.*'
    TabOrder = 6
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 666
    Width = 745
    Height = 8
    Align = alBottom
    TabOrder = 10
  end
  object Button2: TButton
    Left = 448
    Top = 105
    Width = 289
    Height = 24
    Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
    TabOrder = 0
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 448
    Top = 281
    Width = 289
    Height = 200
    Caption = '  '#1057#1074#1086#1081#1089#1090#1074#1072' '#1072#1074#1090#1086#1079#1072#1084#1077#1085#1099'  '
    TabOrder = 4
    object Label4: TLabel
      Left = 16
      Top = 25
      Width = 93
      Height = 16
      Caption = #1063#1090#1086' '#1079#1072#1084#1077#1085#1080#1090#1100':'
    end
    object Label9: TLabel
      Left = 16
      Top = 80
      Width = 113
      Height = 16
      Caption = #1053#1072' '#1095#1090#1086' '#1079#1072#1084#1077#1085#1080#1090#1100':'
    end
    object SpeedButton2: TSpeedButton
      Left = 248
      Top = 105
      Width = 25
      Height = 24
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000007E7E
        7E00C0C0C0006E8E980069919D0072929C007B929A005293A7005693A5005E92
        A2005094A8005B98A9006E96A2006A9AA800729AA600808080008C8C8C009494
        95009A9A9A009E9E9E0098A4A900A7A7A800ADADAD00B1B1B100B4B4B400B7B7
        B800BDBDBD00A3C0C900B1C2C700A5C8D200BED8E00084EAFF0088EAFF008CEB
        FF0091ECFF0096ECFF009AEDFF00A1EEFF00A5EFFF00A9F0FF00AFF1FF00B2F1
        FF00B5F2FF00BAF3FF00BEF4FF00C5C5C500C7C7C800CDCDCD00D1D1D100D9D9
        D900DCDCDC00C0E1E900D1EDF400D8EEF400C1F4FF00C5F5FF00C9F5FF00CDF6
        FF00D0F6FF00D6F8FF00D8F8FF00E4E4E400E9E9E900E0F0F400F2F2F200F4FF
        FF00F9F9F900FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02020202020202020202020202020F01010101010101010F0102020202101143
        11113D3D3D4311400102020210401143111132323243114001020201403E1143
        3E3E3E3E3D431140010202014018111111111111111111400102020140181818
        1818181818181840010202014018080A0A0A0A0A0A0A08400102020140084343
        4343434343430A4001020201400A4324232320201F430A4001020201400A4327
        2624242423430A4001020201400A432A2A2A272626430A4001020201400A4337
        372B2B2A27430A400102020F400A413B3A39393737430A3E01020202010A0A0A
        0A0A0A0A0A0A0B01010202020202020202020202020202020202}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object CheckBox1: TCheckBox
      Left = 18
      Top = 142
      Width = 199
      Height = 20
      Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' Backup '#1092#1072#1081#1083#1099
      TabOrder = 1
    end
    object CheckBox6: TCheckBox
      Left = 18
      Top = 169
      Width = 247
      Height = 16
      Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 16
      Top = 105
      Width = 225
      Height = 24
      TabOrder = 0
      OnChange = Edit3Change
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 48
      Width = 257
      Height = 24
      ItemHeight = 16
      TabOrder = 3
      OnCloseUp = ComboBox1CloseUp
    end
  end
  object Edit1: TEdit
    Left = 608
    Top = 64
    Width = 129
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object RichEdit1: TRichEdit
    Left = 16
    Top = 297
    Width = 409
    Height = 128
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 9
    Visible = False
    WordWrap = False
  end
  object Button3: TButton
    Left = 448
    Top = 249
    Width = 289
    Height = 24
    Caption = #1054#1090#1084#1077#1085#1072
    Enabled = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 448
    Top = 208
    Width = 289
    Height = 25
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1089#1090#1088#1086#1082#1080' '#1080#1079' '#1089#1087#1080#1089#1082#1072' ... '
    TabOrder = 2
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 448
    Top = 25
    Width = 289
    Height = 24
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 12
    object SpeedButton1: TSpeedButton
      Left = 1
      Top = 1
      Width = 287
      Height = 24
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 512
    Width = 745
    Height = 154
    Align = alBottom
    Columns = <
      item
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
        Width = 270
      end
      item
        Alignment = taCenter
        Caption = #1056#1072#1079#1084#1077#1088' "'#1076#1086'" ('#1050#1073')'
        Width = 140
      end
      item
        Alignment = taCenter
        Caption = #1056#1072#1079#1084#1077#1088' "'#1087#1086#1089#1083#1077'" ('#1050#1073')'
        Width = 160
      end
      item
        Alignment = taRightJustify
        Caption = #1047#1072#1084#1077#1085' '#1074' '#1092#1072#1081#1083#1077
        Width = 140
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 13
    ViewStyle = vsReport
  end
  object Button5: TButton
    Left = 448
    Top = 176
    Width = 289
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1092#1072#1081#1083#1086#1074' ...'
    TabOrder = 14
    OnClick = Button5Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Text files(*.txt)|*.txt|All files (*.*)|*.*'
    Left = 240
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.txt'
    FileName = #1077#1085#1085#1077#1085#1077
    Filter = 'Text files(*.txt)|*.txt|All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 275
    Top = 64
  end
end
