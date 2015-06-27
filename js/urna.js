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
        type: 'POST',
        data:{'busca':'partido','valor':valor},
        success: function(data){

            if(data != ""){

                dados = eval('('+data+')');

                if(dados.foto != null){
                    $("#foto-partido").attr('src',"tmp/"+dados.foto);
                }
                else{
                    $("#foto-partido").attr('src',"img/sem_foto.jpg");
                }

                $("#nome-partido").html(dados.nome);
                $("#coligacao-partido").html(dados.coligacao);
            }
        }
    });

}

function buscaCandidato(valor){
    $.ajax({
        url:'ajaxurna.php',
        type: 'POST',
        data:{'busca':'candidato','valor':valor, 'id_cargo':cargoCorrente},
        success: function(data){
            if(data != ""){
                dados = eval('('+data+')');
                $("#foto-candidato").attr('src','tmp/'+dados.foto);
                $(".nome-candidato").html(dados.fantasia);
                $("#numero-candidato").html($('#campo-voto').val());
                $("#nomecandidato").val(dados.fantasia);
                $(".nome-fantasia-candidato").html(dados.fantasia);
            }
        }
    });
}

function digitaUrna(valor){
    var val = $('#campo-voto').val()+''+valor;
    $('#campo-voto').val(val);

    var verificar = true;

    verificaVoto($('#campo-voto').val());
}

function corrige(){
    $('#campo-voto').val('');
    $("#foto-partido").attr('src',"img/sem_foto.jpg");
    $("#foto-candidato").attr('src',"img/sem_foto.jpg");
    $("#nome-partido").html('');
    $("#coligacao-partido").html('');
    $(".nome-candidato").html('');
    $("#numero-candidato").html('');
    $("#nomecandidato").val('');
    $(".nome-fantasia-candidato").html('');
}

function branco(){
    $('#campo-voto').val('');
    switch(cargoCorrente){
        case 1: cedula.vereador = 'branco';cargoCorrente++;break;
        case 2: cedula.deputado = 'branco';cargoCorrente++;break;
        case 3: cedula.prefeito = 'branco';gravaVoto();break;
    }

    proximoCargo();
}

function proximoCargo(){

    switch(cargoCorrente){
        case 1: $("#cargo").html("Vereador");break;
        case 2: $("#cargo").html("Deputado");break;
        case 3: $("#cargo").html("Prefeito");break;
    }
}

function confirma(){

    var voto;

    if($("#nomecandidato").val() != "" ){
        voto = $('#campo-voto').val();
    }
    else{
        voto = "nulo";
    }

    switch(cargoCorrente){
        case 1:
            cedula.vereador = voto;
            cargoCorrente++;
            break;
        case 2:
            cedula.deputado = voto;cargoCorrente++;break;
        case 3: cedula.prefeito = voto;gravaVoto();break;
    }

    corrige();
    proximoCargo();
}

function gravaVoto(){
    alert('hora de gravar');
    console.log(cedula);

    $("#formVotos").html("<input type='hidden' name='vereador' value='"+cedula.vereador+"'>" +
        "<input type='hidden' name='deputado' value='"+cedula.deputado+"'>" +
        "<input type='hidden' name='prefeito' value='"+cedula.prefeito+"'>").submit();

}