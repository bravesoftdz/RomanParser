unit eConvertedLinks;

interface

uses
  API_ORM,
  eCommon;

type
  TConvertedLink = class(TEntity)
  private
    FError: Boolean;
    FErrorMsg: string;
    FExtLinkID: Integer;
  public
    class function GetStructure: TSructure; override;
  published
    property Error: Boolean read FError write FError;
    property ErrorMsg: string read FErrorMsg write FErrorMsg;
    property ExtLinkID: Integer read FExtLinkID write FExtLinkID;
  end;

implementation

class function TConvertedLink.GetStructure: TSructure;
begin
  Result.TableName := 'CONVERTED_LINKS';
end;

end.
