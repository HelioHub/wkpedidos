unit UViewPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, System.UITypes;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBSairClick(Sender: TObject);
    procedure BBIncluirClick(Sender: TObject);
    procedure DBGViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGViewDblClick(Sender: TObject);
    procedure BBExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure TratarDelete;
  public
    { Public declarations }
  end;

var
  FViewPedidos: TFViewPedidos;

implementation

{$R *.dfm}

uses UDadosPedidos;

procedure TFViewPedidos.BBExcluirClick(Sender: TObject);
begin
  TratarDelete;
end;

procedure TFViewPedidos.BBIncluirClick(Sender: TObject);
var
  Formulario: TFDadosPedidos;
begin
  Formulario := TFDadosPedidos.Create(Application);
  Formulario.ShowModal;
end;

procedure TFViewPedidos.BBSairClick(Sender: TObject);
begin
  //DSViewPedidos.DataSet.Close;
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

procedure TFViewPedidos.TratarDelete;
begin
  // Exibe uma mensagem de confirmação antes de deletar o registro
  if MessageDlg('Deseja realmente excluir este Pedido e seus Itens?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Deleta o registro atual
    // DBGView.DataSource.DataSet.Delete;
    BBExcluir.Click;
  end;
end;

end.
