object frmListaProdutos: TfrmListaProdutos
  Left = 0
  Top = 0
  Caption = 'Teste de CRUD de Produto e Pedido - Listagem de Produtos'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 57
    Align = alTop
    Caption = 'Listagem de Produtos'
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
    ExplicitTop = 129
    ExplicitHeight = 279
    object dbgProdutos: TDBGrid
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
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'ID Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 255
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Title.Caption = 'Pre'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Caption = 'Estoque'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_EMPRESA'
          Title.Caption = 'Id Empresa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Caption = 'Data Cadastro'
          Width = 80
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 407
    Width = 628
    Height = 35
    Align = alBottom
    TabOrder = 2
    object btnCadastrar: TButton
      Left = 1
      Top = 1
      Width = 626
      Height = 33
      Align = alClient
      Caption = 'Cadastro'
      TabOrder = 0
      OnClick = btnCadastrarClick
      ExplicitWidth = 209
    end
  end
  object dsListProds: TDataSource
    Left = 528
    Top = 6
  end
end
