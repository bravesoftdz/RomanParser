unit eCommon;

interface

uses
  API_ORM;

type
  TEntity = class(TEntityFeatID)
  public
    constructor Create(aID: Integer = 0);
  end;

  TExtEntity = class(TEntityFeatID)
  public
    constructor Create(aID: Integer = 0);
  end;

implementation

uses
  cController;

constructor TExtEntity.Create(aID: Integer = 0);
begin
  inherited Create(cController.ExtDBEngine, aID);
end;

constructor TEntity.Create(aID: Integer = 0);
begin
  inherited Create(cController.DBEngine, aID);
end;

end.
