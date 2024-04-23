<?php   
    include_once 'php/config.php';
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"><!--Codificacion-->
        <meta name="viewport" 
        content="width=device-width, initial-scale=1.0"> <!-- el citio es adaptable-->
        <meta name="robots" content="index, follow">
        <meta name="theme-color" content="#09f"><!---color de la pagina web externa -->
        <link rel="icon" href="<?php echo SERVERURL; ?>Views/img/logo.jpg">
        <link rel="stylesheet" href="<?php echo SERVERURL; ?>/Views/css/navegacionPrincipal.css">
        <?php
        include 'links.php'; 
        ?>
        <title>Gastro web</title>
    </head>
    <body>
        <?php 
        include_once 'Views/modules/navegacionPrincipal.php';
        $controlador = new Controlador();
        $controlador->enlacesPaginaControlador();
        ?>
    </body>
</html>