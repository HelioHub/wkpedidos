unit Controller.PedidoController;

interface

uses
  Interfaces.IPedido, Model.Pedido;

type
  TPedidoController = class
  private
    FPedido: IPedido;
  public
    constructor Create;
    destructor Destroy; override;

    function GetPedido: IPedido;
    procedure SalvarPedido(APedido: IPedido);
  end;

implementation

{ TPedidoController }

constructor TPedidoController.Create;
begin
  FPedido := TPedido.Create;
end;

destructor TPedidoController.Destroy;
begin
  FPedido := nil;
  inherited;
end;

function TPedidoController.GetPedido: IPedido;
begin
  Result := FPedido;
end;

procedure TPedidoController.SalvarPedido(APedido: IPedido);
begin
  if APedido.Salvar then
    //ShowMessage('Pedido salvo com sucesso!')
  else
    //ShowMessage('Erro ao salvar pedido.');
end;

end.
