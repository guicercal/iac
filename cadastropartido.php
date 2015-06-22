<?php
/**
 * Created by PhpStorm.
 * User: Vinicius
 * Date: 19/06/2015
 * Time: 18:01
 */

require_once('config.php');

$tpl->Show('header');

if($_POST['frmPassou'] != "OK"){
    $tpl->Show('form_cadastro_partido');
}
else {
    $conn->Execute('START TRANSACTION;');
    //criação partido
    $partido = new Partido();
    $partido->id_partido = $conn->nextId('partidos_id_partido_seq');
    $partido->nome = $_POST['nome'];
    $partido->numero = $_POST['numero'];
    $partido->estado = $_POST['estado'];
    $partido->sigla = $_POST['sigla'];
    $partido->deferimento = $_POST['deferimento'];
    $partido->id_endereco = $endereco->id_endereco;
    if($partido->Save()){
        $tpl->set('cadastro_sucesso', 'show-alerts');
        $tpl->Show('form_login');
        $conn->Execute('COMMIT;');

    }else{
        $conn->Execute('ROLLBACK;');
        header("location:javascript://alert('Não foi possível concluir esta operação. Por favor contate o administrador.');history.go(-1)");
    }

}

$tpl->Show('footer');