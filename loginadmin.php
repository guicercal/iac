<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 15/11/14
 * Time: 16:23
 */

require_once('config.php');
$tpl->set('btn_logout','hidden');
$tpl->Show('header');
//caso o input hidden frmPassou seja diferente de ok, seignifica que ainda não foi apresentado o formulário de login
if($_POST['frmPassou'] != "OK"){
    $tpl->Show('form_login_admin');
}
else{

    //verifica se o login é do administrador
    if($_POST['login'] == _ADMIN_ACOUNT && $_POST['senha'] == _ADMIN_PWD){
        $_SESSION['_token'] = md5(_ADMIN_ACOUNT . _ADMIN_PWD);
        $_SESSION['LASTACTIVITY'] = time();
        //redireciona o usuário para a pagina inicial.
        header('Location: indexadmin.php');
        die();
    }
    else{
        $tpl->set('invalid_login_alert','show-alerts');
        $tpl->Show('form_login_admin');
    }

}
$tpl->Show('footer');


