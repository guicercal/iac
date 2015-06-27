<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 27/06/15
 * Time: 07:40
 */

require_once('config.php');
$tpl->set('hide_aqui','hidden');
$tpl->Show('header');
$pessoa = new Pessoa();

$pessoa = new Pessoa();
$test = unserialize($_SESSION['user']);
if($pessoa->Load("cpf='".$test->cpf."'")){
    $tpl->set('nome', strtoupper($pessoa->nome));
    $tpl->set('chave',md5($test->cpf));
    $tpl->Show('comprovante_votacao');

}

$tpl->Show('footer');