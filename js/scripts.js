$(function(){

    $('.conteudo').css('minHeight',$(window).height()-$('.fixed-footer').height());


});

function validarCadPar(){
    var presida = cadpar.presidente.value;
    var nome = cadpar.nome.value;
    var nrptd = cadpar.nrptd.value;
    var estado = cadpar.estado.value;
    var sigla = cadpar.sigla.value;
    var deferimento = cadpar.deferimento.value;
    var cep = cadpar.cep.value;
    var cidade = cadpar.cidade.value;
    var bairro = cadpar.bairro.value;
    var rua = cadpar.rua.value;
    var nsede = cadpar.nsede.value;
    var logradouro = cadpar.logradouro.value;
    var uf = cadpar.uf.value;

    if(presida.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.presidente.focus();
        return false;
    }
    
    if(nome.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.nome.focus();
        return false;
    }
    
    if(nrptd.length < 1){
        alert("Preencha o campo corretamente!");
        cadpar.nrptd.focus();
        return false;
    }
    
    if(estado.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.estado.focus();
        return false;
    }
    
    if(sigla.length < 1){
        alert("Preencha o campo corretamente!");
        cadpar.sigla.focus();
        return false;
    }
    
    if(deferimento.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.deferimento.focus();
        return false;
    }
    
    if(cep.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.cep.focus();
        return false;
    }
    
    if(cidade.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.cidade.focus();
        return false;
    }
    
    if(bairro.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.bairro.focus();
        return false;
    }
   
    if(rua.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.rua.focus();
        return false;
    }
    
    if(nsede.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.nsede.focus();
        return false;
    }
    
    if(logradouro.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.logradouro.focus();
        return false;
    }
   
    if(uf.length < 1){
        alert("Preencha o campo corretamente!")
        cadpar.uf.focus();
        return false;
        
    }else{
        var x;
        var r = confirm("Dados Válidos.Cadastrar e retornar para home ? ");
        if (r==true){
            return true;
        }
        else{
            return false;
        }
            
    }
}


function validarCadCan(){
    var nomefantasia = cadcan.nomefantasia.value;
    var nrcdt = cadcan.numero.value;
    var estado = cadpar.estado.value;
    var sigla = cadpar.sigla.value;
    var deferimento = cadpar.deferimento.value;
    var cep = cadpar.cep.value;
    var cidade = cadpar.cidade.value;
    var bairro = cadpar.bairro.value;
    var rua = cadpar.rua.value;
    var nsede = cadpar.nsede.value;
    var logradouro = cadpar.logradouro.value;
    var uf = cadpar.uf.value;
    
    
    
    
    if(presida.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.presidente.focus();
        return false;
    }
    
    if(nome.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.nome.focus();
        return false;
    }
    
    if(nrptd.length < 1){
        alert("Preencha o campo corretamente!");
        cadpar.nrptd.focus();
        return false;
    }
    
    if(estado.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.estado.focus();
        return false;
    }
    
    if(sigla.length < 1){
        alert("Preencha o campo corretamente!");
        cadpar.sigla.focus();
        return false;
    }
    
    if(deferimento.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.deferimento.focus();
        return false;
    }
    
    if(cep.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.cep.focus();
        return false;
    }
    
    if(cidade.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.cidade.focus();
        return false;
    }
    
    if(bairro.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.bairro.focus();
        return false;
    }
   
   if(rua.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.rua.focus();
        return false;
    }
    
    if(nsede.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.nsede.focus();
        return false;
    }
    
    if(logradouro.length < 2){
        alert("Preencha o campo corretamente!");
        cadpar.logradouro.focus();
        return false;
    }
   
    if(uf.length < 1){
        alert("Preencha o campo corretamente!")
        cadpar.uf.focus();
        return false;
        
    }else{
        var x;
        var r = confirm("Dados V�lidos.Cadastrar e retornar para home ? ");
            if (r==true)
            {
          
            return true;
          
            }
            else
            {
             return false;
            }
            
            }
}

function mascaraCPF (cpf){
    if(mascaraInteiro(cpf)==false){
                event.returnValue = false;
   }    
   return formataCampo(cpf, '000.000.000-00', event);
   
}

function mascaraCep(cep){
    if(mascaraInteiro(cep)==false){
        event.returnValue = false;
    }
    return formataCampo(cep, '00000-000', event);
}

