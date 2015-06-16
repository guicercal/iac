<?php

//define o nome e a senha do administrador
define('_ADMIN_ACOUNT', 'masterAdm');
define('_ADMIN_PWD', 'admPwd');


session_cache_limiter('private_no_expire');
session_cache_expire(1);
session_start();

//template Engine
require_once('MyTemplate.class.php');

//ADODB conexão com o banco de dados
require_once('adodb5/adodb.inc.php');
require_once('adodb5/adodb-active-record.inc.php');



$conn = NewADOConnection('postgres9');
$conn->Connect('localhost:5432', 'postgres', 'postgres', 'trabalhoiac');
$conn->debug=true;

ADOdb_Active_Record::SetDatabaseAdapter($conn);


//instancia a classe de template
$tpl = new MyTemplate('base.tpl');

require_once('pessoa.php');

//define algumas variaveis globais
GLOBAL  $conn, $user, $tpl;



//-------------------FUNÇÕES------------------------

//registra o usuário na sessão
function userSession($user,$password){
    $_SESSION['_token'] = md5($user.md5($password));
}

//verifica se há algum usuário logado
function isLogged(){
    if(isset($_SESSION['_token']) && isset($_SESSION['LASTACTIVITY'])){
        if((time() - $_SESSION['LASTACTIVITY']) < 60){
            return true;
        }
        else{
            session_destroy();
        }
    }
    return false;
}

//transforma uma data para o formato do BD
function DBDate($data){
    $split = explode('/',$data);
    return $split[2] . "-" . $split[1] . "-" . $split[0];
}

//transforma uma data para o formato do usuario
function UserDate($data){
    $split = explode('-',$data);
    return $split[2] . "/" . $split[1] . "/" . $split[0];
}

//verifica se o usuario logado é o administrador
function isAdmin(){
    return ($_SESSION['_token'] == md5(_ADMIN_ACOUNT . _ADMIN_PWD));
}


//verifica se o usuário está logado e se seu
if(!isLogged() && strripos($_SERVER['REQUEST_URI'], 'login.php') == false ){
    header('Location: login.php');
    die();
}
else{
    if(strripos($_SERVER['REQUEST_URI'], 'login.php') == false){
        $_SESSION['LASTACTIVITY'] = time();
    }
}