object Form1: TForm1
  Left = 224
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Test Zamena'
  ClientHeight = 528
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 486
    Top = 486
    Width = 151
    Height = 16
    Caption = #1055#1088#1086#1080#1079#1074#1077#1076#1077#1085#1086' '#1079#1072#1084#1077#1085': 0'
  end
  object Label2: TLabel
    Left = 24
    Top = 472
    Width = 30
    Height = 16
    Caption = #1063#1090#1086':'
  end
  object Label3: TLabel
    Left = 8
    Top = 504
    Width = 49
    Height = 16
    Caption = #1053#1072' '#1095#1090#1086':'
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 8
    Width = 809
    Height = 449
    Lines.Strings = (
      
        'QWERTY__T__>>__666__MERCURY_T_xXx__>>__ROM_xXx_DOOM_666_>>_TT_66' +
        '6_Alpha'
      '>>__666__T_ZZZ__T__666_>>'
      '>>__666__T_xXx__>>__ROM_666_>>_TT_666'
      
        'QWERTY__T__>>__666__MERCURY_T_xXx__>>__ROM_xXx_DOOM_666_>>_TT_66' +
        '6_Alpha')
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Edit1: TEdit
    Left = 72
    Top = 464
    Width = 241
    Height = 24
    TabOrder = 1
    Text = '>>'
  end
  object Edit2: TEdit
    Left = 72
    Top = 496
    Width = 241
    Height = 24
    TabOrder = 2
    Text = '>>>'
  end
  object Button1: TButton
    Left = 328
    Top = 464
    Width = 145
    Height = 25
    Caption = 'Zamena'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 664
    Top = 480
    Width = 153
    Height = 25
    Caption = 'Open file'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 30
    Top = 414
    Width = 237
    Height = 24
    TabOrder = 5
    Visible = False
  end
  object Button3: TButton
    Left = 328
    Top = 496
    Width = 145
    Height = 25
    Caption = 'Zamena New'
    TabOrder = 6
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Html|*.htm;*.html|All|*.*'
    Left = 552
    Top = 384
  end
end
