/**
 * Created by Guilherme on 26/06/15.
 */

var cedula = {};

cedula.vereador = null;
cedula.deputado = null;
cedula.prefeito = null;

var cargoCorrente = 1;

function verificaVoto(valor){
    buscaPartido(valor);
    switch (cargoCorrente){
        //verifica se esta votando em vereador
        case 1:
            if(valor.length == 5){
                buscaCandidato(valor);
            }
            break;

        case 2:
            if(valor.length == 5){
                buscaCandidato(valor);
            }
            break;
        default :
            buscaCandidato(valor);

    }
}

//busca e atualiza a foto do partido
function buscaPartido(valor){

    $.ajax({
        url:'ajaxurna.php',
        method: 'POST',
        type:{'busca':'partido','valor':valor},
        success: function(data){
            if(data != ""){
                dados = eval('('+data+')');
                $("#foto-partido").attr('src',dados.foto);
                $("#nome-partido").html(dados.nome);
                $("#coligacao-partido").html(dados.coligacao);
            }
        }
    });

}

function buscaCandidato(valor){
    $.ajax({
        url:'ajaxurna.php',
        method: 'POST',
        type:{'busca':'candidato','valor':valor},
        success: function(data){
            if(data != ""){
                dados = eval('('+data+')');
                $("#foto-candidato").attr('src',dados.foto);
                $("#nome-candidato").html(dados.nome);
                $("#nome-fantasia-candidato").html(dados.fantasia);
            }
        }
    });
}

function digitaUrna(valor){
    var val = $('#campo-voto').val()+''+valor;
    $('#campo-voto').val(val);
    verificaVoto(valor);
}

function corrige(){
    $('#campo-voto').val('');
}

function branco(){
    $('#campo-voto').val('');
    switch(cargoCorrente){
        case 1: cedula.vereador = 'branco';cargoCorrente++;break;
        case 2: cedula.deputado = 'branco';cargoCorrente++;break;
        case 3: cedula.prefeito = 'branco';gravaVoto();break;
    }
}

function gravaVoto(){

}