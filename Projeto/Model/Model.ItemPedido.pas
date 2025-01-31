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
    constructor Create(const IniFileName: string);
    destructor Destroy; override;

    property IdItemPedido: Integer read GetIdItemPedido write SetIdItemPedido;
    property Pedido: Integer read GetPedido write SetPedido;
    property Produto: Integer read GetProduto write SetProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;

    function CalcularTotalItens(const AIdPedido: Integer): Double; // Implementação do método CalcularTotalItens
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, Vcl.Dialogs;

{ TItemPedido }

constructor TItemPedido.Create(const IniFileName: string);
begin
  // Usa a conexão centralizada com parâmetros do arquivo .INI
  FDatabaseConnection := TDatabaseConnection.Create(IniFileName);
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
      ShowMessage('Erro ao calcular total dos itens: ' + E.Message);
    end;
  end;
end;

end.
