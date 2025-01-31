unit Model.Pedido;

interface

uses
  Interfaces.IPedido, FireDAC.Comp.Client, Data.DB;

type
  TPedido = class(TInterfacedObject, IPedido)
  private
    FNumeroPedido: Integer;
    FDataEmissao: TDateTime;
    FCliente: Integer;
    FValorTotal: Double;
    FQuery: TFDQuery; // Query para interagir com o banco de dados

    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function GetCliente: Integer;
    function GetValorTotal: Double;

    procedure SetNumeroPedido(const Value: Integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;
    property DataEmissao: TDateTime read GetDataEmissao write SetDataEmissao;
    property Cliente: Integer read GetCliente write SetCliente;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;

    function Salvar: Boolean; // Implementa��o do m�todo Salvar
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, Vcl.Dialogs;

{ TPedido }

constructor TPedido.Create;
begin
  // Configura a conex�o com o banco de dados (substitua pelos seus dados de conex�o)
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection.Create(nil);
  FQuery.Connection.DriverName := 'MySQL';
  FQuery.Connection.Params.Database := 'WKPedidos';
  FQuery.Connection.Params.UserName := 'root';
  FQuery.Connection.Params.Password := 'wk@123';
  FQuery.Connection.Params.Add('Server=localhost');
  FQuery.Connection.Params.Add('Port=3306');
  FQuery.Connection.Connected := True;
end;

destructor TPedido.Destroy;
begin
  FQuery.Connection.Connected := False;
  FQuery.Connection.Free;
  FQuery.Free;
  inherited;
end;

function TPedido.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedido.GetDataEmissao: TDateTime;
begin
  Result := FDataEmissao;
end;

function TPedido.GetCliente: Integer;
begin
  Result := FCliente;
end;

function TPedido.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TPedido.SetNumeroPedido(const Value: Integer);
begin
  FNumeroPedido := Value;
end;

procedure TPedido.SetDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TPedido.SetCliente(const Value: Integer);
begin
  FCliente := Value;
end;

procedure TPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

function TPedido.Salvar: Boolean;
begin
  Result := False;
  try
    // Prepara a query para inserir ou atualizar o pedido
    FQuery.SQL.Clear;
    if FNumeroPedido = 0 then
    begin
      // Inserir novo pedido
      FQuery.SQL.Add('INSERT INTO Pedidos (DataEmissaoPedidos, ClientePedidos, ValorTotalPedidos)');
      FQuery.SQL.Add('VALUES (:DataEmissao, :Cliente, :ValorTotal)');
    end
    else
    begin
      // Atualizar pedido existente
      FQuery.SQL.Add('UPDATE Pedidos SET');
      FQuery.SQL.Add('DataEmissaoPedidos = :DataEmissao,');
      FQuery.SQL.Add('ClientePedidos = :Cliente,');
      FQuery.SQL.Add('ValorTotalPedidos = :ValorTotal');
      FQuery.SQL.Add('WHERE NumeroPedidos = :NumeroPedido');
      FQuery.ParamByName('NumeroPedido').AsInteger := FNumeroPedido;
    end;

    // Define os par�metros da query
    FQuery.ParamByName('DataEmissao').AsDateTime := FDataEmissao;
    FQuery.ParamByName('Cliente').AsInteger := FCliente;
    FQuery.ParamByName('ValorTotal').AsFloat := FValorTotal;

    // Executa a query
    FQuery.ExecSQL;

    // Se for uma inser��o, recupera o ID gerado
    if FNumeroPedido = 0 then
    begin
      FQuery.SQL.Clear;
      FQuery.SQL.Add('SELECT LAST_INSERT_ID() AS LastID');
      FQuery.Open;
      FNumeroPedido := FQuery.FieldByName('LastID').AsInteger;
    end;

    Result := True; // Indica que o pedido foi salvo com sucesso
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao salvar pedido: ' + E.Message);
    end;
  end;
end;

end.
