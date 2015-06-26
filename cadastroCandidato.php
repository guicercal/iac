<?php
/**
 * Created by PhpStorm.
 * User: ANDRE
 * Date: 19/06/2015
 * Time: 18:00
 */

require_once('config.php');


if($_GET['verCandidato'] != ''){
    $retorno = array();
    $candidato = new Candidato();
    $res = $candidato->load("cpf ='".str_replace(array('.','-'),'',$_POST['cpf'])."'");

        if($res) {
            $retorno['cod']=3;

        }else{
            $pessoa = new Pessoa();
            $res = $pessoa->load("cpf ='".str_replace(array('.','-'),'',$_POST['cpf'])."'");
            if($res){
                $pes = get_object_vars($pessoa);
                $endereco = new Endereco();
                $endereco->load("id_endereco=".$pes['id_endereco']);
                $pes['endereco'] = get_object_vars($endereco);
                $retorno['cod']=2;
                $retorno['pessoa']= $pes ;
            }else{
                $retorno['cod']=1;
            }
        }

    echo json_encode($retorno);
    exit;
}
//======================================================================================================================
$tpl->Show('header');
$tpl->set('menu_partidos_active','active');
$tpl->Show('menu_principal');
//======================================================================================================================


if($_GET['a'] == "1" || $_GET["a"] == ""){
    $partido = new Partido();
    if($partido->Load('id_partido = ' . $_GET['partido'])){
        $where = "";
        $where2 = "";
        $page = "";
        $tpl->set('nome_partido',$partido->nome);
        $tpl->set('sigla_partido',$partido->sigla);
        if($_GET['page'] != ""){
            $page = "OFFSET " . ($_GET['page']-1) * 10;
        }

        if($_GET['filtro'] != ""){
            $where .= "UPPER(nome) like '%".strtoupper($_GET['filtro'])."%' OR cpf like '%".str_replace(array('-','.'),'',$_GET['filtro'])."%'";
        }

        $SQL = "SELECT a.*, b.nome FROM candidato a ";
        $SQL .= "INNER JOIN pessoa b ON b.cpf = a.cpf ";
        $SQL.= "WHERE id_partido = ".$_GET['partido']."$where LIMIT 10 $page";

        $res = $conn->Execute($SQL);

        $tpl->Show('candidatos_table_head');

        if($res->EOF){
            $tpl->Show('candidatos_table_linha_eof');
        }
        else{

            while(!$res->EOF){
                $tpl->set('nome',$res->fields('nome'));
                $tpl->set('nome_fantasia',$res->fields('nome_fantasia'));

                $tpl->set('link_editar','eleitores.php?a=2&id='.$res->fields('cpf'));
                $tpl->set('link_excluir','eleitores.php?a=3&id='.$res->fields('cpf'));
                $tpl->Show('eleitores_table_linha');
                $res->MoveNext();
            }

            $res = $conn->Execute('select * from pessoa '. $where2);

            $current = $_GET['page'] != "" ? $_GET['page'] : 0;
            $filtro = $_GET['filtro'] !="" ? '&filtro'.$_GET['filtro'] : "";
            $res = $conn->Execute("select * from pessoa $where");
            $tpl->set('paginacao',paginacao($res->PO_RecordCount('pessoa',$where2),$current,'eleitores.php',$filtro));
        }

        $tpl->Show('candidatos_table_foot');
    }
    else{
        ?>
            <script type="text/javascript">
                alert("Partido inexistente!");
                window.history.go(-1);
            </script>
        <?php
    }
}


