<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 21/06/15
 * Time: 16:13
 */

require_once('config.php');

onlyAdmin();


if($_GET['a'] == "3"){
    $eleitor = new Pessoa();
    $eleitor->Load("cpf = '".$_GET['id']."'");
    $endereco = new Endereco();
    $endereco->Load('id_endereco='.$eleitor->id_endereco);

    $eleitor->Delete();
    $endereco->Delete();

    header('Location: eleitores.php?a=1');

}

$tpl->Show('header');
$tpl->set('menu_eleitores_active','active');
$tpl->Show('menu_principal');

if($_GET['a'] == "1" || $_GET['a'] == ""){
    $where = "";
    $where2 = "";
    $page = "";
    if($_GET['page'] != ""){
        $page = "OFFSET " . ($_GET['page']-1) * 10;
    }

    if($_GET['filtro'] != ""){
        $where .= "WHERE nome like '%".$_GET['filtro']."%' OR cpf like '%".str_replace(array('-','.'),'',$_GET['filtro'])."%'";
        $where2 .= "nome like '%".$_GET['filtro']."%' OR cpf like '%".str_replace(array('-','.'),'',$_GET['filtro'])."%'";
    }

    $SQL = "SELECT * FROM pessoa $where LIMIT 10 $page";

    $res = $conn->Execute($SQL);

    $tpl->Show('eleitores_table_head');

    if($res->EOF){
        $tpl->Show('eleitores_table_linha_eof');
    }

    while(!$res->EOF){
        $tpl->set('cpf',mask($res->fields('cpf'),'###.###.###-##'));
        $tpl->set('nome',$res->fields('nome'));

        if($res->fields('votou') == 't'){
            $tpl->set('votou','SIM');
            $tpl->set('cor_votou','label-success');
        }
        else{
            $tpl->set('votou','NÃO');
            $tpl->set('cor_votou','label-danger');
        }

        $tpl->set('link_editar','eleitores.php?a=2&id='.$res->fields('cpf'));
        $tpl->set('link_excluir','eleitores.php?a=3&id='.$res->fields('cpf'));
        $tpl->Show('eleitores_table_linha');
        $res->MoveNext();
    }
    $res = $conn->Execute('select * from pessoa '. $where2);

    $current = $_GET['page'] != "" ? $_GET['page'] : 0;
    $filtro = $_GET['filtro'] !="" ? '&filtro'.$_GET['filtro'] : "";

    $tpl->set('paginacao',paginacao($res->PO_RecordCount('pessoa',$where2),$current,'eleitores.php',$filtro));
    $tpl->Show('eleitores_table_foot');
}


if($_GET['a'] == "2"){

    $eleitor = new Pessoa();

    if($_POST['frmPassou'] == "OK"){

        if($eleitor->Load("cpf = '".str_replace(array('-','.'),'',$_GET['id'])."'")){

            $endereco = new Endereco();
            $endereco->Load('id_endereco='.$eleitor->id_endereco);

            $eleitor->nome = strtolower($_POST['nome']);
            $eleitor->titulo = $_POST['titulo'];

            $eleitor->rg  = $_POST['rg'];
            $eleitor->login = $_POST['login'];

            if(trim($_POST['senha']) != ""){
                $eleitor->senha = md5(trim($_POST['senha']));
            }

            $endereco->cep = str_replace('-', '',$_POST['cep']);
            $endereco->logradouro = $_POST['logradouro'];
            $endereco->numero = $_POST['numero'];
            $endereco->bairro = $_POST['bairro'];
            $endereco->cidade = $_POST['cidade'];
            $endereco->estado = $_POST['estado'];

            $conn->Execute('START TRANSACTION;');

            if($eleitor->Save() && $endereco->Save()){
                $conn->Execute('COMMIT;');
                $tpl->set('cadastro_sucesso', 'show-alerts');
            }
            else{
                $conn->Execute('ROLLBACK;');
                $tpl->set('gravar_err', 'show-alerts');
            }
        }

    }
    else{
        $eleitor->Load("cpf = '".$_GET['id']."'");
    }

    if($eleitor){

        $endereco = new Endereco();
        $endereco->Load('id_endereco='.$eleitor->id_endereco);
        $tpl->set('cpf',mask($eleitor->cpf,'###.###.###-##'));
        $tpl->set('nome',$eleitor->nome);
        $tpl->set('rg',$eleitor->rg);
        $tpl->set('titulo',$eleitor->titulo);
        $tpl->set('login',$eleitor->login);
        $tpl->set('cep',$endereco->cep);
        $tpl->set('logradouro',$endereco->logradouro);
        $tpl->set('numero',$endereco->numero);
        $tpl->set('bairro',$endereco->bairro);
        $tpl->set('cidade',$endereco->cidade);
        $tpl->set($endereco->estado,'selected');
        $tpl->Show('form_editar_eleitor');
    }
}

$tpl->Show('footer');
