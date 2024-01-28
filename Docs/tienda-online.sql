-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2024 a las 01:39:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `tienda-online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'Herrajes', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'Tuberias', 'assets/images/categorias/20220805093028.jpg', 1),
(3, 'Pinturas', 'NO', 1),
(4, 'Tornillos', '', 1),
(5, 'Discos', '', 1),
(6, 'Cascos', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(17) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(3, 'ANGEL SIFUENTES', '', 'lovenaju2@gmail.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', '21a66551b83c814b108081b292dc65d2', 1),
(4, 'VIDA INFORMATICO', '', 'admin@angelsifuentes.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', NULL, 1),
(5, 'JUAN ANGEL', '', 'prueba@gmail.com', '$2y$10$rr24uW0VypkrDEhooFRsoOli/Pcm5NR5F8D9NARgQz0l1UfPkqV1q', 'default.png', 'c81b5136bcd10b4390108c979ed28ee6', 1),
(6, 'Steven Torres', '', 'gamer24minecraft@gmail.com', '$2y$10$tIk4BZpTpdUsoqEVbCKE5.s9wcAbIKYtpvxoNWtLS4F6zOnpMkqNa', 'default.png', NULL, 1),
(10, 'Steven', '', 'steven88724@gmail.com', '$2y$10$AK5Pd09ytvXU7ngubulPyOxmWii8iDknUFcNjOY4oEH15wV5Lh/Zy', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `ID_Contactos` int(11) NOT NULL,
  `Nombres` varchar(255) NOT NULL,
  `Apellidos` varchar(255) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(17) NOT NULL,
  `Mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`ID_Contactos`, `Nombres`, `Apellidos`, `Correo`, `Telefono`, `Mensaje`) VALUES
