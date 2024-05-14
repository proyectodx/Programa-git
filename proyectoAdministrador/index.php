<?php 
/* CONTROLADORES */
include_once 'Controllers/Controlador.php';
include_once 'Controllers/PlazaControlador.php';
include_once 'Controllers/ValidarDatosControlador.php';

/* MODELO */
include_once 'models/EnlacesPaginasModelo.php';
include_once 'models/plaza.php';
include_once 'models/PlazaDAO.php';

$controlador = new Controlador();
$controlador->cargarTemplate();
?>
