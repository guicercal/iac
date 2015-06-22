<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 15/11/14
 * Time: 16:23
 */

require_once('config.php');

$_SESSION['_token']="";
$_SESSION['user']=null;
//session_destroy();
header('location: login.php');


