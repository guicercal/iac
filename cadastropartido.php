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
        $where .= "WHERE UPPER(nome) like '%".strtoupper($_GET['filtro'])."%' OR sigla like '%".strtoupper($_GET['filtro'])."%'";
        $where2 .= "UPPER(nome) like '%".strtoupper($_GET['filtro'])."%' OR sigla like '%".strtoupper($_GET['filtro'])."%'";
    }

    $SQL = "SELECT * FROM partidos $where LIMIT 10 $page";

    $res = $conn->Execute($SQL);


    $tpl->Show('partidos_table_head');

    if($res->EOF){
        $tpl->Show('partidos_table_linha_eof');
    }
    else{
        while(!$res->EOF){

            $tpl->set('nome',$res->fields('nome'));
            $tpl->set('sigla',$res->fields('sigla'));
            $tpl->set('numero',$res->fields('numero'));

            $tpl->set('link_candidatos' ,'cadastroCandidato.php?a=1&partido='.$res->fields('id_partido'));
            $tpl->set('link_editar' ,'cadastropartido.php?a=3&id='.$res->fields('id_partido'));
            $tpl->set('link_excluir','cadastropartido.php?a=4&id='.$res->fields('id_partido'));
            $tpl->Show('partidos_table_linha');
            $res->MoveNext();
        }

        $current = $_GET['page'] != "" ? $_GET['page'] : 0;
        $filtro = $_GET['filtro'] !="" ? '&filtro'.$_GET['filtro'] : "";

        $res = $conn->Execute("select * from partidos $where");
        $tpl->set('paginacao',paginacao($res->PO_RecordCount('partidos',$where2),$current,'cadastropartido.php',$filtro));
    }


    $tpl->Show('partidos_table_foot');
}

if($_GET['a'] == "2"){

    if($_POST['frmPassou'] != "OK"){
        $tpl->set('nome_acao','Cadastrar Novo ');
        $tpl->set('action','cadastropartido.php?a=2');
        $tpl->Show('form_cadastro_partido');
    }
    else {
        $foto = uploadFoto();

        if($foto != false){

            $conn->Execute('START TRANSACTION;');
            //criação partido
            $endereco = new Endereco();
            $endereco->id_endereco = $conn->nextId('endereco_id_endereco_seq');
            $endereco->cep = str_replace('-', '', $_POST['cep']);
            $endereco->logradouro = $_POST['logradouro'];
            $endereco->numero = $_POST['numero_end'];
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
                $partido->foto = $foto;
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
        else{
            var_dump("falha foto");
        }


    }
}

//editar cadastro do partido
if($_GET['a'] == '3'){

    $partido = new Partido();

    if($_POST['frmPassou'] == "OK"){
        //var_dump($_POST);
        if($partido->Load("id_partido = ".$_GET['id_partido'])){

            $endereco = new Endereco();
            $endereco->Load('id_endereco='.$partido->id_endereco);

            $partido->nome = strtolower($_POST['nome']);
            $partido->presidente = $_POST['presidente'];
            $partido->numero = $_POST['numeroPartido'];
            $partido->estado = $_POST['estado'];
            $partido->sigla = $_POST['sigla'];
            $partido->deferimento = $_POST['deferimento'];
            $partido->coligacao = $_POST['coligacao'];
            if($_FILES['foto']['name'] != ""){ $partido->foto = (string) uploadFoto();}
            $endereco->cep = str_replace('-', '',$_POST['cep']);
            $endereco->logradouro = $_POST['logradouro'];
            $endereco->numero = $_POST['numero_end'];
            $endereco->bairro = $_POST['bairro'];
            $endereco->cidade = $_POST['cidade'];
            $endereco->estado = $_POST['estado'];

            $conn->Execute('START TRANSACTION;');

            if($partido->Save() && $endereco->Save()){
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
        $partido->Load("id_partido = '".$_GET['id']."'");
    }

    if($partido){
        $tpl->set('nome_acao','Editar cadastro de ');
        $tpl->set('action','cadastropartido.php?a=3&id_partido='.$partido->id_partido);
        $endereco = new Endereco();
        $endereco->Load('id_endereco='.$partido->id_endereco);
        $tpl->set('nome',$partido->nome);
        $tpl->set('presidente',$partido->presidente);
        $tpl->set('numero',$partido->numero);
        $tpl->set('estado',$partido->estado);
        $tpl->set('sigla',$partido->sigla);
        $tpl->set('coligacao',$partido->coligacao);
        $tpl->set('deferimento',$partido->deferimento);
        $tpl->set('cep',$endereco->cep);
        $tpl->set('logradouro',$endereco->logradouro);
        $tpl->set('numero_end',$endereco->numero);
        $tpl->set('bairro',$endereco->bairro);
        $tpl->set('cidade',$endereco->cidade);
        $tpl->set($endereco->estado,'selected');
        $tpl->Show('form_cadastro_partido');
    }
    


}
if($_GET['a'] == "4"){
    $partido = new Partido();
    $partido->Load("id_partido = '".$_GET['id']."'");
    $endereco = new Endereco();
    $endereco->Load('id_endereco='.$partido->id_endereco);

    $partido->Delete();
    $endereco->Delete();

    header('Location: cadastropartido.php?a=1');

}
$tpl->Show('footer');
