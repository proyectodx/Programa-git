<?php
ob_start();
class plazaControlador {

    public function registrarPlazasControlador() {
        
        //validar datos

        $validarControlador = new ValidarDatosControlador();

        if(isset($_POST["nombre_plaza"])){

            $_SESSION["nombre_plaza"] = $_POST["nombre_plaza"];

            if ($validarControlador->validarNombrePlaza($_POST['nombre_plaza'])) {
                header("location:" . SERVERURL . "administrador/plazasPrincipal.php/regNom");
            }else{

                $plaza = new Plaza();
                $plaza->setNomPlaza($_POST['nombre_plaza']);                
                
                $plazaDao = new PlazaDAO();
                $respuesta = $plazaDao->registrarPlazasModelo($plaza);
                
                if($respuesta){
                    
                   header("Location:".SERVERURL."administrador/plazasPrincipal/okNom");  
                } else{
                  header("Location:".SERVERURL."administrador/plazasPrincipal/erNom");
                }
            }
        }
    }

    public function actualizarPlazaControlador(){
        $patronNombrePlaza = "/^[a-z]{5,}$/";

        if (isset($_POST["nombre_plaza"])) {
            if (!preg_match($patronNombrePlaza, $_POST['patronNombrePlaza'])) {
                header("location:" . SERVERURL . "administrador/plazaPrincipal/" . $_POST['idPlaza'] ."/regNom");
                exit;
            }else {
                $datos = array("nombre_plaza" => $_POST["nombre_plaza"], "id_plaza" => $_POST['idPlaza']);
                $plazaDao = new PlazaDAO();
                $respuesta = $plazaDao->actualizarPlazaModelo($datos);
                
                if ($respuesta == "success") {
                    header("location:" . SERVERURL . "administrador/plazasPrincipal" .$_POST['idPlaza']. "/okUp");
                } else {
                    header("location:" . SERVERURL . "administrador/plazasPrincipal" .$_POST['idPlaza']. "/erUp");
                }
                
            }
        }
    }

    public function listarPlazaControlador() {
        $plazaDao = new PlazaDAO();
        $listado = $plazaDao->listarPlazaModelo();
        return $listado;
    }
    
    public function listarPlazaByControlador($id){
        $plazaDao = new PlazaDAO();
        $resultado = $plazaDao->listarPlazaByControlador($id);
        return $resultado;
    }

    
    public function eliminarPlazaControlador($id) {
        $plazaDao = new PlazaDAO();
        $respuesta = $plazaDao->eliminarplazaModelo($id);
        return $respuesta;
    }
    

    public function validarPlazaControlador($nombre){
        $plazaDao = new PlazaDAO();
        $respuesta = $plazaDao->validarPlazaModelo($nombre);
        if ($respuesta > 0){
            return "si";
        } else{
            return "no";
        }
    }
    public function validarPlazaUpdateControlador($nombre, $id) {
        $respuesta = $this->listarPlazaByControlador($id);
        if ($respuesta[1] == $nombre) {
            return "no";
        } else {
            return $this->validarPlazaControlador($nombre);
        }
    }
    public function buscarPlazaControlador(){
        if (isset($_POST['datoBuscar'])) {
            $plazaDao = new PlazaDAO();
            $plazas = $plazaDao->buscarPlazaModelo($_POST['datoBuscar']);
            return $plazas;
        }
    }

}
?>