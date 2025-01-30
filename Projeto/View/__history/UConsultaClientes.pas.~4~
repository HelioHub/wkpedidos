unit UConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFConsultaClientes = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBGravar: TBitBtn;
    Panel1: TPanel;
    DBGView: TDBGrid;
    LEFiltroNomeCliente: TLabeledEdit;
    BBAtualizar: TBitBtn;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaClientes: TFConsultaClientes;

implementation

{$R *.dfm}

procedure TFConsultaClientes.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsultaClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
