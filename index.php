<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 11/06/15
 * Time: 14:21
 */


require_once('config.php');
$tpl->Show('header');

//verificca se o eleitor já votou
if($_SESSION['user']->votou == null || $_SESSION['user']->votou == 'f'){
    $tpl->Show('urna');

}
else{
    $tpl->Show('voce_ja_votou');
}
$tpl->Show('footer');


