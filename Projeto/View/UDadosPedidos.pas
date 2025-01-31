unit UDadosPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, System.UITypes,
  Controller.PedidoController, Interfaces.IPedido,
  Controller.ItemPedidoController,
  WKConst;

type
  TFDadosPedidos = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBGravar: TBitBtn;
    PItensPedido: TPanel;
    POpcoes: TPanel;
    PView: TPanel;
    DBGView: TDBGrid;
    LENumeroPedido: TLabeledEdit;
    DTPDataEmissao: TDateTimePicker;
    LDT: TLabel;
    LECodigoCliente: TLabeledEdit;
    EDescCliente: TEdit;
    LT: TLabel;
    SBF2: TSpeedButton;
    BBInc: TBitBtn;
    BBAlt: TBitBtn;
    BBExc: TBitBtn;
    LETotalPedido: TLabeledEdit;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBF2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBIncClick(Sender: TObject);
    procedure LETotalPedidoChange(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcClick(Sender: TObject);
    procedure BBGravarClick(Sender: TObject);
  private
    { Private declarations }
    FPedidoController: TPedidoController;
    FItemPedidoController: TItemPedidoController;

    procedure TratarDelete;
    procedure pCRUD(pAcao: TAcao);
    procedure pAtualizacao;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FDadosPedidos: TFDadosPedidos;

implementation

{$R *.dfm}

uses UConsultaClientes, UDadosItensPedido;

constructor TFDadosPedidos.Create(AOwner: TComponent);
begin
  inherited;
  FPedidoController := TPedidoController.Create;
  FItemPedidoController := TItemPedidoController.Create;
end;

destructor TFDadosPedidos.Destroy;
begin
  FPedidoController.Free;
  FItemPedidoController.Free;
  inherited;
end;

procedure TFDadosPedidos.BBExcClick(Sender: TObject);
begin
  TratarDelete;
end;

procedure TFDadosPedidos.BBGravarClick(Sender: TObject);
var
  Pedido: IPedido;
begin
  Pedido := FPedidoController.GetPedido;

  // Preenche os dados do pedido
  Pedido.NumeroPedido := StrToIntDef(LENumeroPedido.Text, 0);
  Pedido.DataEmissao := DTPDataEmissao.DateTime;
  Pedido.Cliente := StrToIntDef(LECodigoCliente.Text, 0);
  Pedido.ValorTotal := StrToFloatDef(LETotalPedido.Text, 0);

  // Salva o pedido
  if FPedidoController.SalvarPedido(Pedido) then
  begin
    // Atualiza o campo NumeroPedido com o ID gerado
    LENumeroPedido.Text := IntToStr(Pedido.NumeroPedido);

    ShowMessage('Sucesso na Grava��o do Pedido '+LENumeroPedido.Text+'.');
  end;
end;

procedure TFDadosPedidos.BBIncClick(Sender: TObject);
begin
  FDadosItensPedido := TFDadosItensPedido.Create(Application);
  FDadosItensPedido.ShowModal;
end;

procedure TFDadosPedidos.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosPedidos.DBGViewDblClick(Sender: TObject);
begin
  BBAlt.Click;
end;

procedure TFDadosPedidos.DBGViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifica se a tecla DELETE foi pressionada
  if Key = VK_DELETE then
  begin
    TratarDelete;
    Key := 0; // Evita que o DBGrid processe o DELETE automaticamente
  end;
end;

procedure TFDadosPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFDadosPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
    SBF2.Click;
end;

procedure TFDadosPedidos.LETotalPedidoChange(Sender: TObject);
begin
  LETotalPedido.Text := FormatFloat('###,##0.00',StrToFloatDef(LETotalPedido.Text,0));
end;

procedure TFDadosPedidos.pAtualizacao;
begin
  //
end;

procedure TFDadosPedidos.pCRUD(pAcao: TAcao);
begin
  //
end;

procedure TFDadosPedidos.SBF2Click(Sender: TObject);
begin
  FConsultaClientes := TFConsultaClientes.Create(Application);
  FConsultaClientes.ShowModal;
end;

procedure TFDadosPedidos.TratarDelete;
begin
  // Exibe uma mensagem de confirma��o antes de deletar o registro
  if MessageDlg('Deseja realmente excluir este Item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Deleta o registro atual
    // DBGView.DataSource.DataSet.Delete;
    BBExc.Click;
  end;
end;

end.
