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
        var r = confirm("Dados Válidos.Cadastrar e retornar para home ? ");
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
$(document).ready(function(){
    $("#emailatendente").blur(function(event) {
         
       
          
          var email = ca.emailatendente.value;
         
          var x ;
          var dataEmail = "email="+email;
        
         
          
        $.ajax({
           
            url: 'testeajax.jsp',
            type: 'POST',
            data: dataEmail,
            success: function(data){
              
                if (data.length < 14){
                 
                    return true;
               }
               if (data.length > 14){
                   alert ("Email já existente, escolha outro!")
                   ca.emailatendente.focus();
                   return false;
                   
               }
            }
        }); 
       
    });
})



