unit uPJBank_POST;

interface

uses
  System.SysUtils, System.Classes;

type
  TPJBank_POST = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('PJBank', [TPJBank_POST]);
end;

end.
