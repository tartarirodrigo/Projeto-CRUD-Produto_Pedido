unit pListaEmpresas;

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
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.DB,
  Datasnap.DBClient,
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
  TfrmListaEmpresas = class(TForm)
    dbgEmpresas: TDBGrid;
    btnCadEmpresa: TButton;
    dsListaEmpresas: TDataSource;
    procedure btnCadEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDataAccess: TDataAccess;
    vFdQry: TFDQuery;

    procedure GridRefresh;
    function getFdQry: TFDQuery;
    procedure setFdQry(pQry: TFDQuery);
  public
    { Public declarations }
    property pQuery: TFDQuery read getFdQry write setFdQry;
    property pDataAccess: TDataAccess read fDataAccess write fDataAccess;
  end;

var
  frmListaEmpresas: TfrmListaEmpresas;

implementation

{$R *.dfm}

uses pCadEmpresa;

procedure TfrmListaEmpresas.btnCadEmpresaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadEmpresa, frmCadEmpresa);
  frmCadEmpresa.pQuery := self.vFdQry;
  frmCadEmpresa.ShowModal;
end;

procedure TfrmListaEmpresas.GridRefresh;
begin
  vFdQry := fDataAccess.ReadRecords('Empresas');
  dsListaEmpresas.DataSet := vFdQry;
  dbgEmpresas.DataSource := dsListaEmpresas;
  dbgEmpresas.Refresh;
end;

procedure TfrmListaEmpresas.setFdQry(pQry: TFDQuery);
begin
  vFdQry := pQry;
end;

procedure TfrmListaEmpresas.FormShow(Sender: TObject);
begin
  GridRefresh;
end;

function TfrmListaEmpresas.getFdQry: TFDQuery;
begin
  Result := vFdQry;
end;

end.
