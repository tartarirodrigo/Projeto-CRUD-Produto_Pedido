unit bCadastroProdutos;

interface

uses
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
  bLogin;

type
  TCadastroProduto = class
  private
    fTlogin : TLogin;
  public
    function incluir(const TableName: string; const Fields, Values: TArray<string>): Boolean;
    function alterar(const TableName: string; const Fields, Values: TArray<string>; const KeyField, KeyValue: string): Boolean;
    function excluir(const TableName, KeyField, KeyValue: string): Boolean;
    function filtrar(const TableName: string): TFDQuery;
  end;

implementation

{ TCadastroProduto }

function TCadastroProduto.alterar(const TableName: string; const Fields, Values: TArray<string>; const KeyField, KeyValue: string): Boolean;
begin
  Try
    fTlogin.pDataAccess.UpdateRecord(TableName,Fields,Values,KeyField,KeyValue);
    Result := True;
  except
    Result := False;
  End;
end; 

function TCadastroProduto.excluir(const TableName, KeyField, KeyValue: string): Boolean;
begin
  Try
    fTlogin.pDataAccess.DeleteRecord(TableName,KeyField,KeyValue);
    Result := True;
  except
    Result := False;
  End;
end;

function TCadastroProduto.filtrar(const TableName: string): TFDQuery;
begin
  Result := fTlogin.pDataAccess.ReadRecords(TableName);
end;

function TCadastroProduto.incluir(const TableName: string; const Fields, Values: TArray<string>): Boolean;
begin
  Try
    fTlogin.pDataAccess.CreateRecord(TableName,Fields,Values);
    Result := True;
  except
    Result := False;
  End;
end;

end.
