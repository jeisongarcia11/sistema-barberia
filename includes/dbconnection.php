<?php 
$con = mysqli_connect("localhost", "root", "", "bpmsdb");

if (!$con) {
    error_log("Error al conectar a la base de datos: " . mysqli_connect_error());
    die("Error de conexión. Intenta más tarde.");
}

mysqli_set_charset($con, "utf8");
?>
