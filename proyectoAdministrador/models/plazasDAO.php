<?php
try {
    $conx = new PDO("mysql:host=localhost;dbname=gastroweb", "root", "");
    // Configuración de PDO para que lance excepciones en errores
    $conx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta SQL para seleccionar todas las filas de la tabla plazas
    $sql = "SELECT * FROM plazas";
    
    // Preparar y ejecutar la consulta
    $resultados = $conx->query($sql);

    // Opcionalmente, podrías procesar los resultados aquí, o devolverlos para su procesamiento en otro lugar
} catch (PDOException $e) {
    // Manejar errores de conexión
    echo "Error de conexión a la base de datos: " . $e->getMessage();
}
?>