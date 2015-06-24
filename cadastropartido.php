<?php
/**
 * Created by PhpStorm.
 * User: Vinicius
 * Date: 19/06/2015
 * Time: 18:01
 */

require_once('config.php');

$tpl->Show('header');
$tpl->set('menu_partidos_active','active');
$tpl->Show('menu_principal');


if($_GET['a'] == "1" || $_GET['a'] == ''){
    $where = "";
    $where2 = "";
    $page = "";
    if($_GET['page'] != "" ){
        $page = "OFFSET " . ($_GET['page']-1) * 10;
    }

    if($_GET['filtro'] != ""){
        $where .= "WHERE nome like '%".$_GET['filtro']."%' OR sigla like '%".$_GET['filtro']."%'";
        $where2 .= "nome like '%".$_GET['filtro']."%' OR sigla like '%".$_GET['filtro']."%'";
    }

    $SQL = "SELECT * FROM partidos $where LIMIT 10 $page";

    $res = $conn->Execute($SQL);


    $tpl->Show('partidos_table_head');

    if($res->EOF){
        $tpl->Show('partidos_table_linha_eof');
    }

    while(!$res->EOF){

        $tpl->set('nome',$res->fields('nome'));
        $tpl->set('sigla',$res->fields('sigla'));
        $tpl->set('numero',$res->fields('numero'));

        $tpl->set('link_editar','cadastropartido.php?a=3&id='.$res->fields('id_partido'));
        $tpl->set('link_excluir','cadastropartido.php?a=4&id='.$res->fields('id_partido'));
        $tpl->Show('partidos_table_linha');
        $res->MoveNext();
    }

    $current = $_GET['page'] != "" ? $_GET['page'] : 0;
    $filtro = $_GET['filtro'] !="" ? '&filtro'.$_GET['filtro'] : "";

    $res = $conn->Execute("select * from partidos $where2");
    $tpl->set('paginacao',paginacao($res->PO_RecordCount('partidos',$where2),$current,'cadastropartido.php',$filtro));
    $tpl->Show('partidos_table_foot');
}

if($_GET['a'] == "2"){

    if($_POST['frmPassou'] != "OK"){
        $tpl->Show('form_cadastro_partido');
    }
    else {
        $conn->Execute('START TRANSACTION;');
        //criação partido
        $endereco = new Endereco();
        $endereco->id_endereco = $conn->nextId('endereco_id_endereco_seq');
        $endereco->cep = str_replace('-', '', $_POST['cep']);
        $endereco->logradouro = $_POST['logradouro'];
        $endereco->numero = $_POST['numero'];
        $endereco->bairro = $_POST['bairro'];
        $endereco->cidade = $_POST['cidade'];
        $endereco->estado = $_POST['estado'];

        if($endereco->Save()){

        $partido = new Partido();
        $partido->id_partido = $conn->nextId('partidos_id_partido_seq');
        $partido->nome = $_POST['nome'];
        $partido->presidente = $_POST['presidente'];
        $partido->numero = $_POST['numeroPartido'];
        $partido->numeroPartido = $_POST['numeroPartido'];
        $partido->sigla = $_POST['sigla'];
        $partido->deferimento = $_POST['deferimento'];
        $partido->id_endereco = $endereco->id_endereco;
        }

        if($partido->Save()){
            $tpl->set('cadastro_sucesso', 'show-alerts');
            $tpl->Show('form_cadastro_partido');
            $conn->Execute('COMMIT;');

        }else{
            $conn->Execute('ROLLBACK;');
            //header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
        }

    }
}

//editar cadastro do partido
if($_GET['a'] == '3'){

}

$tpl->Show('footer');