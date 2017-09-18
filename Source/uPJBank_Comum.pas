unit uPJBank_Comum;

interface
  //Estados brasileiros
  type
    TEstados =(ufAcre,ufAlagoas,ufAmapa,ufAmazonas,ufBahia,ufCeara,
      ufDistritoFederal,ufEspirtoSanto,ufGoias,ufMaranhao,
      ufMatoGrosso,ufMatoGrossoDoSul,ufMinasGerais,ufPara,
      ufParaiba,ufParana,ufPernambuco,ufPiaui,ufRioDeJaneiro,
      ufRioGrandeDoNorte,ufRioGrandeDoSul,ufRondonia,
      ufRoraima,ufSantaCatarina,ufSaoPaulo,ufSergipe,
      ufTocantins);

  //Função responsavel por permitir apenas digitos de 0-9.
  function ApenasNumeros(Value:Variant):Variant;
  //Função responsavel por trazer TEstado vindo de UF
  function RetornaUF(Value:String):TEstados;
  //Função para verificar se campo esta valido;
  function ValidaCampo(Value:Variant; min,max:Integer):Boolean;

implementation
  uses StrUtils, SysUtils, System.Variants;


  function ApenasNumeros(Value:Variant):Variant;
  var
    I : Byte;
    vInput,
    vOutput: String;
  begin
    vInput := VarToStr(Value);
    for I := 1 To Length(vInput) do
      if vInput[I] In ['0'..'9'] Then
        vOutput := vOutput + vInput [I];
    Result := vOutput;
  end;

  function RetornaUF(Value:String):TEstados;
  begin
    case AnsiIndexStr(Value,['AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT',
                    'MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO',
                    'RR','SC','SP','SE','TO']) of
      0 : result := ufAcre               ;
      1 : result := ufAlagoas            ;
      2 : result := ufAmapa              ;
      3 : result := ufAmazonas           ;
      4 : result := ufBahia              ;
      5 : result := ufCeara              ;
      6 : result := ufDistritoFederal    ;
      7 : result := ufEspirtoSanto       ;
      8 : result := ufGoias              ;
      9 : result := ufMaranhao           ;
      10: result := ufMatoGrosso         ;
      11: result := ufMatoGrossoDoSul    ;
      12: result := ufMinasGerais        ;
      13: result := ufPara               ;
      14: result := ufParaiba            ;
      15: result := ufParana             ;
      16: result := ufPernambuco         ;
      17: result := ufPiaui              ;
      18: result := ufRioDeJaneiro       ;
      19: result := ufRioGrandeDoNorte   ;
      20: result := ufRioGrandeDoSul     ;
      21: result := ufRondonia           ;
      22: result := ufRoraima            ;
      23: result := ufSantaCatarina      ;
      24: result := ufSaoPaulo           ;
      25: result := ufSergipe            ;
      26: result := ufTocantins		       ;
    end;
  end;

  function ValidaCampo(Value:Variant; min,max:Integer):Boolean;
  begin
    try
      result := False;
      result := VarIsNull(Value) or VarIsEmpty(Value);
      if VarIsStr(Value) then
        result := ((Length(VarToStr(Value)) >= min) and(Length(VarToStr(Value)) <= max));
      if VarIsNumeric(Value) then
        result := (Value >= min) and (Value <= max);
      if VarIsFloat(Value) then
        result := (Value >= min) and (Value <= max);
    except
      raise Exception.Create('Erro ao validar campo.');
    end;
  end;

end.
