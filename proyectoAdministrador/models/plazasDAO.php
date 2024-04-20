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

if (isset($_POST['agregar_plaza'])) {
    $nomPlaza=($_POST['nombre_plaza']);
    $sql='INSERT INTO Plazas(nomPlaza , idEstado) values(?, 1)';
    $sentencia=$conx->prepare($sql);//preparar sql para insertar valor
    $sentencia->execute([$nomPlaza]);//remplaza en values ? a el valor $plaza
}

if (isset($_GET['id'])){
    $id=$_GET['id'];
    $sql="DELETE FROM Plazas WHERE idPlaza=?";
    $sentencia=$conx->prepare($sql);
    $sentencia->execute([$id]);
}
if (isset($_POST['editar_plaza'])) {
    $idPlaza = $_POST['idPlaza'];
    $nomPlaza = $_POST['nombre_plaza'];
    $sql = 'UPDATE Plazas SET nomPlaza =? WHERE idPlaza =?';
    $sentencia = $conx->prepare($sql);
    $sentencia->execute([$nomPlaza, $idPlaza]);
}
?>