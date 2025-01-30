unit UConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaProdutos: TFConsultaProdutos;

implementation

{$R *.dfm}

procedure TFConsultaProdutos.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFConsultaProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
