unit pMenuPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  uDataAccess,
  Vcl.ComCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Arquivo2: TMenuItem;
    Vendas1: TMenuItem;
    Vendas2: TMenuItem;
    Sair1: TMenuItem;
    Empresa1: TMenuItem;
    Produto1: TMenuItem;
    Pedidos1: TMenuItem;
    Sobre1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDataAccess: TDataAccess;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses
  pTelaLogin,
  pListaEmpresas,
  pListagemProdutos,
  pListagemPedidos;

{$R *.dfm}

procedure TfrmMenuPrincipal.Empresa1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListaEmpresas, frmListaEmpresas);
  frmListaEmpresas.pDataAccess := Self.fDataAccess;
  frmListaEmpresas.ShowModal;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  fDataAccess := frmLogin.fbLogin.pDataAccess;
  frmLogin.ShowModal;
end;

procedure TfrmMenuPrincipal.Pedidos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListPedidos, frmListPedidos);
//  frmListPedidos.fDataAccess := Self.fDataAccess;
  frmListPedidos.ShowModal;
end;

procedure TfrmMenuPrincipal.Produto1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListaProdutos, frmListaProdutos);
  frmListaProdutos.fDataAccess := Self.fDataAccess;
  frmListaProdutos.ShowModal;
end;

procedure TfrmMenuPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
