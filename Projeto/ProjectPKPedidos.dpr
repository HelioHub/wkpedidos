program ProjectPKPedidos;

uses
  Vcl.Forms,
  WKPedidos in 'WKPedidos.pas' {FWKPedidos},
  UViewPedidos in 'View\UViewPedidos.pas' {FViewPedidos},
  UConsultaClientes in 'View\UConsultaClientes.pas' {FConsultaClientes},
  UConsultaProdutos in 'View\UConsultaProdutos.pas' {FConsultaProdutos},
  UDadosItensPedido in 'View\UDadosItensPedido.pas' {FDadosItensPedido},
  UDadosPedidos in 'View\UDadosPedidos.pas' {FDadosPedidos},
  UViewAtencao in 'View\UViewAtencao.pas' {FViewAtencao},
  WKConst in 'WKConst.pas',
  Interfaces.IPedido in 'Interfaces\Interfaces.IPedido.pas',
  Model.Pedido in 'Model\Model.Pedido.pas',
  Controller.PedidoController in 'Controller\Controller.PedidoController.pas',
  Utils.DatabaseConnection in 'Utils\Utils.DatabaseConnection.pas',
  Utils.IniFileHelper in 'Utils\Utils.IniFileHelper.pas',
  Interfaces.IItemPedido in 'Interfaces\Interfaces.IItemPedido.pas',
  Model.ItemPedido in 'Model\Model.ItemPedido.pas',
  Controller.ItemPedidoController in 'Controller\Controller.ItemPedidoController.pas',
  Interfaces.ICliente in 'Interfaces\Interfaces.ICliente.pas',
  Model.Cliente in 'Model\Model.Cliente.pas',
  Controller.ClienteController in 'Controller\Controller.ClienteController.pas',
  Interfaces.IProduto in 'Interfaces\Interfaces.IProduto.pas',
  Model.Produto in 'Model\Model.Produto.pas',
  Controller.ProdutoController in 'Controller\Controller.ProdutoController.pas',
  UViewMaisVendido in 'View\UViewMaisVendido.pas' {FViewMaisVendido},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFWKPedidos, FWKPedidos);
  Application.Run;
end.
