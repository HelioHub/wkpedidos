unit Interfaces.IItemPedido;

interface

uses
  System.SysUtils;

type
  IItemPedido = interface
    ['{0062D5F6-B888-40D8-80DD-8E347E22F0D7}']
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

    property IdItemPedido: Integer read GetIdItemPedido write SetIdItemPedido;
    property Pedido: Integer read GetPedido write SetPedido;
    property Produto: Integer read GetProduto write SetProduto;
    property Quantidade: Double read GetQuantidade write SetQuantidade;
    property ValorUnitario: Double read GetValorUnitario write SetValorUnitario;
    property ValorTotal: Double read GetValorTotal write SetValorTotal;

    function CalcularTotalItens(const AIdPedido: Integer): Double; // Método para calcular o total dos itens
  end;

implementation

end.
