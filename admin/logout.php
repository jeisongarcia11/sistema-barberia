<?php
session_start();

// Limpieza de todas las variables de sesión
$_SESSION = array();

// Eliminación de la cookie de sesión si se utiliza:
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Destrucción de la sesión
session_destroy();

// Redirección al inicio
header("Location: index.php");
exit();
?>
