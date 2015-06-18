<?php

require_once('config.php');


if($_GET['verLogin'] != ""){

    $return = 0;

    $user = new Pessoa();
    $res = $user->load("login = '" . $_POST['login'] . "' ");

    if($res){
        $return++;
    }
    $res = $user->load("cpf = '" . $_POST['cpf'] . "' ");

    if($res){
        $return +=2;
    }
    echo $return;
    die();
}

$tpl->Show('header');

if($_POST['frmPassou'] != "OK"){
    $tpl->Show('form_registro');
}
else{
    $eleitor = new Pessoa();

    $eleitor->nome = strtolower($_POST['nome']);
    $eleitor->cpf;
}

$tpl->Show('footer');