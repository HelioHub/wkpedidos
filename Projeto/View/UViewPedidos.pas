unit UViewPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, System.UITypes,
  Interfaces.IPedido, WKConst, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus,
  Controller.PedidoController,
  Controller.ItemPedidoController;

type
  TFViewPedidos = class(TForm)
    PHead: TPanel;
    PRodape: TPanel;
    PViewPedidos: TPanel;
    BBIncluir: TBitBtn;
    BBAlterar: TBitBtn;
    BBExcluir: TBitBtn;
    BBSair: TBitBtn;
    LNR: TLabel;
    ENR: TEdit;
    DBGView: TDBGrid;
    DSViewPedidos: TDataSource;
    PFiltrar: TPanel;
    LEFiltroNumeroPedido: TLabeledEdit;
    LEFiltroNomeCliente: TLabeledEdit;
    BBAtualizar: TBitBtn;
    PViewItensPedido: TPanel;
    DBGViewItens: TDBGrid;
    PedidosMemTable: TFDMemTable;
    PMOptions: TPopupMenu;
    ItensdoPedido1: TMenuItem;
    N1: TMenuItem;
    ValorTotaldoPedido1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBSairClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcluirClick(Sender: TObject);
    procedure BBAtualizarClick(Sender: TObject);
    procedure BBAlterarClick(Sender: TObject);
    procedure ValorTotaldoPedido1Click(Sender: TObject);
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
  FViewPedidos: TFViewPedidos;

implementation

{$R *.dfm}

uses UDadosPedidos;

constructor TFViewPedidos.Create(AOwner: TComponent);
begin
  inherited;
  FPedidoController := TPedidoController.Create;
  FItemPedidoController := TItemPedidoController.Create;
end;

destructor TFViewPedidos.Destroy;
begin
  FPedidoController.Free;
  FItemPedidoController.Free;
  inherited;
end;

procedure TFViewPedidos.BBAlterarClick(Sender: TObject);
begin
  pCRUD(acAlterar);
end;

procedure TFViewPedidos.BBAtualizarClick(Sender: TObject);
begin
  pAtualizacao;
end;

procedure TFViewPedidos.BBExcluirClick(Sender: TObject);
begin
  TratarDelete;
end;

procedure TFViewPedidos.BBIncluirClick(Sender: TObject);
begin
  pCRUD(acIncluir);
end;

procedure TFViewPedidos.BBSairClick(Sender: TObject);
begin
  DSViewPedidos.DataSet.Close;
  Close;
end;

procedure TFViewPedidos.DBGViewDblClick(Sender: TObject);
begin
  BBAlterar.Click;
end;

procedure TFViewPedidos.DBGViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Verifica se a tecla DELETE foi pressionada
  if Key = VK_DELETE then
  begin
    TratarDelete;
    Key := 0; // Evita que o DBGrid processe o DELETE automaticamente
  end;
end;

procedure TFViewPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFViewPedidos.pAtualizacao;
begin
  PedidosMemTable.Close;
  FPedidoController.CarregarDadosPedidos(PedidosMemTable);
  PedidosMemTable.Open;
end;

procedure TFViewPedidos.pCRUD(pAcao: TAcao);
var
  FormPedido: TFDadosPedidos;
begin
  if (DSViewPedidos.DataSet.FieldByName('NumeroPedidos').IsNull) and
     (pAcao <> acIncluir) then
  begin
    Beep;
    ShowMessage('Selecione um registro v�lido '+cEOL+'para efetuar opera��o desejada!');
    Exit;
  end;

  if (pAcao = acExcluir) then
  begin
    if FPedidoController.ExcluirPedido(
       DSViewPedidos.DataSet.FieldByName('NumeroPedidos').AsInteger) then
      ShowMessage('Pedido exclu�do com sucesso!')
    else
      ShowMessage('Erro ao excluir pedido.');
  end
  else
  begin
    FormPedido := TFDadosPedidos.Create(Application);
    if (pAcao <> acIncluir) then
    begin
      FormPedido.LENumeroPedido.Text := DSViewPedidos.DataSet.FieldByName('NumeroPedidos').AsString;
      FormPedido.DTPDataEmissao.DateTime := DSViewPedidos.DataSet.FieldByName('DataEmissaoPedidos').AsDateTime;
      FormPedido.LECodigoCliente.Text := DSViewPedidos.DataSet.FieldByName('ClientePedidos').AsString;
      FormPedido.EDescCliente.Text := DSViewPedidos.DataSet.FieldByName('NomeClientes').AsString;
      FormPedido.LETotalPedido.Text := DSViewPedidos.DataSet.FieldByName('ValorTotalPedidos').AsString;
    end;
    FormPedido.ShowModal;
  end;
  pAtualizacao;
end;

procedure TFViewPedidos.TratarDelete;
begin
  // Exibe uma mensagem de confirma��o antes de deletar o registro
  if MessageDlg('Deseja realmente excluir este Pedido '+
     DSViewPedidos.DataSet.FieldByName('NumeroPedidos').AsString+' e seus Itens?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Deleta o registro atual
    pCRUD(acExcluir);
  end;
end;

procedure TFViewPedidos.ValorTotaldoPedido1Click(Sender: TObject);
var
  IdPedido: Integer;
  TotalItens: Double;
begin
  // Obt�m o ID do pedido
  IdPedido := DSViewPedidos.DataSet.FieldByName('NumeroPedidos').AsInteger;

  if IdPedido > 0 then
  begin
    // Calcula o total dos itens do pedido
    TotalItens := FItemPedidoController.CalcularTotalItens(IdPedido);
    ShowMessage('Valor Total do Pedido '+
                DSViewPedidos.DataSet.FieldByName('NumeroPedidos').AsString+
                ': ' + FormatFloat('###,##0.00',TotalItens));
  end
  else
    ShowMessage('ID do pedido inv�lido.');
end;

end.
