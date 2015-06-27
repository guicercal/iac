<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 27/06/15
 * Time: 07:11
 */

require_once('config.php');


$pessoa = new Pessoa();
$test = unserialize($_SESSION['user']);
if($pessoa->Load("cpf='".$test->cpf."'")){

    if($pessoa->votou == 't'){
        header('Location: logout.php');
    }

}

    $voto_vereador = new Voto();
    $voto_deputado = new Voto();
    $voto_prefeito = new Voto();

    $conn->Execute('START TRANSACTION');

    $voto_vereador->id_voto = $conn->nextId('votos_id_voto_seq');
    $voto_deputado->id_voto = $conn->nextId('votos_id_voto_seq');
    $voto_prefeito->id_voto = $conn->nextId('votos_id_voto_seq');

switch($_POST['vereador']){
    case 'branco':
        $voto_vereador->tipo_voto = 2; break;
    case 'nulo':
        $voto_vereador->tipo_voto = 3; break;
    default:
        $voto_vereador->tipo_voto = 1;
        $candidato = new Candidato();
        $candidato->Load('numero='.$_POST['vereador']);
        $voto_vereador->id_candidato = $candidato->id_candidato;
}

if($voto_vereador->Save()){
    switch($_POST['deputado']){
        case 'branco':
            $voto_deputado->tipo_voto = 2; break;
        case 'nulo':
            $voto_deputado->tipo_voto = 3; break;
        default:
            $voto_deputado->tipo_voto = 1;
            $candidato = new Candidato();
            $candidato->Load('numero='.$_POST['deputado']);
            $voto_deputado->id_candidato = $candidato->id_candidato;
    }

    if($voto_deputado->Save()){
        switch($_POST['prefeito']){
            case 'branco':
                $voto_prefeito->tipo_voto = 2; break;
            case 'nulo':
                $voto_prefeito->tipo_voto = 3; break;
            default:
                $voto_prefeito->tipo_voto = 1;
                $candidato = new Candidato();
                $candidato->Load('numero='.$_POST['prefeito']);
                $voto_prefeito->id_candidato = $candidato->id_candidato;
        }

        if($voto_prefeito->Save()){



                $pessoa->votou = 't';

                if($pessoa->Save()){
                    $conn->Execute('COMMIT;');

                    header('Location: sucesso.php');
                }

        }

    }
}


echo "algo deu errado!!";

$conn->Execute('ROLLBACK;');