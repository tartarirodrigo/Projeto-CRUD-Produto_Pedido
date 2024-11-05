unit pCadastroProdutos;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Data.DB,
  uDataAccess,
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
  bCadastroProdutos;

type
  TFlag = (fInclusao,fAlteracao,fExclusao,fBrowse);

type
  TfrmcadProdutos = class(TForm)
    Panel1: TPanel;
    pnlProdutos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edID: TDBEdit;
    edNome: TDBEdit;
    edDescricao: TDBEdit;
    edPreco: TDBEdit;
    edEstoque: TDBEdit;
    pnlBotoes: TPanel;
    btIncluir: TButton;
    btEditar: TButton;
    btExcluir: TButton;
    dsDadosProd: TDataSource;
    btGravar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    { Private declarations }
    vFdQry: TFDQuery;
    fDataAccess: TDataAccess;

    function getFdQry: TFDQuery;
    procedure setFdQry(pQry: TFDQuery);
    procedure filtrar;
    procedure acertaBotoes;
  public
    { Public declarations }
    property pQuery: TFDQuery read getFdQry write setFdQry;
  end;

var
  frmcadProdutos: TfrmcadProdutos;

implementation

{$R *.dfm}

{ TfrmcadProdutos }

var
  vFlag: TFlag;
  vIdEmp: string;
  fCadProdutos: TCadastroProduto;

procedure TfrmcadProdutos.acertaBotoes;
begin
  case vFlag of
    fInclusao, fAlteracao:
    begin
      btIncluir.Enabled := False;
      btEditar.Enabled  := False;
      btExcluir.Enabled := False;
      btGravar.Enabled  := True;
    end;
    fExclusao:
    begin
      btIncluir.Enabled := False;
      btEditar.Enabled  := False;
      btExcluir.Enabled := False;
      btGravar.Enabled  := False;
    end;
    else
    begin
      btIncluir.Enabled := True;
      btEditar.Enabled  := True;
      btExcluir.Enabled := True;
      btGravar.Enabled  := False;
    end;
  end;

end;

procedure TfrmcadProdutos.btEditarClick(Sender: TObject);
begin
  vIdEmp := IntToStr(vFdQry.FieldByName('ID').AsInteger);
  vFlag  := fAlteracao;
  pnlProdutos.Enabled := True;
end;

procedure TfrmcadProdutos.btExcluirClick(Sender: TObject);
begin
  vIdEmp := IntToStr(vFdQry.FieldByName('ID').AsInteger);
  vFlag  := fExclusao;
  pnlProdutos.Enabled := False;
end;

procedure TfrmcadProdutos.btGravarClick(Sender: TObject);
begin
  case vFlag of
    fInclusao:
    begin
      fCadProdutos.incluir('PRODUTOS',varArrayof(['ID','NOME','DESCRICAO','PRECO','ESTOQUE','ID_EMPRESA']),
                                      varArrayOf([edID.Text,edNome.Text,edDescricao.Text, edPreco.Text, edEstoque.Text,vIdEmp]));

    end;
    fAlteracao:
    begin
      fcadProdutos.alterar('PRODUTOS',varArrayof(['ID','NOME','DESCRICAO','PRECO','ESTOQUE','ID_EMPRESA']),
                                      varArrayOf([edID.Text,edNome.Text,edDescricao.Text, edPreco.Text, edEstoque.Text,vIdEmp]),
                           'ID',vIdEmp);
    end;
    fExclusao:
    begin
      if Application.MessageBox('Deseja realmente excluir o registro?','Exclusão', MB_ICONQUESTION + MB_YESNO) = mrYes then
        fcadProdutos.excluir('PRODUTOS','ID',vIdEmp)
      else
        ShowMessage('Operação cancelada pelo Usuário.');
    end;
  end;
  filtrar;
  vFlag := fBrowse;
  acertaBotoes;
end;

procedure TfrmcadProdutos.btIncluirClick(Sender: TObject);
begin
  vIdEmp := IntToStr(vFdQry.FieldByName('ID').AsInteger);
  vFlag  := fInclusao;
  pnlProdutos.Enabled := True;
end;

procedure TfrmcadProdutos.filtrar;
begin
  vFdQry := fcadProdutos.filtrar('PRODUTOS');
  vFdQry.Last;
end;

procedure TfrmcadProdutos.FormCreate(Sender: TObject);
begin
  fCadProdutos := TCadastroProduto.Create;
  vFdQry := TFDQuery.Create(nil);
  filtrar;
//  fCadProdutos.ftLogin.pDataAccess := fDataAccess;
  dsDadosProd.DataSet := vFdQry;
  vFdQry.Refresh;
  vFdQry.FieldByName('ID').Required := False;
end;

function TfrmcadProdutos.getFdQry: TFDQuery;
begin
  Result := vFdQry;
end;

procedure TfrmcadProdutos.setFdQry(pQry: TFDQuery);
begin
  vFdQry := pQry;
end;

end.
