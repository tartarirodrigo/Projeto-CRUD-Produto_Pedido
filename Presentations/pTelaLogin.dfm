object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  AlphaBlendValue = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login - Teste de CRUD de Produto e Pedido'
  ClientHeight = 177
  ClientWidth = 559
  Color = clBtnFace
  Constraints.MaxHeight = 215
  Constraints.MaxWidth = 571
  Constraints.MinHeight = 215
  Constraints.MinWidth = 571
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -33
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  KeyPreview = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 45
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 57
    Align = alTop
    Caption = 'Teste de CRUD de Produto e Pedido'
    TabOrder = 0
    ExplicitWidth = 555
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 559
    Height = 120
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 555
    ExplicitHeight = 119
    object Label1: TLabel
      Left = 45
      Top = 23
      Width = 59
      Height = 21
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 45
      Top = 52
      Width = 47
      Height = 21
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edUsuario: TEdit
      Left = 110
      Top = 21
      Width = 369
      Height = 23
      TabOrder = 0
    end
    object btLogin: TButton
      Left = 387
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Login'
      TabOrder = 2
      OnClick = btLoginClick
    end
    object btSair: TButton
      Left = 468
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btSairClick
    end
    object edSenha: TEdit
      Left = 110
      Top = 50
      Width = 369
      Height = 23
      PasswordChar = '*'
      TabOrder = 1
    end
  end
end
