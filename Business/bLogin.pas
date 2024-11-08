unit bLogin;

interface

uses
  SysUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  uDataAccess;

type
  TLogin = class

  private
    { Private declarations }
    fdConexao : TFDConnection;
    fdDriver  : TFDPhysFBDriverLink;
    fUser, fPassword: string;
    fDataAccess: TDataAccess;

    procedure conecta;
    function getUser: string;
    procedure setUser(pUsuario: string);
    function getPassword: string;
    procedure setPassword(pSenha: string);
  public
    { Public declarations }
    destructor Destroy; override;
    property pfdConexao: TFDConnection read fdConexao;
    property pUser: string read getUser write setUser;
    property pPassword: string read getPassword write setPassword;
    property pDataAccess: TDataAccess read fDataAccess write FDataAccess;
    function Conectar: Boolean;
  end;

implementation

{ TLogin }

procedure TLogin.conecta;
begin
  fdConexao := TFDConnection.Create(nil);
  //Preenchendo String de conex�o
  fdConexao.Params.DriverID := 'FB';
  fdConexao.Params.Database := 'D:\Dev\Projeto-CRUD-Produto_Pedido\Data\DATABASE.FDB';
  fdConexao.Params.UserName := fUser; // usu�rio
  fdConexao.Params.Password := fPassword; // senha do usu�rio
  fdConexao.Params.Add('Server=localhost'); // ou o IP do servidor
  fdConexao.Params.Add('Port=3050'); // porta do Firebird

  // Realizando a conex�o do usu�rio no banco
  try
    fdConexao.Connected := True;
    fDataAccess         := TDataAccess.Create(fdConexao);
  except
    on E : exception do
    begin
      raise;
    end;
  end;
end;

function TLogin.Conectar: Boolean;
begin
  try
    conecta;
  finally
    Result := True;
  end;
end;

destructor TLogin.Destroy;
begin
  FreeAndNil(fdConexao);
  inherited;
end;

function TLogin.getPassword: string;
begin
  Result := fPassword;
end;

function TLogin.getUser: string;
begin
  Result := fUser;
end;

procedure TLogin.setPassword(pSenha: string);
begin
  fPassword := Trim(pSenha);
end;

procedure TLogin.setUser(pUsuario: string);
begin
  fUser := Trim(pUsuario);
end;

end.
