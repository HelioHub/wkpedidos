unit Controller.ClienteController;

interface

uses
  Interfaces.ICliente, Model.Cliente, FireDAC.Comp.Client;

type
  TClienteController = class
  private
    FCliente: ICliente;
  public
    constructor Create;
    destructor Destroy; override;

    function GetCliente: ICliente;
    function CarregarNomePorId(pId: String) : String; // Implementa��o do m�todo Carregar Nome por Id
    procedure CarregarDadosClientes(const AFDMemTable: TFDMemTable; pNomeCliente: String);
  end;

implementation

{ TClienteController }

uses WKConst;

function TClienteController.CarregarNomePorId(pId: String): String;
begin
  Result := FCliente.CarregarNomePorId(pId);
end;

constructor TClienteController.Create;
begin
  FCliente := TCliente.Create(cPATH_INI);
end;

destructor TClienteController.Destroy;
begin
  FCliente := nil;
  inherited;
end;

function TClienteController.GetCliente: ICliente;
begin
  Result := FCliente;
end;

procedure TClienteController.CarregarDadosClientes(const AFDMemTable: TFDMemTable; pNomeCliente: String);
begin
  FCliente.CarregarDados(AFDMemTable, pNomeCliente);
end;

end.
