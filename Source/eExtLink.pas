unit eExtLink;

interface

uses
  API_ORM,
  eCommon,
  eExtJob,
  eExtRecord;

type
  TExtLink = class;

  TExtLinkRel = class(TExtEntity)
  private
    FChildLinkID: Integer;
    FChildExtLink: TExtLink;
    FParentLinkID: Integer;
  public
    class function GetStructure: TSructure; override;
  published
    property ChildLinkID: Integer read FChildLinkID write FChildLinkID;
    property ChildExtLink: TExtLink read FChildExtLink write FChildExtLink;
    property ParentLinkID: Integer read FParentLinkID write FParentLinkID;
  end;

  TExtLinkRelList = TEntityAbstractList<TExtLinkRel>;

  TExtLink = class(TExtEntity)
  private
    FExtLinkRelList: TExtLinkRelList;
    FHandleTime: TDateTime;
    FJob: TExtJob;
    FJobID: Integer;
    FLevel: Integer;
    FLink: string;
    FRecordList: TExtRecordList;
    function GetChildExtLink(const aLevel: Integer): TExtLink;
    function GetExtLinkRelList: TExtLinkRelList;
    function GetExtRecordValue(const aKey: string): string;
    function GetExtRecordList: TExtRecordList;
  public
    class function GetStructure: TSructure; override;
    property ChildExtLink[const aLevel: Integer]: TExtLink read GetChildExtLink;
    property ExtLinkRelList: TExtLinkRelList read GetExtLinkRelList;
    property ExtRecordValue[const aKey: string]: string read GetExtRecordValue;
    property ExtRecordList: TExtRecordList read GetExtRecordList;
  published
    property HandleTime: TDateTime read FHandleTime write FHandleTime;
    property Job: TExtJob read FJob write FJob;
    property JobID: Integer read FJobID write FJobID;
    property Level: Integer read FLevel write FLevel;
    property Link: string read FLink write FLink;
  end;

implementation

function TExtLink.GetChildExtLink(const aLevel: Integer): TExtLink;
var
  ExtLinkRel: TExtLinkRel;
begin
  Result := nil;

  for ExtLinkRel in ExtLinkRelList do
    if ExtLinkRel.ChildExtLink.Level = aLevel then
      Exit(ExtLinkRel.ChildExtLink);
end;

class function TExtLinkRel.GetStructure: TSructure;
begin
  Result.TableName := 'LINK2LINK';

  AddForeignKey(Result.ForeignKeyArr, 'PARENT_LINK_ID', TExtLink, 'ID', rtOne2Many);
  AddForeignKey(Result.ForeignKeyArr, 'CHILD_LINK_ID', TExtLink, 'ID', rtOne2One);
end;

function TExtLink.GetExtLinkRelList: TExtLinkRelList;
begin
  if not Assigned(FExtLinkRelList) then
    FExtLinkRelList := TExtLinkRelList.Create(Self);

  Result := FExtLinkRelList;
end;

function TExtLink.GetExtRecordValue(const aKey: string): string;
var
  ExtRecord: TExtRecord;
begin
  for ExtRecord in ExtRecordList do
    if ExtRecord.Key = aKey then
      Exit(ExtRecord.Value)
end;

function TExtLink.GetExtRecordList: TExtRecordList;
begin
  if not Assigned(FRecordList) then
    FRecordList := TExtRecordList.Create(Self);

  Result := FRecordList;
end;

class function TExtLink.GetStructure: TSructure;
begin
  Result.TableName := 'LINKS';

  AddForeignKey(Result.ForeignKeyArr, 'JOB_ID', TExtJob, 'ID');
end;

end.
