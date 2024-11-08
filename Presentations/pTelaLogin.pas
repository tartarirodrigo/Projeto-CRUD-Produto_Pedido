unit pTelaLogin;

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
  Vcl.ExtCtrls,
  bLogin, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edUsuario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btLogin: TButton;
    btSair: TButton;
    edSenha: TEdit;
    procedure btLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fbLogin: TLogin;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  pMenuPrincipal;

{$R *.dfm}

procedure TfrmLogin.btSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMenuPrincipal.fDataAccess := fbLogin.pDataAccess;
  inherited;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   try
    fbLogin := TLogin.Create;
  except
    on E: Exception do
      raise Exception.Create('Erro ao criar classes do sistema.' + #13 + 'Entre em contato com o Suporte T�cnico.');
  end;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    btLoginClick(self)
  else if key = VK_ESCAPE then
    btSairClick(self);
end;

procedure TfrmLogin.btLoginClick(Sender: TObject);
begin
  with fbLogin do
  begin
    try
      pUser     := edUsuario.Text;
      pPassword := edSenha.Text;

      if Conectar then
      begin
        frmLogin.Close;
      end;

    except
      Application.MessageBox(pChar('Erro em tentativa de Login no sistema.' + #13 + 'Poss�veis Usu�rio ou senha Inv�lidos.'),'Erro', MB_ICONWARNING);
    end;
  end;
end;

end.
