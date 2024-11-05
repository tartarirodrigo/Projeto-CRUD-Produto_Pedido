unit pListagemPedidos;

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
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListPedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnEditar: TButton;
    DBGrid1: TDBGrid;
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListPedidos: TfrmListPedidos;

implementation

uses
  pNovoPedido;

{$R *.dfm}

procedure TfrmListPedidos.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCadPedido, frmCadPedido);
  frmCadPedido.ShowModal;
end;

end.
