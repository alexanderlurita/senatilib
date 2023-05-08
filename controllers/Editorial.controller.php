<?php

require_once '../models/Editorial.php';

if (isset($_POST['operacion'])) {

  $editorial = new Editorial();

  if ($_POST['operacion'] == 'cargarOpciones') {
    $datos = $editorial->listar();
    echo json_encode($datos);
  }
}

?>