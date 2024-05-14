<?php

class ValidarDatosControlador{
    

    private $patronCarateres = "/^[A-Za-z0-9\s]+$/";
    private $patronNombrePlaza = "/^[a-z]{5,}$/";
    private $patronNumeros = '/^[[:digit:]]+$/';

    public function validarNombrePlaza($cadena){
        if(!preg_match($this->patronNombrePlaza, $cadena)){
            return false;
        }else{
            return false;
        }
    }
    public function validarCaracteresControlador($cadena) {
        if (!preg_match($this->patronCarateres, $cadena)) {
            return true;
        } else {
            return false;
        }
    }
    public function validarNumerosControlador($cadena) {
        if (!preg_match($this->patronNumeros, $cadena)) {
            return true;
        } else {
            return false;
        }
    }

}
