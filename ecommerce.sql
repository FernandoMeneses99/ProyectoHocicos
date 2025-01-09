-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2025 a las 20:53:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'ALIMENTOS_SECOS', '20250109030621.jpg', 1),
(2, 'JUGUETES', '20250109030630.jpg', 1),
(3, 'ACCESORIOS', '20250109030639.jpg', 1),
(4, 'BAÑO', '20250109030655.jpg', 1),
(5, 'ALIMENTOS_HUMEDOS', '20250109030710.jpg', 1),
(6, 'DESODORANTES', '20231017154500.jpg', 0),
(7, 'PREMIO', '20250109031014.jpg', 1),
(8, 'SALUD_Y_BIENESTAR', '20250109031050.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `host_smtp` varchar(100) NOT NULL,
  `user_smtp` varchar(100) NOT NULL,
  `pass_smtp` varchar(100) NOT NULL,
  `puerto_smtp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `correo`, `whatsapp`, `direccion`, `host_smtp`, `user_smtp`, `pass_smtp`, `puerto_smtp`) VALUES
(1, 'HOCICOS', '3133677048', 'atencioncliente@hocicos.com', '3133677048', 'COLOMBIA', 'smtp.gmail.com', 'atencioncliente@hocicos.com', 'ikhnyjislfpyzhgj', 465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `cantidad`, `precio`, `producto`, `id_producto`, `id_venta`) VALUES
(1, 3, 12000.00, 'JABON LIQUIDO', 7, 1),
(2, 1, 12000.00, 'JABON LIQUIDO', 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `ventas` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `ventas`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Galletas Cuidado Bucal', 'Galletas que protegen la salud bocal de tu perro', 16790.00, 66, 0, '20250109030257.jpg', 1, 8),
(2, 'Barras crocantes sabor pollo', 'Barras crocantes con sabor artificial a pollo, carne, cordero, atún.', 4590.00, 15, 0, '20250109030136.jpg', 1, 7),
(3, 'Suplemento Vitaminico', 'Suplemento con vitaminas para perros, contiene omega 3', 79890.00, 69, 0, '20250109030024.jpg', 1, 8),
(4, 'Crocantes sabor conejo', 'Crocantes sabor artificial a conejo', 6290.00, 98, 0, '20250109025823.jpg', 1, 7),
(5, 'Premios sabor pollo', 'Punta de ala de pollo', 15000.00, 25, 0, '20250109025717.jpg', 1, 1),
(6, 'Cabano sabor pollo', 'Cabano para Perros', 9390.00, 100, 0, '20250109025504.jpg', 1, 7),
(7, 'Galletas Sabor Manzana y Mango', 'Galletas de Sabores para Perros', 7890.00, 153, 4, '20250109025413.jpg', 1, 7),
(8, 'Prueba', '', 1.00, 3, 0, '20250109035649.jpg', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0,
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `correo`, `nombre`, `apellido`, `clave`, `direccion`, `tipo`, `perfil`, `verify`, `token`, `estado`) VALUES
(1, 'fernandomenesesda@gmail.com', 'admin', 'Omar Meneses', '$2y$10$NqGPbZe2k0LlJ9/rh92kn.3OdKxQP4PfzCMUYrLJ8PtYqjv.Bo78O', 'Cr 81j # 57d 02 sur', 1, NULL, 0, NULL, 1),
(13, 'prueba@mail.com', 'Persona de prueba', NULL, '$2y$10$xgS4Squox/M2dOxkgYSs8u1LJTHOKDq/ls9ks/dvfev/J73jUBJoe', NULL, 2, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) NOT NULL DEFAULT 1,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `transaccion`, `total`, `pago`, `nombre`, `apellido`, `direccion`, `telefono`, `ciudad`, `pais`, `cod`, `envio`, `fecha`, `proceso`, `tipo`, `estado`, `id_usuario`) VALUES
(1, NULL, 36000.00, 50000.00, 'Omar Fernando ', 'Meneses Daza', 'Cr 81j # 57d 02 sur	\n', NULL, NULL, NULL, NULL, 0.00, '2025-01-09 00:59:31', 1, 2, 1, 1),
(2, NULL, 12000.00, 15000.00, 'Omar Fernando Meneses Daza', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, '2025-01-09 07:20:58', 1, 2, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

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
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