(1, 'Steven', 'Torres', 'steven@gmail.com', '0967201167', 'Hola soy nuevo, me gustaría reclamar algo contactenseeeeeeee'),
(2, 'Dc', 'Torres', 'admin@example.com', '0967201167', 'Hola soy fan'),
(3, 'Dc', 'Torres', 'admin@example.com', '0967201167', 'Hola soy fan'),
(4, 'Dc', 'Torres', 'admin@example.com', '0967201167', 'Hola soy fan'),
(5, '', '', '', '', ''),
(6, 'Dc', 'Torres', 'admin@example.com', '0967201167', 'Hola soy fan'),
(7, 'Dc', 'Torres', 'admin@example.com', '0967201167', 'Hola soy fan'),
(8, 'Hola mundo', 'Torres', '', '0967201167', 'adadadada'),
(9, 'Steven', 'T.S87', 'correo@gmail.com', '0967201167', 'asdasdasd'),
(10, 'jose', 'asdasd', 'admin@example.com', '0967201167', 'sadadad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'CAMARA WEB', 200.00, 1, 1, 2),
(2, 'TELEVISOR LG', 1500.00, 1, 1, 3),
(3, 'NUEVO PRODUCTO', 5.00, 1, 2, 6),
(4, 'FASHION 2', 3.00, 1, 2, 8),
(5, 'FASHION1', 8.00, 1, 2, 7),
(6, 'MICROFONO', 8.00, 1, 3, 4),
(7, 'CAMARA WEB', 20.00, 1, 3, 2),
(8, 'PARLANTE HILON', 10.00, 1, 3, 1),
(9, 'TELEVISOR LG', 10.00, 1, 4, 3),
(10, 'MICROFONO', 8.00, 1, 4, 4),
(11, 'LAPTOP LENOVO', 30.00, 1, 4, 5),
(12, 'CAMARA WEB', 20.00, 1, 5, 2),
(13, 'Cerraduras multipunto', 190.00, 1, 6, 3),
(14, 'Cerradura de división', 65.00, 1, 6, 2),
(15, 'Cierre de seguridad', 325.00, 1, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id_gasto` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `fecha_gasto` date NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id_gasto`, `descripcion`, `monto`, `categoria`, `fecha_gasto`, `estado`) VALUES
(1, 'Prueba', 10.50, 'Tecnología', '2023-12-19', 1),
(2, 'Prueba2', 50.00, 'Ropa', '2023-12-19', 1),
(3, 'Prueba2', 50.00, 'Ropa', '2023-12-19', 0),
(4, 'Prueba3', 500.00, 'Tecnología', '2023-12-19', 1),
(5, 'Prueba4', 5.00, 'Moda', '2023-12-19', 1),
(6, 'Prueba6', 10.00, 'Fashion', '2023-12-19', 1),
(7, 'Prueba7', 5.00, 'Tecnología', '2023-12-19', 1),
(8, 'Prueba8', 40.00, 'Tecnología', '2023-12-20', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '6PX22696F1040260E', 1700.00, 'COMPLETED', '2023-02-20 17:12:42', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 5, '2'),
(2, '1HJ95121A9582915R', 16.00, 'COMPLETED', '2023-07-10 22:37:24', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 3, '2'),
(3, '0DD59339CC7522842', 38.00, 'COMPLETED', '2023-12-12 19:17:34', 'sb-camzp26185603@business.example.com', 'John', 'Doe', 'Free Trade Zone', 'Bogota', 6, '3'),
(4, '1G703730G23814723', 48.00, 'COMPLETED', '2024-01-25 18:45:05', 'sb-camzp26185603@business.example.com', 'John', 'Doe', 'Free Trade Zone', 'Bogota', 10, '1'),
(5, '0P212580GR2220610', 20.00, 'COMPLETED', '2024-01-25 18:52:34', 'sb-camzp26185603@business.example.com', 'John', 'Doe', 'Free Trade Zone', 'Bogota', 10, '3'),
(6, '8C22492823938592E', 580.00, 'COMPLETED', '2024-01-27 03:46:04', 'sb-camzp26185603@business.example.com', 'John', 'Doe', 'Free Trade Zone', 'Bogota', 10, '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

CREATE TABLE `presupuestos` (
  `id_presupuesto` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presupuestos`
--

INSERT INTO `presupuestos` (`id_presupuesto`, `categoria`, `monto`, `estado`) VALUES
(1, 'Inventario', 1500.00, 1),
(2, 'Marketing', 800.00, 1),
(3, 'Envío', 300.00, 1),
(4, 'Tecnología', 500.00, 0),
(5, 'MODA', 10.00, 0),
(6, 'Tecnologías', 1000.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Cierre de seguridad', 'Pensado para proteger edificios, oficinas. Combina las capacidades de Dom para la protección física con métodos de criptografía digital, ofreciendo un alto nivel de seguridad.', 325.00, 5, 'assets/images/productos/20240126171510.jpg', 1, 1),
(2, 'Cerradura de división', 'Elegante gama de bisagras, cerraduras, cerraderos y pestillos de puertas con galce para mamparas de oficinas (“partitions”). Disponibles en aluminio anodizado y acero inoxidable. Material de fabricación europea certificada y testada para 500.000 ciclos.', 65.00, 15, 'assets/images/productos/20240126172420.jpg', 1, 1),
(3, 'Cerraduras multipunto', 'Todas las ventajas a la vista:\r\n\r\n- cierre y apertura electrónica de todos los pestillos (incluso en la cerradura principal)\r\n\r\n- vigilancia permanente del cierre\r\n\r\n- óptima estanqueidad\r\n\r\n- reducido ancho de montaje de sólo 16 mm y profundidad de montaje desde 52 mm', 190.00, 38, 'assets/images/productos/20240126172632.jpg', 1, 1),
(4, 'Cerradura', 'Elegante gama de bisagras, cerraduras, cerraderos y pestillos de puertas con galce para mamparas de oficina.', 20.00, 5, 'assets/images/productos/20240126173011.jpg', 1, 1),
(5, 'LAPTOP LENOVO', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 30.00, 12, 'assets/images/productos/20220805093535.jpg', 0, 1),
(6, 'Codos de cristal 90°', 'Mangueras y accesorios para un transporte de materias sin límite. Alimentación materia centralizada Para sus aplicaciones muy cargadas (fibra de vidrio u otros elementos).', 5.00, 16, 'assets/images/productos/20240127221738.jpg', 1, 2),
(7, 'Tubo de plastico', 'Un tubo de plástico es una sección tubular o cilindro hueco hecho de polímeros', 2.00, 14, 'assets/images/productos/20240127223037.jpg', 1, 2),
(8, 'Brazo en escuadra', 'Material: aluminio.\r\n\r\nSuperficie: plata anodizada.', 3.00, 12, 'assets/images/productos/20240127223233.jpg', 1, 2),
(10, 'ABRAZADERA EMT 1 1/4', 'ABRAZADERA EMT 1 1/4', 0.22, 50, 'assets/images/productos/20240128000608.jpg', 1, 4),
(11, 'BLANCO MATE', 'ANTIOX TAN BLANCO MATE / CONDOR (C900MC)', 8.38, 20, 'assets/images/productos/20240127233551.jpg', 1, 3),
(12, 'DISCO CAUCHO', 'DISCO CAUCHO PARA AMOLADORA 7', 1.00, 19, 'assets/images/productos/20240127224219.jpg', 1, 5),
(13, 'DISCO DIAMANTE 4.5', 'DISCO DIAMANTE 4.5\" CONTINUO COMANDO', 1.73, 13, 'assets/images/productos/20240127224405.jpg', 1, 5),
(14, 'DISCO CONTINUO CORTOOL', 'DISCO DIAMANTE 4.5\" CONTINUO CORTOOL', 2.68, 5, 'assets/images/productos/20240127230034.jpg', 1, 5),
(15, 'DISCO CONTINUO DEWALT', 'DISCO DIAMANTE 4.5\" CONTINUO DEWALT', 2.00, 10, 'assets/images/productos/20240127230330.jpg', 1, 5),
(16, 'DISCO CONTINUO TRUPER', 'DISCO DIAMANTE 4.5\" CONTINUO TRUPER', 9.08, 20, 'assets/images/productos/20240127230432.jpg', 1, 5),
(17, 'DISCO  CONTINUO PROF INGCO ', 'DISCO DIAMANTE 4.5\" CONTINUO PROF INGCO (DMD021152)', 3.41, 15, 'assets/images/productos/20240127230624.jpg', 1, 5),
(18, 'DISCO CONTINUO COMANDO', 'DISCO DIAMANTE 7\" CONTINUO COMANDO', 3.71, 15, 'assets/images/productos/20240127230808.jpg', 1, 5),
(19, 'PINTURA LATEX INTERIOR BLANCO', 'PIN 3 LATEX INTERIOR BLANCO (6100)', 38.00, 20, 'assets/images/productos/20240127232744.jpg', 1, 3),
(20, 'ACELERANTE', 'ACELERANTE FA 111 4KG', 8.00, 20, 'assets/images/productos/20240127232833.jpg', 1, 3),
(21, 'PINTURA NEGRO MATE', 'ANTIOX TAN NEGRO MATE / CONDOR (C901MC)', 8.38, 20, 'assets/images/productos/20240127234820.jpg', 1, 3),
(22, 'PINTURA GRIS MATE', 'ANTIOX TAN GRIS MATE / CONDOR (C932MC)', 8.38, 20, 'assets/images/productos/20240127235303.jpg', 1, 3),
(23, 'PINTURA BLANCO BRILLANTE', 'NTIOX TAN BLANCO BRILLANTE / CONDOR (C900BC)', 9.78, 15, 'assets/images/productos/20240127235519.jpg', 1, 3),
(24, 'PINTURA NEGRO BRILLANTE', 'ANTIOX TAN NEGRO BRILLANTE / CONDOR (C901BC)', 9.70, 20, 'assets/images/productos/20240127235812.jpg', 1, 3),
(25, 'PINTURA GRIS BRILLANTE', 'ANTIOX TAN GRIS BRILLANTE / CONDOR (C932BC)', 8.38, 20, 'assets/images/productos/20240127235940.jpg', 1, 3),
(26, 'ABRAZADERA EMT 1/2', 'ABRAZADERA EMT 1/2', 0.10, 50, 'assets/images/productos/20240128000207.jpg', 1, 4),
(27, 'ABRAZADERA EMT 3/4', 'ABRAZADERA EMT 3/4', 0.15, 50, 'assets/images/productos/20240128001111.jpg', 1, 4),
(28, 'ABRAZADERA EMT 1', 'ABRAZADERA EMT 1', 0.20, 50, 'assets/images/productos/20240128001156.jpg', 1, 4),
(29, 'ABRAZADERA EMT 1 1/2', 'ABRAZADERA EMT 1 1/2', 0.41, 50, 'assets/images/productos/20240128001303.jpg', 1, 4),
(30, 'ABRAZADERA EMT 2', 'ABRAZADERA EMT 2', 0.71, 50, 'assets/images/productos/20240128001449.jpg', 1, 4),
(31, 'ABRAZADERA REDONDA 1/2', 'ABRAZADERA REDONDA 1/2', 0.32, 50, 'assets/images/productos/20240128001539.jpg', 1, 4),
(32, 'ABRAZADERA REDONDA 3/4', 'ABRAZADERA REDONDA 3/4', 0.36, 50, 'assets/images/productos/20240128001611.jpg', 1, 4),
(33, 'CASCO ROJO ', 'CASCO PROTECTOR ROJO COMANDO', 3.79, 20, 'assets/images/productos/20240128002417.jpg', 1, 6),
(34, 'CASCO BLANCO', 'CASCO PROTECTOR BLANCO COMANDO', 3.79, 20, 'assets/images/productos/20240128002504.jpg', 1, 6),
(35, 'CASCO AMARILLO', 'CASCO PROTECTOR AMARILLO COMANDO', 3.79, 20, 'assets/images/productos/20240128002609.jpg', 1, 6),
(36, 'CASCO AZUL', 'CASCO PROTECTOR AZUL COMANDO', 3.79, 20, 'assets/images/productos/20240128002912.jpg', 1, 6),
(37, 'CASCO TOMATE', 'CASCO PROTECTOR TOMATE COMANDO', 3.79, 20, 'assets/images/productos/20240128003020.jpg', 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'ANGEL', 'SIFUENTES', 'angelsifuentes2580@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 1),
(2, 'hola', 'como', 'esta@gmail.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 0),
(3, 'Steven', 'Torres', 'steven@gmail.com', '$2y$10$PwqMRfMZZNsx1pbRWRk8deTOOpVHLPaPhD/913D0H660QL7cndR4G', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`ID_Contactos`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id_gasto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD PRIMARY KEY (`id_presupuesto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `ID_Contactos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id_gasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `id_presupuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;
