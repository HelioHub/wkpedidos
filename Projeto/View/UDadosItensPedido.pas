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
    procedure SBF2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LEPrecoExit(Sender: TObject);
    procedure LEQtdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDadosItensPedido: TFDadosItensPedido;

implementation

{$R *.dfm}

uses UConsultaProdutos;

procedure TFDadosItensPedido.BBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDadosItensPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFDadosItensPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
    SBF2.Click;
end;

procedure TFDadosItensPedido.LEPrecoExit(Sender: TObject);
var
  dQtd, dPreco : Double;
begin
  dQtd := StrToFloatDef(LEQtd.Text,0);
  dPreco := StrToFloatDef(LEPreco.Text,0);
  LEQtd.Text := FormatFloat('###,##0.00',dQtd);
  LEPreco.Text := FormatFloat('###,##0.00',dPreco);
  LEValor.Text := FormatFloat('###,##0.00',dQtd*dPreco);
end;

procedure TFDadosItensPedido.LEQtdKeyPress(Sender: TObject; var Key: Char);
var
  edText : String;
begin
  edText := (Sender as TLabeledEdit).Text;

  // Permite apenas n�meros (0-9), decimal (,) e teclas de controle (Backspace, Delete, etc.)
  if not (Key in ['0'..'9', ',', #8, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  // Verifica se j� existe um decimal no texto
  if (Key = ',') and (Pos(',', edText) > 0) then
  begin
    Key := #0;
    Exit;
  end;
end;

procedure TFDadosItensPedido.SBF2Click(Sender: TObject);
begin
  FConsultaProdutos := TFConsultaProdutos.Create(Application);
  FConsultaProdutos.ShowModal;
end;

end.
