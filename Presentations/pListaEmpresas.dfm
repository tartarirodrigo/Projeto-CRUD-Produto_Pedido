object frmListaEmpresas: TfrmListaEmpresas
  Left = 0
  Top = 0
  Caption = 'Teste de CRUD de Produto e Pedido - Lista de Empresa'
  ClientHeight = 432
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object dbgEmpresas: TDBGrid
    Left = 8
    Top = 8
    Width = 612
    Height = 369
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
        FieldName = 'CNPJ'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Caption = 'Data Cadastro'
        Visible = True
      end>
  end
  object btnCadEmpresa: TButton
    Left = 408
    Top = 383
    Width = 212
    Height = 42
    Caption = 'Cadastro'
    TabOrder = 1
    OnClick = btnCadEmpresaClick
  end
  object dsListaEmpresas: TDataSource
    Left = 184
    Top = 384
  end
end
