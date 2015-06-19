<?php

require_once('config.php');

/**
 * caso o valor do input frmPassou seja OK ,
 * significa que o usuário já enviou suas credenciais para validação
 *
*/
$tpl->Show("header");
if($_POST['frmPassou'] == "OK"){

    $user = new Pessoa();
    $res = $user->load("login = '" . $_POST['login'] . "' ");

    //caso tenha encontrado o nome de usuário no BD.
    if($res){

        //caso a senha coincida com a registrada no BD.
        if($user->senha == md5($_POST['senha'])){

            //registra os dados do usuário na sessão
            $_SESSION['_token'] = md5($user->login.md5($user->senha));
            $_SESSION['LASTACTIVITY'] = time();
            $_SESSION['user'] = $user;
            //redireciona o usuário para a pagina inicial.
            header('Location: index.php');
            die();
        }
    }

    //se chegar a este trecho de codigo então houve falha na validação
    $tpl->set('login_error','show-alerts');

}

//apresenta o formulário na tela
$tpl->Show('form_login');
$tpl->Show('footer');
