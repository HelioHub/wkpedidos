unit UConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Controller.ProdutoController;

type
  TFConsultaProdutos = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBSelecionar: TBitBtn;
    PHead: TPanel;
    LEFiltroDescricaoItem: TLabeledEdit;
    BBFiltrar: TBitBtn;
    DBGView: TDBGrid;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FProdutoController: TProdutoController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FConsultaProdutos: TFConsultaProdutos;

implementation

{$R *.dfm}

constructor TFConsultaProdutos.Create(AOwner: TComponent);
begin
  inherited;
  FProdutoController := TProdutoController.Create('C:\caminho\para\config.ini');
end;

destructor TFConsultaProdutos.Destroy;
begin
  FProdutoController.Free;
  inherited;
end;

procedure TFConsultaProdutos.BBFiltrarClick(Sender: TObject);
begin
 // Carrega os dados no TFDMemTable
 //FProdutoController.CarregarDadosProdutos(FDMemTable);
end;

procedure TFConsultaProdutos.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsultaProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
