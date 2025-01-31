unit Model.Cliente;

interface

uses
  Interfaces.ICliente, FireDAC.Comp.Client, Data.DB, Utils.DatabaseConnection;

type
  TCliente = class(TInterfacedObject, ICliente)
  private
    FCodigoClientes: Integer;
    FNomeClientes: string;
    FCidadeClientes: string;
    FUFClientes: string;
    FQuery: TFDQuery; // Query para interagir com o banco de dados
    FDatabaseConnection: TDatabaseConnection; // Conexão centralizada

    function GetCodigoClientes: Integer;
    function GetNomeClientes: string;
    function GetCidadeClientes: string;
    function GetUFClientes: string;

    procedure SetCodigoClientes(const Value: Integer);
    procedure SetNomeClientes(const Value: string);
    procedure SetCidadeClientes(const Value: string);
    procedure SetUFClientes(const Value: string);
  public
    constructor Create(const IniFileName: string);
    destructor Destroy; override;
    property CodigoClientes: Integer read GetCodigoClientes write SetCodigoClientes;
    property NomeClientes: string read GetNomeClientes write SetNomeClientes;
    property CidadeClientes: string read GetCidadeClientes write SetCidadeClientes;
    property UFClientes: string read GetUFClientes write SetUFClientes;

    procedure CarregarDados(const AFDMemTable: TFDMemTable); // Implementação do método CarregarDados
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, Vcl.Dialogs;

{ TCliente }

constructor TCliente.Create(const IniFileName: string);
begin
  // Usa a conexão centralizada com parâmetros do arquivo .INI
  FDatabaseConnection := TDatabaseConnection.Create(IniFileName);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FDatabaseConnection.Connection;
end;

destructor TCliente.Destroy;
begin
  FQuery.Free;
  FDatabaseConnection.Free;
  inherited;
end;

function TCliente.GetCodigoClientes: Integer;
begin
  Result := FCodigoClientes;
end;

function TCliente.GetNomeClientes: string;
begin
  Result := FNomeClientes;
end;

function TCliente.GetCidadeClientes: string;
begin
  Result := FCidadeClientes;
end;

function TCliente.GetUFClientes: string;
begin
  Result := FUFClientes;
end;

procedure TCliente.SetCodigoClientes(const Value: Integer);
begin
  FCodigoClientes := Value;
end;

procedure TCliente.SetNomeClientes(const Value: string);
begin
  FNomeClientes := Value;
end;

procedure TCliente.SetCidadeClientes(const Value: string);
begin
  FCidadeClientes := Value;
end;

procedure TCliente.SetUFClientes(const Value: string);
begin
  FUFClientes := Value;
end;

procedure TCliente.CarregarDados(const AFDMemTable: TFDMemTable);
begin
  try
    // Prepara a query para selecionar os dados
    FQuery.SQL.Clear;
    FQuery.SQL.Add('SELECT CodigoClientes, NomeClientes, CidadeClientes, UFClientes');
    FQuery.SQL.Add('FROM Clientes');
    FQuery.Open;

    // Copia os dados para o TFDMemTable
    AFDMemTable.Close;
    AFDMemTable.Data := FQuery.Data;
    AFDMemTable.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

end.
