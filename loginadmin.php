<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 15/11/14
 * Time: 16:23
 */

require_once('config.php');

//caso o input hidden frmPassou seja diferente de ok, seignifica que ainda não foi apresentado o formulário de login
if($_POST['frmPassou'] != "OK"){
    $tpl->Show('form_login');
}
else{

    if($_POST['username'] != _ADMIN_ACOUNT)

    //verifica se o login é do administrador
    if($_POST['username'] == _ADMIN_ACOUNT && $_POST['password'] == _ADMIN_PWD){

        $_SESSION['_token'] = md5(_ADMIN_ACOUNT . _ADMIN_PWD);
        print 1;
        exit;

    }
    else{
        $user = new Comprador();
        $res = $user->load("login = '" . $_POST['username'] . "' ");

        if($res){
            if($user->senha == md5($_POST['password'])){
                $_SESSION['_token'] = md5($user->login.md5($user->senha));
                $_SESSION['cpf'] = $user->cpf;
                print 1;
                exit;
            }
            else print 2;
            exit;
        }

        print 0;
        exit;
    }
}

//verifica se o login é do administrador
if($_POST['username'] == _ADMIN_ACOUNT && $_POST['password'] == _ADMIN_PWD){

    $_SESSION['_token'] = md5(_ADMIN_ACOUNT . _ADMIN_PWD);
    print 1;
    exit;

}
else{
    $user = new Comprador();
    $res = $user->load("login = '" . $_POST['username'] . "' ");

    if($res){
        if($user->senha == md5($_POST['password'])){
            $_SESSION['_token'] = md5($user->login.md5($user->senha));
            $_SESSION['cpf'] = $user->cpf;
            print 1;
            exit;
        }
        else print 2;
        exit;
    }

    print 0;
    exit;
}
echo "chups mai dics";