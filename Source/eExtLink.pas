unit eExtLink;

interface

uses
  API_ORM,
  eCommon,
  eExtJob;

type
  TExtLink = class(TExtEntity)
  private
    FHandleTime: TDateTime;
    FJob: TExtJob;
    FJobID: Integer;
  public
    class function GetStructure: TSructure; override;
  published
    property HandleTime: TDateTime read FHandleTime write FHandleTime;
    property Job: TExtJob read FJob write FJob;
    property JobID: Integer read FJobID write FJobID;
  end;

implementation

class function TExtLink.GetStructure: TSructure;
begin
  Result.TableName := 'LINKS';

  AddForeignKey(Result.ForeignKeyArr, 'JOB_ID', TExtJob, 'ID');
end;

end.
