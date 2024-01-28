<?php
include_once '../Config/Config.php';
include_once '../Config/App/Conexion.php';

$id = isset($_GET['id']) ? $_GET['id'] : '';
$token = isset($_GET['token']) ? $_GET['token'] : '';

if ($id == '' || $token == '') {
    echo 'Error al procesar los datos';
    exit;
} else {
    $token_temp = hash_hmac('sha1', $id, KEY_TOKEN);

    if ($token == $token_temp) {
        $objConexion = new Conexion();
        $sql = "SELECT count(id) FROM `productos` WHERE `id` = $id";
        $data = $objConexion->consultar($sql);
        if ($data[0] > 0) {
            $sql = "SELECT * FROM `productos` WHERE `id` = $id";
            $data = $objConexion->consultar($sql);
            $data = $data[0];
        }
    } else {
        echo 'Error al procesar los datos';
        exit;
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/principal/css/animate.min.css">
    <link rel="stylesheet" href="../assets/principal/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../assets/principal/css/bootstrap-grid.min.css.map">
    <link rel="stylesheet" href="../assets/principal/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../assets/principal/css/bootstrap-reboot.min.css.map">
    <link rel="stylesheet" href="../assets/principal/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/principal/css/bootstrap.min.css.map">
    <link rel="stylesheet" href="../assets/principal/css/default-skin.css">
    <link rel="stylesheet" href="../assets/principal/css/icomoon.css">
    <link rel="stylesheet" href="../assets/principal/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="../assets/principal/css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="../assets/principal/css/meanmenu.css">
    <link rel="stylesheet" href="../assets/principal/css/nice-select.css">
    <link rel="stylesheet" href="../assets/principal/css/normalize.css">
    <link rel="stylesheet" href="../assets/principal/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/principal/css/responsive.css">
    <link rel="stylesheet" href="../assets/principal/css/slick.css">
    <link rel="stylesheet" href="../assets/principal/css/style.css">
</head>

<body>

    <!-- banner bg main start -->
    <div class="banner_bg">
        <!-- header top section start -->
        <div class="container">
            <div class="header_section_top">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="custom_menu">
                            <ul>
                                <li><a href="#">Tienda Online</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- header top section start -->

        <div class="container">
            <div class="row">
                <div class="col-md-6 order-md-1">
                    <img src="../<?php echo $data['imagen'] ?>" alt="" width="400" height="400">
                </div>
                <div class="col-md-6 order-md-2">
                    <h2><?php echo $data['nombre'] ?></h2>
                    <p><?php echo $data['descripcion'] ?></p>
                    <p>Precio: $<?php echo $data['precio'] ?></p>
                    <a href="http://localhost/Tienda" class="btn btn-primary">Regresar para ver más productos</a>
                </div>
            </div>
        </div>


</body>

</html>