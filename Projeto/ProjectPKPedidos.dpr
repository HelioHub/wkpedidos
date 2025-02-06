program ProjectPKPedidos;

uses
  Vcl.Forms,
  WKPedidos in 'WKPedidos.pas' {FWKPedidos},
  View.Pedidos in 'View\View.Pedidos.pas' {FViewPedidos},
  View.Consulta.Clientes in 'View\View.Consulta.Clientes.pas' {FConsultaClientes},
  View.Consulta.Produtos in 'View\View.Consulta.Produtos.pas' {FConsultaProdutos},
  View.Dados.ItensPedido in 'View\View.Dados.ItensPedido.pas' {FDadosItensPedido},
  View.Dados.Pedidos in 'View\View.Dados.Pedidos.pas' {FDadosPedidos},
  View.Show.Atencao in 'View\View.Show.Atencao.pas' {FViewAtencao},
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
  View.Show.MaisVendido in 'View\View.Show.MaisVendido.pas' {FViewMaisVendido},
  Vcl.Themes,
  Vcl.Styles,
  Model.Item in 'Model\Model.Item.pas',
  Model.Item.RegraAtacado in 'Model\Model.Item.RegraAtacado.pas',
  Model.Item.RegraVarejo in 'Model\Model.Item.RegraVarejo.pas',
  Interfaces.Visitor in 'Interfaces\Interfaces.Visitor.pas',
  Utils.ErrorLogger in 'Utils\Utils.ErrorLogger.pas',
  Utils.DMUtils in 'Utils\Utils.DMUtils.pas' {DMUtils: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'WK Pedidos';
  Application.CreateForm(TFWKPedidos, FWKPedidos);
  Application.CreateForm(TDMUtils, DMUtils);
  Application.Run;
end.
