<?php

require_once '../models/Subcategoria.php';

if (isset($_POST['operacion'])) {

  $subcategoria = new Subcategoria();

  if ($_POST['operacion'] == 'cargarOpciones') {
    $datos = $subcategoria->listar();
    echo json_encode($datos);
  }
}

?>