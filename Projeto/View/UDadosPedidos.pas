unit UDadosPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDadosPedidos: TFDadosPedidos;

implementation

{$R *.dfm}

uses UConsultaClientes, UDadosItensPedido;

procedure TFDadosPedidos.BBIncClick(Sender: TObject);
begin
  FDadosItensPedido := TFDadosItensPedido.Create(Application);
  FDadosItensPedido.ShowModal;
end;

procedure TFDadosPedidos.BBSairClick(Sender: TObject);
begin
  Close;
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

procedure TFDadosPedidos.SBF2Click(Sender: TObject);
begin
  FConsultaClientes := TFConsultaClientes.Create(Application);
  FConsultaClientes.ShowModal;
end;

end.
