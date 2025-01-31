unit Controller.ItemPedidoController;

interface

uses
  Interfaces.IItemPedido, Model.ItemPedido, FireDAC.Comp.Client;

type
  TItemPedidoController = class
  private
    FItemPedido: IItemPedido;
  public
    constructor Create;
    destructor Destroy; override;

    function GetItemPedido: IItemPedido;
    function SalvarItemPedido(AItemPedido: IItemPedido): Boolean;
    function ExcluirItemPedido(const AId: Integer): Boolean;
    function CalcularTotalItens(const AIdPedido: Integer): Double;

    procedure CarregarDadosItensPedido(const AFDMemTable: TFDMemTable; pPedido: String);
  end;

implementation

{ TItemPedidoController }

uses WKConst;

constructor TItemPedidoController.Create;
begin
  FItemPedido := TItemPedido.Create(cPATH_INI);
end;

destructor TItemPedidoController.Destroy;
begin
  FItemPedido := nil;
  inherited;
end;

function TItemPedidoController.GetItemPedido: IItemPedido;
begin
  Result := FItemPedido;
end;

function TItemPedidoController.CalcularTotalItens(const AIdPedido: Integer): Double;
begin
  Result := FItemPedido.CalcularTotalItens(AIdPedido);
end;

function TItemPedidoController.SalvarItemPedido(AItemPedido: IItemPedido): Boolean;
begin
  if AItemPedido.Produto = cZero then
    Result := false
  else
    Result := AItemPedido.Salvar;
end;

procedure TItemPedidoController.CarregarDadosItensPedido(const AFDMemTable: TFDMemTable; pPedido: String);
begin
  FItemPedido.CarregarDados(AFDMemTable, pPedido);
end;

function TItemPedidoController.ExcluirItemPedido(const AId: Integer): Boolean;
begin
  Result := FItemPedido.Excluir(AId);
end;

end.
