unit uDataAccess;

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
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB;

type
  TDataAccess = class
  private
    FConnection: TFDConnection;
  public
    constructor Create(AConnection: TFDConnection);
    procedure CreateRecord(const TableName: string; const Fields, Values: TArray<string>);
    function ReadRecords(const TableName: string; const Fields: string = '*'): TFDQuery;
    procedure UpdateRecord(const TableName: string; const Fields, Values: TArray<string>; const KeyField, KeyValue: string);
    procedure DeleteRecord(const TableName, KeyField, KeyValue: string);
  end;
implementation
{ TDataAccess }
constructor TDataAccess.Create(AConnection: TFDConnection);
begin
  FConnection := AConnection;
end;
procedure TDataAccess.CreateRecord(const TableName: string; const Fields, Values: TArray<string>);
var
  SQL, FieldsList, ValuesList: string;
  i: Integer;
  Query: TFDQuery;
begin
  if Length(Fields) <> Length(Values) then
    raise Exception.Create('O n�mero de campos e valores deve ser igual.');
  FieldsList := '';
  ValuesList := '';
  for i := 0 to High(Fields) do
  begin
    FieldsList := FieldsList + Fields[i];
    ValuesList := ValuesList + QuotedStr(Values[i]);
    if i < High(Fields) then
    begin
      FieldsList := FieldsList + ', ';
      ValuesList := ValuesList + ', ';
    end;
  end;
  SQL := Format('INSERT INTO %s (%s) VALUES (%s)', [TableName, FieldsList, ValuesList]);
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := SQL;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;
function TDataAccess.ReadRecords(const TableName: string; const Fields: string): TFDQuery;
var
  SQL: string;
  Query: TFDQuery;
begin
  SQL := Format('SELECT %s FROM %s ORDER BY ID', [Fields, TableName]);
  Query := TFDQuery.Create(nil);
  Query.Connection := FConnection;
  Query.SQL.Text := SQL;
  Query.Open;
  Result := Query;
end;
procedure TDataAccess.UpdateRecord(const TableName: string; const Fields, Values: TArray<string>; const KeyField, KeyValue: string);
var
  SQL, UpdateList: string;
  i: Integer;
  Query: TFDQuery;
begin
  if Length(Fields) <> Length(Values) then
    raise Exception.Create('O n�mero de campos e valores deve ser igual.');
  UpdateList := '';
  for i := 0 to High(Fields) do
  begin
    UpdateList := UpdateList + Format('%s = %s', [Fields[i], QuotedStr(Values[i])]);
    if i < High(Fields) then
      UpdateList := UpdateList + ', ';
  end;
  SQL := Format('UPDATE %s SET %s WHERE %s = %s', [TableName, UpdateList, KeyField, QuotedStr(KeyValue)]);
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := SQL;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;
procedure TDataAccess.DeleteRecord(const TableName, KeyField, KeyValue: string);
var
  SQL: string;
  Query: TFDQuery;
begin
  SQL := Format('DELETE FROM %s WHERE %s = %s', [TableName, KeyField, QuotedStr(KeyValue)]);
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FConnection;
    Query.SQL.Text := SQL;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;
end.
