program CRUDProdPed;

uses
  Vcl.Forms,
  pMenuPrincipal in '..\Presentations\pMenuPrincipal.pas' {frmMenuPrincipal},
  pTelaLogin in '..\Presentations\pTelaLogin.pas' {frmLogin},
  bLogin in '..\Business\bLogin.pas',
  bCadastroProdutos in '..\Business\bCadastroProdutos.pas',
  bCadastroPedidos in '..\Business\bCadastroPedidos.pas',
  pListaEmpresas in '..\Presentations\pListaEmpresas.pas' {frmListaEmpresas},
  pCadEmpresa in '..\Presentations\pCadEmpresa.pas' {frmCadEmpresa},
  pListagemProdutos in '..\Presentations\pListagemProdutos.pas' {frmListaProdutos},
  pCadastroProdutos in '..\Presentations\pCadastroProdutos.pas' {frmcadProdutos},
  pEdicaoProdutos in '..\Presentations\pEdicaoProdutos.pas' {frmEdtProdutos},
  pExclusaoProdutos in '..\Presentations\pExclusaoProdutos.pas' {frmExclProdutos},
  pListagemPedidos in '..\Presentations\pListagemPedidos.pas' {frmListPedidos},
  pNovoPedido in '..\Presentations\pNovoPedido.pas' {frmCadPedido},
  pExclusaoPedido in '..\Presentations\pExclusaoPedido.pas' {frmExclPedido},
  uDataAccess in '..\Data\uDataAccess.pas';


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.