function mascaraCNPJ(cnpj){
        if(mascaraInteiro(cnpj)==false){
                event.returnValue = false;
        }       
        return formataCampo(cnpj, '00.000.000/0000-00', event);
}
function mascaraTelefone(tel){  
        if(mascaraInteiro(tel)==false){
                event.returnValue = false;
        }       
        return formataCampo(tel, '(00) 0000-0000', event);
}
function mascaraInteiro(){
        if (event.keyCode < 48 || event.keyCode > 57){
                event.returnValue = false;
                return false;
        }
        return true;
}
function formataCampo(campo, Mascara, evento) { 
        var boleanoMascara; 

        var Digitato = evento.keyCode;
        exp = /\-|\.|\/|\(|\)| /g
        campoSoNumeros = campo.value.toString().replace( exp, "" ); 

        var posicaoCampo = 0;    
        var NovoValorCampo="";
        var TamanhoMascara = campoSoNumeros.length;; 

        if (Digitato != 8) { // backspace 
                for(i=0; i<= TamanhoMascara; i++) { 
                        boleanoMascara  = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                                                                || (Mascara.charAt(i) == "/")) 
                        boleanoMascara  = boleanoMascara || ((Mascara.charAt(i) == "(") 
                                                                || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " ")) 
                        if (boleanoMascara) { 
                                NovoValorCampo += Mascara.charAt(i); 
                                  TamanhoMascara++;
                        }else { 
                                NovoValorCampo += campoSoNumeros.charAt(posicaoCampo); 
                                posicaoCampo++; 
                          }              
                  }      
                campo.value = NovoValorCampo;
                  return true; 
        }else { 
                return true; 
        }
}



function mascaraNumeroCandidato(campo,padrao){
    if(campo.value.length <2){
        campo.value = padrao;
    }
    else{
        if(campo.value.substr(0,3) != padrao){
            var resto = campo.value.substr(2,5);
            campo.value = padrao+''+resto;
        }
    }

}


function mascaraString(){
        if (event.keyCode > 46 && event.keyCode < 59){
                event.returnValue = false;
                return false;
        }
        return true;
}
function mascaraChar(Char){
    if(mascaraString(Char)==false){
                event.returnValue = false;
                return false;
   }       
   
}
function mascaraTudo(){
    if(mascaraAll()==false){
                event.returnValue = false;
                return false;
   }       
   
}
function mascaraAll(){
        if (event.keyCode > 0 && event.keyCode < 1110){
                event.returnValue = false;
                return false;
        }
        return true;
}


function validarCPF(cpfField) {
    ok = true;
    cpf = $(cpfField).val();

    cpf = cpf.replace(/[^\d]+/g,'');
    if(cpf == '') ok = false;
    // Elimina CPFs invalidos conhecidos
    if (cpf.length != 11 ||
        cpf == "00000000000" ||
        cpf == "11111111111" ||
        cpf == "22222222222" ||
        cpf == "33333333333" ||
        cpf == "44444444444" ||
        cpf == "55555555555" ||
        cpf == "66666666666" ||
        cpf == "77777777777" ||
        cpf == "88888888888" ||
        cpf == "99999999999")
        ok = false;
    // Valida 1o digito
    add = 0;
    for (i=0; i < 9; i ++)
        add += parseInt(cpf.charAt(i)) * (10 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(9)))
        ok = false;
    // Valida 2o digito
    add = 0;
    for (i = 0; i < 10; i ++)
        add += parseInt(cpf.charAt(i)) * (11 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(10)))
        ok = false;

    return ok;
}


function validarFormulario(form){
    var gravar = true;
    $.each($(form).find('input[required], select[required], textarea[required]'),function(){
        $(this).removeClass('has-error');
        if(this.value == ""){
            gravar = false;
            $(this).addClass('has-error');
        }
        if($(this).attr('formato') == "cpf" && !validarCPF(this)){
            gravar = false;
            $(this).addClass('has-error');
        }
    });

    if(!gravar){
        $('.form-errors-alert').fadeIn(400);
    }

    return gravar;
}


function verificaDisponibilidadeLogin(form){


   $.ajax({
        url: 'cadastropessoa.php?verLogin=true',
        type: 'POST',
        data: {'login':$(form.login).val(),'cpf':$(form.cpf).val()},
        async:false,
        success: function(data){

            $(login).removeClass('has-error');
            if(data == "1"){

                $(form.login).addClass('has-error');
                $('#loginDisponivel').val('false');
                $('.login-indisp-alert').fadeIn(400);
            }
            if(data == "2"){
                $(form.cpf).addClass('has-error');
                $('#loginDisponivel').val('false');
                $('.cpf-indisp-alert').fadeIn(400);
            }
            if(data == "3"){
                $(form.cpf).addClass('has-error');
                $(form.login).addClass('has-error');
                $('#loginDisponivel').val('false');
                $('.cpf-indisp-alert').fadeIn(400);
                $('.login-indisp-alert').fadeIn(400);
            }

        }
   });

   return $('#loginDisponivel').val() != 'false';
}

