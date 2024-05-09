<?php
ob_start();
class plazaControlador {

    public function registrarPlazasControlador() { //Encargada de validar y registrar nuevas plazas en el sistema.
        
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

    public function listarPlazaControlador() { //Recupera el listado completo de plazas almacenadas.
        $plazaDao = new PlazaDAO();
        $listado = $plazaDao->listarPlazaModelo();
        return $listado;
    }
    
    public function listarPlazaByControlador($id){ //Obtiene información específica de una plaza según su ID.
        $plazaDao = new PlazaDAO();
        $resultado = $plazaDao->listarPlazaByControlador($id);
        return $resultado;
    }

    
    public function eliminarPlazaControlador($id) { //Permite la eliminación de una plaza del sistema.
        $plazaDao = new PlazaDAO();
        $respuesta = $plazaDao->eliminarplazaModelo($id);
        return $respuesta;
    }
    

    public function validarPlazaControlador($nombre){ //Valida la existencia de una plaza según su nombre.
        $plazaDao = new PlazaDAO();
        $respuesta = $plazaDao->validarPlazaModelo($nombre);
        if ($respuesta > 0){
            return "si";
        } else{
            return "no";
        }
    }
    public function validarPlazaUpdateControlador($nombre, $id) { //Valida la existencia de una plaza al realizar una actualización.
        $respuesta = $this->listarPlazaByControlador($id);
        if ($respuesta[1] == $nombre) {
            return "no";
        } else {
            return $this->validarPlazaControlador($nombre);
        }
    }
    public function buscarPlazaControlador(){ //Realiza búsquedas de plazas según un criterio especificado
        if (isset($_POST['datoBuscar'])) {
            $plazaDao = new PlazaDAO();
            $plazas = $plazaDao->buscarPlazaModelo($_POST['datoBuscar']);
            return $plazas;
        }
    }

}
?>