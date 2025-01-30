unit UDadosItensPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask;

type
  TFDadosItensPedido = class(TForm)
    PRodape: TPanel;
    PDados: TPanel;
    BBSair: TBitBtn;
    BBGravar: TBitBtn;
    LECodigoProduto: TLabeledEdit;
    LEDescricao: TLabeledEdit;
    SBF2: TSpeedButton;
    LEQtd: TLabeledEdit;
    LEPreco: TLabeledEdit;
    LEValor: TLabeledEdit;
    procedure BBSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LEQtdExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDadosItensPedido: TFDadosItensPedido;

implementation

{$R *.dfm}

procedure TFDadosItensPedido.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosItensPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFDadosItensPedido.LEQtdExit(Sender: TObject);
begin
  LEQtd.Text := FormatFloat('###,##0.00',StrToFloatDef(LEQtd.Text,10));
end;

end.
