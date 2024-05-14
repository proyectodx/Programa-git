<?php

if (!file_exists('config/Conexion.php')) {
    require_once '../../../config/Conexion.php';
} else {
    require_once 'config/Conexion.php';
}


class PlazaDAO extendS Conexion{

    public function registrarPlazasModelo(Plaza $plaza){
        
        $nombre = $plaza->getNomPlaza();

        $sql = "INSERT INTO Plazas 
        (nomPlaza, idEstado) values(:nombre, 1)";
        
        try {
            $conexion = new Conexion();//crear intancia de la clase conexion
            //llamar el metodo conectar del objeto conexion esto devuleve el objeto conexion a la baasae de datos
            //de lo anterior de llame se llama al método prepare($sql)
            $stmt = $conexion->conectar()->prepare($sql);
            $stmt->bindParam(":nombre", $nombre, PDO::PARAM_STR);//Vicula el parametro ":nombre" de la consulta preparada con la variable nombre
            if ($stmt->execute()) {//si tiene exito ejecultar la consulta
                $conexion = null; //cerrar conexion
                $stmt = null; //libera los recursos del objeto de la consulta
                return "success"; // la consulta se realizó exitosamente
            } else {
                return "error"; // la consulta se fallo devolver "error"
            }
        
        } catch (Exception $e) { // se captura cualquier error que se genere lo siguinte
            print "<p>Fallo<p>";
        }

    }

    public function listarPlazaModelo(){
        $sql = "SELECT * FROM Plazas";

        try {
            $conexion = new Conexion();
            $stmt = $conexion->conectar()->prepare($sql);
            $stmt -> execute();
            return $stmt->fetchAll();
            $conexion = null;
            $stmt=null;
        } catch (Exception $e) {
            echo $e->getTraceAsString();
        }
    }

    public function listarPlazaByControlador($id) {
        $sql = "SELECT * from Plazas where idPlaza = :id";
        try{
            $conexion = new Conexion();
            $stmt = $conexion->conectar()->prepare($sql);
            $stmt -> bindParam(':id',$id, PDO::PARAM_INT);
            $stmt -> execute();
            return $stmt->fetchAll();
            $conexion = null;
            $stmt=null;
        } catch (Exception $e){
            echo $e->getTraceAsString();
        }
    }

    public function actualizarPlazaModelo($datos){
        $sql = "UPDATE nombre_plaza set nomPlaza = :nombre,"
        . "WHERE idPlaza = :id";
        
        try {
            $conexion = new Conexion();
            $stmt = $conexion->conectar()->prepare($sql);
            $stmt->bindParam(":nombre", $datos['nombre'], PDO::PARAM_STR);
            $stmt->bindParam("id", $datos['idPlaza'], PDO::PARAM_INT);
            $stmt->execute();
            if ($stmt->rowCount() > 0) {
                $conexion=null;
                $stmt=null;
                return "surccess";
            } else {
                return "error";
            }
            
        } catch (Exception $e) {
            print "<p> FALLO </p>";
        }
    }
    
    public function validarPlazaModelo($nombre){
        $sql = "SELECT idPlaza, nomPlaza FROM Plazas WHERE nomPlaza = :nombre";
        try {
            $conexion = new Conexion();
            $stmt = $conexion->conectar()->prepare($sql);
            $stmt -> bindParam(":nombre", $nombre, PDO::PARAM_STR);
            $stmt -> execute();
            return $stmt->fetch();
            $conexion = null;
            $stmt = null;
        } catch (Exception $e) {
            echo $e->getTraceAsString();
        }
    }

    public function eliminarPlazaModelo($id) {
        $sql1 = "SELECT count(*) as valor from Plazas";
        $sql2 = "DELETE FROM Plazas WHERE idPlaza = :id";
        try {
            $conexion = new Conexion();
            $stmt = $conexion->conectar()->prepare($sql1);
            if ($stmt->execute()) {
                $usuarios = $stmt->fetch();
            }
            if ($usuarios['valor'] > 1) {
                try {
                    $stmt = null;
                    $stmt = $conexion->conectar()->prepare($sql2);
                    $stmt->bindParam(":id", $id, PDO::PARAM_INT);
                    $stmt->execute();
                    if ($stmt->rowCount() > 0) {
                        return "success";
                        $conexion = null;
                        $stmt = null;
                    } else {
                        return "error";
                    }
                } catch (Exception $e) {
                    echo $e->getTraceAsString();
                }
            } else {
                return "error";
            }
        } catch (Exception $e) {
            echo $e->getTraceAsString();
        }
    }

    public function buscarPlazaModelo($datoBuscar) {
        $sql = "SELECT idPlaza, nomPlaza FROM plazas WHERE "
                . "nomPlaza like '%' :nombre '%'";
        try {
            $conexion = new Conexion();
            $stmt = $conexion->conectar()->prepare($sql);
            $stmt->bindParam(":nombre", $datoBuscar, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetchAll();
            $conexion = null;
            $stmt = null;
        } catch (Exception $ex) {
            
        }
    }
}

