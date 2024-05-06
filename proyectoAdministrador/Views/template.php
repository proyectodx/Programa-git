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
        <script src="<?php echo SERVERURL; ?>Views/js/config.js"></script><!------ Para que funcione el SERVERURL en todos los js  ------->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js" integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-numeric@1.5.0/jquery.numeric.min.js"></script>
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

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.js"></script>
    </body>
</html>