object frmListPedidos: TfrmListPedidos
  Left = 0
  Top = 0
  Caption = 'Teste de CRUD de Produto e Pedido - Listagem de Pedidos'
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
    Caption = 'Listagem de Pedidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 624
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 628
    Height = 350
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 288
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 626
      Height = 348
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 407
    Width = 628
    Height = 35
    Align = alBottom
    TabOrder = 2
    object btnEditar: TButton
      Left = 1
      Top = 1
      Width = 626
      Height = 33
      Align = alClient
      Caption = 'Cadastro'
      TabOrder = 0
      OnClick = btnEditarClick
      ExplicitLeft = 210
      ExplicitWidth = 206
    end
  end
end
