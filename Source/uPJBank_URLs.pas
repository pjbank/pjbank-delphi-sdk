unit uPJBank_URLs;

interface

const

  urlContaDigital : String = '/contadigital';
  urlCredencial   : String = '/contadigital/{{credencial}}';
  urlTransacoes   : String = '/contadigital/{{credencial}}/transacaoes';
  urlTransacoesID : String = '/contadigital/{{credencial}}/transacaoes/{{id}}';
  urlTransDocs    : String = '/contadigital/{{credencial}}/transacaoes/documentos';
  urlTransDocsID  : String = '/contadigital/{{credencial}}/transacaoes/documentos/{{id}}';
  urlRecebimentos : String = '/contadigital/{{credencial}}/recebimentos/';
  urlRecebTransacoes   : String = '/contadigital/{{credencial}}/recebimentos/transacoes';
  urlRecebTransacoesID : String = '/contadigital/{{credencial}}/recebimentos/transacoes/{{id}}';
  urlAdministradores   : String = '/contadigital/{{credencial}}/administradores';
  urlAdminisEmail      : String = '/contadigital/{{credencial}}/administradores/{{email}}';

var
  urlEnvio : String;
implementation

end.
