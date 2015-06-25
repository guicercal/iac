<?php
/**
 * Created by PhpStorm.
 * User: Vinicius
 * Date: 25/06/2015
 * Time: 16:10
 */

require_once('config.php');


if($_GET['verEleicao'] != ''){
    $retorno = array();
    $eleicao = new Eleicoes();
    $res = $e->load("id ='",$_POST['id_eleicoes']."'");

    if($res) {
        $retorno['cod']=3;

    }else{
        $eleicao = new Eleicoes();
        $res = $eleicao->load("id ='",$_POST['cpf']."'");
        if($res){
            $pes = get_object_vars($eleicao);
            $eleicao = new Eleicoes();

            $retorno['cod']=2;
            $retorno['eleicao']= $pes ;
        }else{
            $retorno['cod']=1;
        }
    }

    echo json_encode($retorno);
    exit;
}
//======================================================================================================================
$tpl->Show('header');

//======================================================================================================================


$tpl->Show('menu_principal');

if($_POST['frmPassou'] != "OK"){
    $tpl->set('id_eleicao',$_GET);
    $tpl->Show('form_configuracoes');

} else {
    $eleicao = new Eleicoes();
    $res = $eleicao->load("id_eleicao ='", $_POST['id'] . "'");

    if ($res) {
        header("location:javascript://alert('Não foi possível concluir esta operação. Eleicao ja existente. Caso duvidas contate o administrador.');history.go(-1)");
    } else {
        $conn->Execute('START TRANSACTION;');

        //criação de candidato
        $eleicao = new Eleicoes();
        $eleicao->id_eleicao = ($_POST['id_eleicao']);
        $eleicao->dataInicio = ($_POST['dataInicio']);
        $eleicao->dataFim = ($_POST['dataFim']);
        $eleicao->horaInicio = ($_POST['horaInicio']);
        $eleicao->horaFim = ($_POST['horaFim']);
        $eleicao->vereadores = ($_POST['vereadores']);
        $eleicao->deputados = ($_POST['deputados']);
        $eleicao->prefeito = ($_POST['prefeito']);


        if ($eleicao->Save()) {
            $tpl->set('cadastro_sucesso', 'show-alerts');
            $tpl->Show('form_configuracoes');
            $conn->Execute('COMMIT;');
        } else {
            $conn->Execute('ROLLBACK;');
            header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
        }
    }

}
//provavel excluir
if($_GET['a'] == "4"){
    $eleicao = new Eleicoes();
    $eleicao->Load("id_eleicao = '".$_GET['id']."'");


    $eleicao->Delete();


    header('Location: cadastroEleicao.php?a=1');

}


// provavel editar
if($_GET['a'] == '3'){


    $eleicao = new Eleicoes();

    if($_POST['frmPassou'] == "OK"){

        if($c->Load("id_eleicao = '",$_GET['id'])."'"){

            $eleicao->id_eleicao = ($_POST['id_eleicao']);
            $eleicao->dataInicio = ($_POST['dataInicio']);
            $eleicao->dataFim = ($_POST['dataFim']);
            $eleicao->horaInicio = ($_POST['horaInicio']);
            $eleicao->horaFim = ($_POST['horaFim']);
            $eleicao->vereadores = ($_POST['vereadores']);
            $eleicao->deputados = ($_POST['deputados']);
            $eleicao->prefeito = ($_POST['prefeito']);


            $conn->Execute('START TRANSACTION;');

            if($candidato->Save()){
                $conn->Execute('COMMIT;');
                $tpl->set('form_configuracoes', 'show-alerts');
            }
            else{
                $conn->Execute('ROLLBACK;');
                $tpl->set('gravar_err', 'show-alerts');
            }
        }

    }
    else{
        $eleicao->Load("id_eleicao = '".$_GET['id']."'");
    }

    if($eleicao){

        $eleicao->id_eleicao = ($_POST['id_eleicao']);
        $eleicao->dataInicio = ($_POST['dataInicio']);
        $eleicao->dataFim = ($_POST['dataFim']);
        $eleicao->horaInicio = ($_POST['horaInicio']);
        $eleicao->horaFim = ($_POST['horaFim']);
        $eleicao->vereadores = ($_POST['vereadores']);
        $eleicao->deputados = ($_POST['deputados']);
        $eleicao->prefeito = ($_POST['prefeito']);


        $tpl->set('id_eleicao',$eleicao->id_eleicao);
        $tpl->set('dataInicio',$eleicao->dataInicio);
        $tpl->set('dataFim',$eleicao->dataFim);
        $tpl->set('horaInicio',$eleicao->horaInicio);
        $tpl->set('horaFim',$eleicao->horaFim);
        $tpl->set('vereadores',$eleicao->vereadores);
        $tpl->set('deputados',$eleicao->deputados);
        $tpl->set('prefeito',$eleicao->prefeito);
        $tpl->Show('form_configuracoes');
    }



}



//======================================================================================================================
$tpl->Show('footer');
//======================================================================================================================