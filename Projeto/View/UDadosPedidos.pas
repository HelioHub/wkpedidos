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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDadosPedidos: TFDadosPedidos;

implementation

{$R *.dfm}

procedure TFDadosPedidos.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
