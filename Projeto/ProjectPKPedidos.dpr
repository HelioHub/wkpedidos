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
  Controller.PedidoController in 'Controller\Controller.PedidoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFWKPedidos, FWKPedidos);
  Application.Run;
end.
