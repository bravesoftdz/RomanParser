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
    FEmail: string;
    FEnAddress: string;
    FEnCity: string;
    FEnContent: string;
    FEnCountry: string;
    FEnTitle: string;
    FPhone: string;
    FRuAddress: string;
    FRuCity: string;
    FRuContent: string;
    FRuCountry: string;
    FRuTitle: string;
    FSiteURL: string;
    FSkype: string;
    FUaAddress: string;
    FUaCity: string;
    FUaContent: string;
    FUaCountry: string;
    FUaTitle: string;
  public
    class function GetStructure: TSructure; override;
  published
    property CategoryIdentifier: string read FCategoryIdentifier write FCategoryIdentifier;
    property CTime: TDateTime read FCTime write FCTime;
    property Email: string read FEmail write FEmail;
    property EnAddress: string read FEnAddress write FEnAddress;
    property EnCity: string read FEnCity write FEnCity;
    property EnContent: string read FEnContent write FEnContent;
    property EnCountry: string read FEnCountry write FEnCountry;
    property EnTitle: string read FEnTitle write FEnTitle;
    property Phone: string read FPhone write FPhone;
    property RuAddress: string read FRuAddress write FRuAddress;
    property RuCity: string read FRuCity write FRuCity;
    property RuContent: string read FRuContent write FRuContent;
    property RuCountry: string read FRuCountry write FRuCountry;
    property RuTitle: string read FRuTitle write FRuTitle;
    property SiteURL: string read FSiteURL write FSiteURL;
    property Skype: string read FSkype write FSkype;
    property UaAddress: string read FUaAddress write FUaAddress;
    property UaCity: string read FUaCity write FUaCity;
    property UaContent: string read FUaContent write FUaContent;
    property UaCountry: string read FUaCountry write FUaCountry;
    property UaTitle: string read FUaTitle write FUaTitle;
  end;

implementation

class function TOutput.GetStructure: TSructure;
begin
  Result.TableName := 'OUTPUT';
end;

end.
