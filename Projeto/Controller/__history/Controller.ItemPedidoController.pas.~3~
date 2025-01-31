unit Controller.ItemPedidoController;

interface

uses
  Interfaces.IItemPedido, Model.ItemPedido;

type
  TItemPedidoController = class
  private
    FItemPedido: IItemPedido;
  public
    constructor Create;
    destructor Destroy; override;

    function GetItemPedido: IItemPedido;
    function CalcularTotalItens(const AIdPedido: Integer): Double;
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

end.
