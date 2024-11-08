object frmCadEmpresa: TfrmCadEmpresa
  Left = 0
  Top = 0
  Caption = 'Teste de CRUD de Produto e Pedido - Tela de Cadastro da Empresa'
  ClientHeight = 282
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 57
    Align = alTop
    Caption = 'Cadastro da Empresa'
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
    Top = 96
    Width = 628
    Height = 186
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 624
    ExplicitHeight = 185
    DesignSize = (
      628
      186)
    object Label1: TLabel
      Left = 32
      Top = 12
      Width = 58
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Id Empresa'
    end
    object Label2: TLabel
      Left = 32
      Top = 41
      Width = 27
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'CNPJ'
      ExplicitTop = 53
    end
    object Label3: TLabel
      Left = 32
      Top = 70
      Width = 33
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Nome'
      ExplicitTop = 82
    end
    object Label4: TLabel
      Left = 32
      Top = 99
      Width = 49
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Endere'#231'o'
      ExplicitTop = 111
    end
    object Label5: TLabel
      Left = 32
      Top = 128
      Width = 44
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'Telefone'
      ExplicitTop = 140
    end
    object Label6: TLabel
      Left = 32
      Top = 157
      Width = 34
      Height = 15
      Anchors = [akLeft, akBottom]
      Caption = 'E-mail'
      ExplicitTop = 169
    end
    object edIdEmpresa: TDBEdit
      Left = 99
      Top = 9
      Width = 121
      Height = 23
      Anchors = [akLeft, akBottom]
      DataField = 'ID'
      DataSource = dsDadosEmp
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      ExplicitTop = 8
    end
    object edNome: TDBEdit
      Left = 99
      Top = 67
      Width = 494
      Height = 23
      Anchors = [akLeft, akBottom]
      DataField = 'NOME'
      DataSource = dsDadosEmp
      TabOrder = 2
      ExplicitTop = 66
    end
    object EdEndereco: TDBEdit
      Left = 99
      Top = 96
      Width = 494
      Height = 23
      Anchors = [akLeft, akBottom]
      DataField = 'ENDERECO'
      DataSource = dsDadosEmp
      TabOrder = 3
      ExplicitTop = 95
    end
    object edTelefone: TDBEdit
      Left = 99
      Top = 125
      Width = 121
      Height = 23
      Anchors = [akLeft, akBottom]
      DataField = 'TELEFONE'
      DataSource = dsDadosEmp
      TabOrder = 4
      ExplicitTop = 124
    end
    object edEmail: TDBEdit
      Left = 99
      Top = 154
      Width = 334
      Height = 23
      Anchors = [akLeft, akBottom]
      DataField = 'EMAIL'
      DataSource = dsDadosEmp
      TabOrder = 5
      ExplicitTop = 153
    end
    object mskCNPJ: TMaskEdit
      Left = 99
      Top = 38
      Width = 121
      Height = 23
      Anchors = [akLeft, akBottom]
      EditMask = '00\.000\.000\/0000\-00;0;_'
      MaxLength = 18
      TabOrder = 0
      Text = ''
      OnExit = mskCNPJExit
      ExplicitTop = 37
    end
    object btnConsCNPJ: TButton
      Left = 226
      Top = 38
      Width = 111
      Height = 23
      Anchors = [akLeft, akBottom]
      Caption = 'Consultar CNPJ'
      TabOrder = 1
      OnClick = btnConsCNPJClick
      ExplicitTop = 37
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 628
    Height = 39
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 624
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 626
      Height = 37
      DataSource = dsDadosEmp
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 622
    end
  end
  object dsDadosEmp: TDataSource
    OnDataChange = dsDadosEmpDataChange
    Left = 392
    Top = 104
  end
end
