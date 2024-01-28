<?php include_once 'Views/template/header-principal.php'; ?>
<?php include_once 'Config/App/Conexion.php' ?>

<?php

if ($_POST) {

  $nombre = $_POST['nombre'];
  $apellidos = $_POST['apellidos'];
  $correo = $_POST['correo'];
  $telefono = $_POST['telefono'];
  $mensaje = $_POST['mensaje'];

  if ($nombre == '' || $apellidos == '' || $correo == '' || $telefono == '' || $mensaje == '') {
    echo '<script>alert("Todos los campos son obligatorios");</script>';
  } else {
    $conexion = new Conexion();
    $sql = "INSERT INTO `contactos` (`Nombres`, `Apellidos`, `Correo`, `Telefono`, `Mensaje`) VALUES ('$nombre', '$apellidos', '$correo', '$telefono', '$mensaje');";
    $conexion->ejecutar($sql);
  }
}


?>

<!-- banner section start -->
<div class="banner_section layout_padding">
  <div class="container">
    <div id="my_slider" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="row">
            <div class="col-sm-12">
              <h1 class="banner_taital">Get Start <br>Your favriot shoping</h1>
              <div class="buynow_bt"><a href="#">Buy Now</a></div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col-sm-12">
              <h1 class="banner_taital">Get Start <br>Your shoping</h1>
              <div class="buynow_bt"><a href="#">Buy Now</a></div>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="row">
            <div class="col-sm-12">
              <h1 class="banner_taital">Get Start <br>Your favriot shoping</h1>
              <div class="buynow_bt"><a href="#">Buy Now</a></div>
            </div>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#my_slider" role="button" data-slide="prev">
        <i class="fa fa-angle-left"></i>
      </a>
      <a class="carousel-control-next" href="#my_slider" role="button" data-slide="next">
        <i class="fa fa-angle-right"></i>
      </a>
    </div>
  </div>
</div>
<!-- banner section end -->

</div>
<!-- banner bg main end -->

<!-- fashion section start -->
<?php foreach ($data['categorias'] as $categoria) { ?>
  <div class="fashion_section">
    <div class="container" id="categoria_<?php echo $categoria['id']; ?>">
      <h1 class="fashion_taital text-uppercase"><?php echo $categoria['categoria']; ?></h1>
      <div class="row <?php echo (count($categoria['productos']) > 0) ? 'multiple-items' : ''; ?>">
        <?php foreach ($categoria['productos'] as $producto) { ?>
          <div class="<?php echo (count($categoria['productos']) > 2) ? 'col-lg-4' : 'col-lg-12'; ?>">
            <div class="box_main">
              <h4 class="shirt_text"><?php echo $producto['nombre']; ?></h4>
              <p class="price_text">Precio <span style="color: #262626;">$ <?php echo $producto['precio']; ?></span></p>
              <div class="text-center">
                <img data-lazy="<?php echo BASE_URL . $producto['imagen']; ?>" />
              </div>
              <div class="btn_main">
                <div class="buy_bt"><a href="#" class="btnAddcarrito" prod="<?php echo $producto['id']; ?>">Añadir</a></div>
                <div class="seemore_bt"><a href="#">Leer más</a></div>
              </div>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </div>
<?php } ?>

<!-- Section Contact -->
<section>
  <div class="container mb-5">
    <p class="text-center mb-5 font-weight-bold text-uppercase fs-1">Contacto</p>
    <form class="w-50 mx-auto" method="post" action="index.php">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre">
      </div>
      <div class="mb-3">
        <label for="apellidos" class="form-label">Apellidos</label>
        <input type="text" class="form-control" id="apellidos" name="apellidos">
      </div>
      <div class="mb-3">
        <label for="correo" class="form-label">Correo</label>
        <input type="email" class="form-control" id="correo" name="correo" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">Nunca compartiremos su correo electrónico con nadie más.</div>
      </div>
      <div class="mb-3">
        <label for="telefono" class="form-label">telefono</label>
        <input type="text" class="form-control" id="telefono" name="telefono">
      </div>
      <div class="mb-3">
        <label for="mensaje" class="form-label">Mensaje</label>
        <textarea class="form-control" id="mensaje" name="mensaje" rows="3"></textarea>
      </div>
      <button type="submit" class="btn btn-success">Submit</button>
    </form>
  </div>
</section>

<!-- Boton flotante -->
<div class="chatbot">
  <a href="Views/template/ai.php"><i class='bx bx-bot'></i></a>
</div>


<?php include_once 'Views/template/footer-principal.php'; ?>

<script>
  $('.multiple-items').slick({
    lazyLoad: 'ondemand',
    dots: true,
    infinite: false,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: true,
    responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
</script>

</body>

</html>