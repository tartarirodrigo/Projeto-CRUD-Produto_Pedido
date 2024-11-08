object frmcadProdutos: TfrmcadProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Teste de CRUD de Produto e Pedido - Cadastro de Produto'
  ClientHeight = 268
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MaxHeight = 307
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 307
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 57
    Align = alTop
    Caption = 'Cadastro de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlProdutos: TPanel
    Left = 0
    Top = 103
    Width = 624
    Height = 165
    Align = alBottom
    Enabled = False
    TabOrder = 1
    ExplicitTop = 104
    ExplicitWidth = 628
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 57
      Height = 15
      Caption = 'ID Produto'
    end
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 16
      Top = 72
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel
      Left = 16
      Top = 101
      Width = 30
      Height = 15
      Caption = 'Pre'#231'o'
    end
    object Label5: TLabel
      Left = 16
      Top = 130
      Width = 42
      Height = 15
      Caption = 'Estoque'
    end
    object edID: TDBEdit
      Left = 79
      Top = 11
      Width = 121
      Height = 23
      DataField = 'ID'
      DataSource = dsDadosProd
      TabOrder = 0
    end
    object edNome: TDBEdit
      Left = 79
      Top = 40
      Width = 538
      Height = 23
      DataField = 'NOME'
      DataSource = dsDadosProd
      TabOrder = 1
    end
    object edDescricao: TDBEdit
      Left = 79
      Top = 69
      Width = 538
      Height = 23
      DataField = 'DESCRICAO'
      DataSource = dsDadosProd
      TabOrder = 2
    end
    object edPreco: TDBEdit
      Left = 79
      Top = 98
      Width = 121
      Height = 23
      DataField = 'PRECO'
      DataSource = dsDadosProd
      TabOrder = 3
    end
    object edEstoque: TDBEdit
      Left = 79
      Top = 127
      Width = 121
      Height = 23
      DataField = 'ESTOQUE'
      DataSource = dsDadosProd
      TabOrder = 4
    end
    object btGravar: TButton
      Left = 542
      Top = 125
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 5
      OnClick = btGravarClick
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 57
    Width = 624
    Height = 46
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 628
    ExplicitHeight = 52
    object btIncluir: TButton
      Left = 1
      Top = 1
      Width = 209
      Height = 45
      Align = alLeft
      Caption = 'Incluir'
      Constraints.MaxWidth = 209
      TabOrder = 0
      OnClick = btIncluirClick
    end
    object btEditar: TButton
      Left = 210
      Top = 1
      Width = 208
      Height = 45
      Align = alClient
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btEditarClick
      ExplicitHeight = 56
    end
    object btExcluir: TButton
      Left = 418
      Top = 1
      Width = 209
      Height = 45
      Align = alRight
      Caption = 'Excluir'
      Constraints.MaxWidth = 209
      TabOrder = 2
      OnClick = btExcluirClick
      ExplicitLeft = 416
    end
  end
  object dsDadosProd: TDataSource
    Left = 448
    Top = 208
  end
end
