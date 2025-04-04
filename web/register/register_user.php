<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
// Define variables and initialize with empty values
if (!empty($_POST) && $_SERVER["REQUEST_METHOD"] === 'POST') {
    $username = htmlspecialchars($_POST['username']);
    $password = htmlspecialchars($_POST['password']);
    if(username_exists($username)) {
        http_response_code(400);
        die("username already exists");
    }
    $query = "INSERT INTO `players` (username,points,all_wins,all_games_played,kills,deaths,music_pack_id,active_skin_id) VALUES (?,0,0,0,0,0,NULL,NULL);";
    $result = $conn->prepare($query);
    $result->bind_param("s", $username);
    $result->execute();
    $result = $conn->prepare("INSERT INTO `player_login` (username, password) VALUES(?,?);");
    $result->bind_param("ss", $username, $password);
    $result->execute();
    http_response_code(201);
    $_SESSION['username'] = $username;
} else {
    http_response_code(400);
}