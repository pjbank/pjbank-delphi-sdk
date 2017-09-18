unit uPJBank_ContaDigital;

interface

uses
  System.SysUtils, System.Classes,uPJBank_Comum;

type
  TContaDigital = class
  private
    FCNPJ: String;
    FEmail: String;
    FBairro: String;
    FDDD: String;
    FUF: TEstados;
    FCEP: String;
    FNomeEmpresa: String;
    FNumero: String;
    FComplemento: String;
    FWebhook: String;
    FCidade: String;
    FEndereco: String;
    FTelefone: String;
    procedure SetBairro(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetCNPJ(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetDDD(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetNomeEmpresa(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetTelefone(const Value: String);

    procedure SetWebhook(const Value: String);
    procedure SetUF(const Value: TEstados);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property NomeEmpresa:String read FNomeEmpresa write SetNomeEmpresa;
    property CNPJ :String read FCNPJ write SetCNPJ;
    property CEP : String read FCEP write SetCEP;
    property Endereco : String read FEndereco write SetEndereco;
    property Numero : String read FNumero write SetNumero;
    property Bairro : String read FBairro write SetBairro;
    property Complemento : String read FComplemento write SetComplemento;
    property Cidade : String read FCidade write SetCidade;
    property UF : TEstados read FUF write SetUF;
    property DDD : String read FDDD write SetDDD;
    property Telefone : String read FTelefone write SetTelefone;
    property Email   : String read FEmail write SetEmail;
    property Webhook : String read FWebhook write SetWebhook;
  end;

implementation

  uses StrUtils;


{ TContaDigital }

procedure TContaDigital.SetBairro(const Value: String);
begin
  if not ValidaCampo(Value,1,128) then
    raise Exception.Create('Bairro deve conter entre 1 e 128 caracteres.')
  else
    FBairro := Copy(Value,0,128);
end;

procedure TContaDigital.SetCEP(const Value: String);
begin
  FCEP := Copy(Value,0,8);
end;

procedure TContaDigital.SetCidade(const Value: String);
begin
  if not ValidaCampo(Value,1,128) then
    raise Exception.Create('Nome da cidade deve conter entre 1 e 128 caracteres.')
  else
    FCidade := Copy(Value,0,128);
end;

procedure TContaDigital.SetCNPJ(const Value: String);
begin
  if not ValidaCampo(ApenasNumeros(Value),1,10) then
    raise Exception.Create('O CNPJ deve conter 14 caracteres.')
  else
    FCNPJ := Copy(ApenasNumeros(Value),0,14);
end;

procedure TContaDigital.SetComplemento(const Value: String);
begin
  FComplemento := Copy(Value,0,128);
end;

procedure TContaDigital.SetDDD(const Value: String);
begin
  FDDD := Copy(ApenasNumeros(Value),0,3);
end;

procedure TContaDigital.SetEmail(const Value: String);
begin
  if not ValidaCampo(Value,10,64) then
    raise Exception.Create('Email deve ter entre 10 e 64 caracteres.')
  else
    FEmail := Copy(Value,0,64);
end;

procedure TContaDigital.SetEndereco(const Value: String);
begin
  if not ValidaCampo(Value,1,128) then
    raise Exception.Create('Endereço deve ter entre 10 e 128 caracteres.')
  else
    FEndereco := Copy(Value,0,128);
end;

procedure TContaDigital.SetNomeEmpresa(const Value: String);
begin
  if not ValidaCampo(Value,1,128) then
    raise Exception.Create('Nome da empresa deve ter entre 10 e 128 caracteres.')
  else
    FNomeEmpresa := Copy(Value,0,128);
end;

procedure TContaDigital.SetNumero(const Value: String);
begin
  if Pos('SN',UpperCase(Value)) > 0 then
    FNumero := '0'
  else
    begin
      if not ValidaCampo(Value,1,10) then
        raise Exception.Create('Número deve ter no minimo 1 caractere, se não houver número, informe SN.')
      else
        FNumero := Value;
    end;
end;

procedure TContaDigital.SetTelefone(const Value: String);
begin
  FTelefone := Copy(ApenasNumeros(Value),0,128);
end;


procedure TContaDigital.SetUF(const Value: TEstados);
begin
  FUF := Value;
end;

procedure TContaDigital.SetWebhook(const Value: String);
begin
  FWebhook := Value;
end;

end.
