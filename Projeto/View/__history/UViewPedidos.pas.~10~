unit UViewPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViewPedidos: TFViewPedidos;

implementation

{$R *.dfm}

uses UDadosPedidos;

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

procedure TFViewPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
