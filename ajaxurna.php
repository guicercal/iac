<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 26/06/15
 * Time: 16:24
 */

require_once('config.php');

if(isLogged()){
    $return = array();

    if($_POST['busca']=='partido'){
        $filtro = substr($_POST['valor'],0,2);

        $partido = new Partido();

        if($partido->Load("numero = $filtro")){
            $return['foto'] = $partido->foto;
            $return['nome'] = $partido->nome;
            $return['coligacao'] = $partido->coligacao;
            echo json_encode($return);
        }
        else{
            echo "";
        }

        exit;
    }

    if($_POST['busca'] == 'candidato'){
        $candidato = new Candidato();
        if($candidato->Load('numero='.$_POST['valor'] . ' AND id_cargo = ' . $_POST['cargo'])){
            $return['foto'] = $partido->foto;
            $return['nome'] = $partido->nome;
            $return['fantasia'] = $partido->nome_fantasia;
            echo json_encode($return);
        }
        else{
            echo "";
        }

        exit;
    }
}