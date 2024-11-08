unit pListagemProdutos;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  FireDAC.Phys.FBDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uDataAccess;

type
  TfrmListaProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgProdutos: TDBGrid;
    Panel3: TPanel;
    btnCadastrar: TButton;
    dsListProds: TDataSource;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure GridRefresh;
    { Private declarations }
  public
    { Public declarations }
    fDataAccess: TDataAccess;
    vFdQry: TFDQuery;
  end;

var
  frmListaProdutos: TfrmListaProdutos;

implementation

uses
  pCadastroProdutos;

{$R *.dfm}

procedure TfrmListaProdutos.btnCadastrarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmcadProdutos, frmcadProdutos);
  frmcadProdutos.pQuery := self.vFdQry;
  frmcadProdutos.ShowModal;
end;

procedure TfrmListaProdutos.FormShow(Sender: TObject);
begin
  GridRefresh;
end;

procedure TfrmListaProdutos.GridRefresh;
begin
  vFdQry := fDataAccess.ReadRecords('Produtos');
  dsListProds.DataSet := vFdQry;
  dbgProdutos.DataSource := dsListProds;
  dbgProdutos.Refresh;
end;

end.
