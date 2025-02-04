unit Model.Produto;

interface

uses
  Interfaces.IProduto, FireDAC.Comp.Client, Data.DB, Utils.DatabaseConnection;

type
  TProduto = class(TInterfacedObject, IProduto)
  private
    FCodigoProdutos: Integer;
    FDescricaoProdutos: string;
    FPrecoVendaProdutos: Double;
    FQuery: TFDQuery; // Query para interagir com o banco de dados
    FDatabaseConnection: TDatabaseConnection; // Conex�o centralizada

    function GetCodigoProdutos: Integer;
    function GetDescricaoProdutos: string;
    function GetPrecoVendaProdutos: Double;

    procedure SetCodigoProdutos(const Value: Integer);
    procedure SetDescricaoProdutos(const Value: string);
    procedure SetPrecoVendaProdutos(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;

    property CodigoProdutos: Integer read GetCodigoProdutos write SetCodigoProdutos;
    property DescricaoProdutos: string read GetDescricaoProdutos write SetDescricaoProdutos;
    property PrecoVendaProdutos: Double read GetPrecoVendaProdutos write SetPrecoVendaProdutos;

    function CarregarNomePorId(pId: String): String;
    function CarregarPricePorId(pId: String): Double;
    procedure CarregarDados(const AFDMemTable: TFDMemTable; pDescricaoProduto: String); // Implementa��o do m�todo CarregarDados
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, System.SysUtils, Vcl.Dialogs;

{ TProduto }

constructor TProduto.Create;
begin
  // Usa a conex�o centralizada com par�metros do arquivo .INI
  FDatabaseConnection := TDatabaseConnection.Create;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FDatabaseConnection.Connection;
end;

destructor TProduto.Destroy;
begin
  FQuery.Free;
  FDatabaseConnection.Free;
  inherited;
end;

function TProduto.GetCodigoProdutos: Integer;
begin
  Result := FCodigoProdutos;
end;

function TProduto.GetDescricaoProdutos: string;
begin
  Result := FDescricaoProdutos;
end;

function TProduto.GetPrecoVendaProdutos: Double;
begin
  Result := FPrecoVendaProdutos;
end;

procedure TProduto.SetCodigoProdutos(const Value: Integer);
begin
  FCodigoProdutos := Value;
end;

procedure TProduto.SetDescricaoProdutos(const Value: string);
begin
  FDescricaoProdutos := Value;
end;

procedure TProduto.SetPrecoVendaProdutos(const Value: Double);
begin
  FPrecoVendaProdutos := Value;
end;

procedure TProduto.CarregarDados(const AFDMemTable: TFDMemTable; pDescricaoProduto: String);
begin
  try
    // Prepara a query para selecionar os dados
    FQuery.SQL.Clear;
    FQuery.SQL.Add('SELECT CodigoProdutos, DescricaoProdutos, PrecoVendaProdutos ');
    FQuery.SQL.Add('FROM Produtos ');
    if pDescricaoProduto <> EmptyStr then
      FQuery.SQL.Add('WHERE DescricaoProdutos LIKE '+QuotedStr(pDescricaoProduto+'%'));
    FQuery.SQL.Add(' ORDER BY DescricaoProdutos ');
    FQuery.Open;

    // Copia os dados para o TFDMemTable
    AFDMemTable.Close;
    AFDMemTable.Data := FQuery.Data;
    AFDMemTable.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

function TProduto.CarregarNomePorId(pId: String) : String;
begin
  Result := '';
  try
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' SELECT DescricaoProdutos ');
    FQuery.SQL.Add(' FROM Produtos ');
    if pId <> EmptyStr then
      FQuery.SQL.Add('WHERE CodigoProdutos = '+pId);
    FQuery.Open;

    Result := FQuery.FieldByName('DescricaoProdutos').AsString;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

function TProduto.CarregarPricePorId(pId: String) : Double;
begin
  Result := 0;
  try
    FQuery.SQL.Clear;
    FQuery.SQL.Add(' SELECT PrecoVendaProdutos ');
    FQuery.SQL.Add(' FROM Produtos ');
    if pId <> EmptyStr then
      FQuery.SQL.Add('WHERE CodigoProdutos = '+pId);
    FQuery.Open;

    Result := FQuery.FieldByName('PrecoVendaProdutos').AsFloat;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar dados: ' + E.Message);
    end;
  end;
end;

end.
