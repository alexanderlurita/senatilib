<?php

require_once '../models/Material.php';

if (isset($_POST['operacion'])) {

  $material = new Material();

  if ($_POST['operacion'] == 'listar') {
    $datos = $material->listar();
    if ($datos) {
      echo json_encode($datos);
    }
  }

  if ($_POST['operacion'] == 'registrar') {
    //IMAGES
    $rutaDestinoIMG = '';
    $nombreArchivoIMG = '';
    $nombreGuardarIMG = 'NULL';
    if (isset($_FILES['caratula'])) {
      $rutaDestinoIMG = '../data/portadas/';
      $nombreArchivoIMG = sha1(date('c')) . '.jpg';
      $rutaDestinoIMG .= $nombreArchivoIMG;
      if(move_uploaded_file($_FILES['caratula']['tmp_name'], $rutaDestinoIMG)) {
        $nombreGuardarIMG = $nombreArchivoIMG;
      }
    }
    
    //PDF
    $rutaDestinoPDF = '';
    $nombreArchivoPDF = '';
    $nombreGuardarPDF = 'NULL';
    if (isset($_FILES['materialpdf'])) {
      $rutaDestinoPDF = '../data/pdf/';
      $nombreArchivoPDF = sha1(date('c')) . '.pdf';
      $rutaDestinoPDF .= $nombreArchivoPDF;
      if(move_uploaded_file($_FILES['materialpdf']['tmp_name'], $rutaDestinoPDF)) {
        $nombreGuardarPDF = $nombreArchivoPDF;
      }
    }

    $datos = [
      "idsubcategoria"  => $_POST['idsubcategoria'],
      "ideditorial"     => $_POST['ideditorial'],
      "titulo"          => $_POST['titulo'],
      "sinopsis"        => $_POST['sinopsis'],
      "versionmat"      => $_POST['versionmat'],
      "autor"           => $_POST['autor'],
      "cantpaginas"     => $_POST['cantpaginas'],
      "apublicacion"    => $_POST['apublicacion'],
      "caratula"        => $nombreGuardarIMG,
      "materialpdf"     => $nombreGuardarPDF
    ];

    $respuesta = $material->registrar($datos);
    echo json_encode($respuesta);
  }
}

?>