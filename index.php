<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 11/06/15
 * Time: 14:21
 */


require_once('config.php');
$tpl->Show('header');


$pessoa = new Pessoa();
$test = unserialize($_SESSION['user']);

$tpl->Show('header');

if($pessoa->Load("cpf='".$test->cpf."'")){

    if($pessoa->votou == 't'){
        $tpl->Show('voce_ja_votou');
    }
    else{
        $tpl->Show('urna');
    }

}
$tpl->Show('footer');


