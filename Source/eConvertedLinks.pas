unit eConvertedLinks;

interface

uses
  API_ORM,
  eCommon;

type
  TConvertedLink = class(TEntity)
  private
    FExtLinkID: Integer;
  public
    class function GetStructure: TSructure; override;
  published
    property ExtLinkID: Integer read FExtLinkID write FExtLinkID;
  end;

implementation

class function TConvertedLink.GetStructure: TSructure;
begin
  Result.TableName := 'CONVERTED_LINKS';
end;

end.
