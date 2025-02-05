unit Model.ItemPedido;

interface

uses
  Interfaces.IItemPedido, FireDAC.Comp.Client, Data.DB, Utils.DatabaseConnection;

type
  TItemPedido = class(TInterfacedObject, IItemPedido)
  private
    FIdItemPedido: Integer;
    FPedido: Integer;
    FProduto: Integer;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;
    FQuery: TFDQuery; // Query para interagir com o banco de dados
    FDatabaseConnection: TDatabaseConnection; // Conexão centralizada

    function GetIdItemPedido: Integer;
    function GetPedido: Integer;
    function GetProduto: Integer;
    function GetQuantidade: Double;
    function GetValorUnitario: Double;
    function GetValorTotal: Double;

    procedure SetIdItemPedido(const Value: Integer);
    procedure SetPedido(const Value: Integer);
    procedure SetProduto(const Value: Integer);
    procedure SetQuantidade(const Value: Double);
    procedure SetValorUnitario(const Value: Double);
    procedure SetValorTotal(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    property IdItemPedido: Integer read GetIdItemPedido write SetIdItemPedido;
    property Pedido: Integer read GetPedido write SetPedido;
    property Produto: Integer read GetProduto write SetProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;

    function Salvar: Boolean; // Implementação do método Salvar
    function Excluir(const AId: Integer): Boolean; // Implementação do método Excluir
    function CalcularTotalItens(const AIdPedido: Integer): Double; // Implementação do método CalcularTotalItens

    procedure CarregarDados(const AFDMemTable: TFDMemTable; pPedido: String); // Implementação do método CarregarDados
    procedure MaisVendido(const AFDMemTable: TFDMemTable); // Método Mais Vendido dos Pedidos.
end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, Vcl.Dialogs;

{ TItemPedido }

constructor TItemPedido.Create;
begin
  // Usa a conexão centralizada com parâmetros do arquivo .INI
  FDatabaseConnection := TDatabaseConnection.Create;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FDatabaseConnection.Connection;
end;

destructor TItemPedido.Destroy;
begin
  FQuery.Free;
  FDatabaseConnection.Free;
  inherited;
end;

function TItemPedido.GetIdItemPedido: Integer;
begin
  Result := FIdItemPedido;
end;

function TItemPedido.GetPedido: Integer;
begin
  Result := FPedido;
end;

function TItemPedido.GetProduto: Integer;
begin
  Result := FProduto;
end;

function TItemPedido.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

function TItemPedido.GetValorUnitario: Double;
begin
  Result := FValorUnitario;
end;

procedure TItemPedido.MaisVendido(const AFDMemTable: TFDMemTable);
begin
  try
    // Prepara a query para selecionar os dados
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' SELECT pr.CodigoProdutos,');
    FQuery.SQL.Add('        pr.DescricaoProdutos,');
    FQuery.SQL.Add('        SUM(ip.QuantidadeItensPedido) AS TotalVendido');
    FQuery.SQL.Add(' FROM WKPedidos.ItensPedido ip');
    FQuery.SQL.Add(' JOIN WKPedidos.Produtos pr ON ip.ProdutoItensPedido = pr.CodigoProdutos');
    FQuery.SQL.Add(' GROUP BY pr.CodigoProdutos, pr.DescricaoProdutos');
    FQuery.SQL.Add(' ORDER BY TotalVendido DESC');
    FQuery.Open;

    // Copia os dados para o TFDMemTable
    begin
      AFDMemTable.Close;
      AFDMemTable.Data := FQuery.Data;
      AFDMemTable.Open;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

function TItemPedido.GetValorTotal: Double;
begin
  Result := FValorTotal;
end;

procedure TItemPedido.SetIdItemPedido(const Value: Integer);
begin
  FIdItemPedido := Value;
end;

procedure TItemPedido.SetPedido(const Value: Integer);
begin
  FPedido := Value;
end;

procedure TItemPedido.SetProduto(const Value: Integer);
begin
  FProduto := Value;
end;

procedure TItemPedido.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TItemPedido.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

procedure TItemPedido.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

function TItemPedido.CalcularTotalItens(const AIdPedido: Integer): Double;
begin
  Result := 0;
  try
    // Prepara a query para calcular o total dos itens do pedido
    FQuery.SQL.Clear;
    FQuery.SQL.Add('SELECT SUM(VlrTotalItensPedido) AS TotalItens');
    FQuery.SQL.Add('FROM ItensPedido');
    FQuery.SQL.Add('WHERE PedidoItensPedido = :Pedido');
    FQuery.ParamByName('Pedido').AsInteger := AIdPedido;
    FQuery.Open;

    // Retorna o total dos itens
    if not FQuery.FieldByName('TotalItens').IsNull then
      Result := FQuery.FieldByName('TotalItens').AsFloat;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao calcular total dos itens: ' + E.Message);
    end;
  end;
