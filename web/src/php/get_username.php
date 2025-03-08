<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
//Returns the logged in player's username
if (is_logged_in()) {
    http_response_code(200);
    echo $_SESSION['username'];
} else {
    echo "";
}