<?php

require_once('config.php');


if($_GET['verLogin'] != ""){

    $return = 0;

    $user = new Pessoa();
    $res = $user->load("login = '" . $_POST['login'] . "' ");

    if($res){
        $return++;
    }
    $user = new Pessoa();
    $res = $user->load("cpf = '" . str_replace(array('-','.'),'',$_POST['cpf']) . "' ");

    if($res){
        $return +=2;
    }
    echo $return;
    exit;
}

$tpl->Show('header');

if($_POST['frmPassou'] != "OK"){
    $tpl->Show('form_registro');
}
else{
    $conn->Execute('START TRANSACTION;');
    //criação endereço
    $endereco = new Endereco();
    $endereco->id_endereco = $conn->nextId('endereco_id_endereco_seq');
    $endereco->cep = str_replace('-', '',$_POST['cep']);
    $endereco->logradouro = $_POST['logradouro'];
    $endereco->numero = $_POST['numero'];
    $endereco->bairro = $_POST['bairro'];
    $endereco->cidade = $_POST['cidade'];
    $endereco->estado = $_POST['estado'];

    if($endereco->Save()){
        //criação pessoa
        $eleitor = new Pessoa();
        $eleitor->cpf = str_replace(array('.','-'), '',$_POST['cpf']);
        $eleitor->nome = strtolower($_POST['nome']);
        $eleitor->titulo = $_POST['titulo'];

        $eleitor->rg  = $_POST['rg'];
        $eleitor->login = $_POST['login'];
        $eleitor->senha = md5($_POST['senha']) ;

        $eleitor->id_endereco = $endereco->id_endereco;
        if($eleitor->Save()){
            $tpl->set('cadastro_sucesso', 'show-alerts');
            $tpl->Show('form_login');
            $conn->Execute('COMMIT;');

        }else{
            $conn->Execute('ROLLBACK;');
            header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
        }

    }else{
        $conn->Execute('ROLLBACK;');
    }
//-----------------------------------------------------


}

$tpl->Show('footer');