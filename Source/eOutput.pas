unit eOutput;

interface

uses
  API_ORM,
  eCommon;

type
  TOutput = class(TEntity)
  private
    FCategoryIdentifier: string;
    FCTime: TDateTime;
    FEnTitle: string;
    FRuTitle: string;
  public
    class function GetStructure: TSructure; override;
  published
    property CategoryIdentifier: string read FCategoryIdentifier write FCategoryIdentifier;
    property CTime: TDateTime read FCTime write FCTime;
    property EnTitle: string read FEnTitle write FEnTitle;
    property RuTitle: string read FRuTitle write FRuTitle;
  end;

implementation

class function TOutput.GetStructure: TSructure;
begin
  Result.TableName := 'OUTPUT';
end;

end.
