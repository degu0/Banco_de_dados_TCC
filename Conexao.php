<?php 

$hostname = "localhost";
$bancodedados = "localhost";
$usuario = "localhost";
$senha = "localhost";

$mysqli = new mysqli($hostname, $bancodedados, $usuario, $senha);
if ($mysqli->connect_errno) {
    echo "Falha ao conectar: {" .$mysqli->connect_errno . ") ". $mysqli->connect_errno;
}else 
    echo "Conectado!";