end;

function TItemPedido.Salvar: Boolean;
begin
  Result := False;
  FDatabaseConnection.Connection.StartTransaction;
  try
    // Prepara a query para inserir ou atualizar o item de pedido
    FQuery.SQL.Clear;
    if FIdItemPedido = 0 then
    begin
      // Inserir novo item de pedido
      FQuery.SQL.Add('INSERT INTO ItensPedido (PedidoItensPedido, ProdutoItensPedido, QuantidadeItensPedido, VlrUnitarioItensPedido, VlrTotalItensPedido)');
      FQuery.SQL.Add('VALUES (:Pedido, :Produto, :Quantidade, :ValorUnitario, :ValorTotal)');
    end
    else
    begin
      // Atualizar item de pedido existente
      FQuery.SQL.Add('UPDATE ItensPedido SET');
      FQuery.SQL.Add('PedidoItensPedido = :Pedido,');
      FQuery.SQL.Add('ProdutoItensPedido = :Produto,');
      FQuery.SQL.Add('QuantidadeItensPedido = :Quantidade,');
      FQuery.SQL.Add('VlrUnitarioItensPedido = :ValorUnitario,');
      FQuery.SQL.Add('VlrTotalItensPedido = :ValorTotal');
      FQuery.SQL.Add('WHERE idItensPedido = :IdItemPedido');
      FQuery.ParamByName('IdItemPedido').AsInteger := FIdItemPedido;
    end;

    // Define os parâmetros da query
    FQuery.ParamByName('Pedido').AsInteger := FPedido;
    FQuery.ParamByName('Produto').AsInteger := FProduto;
    FQuery.ParamByName('Quantidade').AsFloat := FQuantidade;
    FQuery.ParamByName('ValorUnitario').AsFloat := FValorUnitario;
    FQuery.ParamByName('ValorTotal').AsFloat := FValorTotal;

    // Executa a query
    FQuery.ExecSQL;

    // Se for uma inserção, recupera o ID gerado
    if FIdItemPedido = 0 then
    begin
      FQuery.SQL.Clear;
      FQuery.SQL.Add('SELECT LAST_INSERT_ID() AS LastID');
      FQuery.Open;
      FIdItemPedido := FQuery.FieldByName('LastID').AsInteger;
    end;

    FDatabaseConnection.Connection.Commit;
    Result := True; // Indica que o item de pedido foi salvo com sucesso
  except
    on E: Exception do
    begin
      FDatabaseConnection.Connection.Rollback;
      raise Exception.Create('Erro ao salvar item de pedido: ' + E.Message);
    end;
  end;
end;

procedure TItemPedido.CarregarDados(const AFDMemTable: TFDMemTable; pPedido: String);
begin
  try
    // Prepara a query para selecionar os dados
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' SELECT a.idItensPedido, a.PedidoItensPedido,');
    FQuery.SQL.Add('        a.ProdutoItensPedido, a.QuantidadeItensPedido,');
    FQuery.SQL.Add('        a.VlrUnitarioItensPedido, a.VlrTotalItensPedido,');
    FQuery.SQL.Add('        b.DescricaoProdutos');
    FQuery.SQL.Add(' FROM ItensPedido a ');
    FQuery.SQL.Add(' JOIN Produtos b ON b.CodigoProdutos = a.ProdutoItensPedido ');
    if not pPedido.IsEmpty then
    begin
      FQuery.SQL.Add(' WHERE PedidoItensPedido = '+pPedido);
    end;
    FQuery.SQL.Add(' ORDER BY a.ProdutoItensPedido = '+pPedido);
    FQuery.Open;

    // Copia os dados para o TFDMemTable
    begin
      AFDMemTable.Close;
      AFDMemTable.Data := FQuery.Data;
      AFDMemTable.Open;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

function TItemPedido.Excluir(const AId: Integer): Boolean;
begin
  Result := False;
  try
    // Prepara a query para excluir o item de pedido
    FQuery.SQL.Clear;
    FQuery.SQL.Add('DELETE FROM ItensPedido WHERE idItensPedido = :IdItemPedido');
    FQuery.ParamByName('IdItemPedido').AsInteger := AId;

    // Executa a query
    FQuery.ExecSQL;

    Result := True; // Indica que o item de pedido foi excluído com sucesso
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao excluir item de pedido: ' + E.Message);
    end;
  end;
end;

end.
