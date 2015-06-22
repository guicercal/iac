<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 20/06/15
 * Time: 17:02
 */

class Eleicoes extends ADODB_Active_Record {
    var $_table = 'eleicoes';

    public function getQtdVagasVereador(){
        $cargos = new Cargos();
        $cargos->Load('id_cargo=1');

        return $cargos->qtd_vagas;
    }

    public function getQtdVagasDeputado(){
        $cargos = new Cargos();
        $cargos->Load('id_cargo=2');

        return $cargos->qtd_vagas;
    }

    public function getQtdVagasPrefeito(){
        $cargos = new Cargos();
        $cargos->Load('id_cargo=3');

        return $cargos->qtd_vagas;
    }

    public function getComboCargos($nome){
        global $conn;

        $res = $conn->Execute('SELECT * FROM cargos');

        $html = "<select name=\"$nome\" required>";

        while(!$res->EOF){
            $html .= "<option value=\"".$res->fields('id_cargo')."\">".$res->fields('nome')."</option>";
            $res->MoveNext();
        }
        return $html .= "</select>";
    }

    public function setQtdVagasVereador($qtd){
        $cargos = new Cargos();
        $cargos->Load('id_cargo=1');
        $cargos->qtd_vagas = $qtd;
        $cargos->Save();
    }

    public function setQtdVagasDeputado($qtd){
        $cargos = new Cargos();
        $cargos->Load('id_cargo=2');
        $cargos->qtd_vagas = $qtd;
        $cargos->Save();
    }

}