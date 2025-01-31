unit Model.Pedido;

interface

uses
  Interfaces.IPedido, FireDAC.Comp.Client, Data.DB, Utils.DatabaseConnection;

type
  TPedido = class(TInterfacedObject, IPedido)
  private
    FNumeroPedido: Integer;
    FDataEmissao: TDateTime;
    FCliente: Integer;
    FValorTotal: Double;
    FQuery: TFDQuery; // Query para interagir com o banco de dados
    FDatabaseConnection: TDatabaseConnection; // Conex�o centralizada

    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function GetCliente: Integer;
    function GetValorTotal: Double;

    procedure SetNumeroPedido(const Value: Integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
  public
    constructor Create(const IniFileName: string);
    destructor Destroy; override;

    property NumeroPedido: Integer read GetNumeroPedido write SetNumeroPedido;
    property DataEmissao: TDateTime read GetDataEmissao write SetDataEmissao;
    property Cliente: Integer read GetCliente write SetCliente;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;

    function Salvar: Boolean; // Implementa��o do m�todo Salvar
    function Excluir(const AId: Integer): Boolean; // Implementa��o do m�todo Excluir
    procedure CarregarDados(const AFDMemTable: TFDMemTable;
      pNumeroPedido, pNomeCliente, pLimite: String); // Implementa��o do m�todo CarregarDados
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, Vcl.Dialogs;

{ TPedido }

constructor TPedido.Create(const IniFileName: string);
begin
  // Usa a conex�o centralizada com par�metros do arquivo .INI
  FDatabaseConnection := TDatabaseConnection.Create(IniFileName);
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FDatabaseConnection.Connection;
end;

destructor TPedido.Destroy;
begin
  FQuery.Free;
  FDatabaseConnection.Free;
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
      FQuery.SQL.Add(' INSERT INTO Pedidos (DataEmissaoPedidos, ClientePedidos, ValorTotalPedidos)');
      FQuery.SQL.Add(' VALUES (:DataEmissao, :Cliente, :ValorTotal)');
    end
    else
    begin
      // Atualizar pedido existente
      FQuery.SQL.Add(' UPDATE Pedidos SET');
      FQuery.SQL.Add('  DataEmissaoPedidos = :DataEmissao,');
      FQuery.SQL.Add('  ClientePedidos = :Cliente,');
      FQuery.SQL.Add(' ValorTotalPedidos = :ValorTotal');
      FQuery.SQL.Add('  WHERE NumeroPedidos = :NumeroPedido');
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

procedure TPedido.CarregarDados(const AFDMemTable: TFDMemTable;
  pNumeroPedido, pNomeCliente, pLimite: String);
begin
  try
    // Prepara a query para selecionar os dados
    FQuery.SQL.Clear;
    FQuery.SQL.Add('	SELECT');
    FQuery.SQL.Add('		p.NumeroPedidos,');
    FQuery.SQL.Add('		p.DataEmissaoPedidos,');
//  FQuery.SQL.Add('		p.ValorTotalPedidos,');
    FQuery.SQL.Add('    p.ClientePedidos,');
    FQuery.SQL.Add('		c.NomeClientes,');
    FQuery.SQL.Add('    (SELECT SUM(ip.VlrTotalItensPedido)');
    FQuery.SQL.Add('     FROM WKPedidos.ItensPedido ip');
    FQuery.SQL.Add('     WHERE ip.PedidoItensPedido = p.NumeroPedidos');
    FQuery.SQL.Add('     ) AS ValorTotalPedidos');
    FQuery.SQL.Add('	FROM');
    FQuery.SQL.Add('		WKPedidos.Pedidos p');
    FQuery.SQL.Add('	JOIN');
    FQuery.SQL.Add('		WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes');
    FQuery.SQL.Add('	WHERE 1=1 ');
    if Not pNumeroPedido.IsEmpty then
      FQuery.SQL.Add('	AND p.NumeroPedidos = '+pNumeroPedido);
    if Not pNomeCliente.IsEmpty then
      FQuery.SQL.Add('	AND c.NomeClientes LIKE '+QuotedStr(pNomeCliente+'%'));
    FQuery.SQL.Add('	ORDER BY');
    FQuery.SQL.Add('		p.DataEmissaoPedidos DESC');
    if Not pLimite.IsEmpty then
      FQuery.SQL.Add('	LIMIT '+pLimite+' OFFSET 0;');
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

function TPedido.Excluir(const AId: Integer): Boolean;
begin
  Result := False;
  try
    // Prepara a query para excluir o pedido
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' DELETE FROM Pedidos WHERE NumeroPedidos = :NumeroPedido');
    FQuery.ParamByName('NumeroPedido').AsInteger := AId;

    // Executa a query
    FQuery.ExecSQL;

    Result := True; // Indica que o pedido foi exclu�do com sucesso
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao excluir pedido: ' + E.Message);
    end;
  end;
end;

end.
