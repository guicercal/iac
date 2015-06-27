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
                $tpl->set('numero',$res->fields('numero'));

                $tpl->set('link_editar','cadastroCandidato.php?a=3&id='.$res->fields('id_candidato'));
                $tpl->set('link_excluir','cadastroCandidato.php?a=4&id='.$res->fields('id_candidato'));
                $tpl->Show('candidatos_table_linha');
                $res->MoveNext();
            }

            $res = $conn->Execute('select * from pessoa '. $where2);

            $current = $_GET['page'] != "" ? $_GET['page'] : 0;
            $filtro = $_GET['filtro'] !="" ? '&filtro'.$_GET['filtro'] : "";
            $res = $conn->Execute("select * from pessoa $where");
            $tpl->set('paginacao',paginacao($res->PO_RecordCount('pessoa',$where2),$current,'eleitores.php',$filtro));
        }
        $tpl->set('id_partido',$partido->id_partido);
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
    $partido = new Partido();


    //apresenta o formulário
    if($_POST['frmPassou'] != "OK"){

        if($partido->Load('id_partido = ' . $_GET['id_partido']) ){
            $tpl->set('id_partido',$_GET['id_partido']);
            $tpl->set('nome_partido',$partido->nome);
            $tpl->set('numero_partido',$partido->numero);
            $tpl->set('sigla_partido',$partido->sigla);
            $tpl->Show('form_candidato');
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

    //grava o novo candidato
    else {
        if($partido->Load('id_partido = ' . $_POST['id_partido'])){
            $candidato = new Candidato();

            //verifica se ja existe algum candidato cadastrado com o mesmo cpf
            if ($candidato->load("cpf ='" . str_replace(array('.', '-'), '', $_POST['cpf']) . "'")) {
                ?>
                <script type="text/javascript">
                    alert("Não foi possivel concluir a operação! cpf já cadastrado como candidato! 1 ");
                    window.history.go(-1);
                </script>
            <?php
            }

            //caso não haja nenhum candidato cadastrado com o mesmo cpf
            else{

                $foto = uploadFoto();

                $conn->Execute('START TRANSACTION;');

                $pessoa = new Pessoa();
                if(!$pessoa->load("cpf ='" . str_replace(array('.', '-'), '', $_POST['cpf']) . "'")){
                    //criação endereço
                    $endereco = new Endereco();
                    $endereco->id_endereco = $conn->nextId('endereco_id_endereco_seq');
                    $endereco->cep = str_replace('-', '', $_POST['cep']);
                    $endereco->logradouro = $_POST['logradouro'];
                    $endereco->numero = $_POST['numero'];
                    $endereco->bairro = $_POST['bairro'];
                    $endereco->cidade = $_POST['cidade'];
                    $endereco->estado = $_POST['estado'];

                    if($endereco->Save()){
                        //criação pessoa

                        $pessoa->cpf = str_replace(array('.', '-'), '', $_POST['cpf']);
                        $pessoa->nome = strtolower($_POST['nome']);
                        $pessoa->titulo = $_POST['titulo'];

                        $pessoa->rg = $_POST['rg'];
                        $pessoa->login = $_POST['login'];
                        $pessoa->senha = md5($_POST['senha']);

                        $pessoa->id_endereco = $endereco->id_endereco;

                        if ($pessoa->Save()) {
                            //criação de candidato
                            $candidato = new Candidato();
                            $candidato->id_candidato = $conn->nextId('candidato_id_candidato_seq');
                            $candidato->id_partido = $_POST['id_partido'];
                            $candidato->numero = $_POST['numeroCandidato'];
                            $candidato->coligacao = $_POST['coligacao'];
                            $candidato->nome_fantasia = $_POST['nomeFantasia'];
                            $candidato->id_cargo = $_POST['cargo'];
                            $candidato->cpf = $pessoa->cpf;
                            $candidato->foto = $foto;

                            if ($candidato->Save()) {

                                $conn->Execute('COMMIT;');

                                ?>
                                <script type="text/javascript">
                                    alert("Operação realizada com sucesso!");

                                </script>
                                <?php

                                header('Location: cadastroCandidato.php?a=1&partido='.$candidato->id_partido);
                            }
                            else{
                                $conn->Execute('ROLLBACK;');
                                ?>
                                <script type="text/javascript">
                                    alert("Não foi possivel concluir a operação! por favor contato o admin erro 1! ");
                                    //window.history.go(-1);
                                </script>
                            <?php
                            }

                        }
                        else {
                            $conn->Execute('ROLLBACK;');
                            ?>
                            <script type="text/javascript">
                                alert("Não foi possivel concluir a operação! por favor contate o admin erro 2! ");
                                //window.history.go(-1);
                            </script>
                        <?php
                        }

                    } else {
                        $conn->Execute('ROLLBACK;');
                        ?>
                        <script type="text/javascript">
                            alert("Não foi possivel concluir a operação! erro 3 ");
                            window.history.go(-1);
                        </script>
                    <?php
                    }

                }
                else{

                    //criação de candidato
                    $candidato = new Candidato();
                    $candidato->id_candidato = $conn->nextId('candidato_id_candidato_seq');
                    $candidato->id_partido = $_POST['id_partido'];
                    $candidato->numero = $_POST['numeroCandidato'];
                    $candidato->coligacao = $_POST['coligacao'];
                    $candidato->nome_fantasia = $_POST['nomeFantasia'];
                    $candidato->id_cargo = $_POST['cargo'];
                    $candidato->cpf = $pessoa->cpf;
                    $candidato->foto = $foto;

                    if ($candidato->Save()) {

                        $conn->Execute('COMMIT;');
                        ?>
                        <script type="text/javascript">
                            alert("Operação realizada com sucesso!");

                        </script>
                        <?php

                        header('Location: cadastroCandidato.php?a=1&partido='.$candidato->id_partido);
                    }
                    else{
                        $conn->Execute('ROLLBACK;');
                        ?>
                        <script type="text/javascript">
                            alert("Não foi possivel concluir a operação! cpf já cadastrado como candidato! 2 ");
                            //window.history.go(-1);
                        </script>
                    <?php
                    }
                }
            }
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

        if($candidato->Load("id_candidato = ".$_POST['id_candidato'])){

            if($_FILES['foto']['name'] != ""){
                $foto = uploadFoto();

                if($foto != false){
                    $candidato->numero = $_POST['numeroCandidato'];
                    $candidato->coligacao = $_POST['coligacao'];
                    $candidato->nome_fantasia = $_POST['nomeFantasia'];
                    $candidato->foto = $foto;

                    $conn->Execute('START TRANSACTION;');

                    if($candidato->Save()){
                        $conn->Execute('COMMIT;');
                        $tpl->Show('form_editar_candidato', 'show-alerts');
                    }
                    else{
                        $conn->Execute('ROLLBACK;');
                        $tpl->Show('gravar_err', 'show-alerts');
                    }
                }
            }
            else{

                $candidato->numero = $_POST['numeroCandidato'];
                $candidato->coligacao = $_POST['coligacao'];
                $candidato->nome_fantasia = $_POST['nomeFantasia'];

                $conn->Execute('START TRANSACTION;');

                if($candidato->Save()){
                    $conn->Execute('COMMIT;');
                    ?>
                        <script type="text/javascript">
                            alert("Operação realizada com sucesso!");

                        </script>
                    <?php

                    header('Location: cadastroCandidato.php?a=1&partido='.$candidato->id_partido);
                }
                else{
                    $conn->Execute('ROLLBACK;');
                    ?>
                        <script type="text/javascript">
                            alert("Ocorreu um erro ao gravar!");
                            window.history.go(-1);
                        </script>
                    <?php
                }

            }
        }
        else{
            ?>
                <script type="text/javascript">
                    alert("Candidato inexistente!");
                    window.history.go(-1);
                </script>
            <?php
        }

    }
    else{
        if($candidato->Load("id_candidato = ".$_GET['id'])){

            $eleitor = new Pessoa();
            $eleitor->Load("cpf = '".$candidato->cpf."'");

            $partido = new Partido();
            if($partido->Load('id_partido ='  . $candidato->id_partido) ){


                $endereco = new Endereco();
                $endereco->Load('id_endereco='.$eleitor->id_endereco);
                $tpl->set('cpf',mask($eleitor->cpf,'###.###.###-##'));
                $tpl->set('nome',$eleitor->nome);
                $tpl->set('rg',$eleitor->rg);
                $tpl->set('titulo',$eleitor->titulo);
                $tpl->set('login',$eleitor->login);
                $tpl->set('cep',$endereco->cep);
                $tpl->set('logradouro',$endereco->logradouro);
                $tpl->set('numero_end',$endereco->numero);
                $tpl->set('bairro',$endereco->bairro);
                $tpl->set('cidade',$endereco->cidade);
                $tpl->set($endereco->estado,'selected');

                $tpl->set('nome_partido',$partido->nome);
                $tpl->set('sigla_partido',$partido->sigla);

                $tpl->set('id_partido',$candidato->id_partido);
                $tpl->set('id_candidato',$candidato->id_candidato);
                $tpl->set('numero',$candidato->numero);
                $tpl->set('numero_partido',$partido->numero);
                $tpl->set('nomeFantasia',$candidato->nome_fantasia);
                $tpl->set('cargo_'.$candidato->id_cargo,'selected');
                $tpl->Show('form_editar_candidato');

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
        else{
            ?>
            <script type="text/javascript">
                alert("Candidato inexistente!");
                window.history.go(-1);
            </script>
        <?php
        }

    }




}



//======================================================================================================================
$tpl->Show('footer');
//======================================================================================================================