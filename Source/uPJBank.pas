unit uPJBank;

interface

uses
  System.SysUtils, System.Classes, uPJBank_ContaDigital;

type
  TAmbiente = (amSandbox, amProducao);
  TConfiguracao = class
  private
    FChave: String;
    FContaDigital: String;
    FAmbiente: TAmbiente;
    procedure SetChave(const Value: String);
    procedure SetContaDigital(const Value: String);
    procedure SetAmbiente(const Value: TAmbiente);
  published
    property Chave:String read FChave write SetChave;
    property ContaDigital:String read FContaDigital write SetContaDigital;
    Property Ambiente:TAmbiente read FAmbiente write SetAmbiente;

  end;

type
  TPJBank = class(TComponent)
  private
    { Private declarations }
    FContaDigital: TContaDigital;
    FConfiguracoes: TConfiguracao;
    procedure SetConfiguracoes(const Value: TConfiguracao);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
  published
    { Published declarations }
    property ContaDigital : TContaDigital read FContaDigital write FContaDigital;
    property Configuracoes:TConfiguracao read FConfiguracoes write SetConfiguracoes;
  end;

procedure Register;


implementation
  uses uPJBank_URLs;

procedure Register;
begin
  RegisterComponents('PJBank', [TPJBank]);
end;

{ TPJBank }

constructor TPJBank.Create(AOwner: TComponent);
begin
  inherited;
  FContaDigital  := TContaDigital.Create;
  FConfiguracoes := TConfiguracao.Create;
end;

procedure TPJBank.SetConfiguracoes(const Value: TConfiguracao);
begin
  FConfiguracoes := Value;
end;

{ TConfiguracao }

procedure TConfiguracao.SetAmbiente(const Value: TAmbiente);
begin
  FAmbiente := Value;
  case Value of
    amSandbox:  urlEnvio := 'https://sandbox.pjbank.com.br';
    amProducao: urlEnvio := 'https://api.pjbank.com.br';
  end;
end;

procedure TConfiguracao.SetChave(const Value: String);
begin
  FChave := Value;
end;

procedure TConfiguracao.SetContaDigital(const Value: String);
begin
  FContaDigital := Value;
end;



end.
