object frmCadPedido: TfrmCadPedido
  Left = 0
  Top = 0
  Caption = 'Teste de CRUD de Produto e Pedido - Cadastro de Pedido'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 57
    Align = alTop
    Caption = 'Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 624
  end
  object Panel4: TPanel
    Left = 0
    Top = 57
    Width = 628
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitTop = 88
    ExplicitWidth = 185
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 209
      Height = 39
      Align = alLeft
      Caption = 'Incluir'
      Constraints.MaxWidth = 209
      TabOrder = 0
      ExplicitLeft = 9
      ExplicitTop = 2
    end
    object Button2: TButton
      Left = 210
      Top = 1
      Width = 208
      Height = 39
      Align = alClient
      Caption = 'Editar'
      TabOrder = 1
      ExplicitHeight = 56
    end
    object Button3: TButton
      Left = 418
      Top = 1
      Width = 209
      Height = 39
      Align = alRight
      Caption = 'Excluir'
      Constraints.MaxWidth = 209
      TabOrder = 2
      ExplicitLeft = 416
      ExplicitHeight = 45
    end
  end
  object pnlPedido: TPanel
    Left = 0
    Top = 98
    Width = 628
    Height = 344
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    ExplicitLeft = 272
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel2: TPanel
      Left = 0
      Top = 97
      Width = 628
      Height = 247
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 125
      ExplicitHeight = 251
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 626
        Height = 32
        Align = alTop
        TabOrder = 0
        object DBNavigator1: TDBNavigator
          Left = 1
          Top = 1
          Width = 624
          Height = 30
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
          Align = alClient
          TabOrder = 0
        end
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 33
        Width = 626
        Height = 194
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object StatusBar1: TStatusBar
        Left = 1
        Top = 227
        Width = 626
        Height = 19
        Panels = <
          item
            Alignment = taRightJustify
            Width = 350
          end
          item
            Alignment = taRightJustify
            Text = 'Total do Pedido: '
            Width = 100
          end
          item
            Alignment = taRightJustify
            Width = 50
          end>
        ExplicitTop = 231
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 628
      Height = 97
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 15
        Top = 14
        Width = 51
        Height = 15
        Caption = 'ID Pedido'
      end
      object Label2: TLabel
        Left = 16
        Top = 43
        Width = 51
        Height = 15
        Caption = 'ID Cliente'
      end
      object Label3: TLabel
        Left = 15
        Top = 72
        Width = 64
        Height = 15
        Caption = 'Data Pedido'
      end
      object DBEdit1: TDBEdit
        Left = 85
        Top = 6
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 85
        Top = 35
        Width = 121
        Height = 23
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 85
        Top = 64
        Width = 121
        Height = 23
        TabOrder = 2
      end
    end
  end
end
