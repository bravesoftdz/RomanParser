unit eExtRecord;

interface

uses
  API_ORM,
  eCommon;

type
  TExtRecord = class(TExtEntity)
  private
    FKey: string;
    FLinkID: Integer;
    FValue: string;
  public
    class function GetStructure: TSructure; override;
  published
    property Key: string read FKey write FKey;
    property LinkID: Integer read FLinkID write FLinkID;
    property Value: string read FValue write FValue;
  end;

  TExtRecordList = TEntityAbstractList<TExtRecord>;

implementation

uses
  eExtLink;

class function TExtRecord.GetStructure: TSructure;
begin
  Result.TableName := 'RECORDS';

  AddForeignKey(Result.ForeignKeyArr, 'LINK_ID', TExtLink, 'ID');
end;

end.
