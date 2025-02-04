unit Model.Item;

interface

uses Interfaces.Visitor;

Type
  TModelItem = class(TInterfacedObject, iItem, iItemRegras, iVisitable)
    private
      FPrecoUnitario : Currency;
      FVisitor : iVisitor;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iItem;
      function SetPrecoUnitario(Value: Currency) : iItem;
      function PrecoUnitario : Currency;
      function PrecoAVista : Currency;
      function PrecoAPrazo : Currency;
      function Accept(Value : iVisitor) : iItemRegras;
      function Visitor: iVisitor;
      function Regras : iVisitable;
  end;

implementation

{TModelItem}

uses Model.Item.RegraAtacado, Model.Item.RegraVarejo;

function TModelItem.Accept(Value: iVisitor): iItemRegras;
begin
  FVisitor := Value;
  Result := FVisitor.Visit(Self);
end;

constructor TModelItem.Create;
begin
  FVisitor := TModelItemRegraVarejo.New.Visitor;
end;

destructor TModelItem.Destroy;
begin

  inherited;
end;

class function TModelItem.New : IItem;
begin
  Result := Self.Create;
end;

function TModelItem.SetPrecoUnitario(Value: Currency) : iItem;
begin
  Result := Self;
  FPrecoUnitario := Value;
end;

function TModelItem.Visitor: iVisitor;
begin
  Result := FVisitor;
end;

function TModelItem.PrecoAVista: Currency;
begin
  Result := FVisitor.Visit(Self).PrecoAVista;
end;

function TModelItem.PrecoUnitario: Currency;
begin
  Result := FPrecoUnitario;
end;

function TModelItem.PrecoAPrazo: Currency;
begin
  Result := FVisitor.Visit(Self).PrecoAPrazo;
end;


function TModelItem.Regras: iVisitable;
begin
  Result := Self;
end;

end.