function verificaCandidato(cpf){


    if($(cpf).val().length == 14){
        $.ajax({
            url:'cadastroCandidato.php?verCandidato=true',
            type: 'POST',
            data: {'cpf':$(cpf).val()},
            success: function(data){

                var res = eval('('+data+')');

                console.log(res);
                if(res.cod== 2 || res.cod == 3) {
                    $('#alertaExisteEleitor').fadeIn(1000);
                    $('#nome').val(res.pessoa.nome);
                    $('#rg').val(res.pessoa.rg);
                    $('#titulo').val(res.pessoa.titulo);
                    $('#cep').val(res.pessoa.endereco.cep);
                    $('#logradouro').val(res.pessoa.endereco.logradouro);
                    $('#numero').val(res.pessoa.endereco.numero);
                    $('#bairro').val(res.pessoa.endereco.bairro);
                    $('#cidade').val(res.pessoa.endereco.cidade);
                    $("#estado option[value=" + res.pessoa.endereco.estado + "]").attr('selected', 'selected');


                    $('#nome').attr('disabled', 'disabled');
                    $('#rg').attr('disabled', 'disabled');
                    $('#titulo').attr('disabled', 'disabled');
                    $('#cep').attr('disabled', 'disabled');
                    $('#logradouro').attr('disabled', 'disabled');
                    $('#numero').attr('disabled', 'disabled');
                    $('#bairro').attr('disabled', 'disabled');
                    $('#cidade').attr('disabled', 'disabled');
                    $('#estado').attr('disabled', 'disabled');
                }else{
                    $('#nome').removeAttr('disabled').val('');
                    $('#titulo').removeAttr('disabled').val('');
                    $('#cep').removeAttr('disabled').val('');
                    $('#logradouro').removeAttr('disabled').val('');
                    $('#numero').removeAttr('disabled').val('');
                    $('#bairro').removeAttr('disabled').val('');
                    $('#cidade').removeAttr('disabled').val('');
                    $('#estado').removeAttr('disabled').val('');
                }


                /*$(cpf).removeClass('has-error');
                if(data =='1' ){
                    $(cpf.value).addClass('has_erro');
                    $('#cpfDisponivel').val('false');
                    $('.login-indisp-alert').fadeIn(400);
                }
                if(data == '2')*/


            }
        });
    }else{
        $('#nome').removeAttr('disabled').val('');
        $('#rg').removeAttr('disabled').val('');
        $('#titulo').removeAttr('disabled').val('');
        $('#cep').removeAttr('disabled').val('');
        $('#logradouro').removeAttr('disabled').val('');
        $('#numero').removeAttr('disabled').val('');
        $('#bairro').removeAttr('disabled').val('');
        $('#cidade').removeAttr('disabled').val('');
        $('#estado').removeAttr('disabled').val('');
    }

    /*$.ajax({
        url: 'cadastropessoa.php?verLogin=true',
        type: 'POST',
        data: {'login':$(form.login).val(),'cpf':$(form.cpf).val()},
        async:false,
        success: function(data){

            $(login).removeClass('has-error');
            if(data == "1"){

                $(form.login).addClass('has-error');
                $('#loginDisponivel').val('false');
                $('.login-indisp-alert').fadeIn(400);
            }
            if(data == "2"){
                $(form.cpf).addClass('has-error');
                $('#loginDisponivel').val('false');
                $('.cpf-indisp-alert').fadeIn(400);
            }
            if(data == "3"){
                $(form.cpf).addClass('has-error');
                $(form.login).addClass('has-error');
                $('#loginDisponivel').val('false');
                $('.cpf-indisp-alert').fadeIn(400);
                $('.login-indisp-alert').fadeIn(400);
            }

        }
    });

    return $('#loginDisponivel').val() != 'false';*/
}

function buscaEndereco(campoCep){

    /**
     * Resgatamos o valor do campo #cep
     * usamos o replace, pra remover tudo que não for numérico,
     * com uma expressão regular
     */

    if($(campoCep).val().length == 9){

        var cep     = $(campoCep).val().replace(/[^0-9]/, '');
        //Verifica se não está vazio
        if(cep !== ""){
            //Cria variável com a URL da consulta, passando o CEP
            var url = 'http://cep.correiocontrol.com.br/'+cep+'.json';

            /**
             * Fazemos um requisição a URL, como vamos retornar json,
             * usamos o método $.getJSON;
             * Que é composta pela URL, e a função que vai retorna os dados
             * o qual passamos a variável json, para recuperar os valores
             */
            $.getJSON(url, function(json){
                //Atribuimos o valor aos inputs
                $("#logradouro").val(json.logradouro);
                $("#bairro").val(json.bairro);
                $("#cidade").val(json.localidade);
                $("#estado option[value="+json.uf+"]").attr('selected','selected');
                console.log(json);


                //Usamos o método fail, caso não retorne nada
            });
        }
    }


}