//cadastrarnovo candidato
if($_GET['a'] == "2"){
    if($_POST['frmPassou'] != "OK"){
        $tpl->set('id_partido',$_GET);
        $tpl->Show('form_candidato');

    } else {
        $candidato = new Candidato();
        $res = $candidato->load("cpf ='" . str_replace(array('.', '-'), '', $_POST['cpf']) . "'");
        $pessoa = new Pessoa();
        $resPessoa = $pessoa->load("cpf ='" . str_replace(array('.', '-'), '', $_POST['cpf']) . "'");

        if ($res) {
            header("location:javascript://alert('Não foi possível concluir esta operação. Candidato ja existente. Caso duvidas contate o administrador.');history.go(-1)");
        } else if ($resPessoa) {
            $conn->Execute('START TRANSACTION;');

            //criação de candidato
            $candidato = new Candidato();
            $candidato->id_partido = ($_POST['id_partido']);
            $candidato->numeroCandidato = ($_POST['numeroCandidato']);
            $candidato->coligacao = ($_POST['coligacao']);
            $candidato->nomeFantasia = ($_POST['nomeFantasia']);
            $candidato->cargo = ($_POST['cargo']);


            if ($candidato->Save()) {
                $tpl->set('cadastro_sucesso', 'show-alerts');
                $tpl->Show('form_login');
                $conn->Execute('COMMIT;');
            } else {
                $conn->Execute('ROLLBACK;');
                header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
            }
        } else {

            $conn->Execute('START TRANSACTION;');
            //criação endereço
            $endereco = new Endereco();
            $endereco->id_endereco = $conn->nextId('endereco_id_endereco_seq');
            $endereco->cep = str_replace('-', '', $_POST['cep']);
            $endereco->logradouro = $_POST['logradouro'];
            $endereco->numero = $_POST['numero'];
            $endereco->bairro = $_POST['bairro'];
            $endereco->cidade = $_POST['cidade'];
            $endereco->estado = $_POST['estado'];

            if ($endereco->Save()) {
                //criação pessoa
                $eleitor = new Pessoa();
                $eleitor->cpf = str_replace(array('.', '-'), '', $_POST['cpf']);
                $eleitor->nome = strtolower($_POST['nome']);
                $eleitor->titulo = $_POST['titulo'];

                $eleitor->rg = $_POST['rg'];
                $eleitor->login = $_POST['login'];
                $eleitor->senha = md5($_POST['senha']);

                $eleitor->id_endereco = $endereco->id_endereco;

                if ($eleitor->Save()) {
                    //criação de candidato
                    $candidato = new Candidato();
                    $candidato->partido = ($_POST['partido']);
                    $candidato->numeroCandidato = ($_POST['numeroCandidato']);
                    $candidato->coligacao = ($_POST['coligacao']);
                    $candidato->nomeFantasia = ($_POST['nomeFantasia']);
                    $candidato->cargo = ($_POST['cargo']);

                } else {
                    $conn->Execute('ROLLBACK;');
                    header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
                }

                if ($candidato->Save()) {
                    $tpl->set('cadastro_sucesso', 'show-alerts');
                    $tpl->Show('form_login');
                    $conn->Execute('COMMIT;');


                } else {
                    $conn->Execute('ROLLBACK;');
                    header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
                }

            } else {
                $conn->Execute('ROLLBACK;');
            }
        }
    }
}


//provavel excluir
if($_GET['a'] == "4"){
    $candidato = new Candidato();
    $candidato->Load("id_candidato = '".$_GET['id']."'");


    $cadidato->Delete();


    header('Location: cadastroCandidato.php?a=1');

}


// provavel editar
if($_GET['a'] == '3'){


    $candidato = new Candidato();

    if($_POST['frmPassou'] == "OK"){

        if($candidato->Load("id_candidato = '",$_GET['id'])."'"){

            $candidato->id_partido = ($_POST['id_partido']);
            $candidato->numeroCandidato = ($_POST['numeroCandidato']);
            $candidato->coligacao = ($_POST['coligacao']);
            $candidato->nomeFantasia = ($_POST['nomeFantasia']);
            $candidato->cargo = ($_POST['cargo']);


            $conn->Execute('START TRANSACTION;');

            if($candidato->Save()){
                $conn->Execute('COMMIT;');
                $tpl->set('form_candidato', 'show-alerts');
            }
            else{
                $conn->Execute('ROLLBACK;');
                $tpl->set('gravar_err', 'show-alerts');
            }
        }

    }
    else{
        $candidato->Load("id_candidato = '".$_GET['id']."'");
    }

    if($candidato){

        $candidato->id_partido = ($_POST['id_partido']);
        $candidato->numeroCandidato = ($_POST['numeroCandidato']);
        $candidato->coligacao = ($_POST['coligacao']);
        $candidato->nomeFantasia = ($_POST['nomeFantasia']);
        $candidato->cargo = ($_POST['cargo']);


        $tpl->set('id_partido',$candidato->id_partido);
        $tpl->set('numeroCandidato',$candidato->numeroCandidato);
        $tpl->set('coligacao',$candidato->coligacao);
        $tpl->set('nomeFantasia',$candidato->nomeFantasia);
        $tpl->set('cargo',$candidato->cargo);
        $tpl->Show('form_cadastro_partido');
    }



}



//======================================================================================================================
$tpl->Show('footer');
//======================================================================================================================