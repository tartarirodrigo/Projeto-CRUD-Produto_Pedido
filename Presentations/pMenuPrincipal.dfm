object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste de CRUD de Produto e Pedido'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 423
    Width = 628
    Height = 19
    Panels = <>
    ExplicitTop = 422
    ExplicitWidth = 624
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 96
    object Arquivo1: TMenuItem
      Caption = '&Arquivo'
      object Sair1: TMenuItem
        Caption = '&Sair'
        OnClick = Sair1Click
      end
    end
    object Arquivo2: TMenuItem
      Caption = '&Cadastros'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
    end
    object Vendas1: TMenuItem
      Caption = '&Vendas'
      object Pedidos1: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos1Click
      end
    end
    object Vendas2: TMenuItem
      Caption = 'A&juda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
end
