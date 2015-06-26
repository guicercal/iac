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
        $eleicao->dataInicio = ($_POST['data_inicio']);
        $eleicao->dataTermino = ($_POST['data_termino']);
        $eleicao->horaInicio = ($_POST['hora_inicio']);
        $eleicao->horaTermino = ($_POST['hora_termino']);
        $eleicao->vereadores = ($_POST['qtd_vagas_vereador']);
        $eleicao->deputados = ($_POST['qtd_vagas_deputado']);
        $eleicao->prefeito = ($_POST['qtd_vagas_prefeito']);


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
            $eleicao->dataInicio = ($_POST['data_inicio']);
            $eleicao->dataTermino = ($_POST['data_termino']);
            $eleicao->horaInicio = ($_POST['horario_inicio']);
            $eleicao->horaTermino = ($_POST['horario_termino']);
            $eleicao->vereadores = ($_POST['qtd_vagas_vereador']);
            $eleicao->deputados = ($_POST['qtd_vagas_deputado']);
            $eleicao->prefeito = ($_POST['qtd_vagas_prefeito']);


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
        $eleicao->dataInicio = ($_POST['data_inicio']);
        $eleicao->dataTermino = ($_POST['data_termino']);
        $eleicao->horarioInicio = ($_POST['horario_inicio']);
        $eleicao->horarioTermino = ($_POST['horario_termino']);
        $eleicao->vereadores = ($_POST['qtd_vagas_vereador']);
        $eleicao->deputados = ($_POST['qtd_vagas_deputado']);
        $eleicao->prefeito = ($_POST['qtd_vagas_prefeito']);


        $tpl->set('id_eleicao',$eleicao->id_eleicao);
        $tpl->set('dataInicio',$eleicao->data_inicio);
        $tpl->set('dataTermino',$eleicao->data_termino);
        $tpl->set('horaInicio',$eleicao->hora_inicio);
        $tpl->set('horaTErmino',$eleicao->hora_temrino);
        $tpl->set('vereadores',$eleicao->qtd_vagas_vereador);
        $tpl->set('deputados',$eleicao->qtd_vagas_deputado);
        $tpl->set('prefeito',$eleicao->qtd_vagas_prefeito);
        $tpl->Show('form_configuracoes');
    }



}



//======================================================================================================================
$tpl->Show('footer');
//======================================================================================================================