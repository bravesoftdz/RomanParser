unit eExtJob;

interface

uses
  API_ORM,
  eCommon;

type
  TExtJob = class(TExtEntity)
  private
    FCaption: string;
  public
    class function GetStructure: TSructure; override;
  published
    property Caption: string read FCaption write FCaption;
  end;

implementation

class function TExtJob.GetStructure: TSructure;
begin
  Result.TableName := 'JOBS';
end;

end.
