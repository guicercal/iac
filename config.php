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
//$conn->debug = true;


ADOdb_Active_Record::SetDatabaseAdapter($conn);


//instancia a classe de template
$tpl = new MyTemplate('base.tpl');

require_once('Pessoa.php');
require_once('Endereco.php');
require_once('cargos.php');
require_once('Eleicoes.php');
require_once('Partido.php');
require_once('Candidato.php');
require_once('Voto.php');


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
        if((time() - $_SESSION['LASTACTIVITY']) < 3000){
            return true;
        }
        else{
            session_destroy();
            unset($_SESSION);
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

function mask($val, $mask)
{
    $maskared = '';
    $k = 0;
    for($i = 0; $i<=strlen($mask)-1; $i++)
    {
        if($mask[$i] == '#')
        {
            if(isset($val[$k]))
                $maskared .= $val[$k++];
        }
        else
        {
            if(isset($mask[$i]))
                $maskared .= $mask[$i];
        }
    }
    return $maskared;
}

function paginacao($itens,$current,$root_link,$query){
    $html = "";

    if($itens >= 10){
        $pages = (int)($itens/10);
        $html .= "<ul class=\"pagination pagination-sm no-margin pull-right\">
                     <li><a href=\"$root_link?$query\">&laquo;</a></li>";


        if($pages >= 3){
            if($current >= 2){
                if($current <= ($pages-1)){
                    $html .= "<li><a href=\"$root_link?page=".($current-1)."$query\">".($current-1)."</a></li>";
                    $html .= "<li><a href=\"$root_link?page=".($current)."$query\">".($current)."</a></li>";
                    $html .= "<li><a href=\"$root_link?page=".($current+1)."$query\">".($current+1)."</a></li>";
                }
                else{
                    $html .= "<li><a href=\"$root_link?page=".($current-2)."$query\">".($current-2)."</a></li>";
                    $html .= "<li><a href=\"$root_link?page=".($current-1)."$query\">".($current-1)."</a></li>";
                    $html .= "<li><a href=\"$root_link?page=".($current)."$query\">".($current)."</a></li>";
                }

            }
            else{
                $html .= "<li><a href=\"".$root_link."?".$query."\">1</a></li>";
                $html .= "<li><a href=\"$root_link?page=2$query\">2</a></li>";
                $html .= "<li><a href=\"$root_link?page=3$query\">3</a></li>";
            }
        }
        else{
            $html .= "<li><a href=\"".$root_link."?".$query."\">1</a></li>";
            $html .= "<li><a href=\"$root_link?page=2$query\">2</a></li>";
            $html .= "<li><a href=\"$root_link?page=".($pages+1)."$query\">3</a></li>";
        }

        $html .= "<li><a href=\"$root_link?page=".($pages+1).$query."\">&raquo;</a></li></ul>";

    }

    return $html;
}

function onlyAdmin(){
    if(!isAdmin()){
        session_destroy();
        header('Location: login.php');
        die();
    }
}


function uploadFoto(){

    if(isset($_FILES['foto']['name']) && $_FILES["foto"]["error"] == 0)
    {

        $arquivo_tmp = $_FILES['foto']['tmp_name'];
        $nome = $_FILES['foto']['name'];

        // Pega a extensao
        $extensao = strrchr($nome, '.');

        // Converte a extensao para mimusculo
        $extensao = strtolower($extensao);

        // Somente imagens, .jpg;.jpeg;.gif;.png
        // Aqui eu enfilero as extesões permitidas e separo por ';'
        // Isso server apenas para eu poder pesquisar dentro desta String
        if(strstr('.jpg;.jpeg;.gif;.png', $extensao)){
            // Cria um nome único para esta imagem
            // Evita que duplique as imagens no servidor.
            $novoNome = md5(microtime()) . $extensao;

            // Concatena a pasta com o nome
            $destino = 'tmp/' . $novoNome;

            // tenta mover o arquivo para o destino
            if( @move_uploaded_file( $arquivo_tmp, $destino  )){
                return $novoNome;
            }
            else{
                var_dump('nao moveu');
                return false;
            }
        }
        else{
            var_dump('nao coiso strtr');
            return false;
        }
    }
    else{

        return false;
    }
}

//verifica se o usuário está logado e se seu
if(!isLogged() && strripos($_SERVER['REQUEST_URI'], 'login.php') == false
    && strripos($_SERVER['REQUEST_URI'], 'loginadmin.php') == false
    && strripos($_SERVER['REQUEST_URI'], 'cadastropessoa.php') == false){

    if(isAdmin()){
        header('Location: loginadmin.php');
    }
    else{
        header('Location: login.php');
    }

    die();
}
else{
    if(strripos($_SERVER['REQUEST_URI'], 'login.php') == false
        && strripos($_SERVER['REQUEST_URI'], 'loginadmin.php') == false
        && strripos($_SERVER['REQUEST_URI'], 'cadastropessoa.php') == false){
        $_SESSION['LASTACTIVITY'] = time();
    }
}
