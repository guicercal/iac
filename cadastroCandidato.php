<?php
/**
 * Created by PhpStorm.
 * User: ANDRE
 * Date: 19/06/2015
 * Time: 18:00
 */

require_once('config.php');
if($_GET['verCandidato'] != ''){
    $retorno = array();
    $candidato = new Candidato();
    $res = $candidato->load("cpf ='".str_replace(array('.','-'),'',$_POST['cpf'])."'");

        if($res) {
            $retorno['cod']=3;

        }else{
            $pessoa = new Pessoa();
            $res = $pessoa->load("cpf ='".str_replace(array('.','-'),'',$_POST['cpf'])."'");
            if($res){
                $pes = get_object_vars($pessoa);
                $endereco = new Endereco();
                $endereco->load("id_endereco=".$pes['id_endereco']);
                $pes['endereco'] = get_object_vars($endereco);
                $retorno['cod']=2;
                $retorno['pessoa']= $pes ;
            }else{
                $retorno['cod']=1;
            }
        }

    echo json_encode($retorno);
    exit;
}
//======================================================================================================================
$tpl->Show('header');

//======================================================================================================================


$tpl->Show('menu_principal');
if($_POST['frmPassou'] != "OK"){
    $tpl->Show('form_candidato');
}
else {
    $conn->Execute('START TRANSACTION;');
    //criação endereço
    $endereco = new Endereco();
    $endereco->id_endereco = $conn->nextId('endereco_id_endereco_seq');
    $endereco->cep = str_replace('-', '', $_POST['cep']);
    $endereco->logradouro = $_POST['logradouro'];
    $endereco->numero = $_POST['numero'];
    $endereco->bairro = $_POST['bairro'];
    $endereco->cidade = $_POST['cidade'];
    $endereco->estado = $_POST['estado'];

    if ($endereco->Save()) {
        //criação pessoa
        $eleitor = new Pessoa();
        $eleitor->cpf = str_replace(array('.', '-'), '', $_POST['cpf']);
        $eleitor->nome = strtolower($_POST['nome']);
        $eleitor->titulo = $_POST['titulo'];

        $eleitor->rg = $_POST['rg'];
        $eleitor->login = $_POST['login'];
        $eleitor->senha = md5($_POST['senha']);

        $eleitor->id_endereco = $endereco->id_endereco;

        if ($eleitor->Save()) {
            //criação de candidato
            $candidato = new Candidato();
            $candidato->partido = ($_POST['partido']);
            $candidato->numeroCandidato = ($_POST['numeroCandidato']);
            $candidato->coligacao = ($_POST['coligacao']);
            $candidato->nomeFantasia = ($_POST['nomeFantasia']);
            $candidato->cargo = ($_POST['cargo']);

        }else{
            $conn->Execute('ROLLBACK;');
            header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
        }

        if($candidato->Save()){
            $tpl->set('cadastro_sucesso', 'show-alerts');
            $tpl->Show('form_login');
            $conn->Execute('COMMIT;');


        } else {
            $conn->Execute('ROLLBACK;');
            header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
        }

    } else {
        $conn->Execute('ROLLBACK;');
    }
}

//======================================================================================================================
$tpl->Show('footer');
//======================================================================================================================