unit Controller.ProdutoController;

interface

uses
  Interfaces.IProduto, Model.Produto, FireDAC.Comp.Client;

type
  TProdutoController = class
  private
    FProduto: IProduto;
  public
    constructor Create(const IniFileName: string);
    destructor Destroy; override;

    function GetProduto: IProduto;
    procedure CarregarDadosProdutos(const AFDMemTable: TFDMemTable);
  end;

implementation

{ TProdutoController }

constructor TProdutoController.Create(const IniFileName: string);
begin
  FProduto := TProduto.Create(IniFileName);
end;

destructor TProdutoController.Destroy;
begin
  FProduto := nil;
  inherited;
end;

function TProdutoController.GetProduto: IProduto;
begin
  Result := FProduto;
end;

procedure TProdutoController.CarregarDadosProdutos(const AFDMemTable: TFDMemTable);
begin
  FProduto.CarregarDados(AFDMemTable);
end;

end.
