<?php

class Conexion {

    public function conectar() {
        //try {
            $conx = new PDO("mysql:host=localhost;dbname=gastroweb", "root", "");
            // Si la conexión se realizó correctamente, aquí podrías realizar más operaciones si es necesario
            return $conx;
       // } catch (PDOException $e) {
            // Si la conexión falla, se lanzará una excepción
        //    throw new Exception("Error de conexión a la base de datos: " . $e->getMessage());
       // }
        
//        var_dump($pdo);
     }
}
