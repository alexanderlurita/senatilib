<?php

require_once '../models/Categoria.php';

if (isset($_POST['operacion'])) {

  $categoria = new Categoria();

  if ($_POST['operacion'] == 'cargarOpciones') {
    $datos = $categoria->listar();
    echo json_encode($datos);
  }
}

?>