unit pCadEmpresa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  RESTRequest4D,
  Data.DB,
  Datasnap.DBClient,
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
  FireDAC.Comp.Client;

type
  TfrmCadEmpresa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edIdEmpresa: TDBEdit;
    edNome: TDBEdit;
    EdEndereco: TDBEdit;
    edTelefone: TDBEdit;
    edEmail: TDBEdit;
    mskCNPJ: TMaskEdit;
    btnConsCNPJ: TButton;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    dsDadosEmp: TDataSource;
    procedure btnConsCNPJClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskCNPJExit(Sender: TObject);
    procedure dsDadosEmpDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    vFdQry: TFDQuery;

    function getFdQry: TFDQuery;
    procedure setFdQry(pQry: TFDQuery);
  public
    { Public declarations }

    property pQuery: TFDQuery read getFdQry write setFdQry;
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

{$R *.dfm}

procedure TfrmCadEmpresa.btnConsCNPJClick(Sender: TObject);
var
  LResponse: IResponse;
  LJSON: TJSONObject;
  vCNPJ: string;
begin
  try
    vCNPJ := StringReplace(mskCNPJ.Text,'.', '', [rfReplaceAll]);
    vCNPJ := StringReplace(vCNPJ,'/', '', [rfReplaceAll]);
    vCNPJ := StringReplace(vCNPJ,'-', '', [rfReplaceAll]);
    // Executando a requisi��o REST
    LResponse := TRequest.New.BaseURL('https://receitaws.com.br/v1/cnpj/' + vCNPJ + '')
      .Accept('application/json')
      .Get;
    if LResponse.StatusCode = 200 then
    begin
      LJSON := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
      try
        // atribuindo dados do JSON
        edNome.Text     := LJSON.GetValue<string>('nome');
        EdEndereco.Text := LJSON.GetValue<string>('logradouro');
        edTelefone.Text := LJSON.GetValue<string>('telefone');
        edEmail.Text    := LJSON.GetValue<string>('email');
        // Adicione mais campos conforme necess�rio
      finally
        LJSON.Free;
      end;
    end
    else
    begin
      Writeln('Erro na consulta. C�digo: ' + LResponse.StatusCode.ToString);
    end;
  except
    on E: Exception do
      Writeln('Erro: ' + E.Message);
  end;
end;

procedure TfrmCadEmpresa.dsDadosEmpDataChange(Sender: TObject; Field: TField);
begin
  if vFdQry.State = dsBrowse then
  begin
    if (edIdEmpresa.Text = '') then
      edIdEmpresa.Text := vFdQry.FieldByName('ID').AsString;

    mskCNPJ.Enabled := False;
    mskCNPJ.Text := vFdQry.FieldByName('CNPJ').AsString;
  end
  else
  begin
    if vFdQry.State = dsInsert then
      mskCNPJ.Text := '';
    mskCNPJ.Enabled := True;
  end;
end;

procedure TfrmCadEmpresa.FormShow(Sender: TObject);
begin
  dsDadosEmp.DataSet := vFdQry;
  vFdQry.Refresh;
  vFdQry.FieldByName('ID').Required := False;
end;

function TfrmCadEmpresa.getFdQry: TFDQuery;
begin
  Result := vFdQry;
end;

procedure TfrmCadEmpresa.mskCNPJExit(Sender: TObject);
begin
  if (trim(mskCNPJ.Text) <> '') and (length(trim(mskCNPJ.Text)) = 14) and
     (vFdQry.State in [dsEdit,dsInsert]) then
    vFdQry.FieldByName('CNPJ').AsString := trim(mskCNPJ.Text);
end;

procedure TfrmCadEmpresa.setFdQry(pQry: TFDQuery);
begin
  vFdQry := pQry;
end;

end.
