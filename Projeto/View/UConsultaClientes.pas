unit UConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Controller.ClienteController;

type
  TFConsultaClientes = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBSelecionar: TBitBtn;
    PHead: TPanel;
    DBGView: TDBGrid;
    LEFiltroNomeCliente: TLabeledEdit;
    BBFiltrar: TBitBtn;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FClienteController: TClienteController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FConsultaClientes: TFConsultaClientes;

implementation

{$R *.dfm}

constructor TFConsultaClientes.Create(AOwner: TComponent);
begin
  inherited;
  FClienteController := TClienteController.Create('C:\caminho\para\config.ini');
end;

destructor TFConsultaClientes.Destroy;
begin
  FClienteController.Free;
  inherited;
end;

procedure TFConsultaClientes.BBFiltrarClick(Sender: TObject);
begin
  // Carrega os dados no TFDMemTable
  //FClienteController.CarregarDadosClientes(FDMemTable);
end;

procedure TFConsultaClientes.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsultaClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
