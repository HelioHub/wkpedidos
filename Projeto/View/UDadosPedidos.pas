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
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    LEFiltroNumeroPedido: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    Edit1: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabeledEdit2: TLabeledEdit;
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
