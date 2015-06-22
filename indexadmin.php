<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 20/06/15
 * Time: 15:41
 */

require_once('config.php');

$eleicoes = new Eleicoes();
$eleicoes->Load('id_eleicao=1');

$tpl->Show('header');
$tpl->set('menu_home_active','active');
$tpl->Show('menu_principal');

if($_POST['frmPassou'] == "OK"){
    $eleicoes->data_inicio = $_POST['data_inicio'] . ' ' . $_POST['horario_inicio'] . ':00';
    $eleicoes->data_termino = $_POST['data_termino'] . ' ' . $_POST['horario_termino'] . ':00';
    $eleicoes->setQtdVagasVereador($_POST['qtd_vagas_vereador']);
    $eleicoes->setQtdVagasDeputado($_POST['qtd_vagas_deputado']);
    if($eleicoes->Save()){
        $tpl->set('config_ok','show-alerts');
    }
    else{
        $tpl->set('config_err','show-alerts');
    }
}

$inicio = explode(' ',$eleicoes->data_inicio);
$termino = explode(' ',$eleicoes->data_termino);

$tpl->set('data_inicio',$inicio[0]);
$tpl->set('horario_inicio',$inicio[1]);
$tpl->set('data_termino',$termino[0]);
$tpl->set('horario_termino',$termino[1]);
$tpl->set('qtd_vagas_vereador',$eleicoes->getQtdVagasVereador());
$tpl->set('qtd_vagas_deputado',$eleicoes->getQtdVagasDeputado());
$tpl->set('qtd_vagas_prefeito',$eleicoes->getQtdVagasPrefeito());

$tpl->Show('form_configuracoes');
$tpl->Show('footer');
