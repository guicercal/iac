<?php
/**
 * Created by PhpStorm.
 * User: Guilherme
 * Date: 15/11/14
 * Time: 16:23
 */

require_once('config.php');

session_destroy();
header('location: login.php');


