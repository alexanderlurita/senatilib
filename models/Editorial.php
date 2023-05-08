<?php

require_once 'Conexion.php';

class Editorial extends Conexion {
  
  private $conexion;

  public function __CONSTRUCT() {
    $this->conexion = parent::getConexion();
  }

  public function listar() {
    try {
      $consulta = $this->conexion->prepare("CALL spu_editoriales_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch(Exception $e) {
      die($e->getCode());
    }
  }

}

?>