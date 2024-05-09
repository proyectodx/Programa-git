<?php
class Plaza{
    private $idPlaza;
    private $nomPlaza;
    private $idEstado;

    public function __construct(){
        
    }

    //getes de plazas
    public function getId(){
        return $this->idPlaza;
    }
    public function getNomPlaza(){
        return $this->nomPlaza;
    }
    public function getIdEstado(){
        return $this->idEstado;
    }

    //seters
    public function setId($idPlaza){
        $this->idPlaza = $idPlaza;
    }
    public function setNomPlaza($nomPlaza){
        $this->nomPlaza = $nomPlaza;
    }
    public function setIdEstado($idEstado){
        $this->idEstado = $idEstado;
    }
}