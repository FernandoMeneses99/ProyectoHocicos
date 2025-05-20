-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2025 a las 05:11:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce_categorias`
--

CREATE TABLE `ecommerce_categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce_configuracion`
--

CREATE TABLE `ecommerce_configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `host_smtp` varchar(100) DEFAULT NULL,
  `user_smtp` varchar(100) DEFAULT NULL,
  `pass_smtp` varchar(100) DEFAULT NULL,
  `puerto_smtp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce_detalle_ventas`
--

CREATE TABLE `ecommerce_detalle_ventas` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce_productos`
--

CREATE TABLE `ecommerce_productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `ventas` int(11) DEFAULT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce_usuarios`
--

CREATE TABLE `ecommerce_usuarios` (
  `id` int(11) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `verify` int(11) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce_ventas`
--

CREATE TABLE `ecommerce_ventas` (
  `id` int(11) NOT NULL,
  `transaccion` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `pago` decimal(10,2) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL,
  `envio` decimal(10,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proceso` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ecommerce_categorias`
--
ALTER TABLE `ecommerce_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ecommerce_configuracion`
--
ALTER TABLE `ecommerce_configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ecommerce_detalle_ventas`
--
ALTER TABLE `ecommerce_detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `ecommerce_productos`
--
ALTER TABLE `ecommerce_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `ecommerce_usuarios`
--
ALTER TABLE `ecommerce_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ecommerce_ventas`
--
ALTER TABLE `ecommerce_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ecommerce_categorias`
--
ALTER TABLE `ecommerce_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ecommerce_configuracion`
--
ALTER TABLE `ecommerce_configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ecommerce_detalle_ventas`
--
ALTER TABLE `ecommerce_detalle_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ecommerce_productos`
--
ALTER TABLE `ecommerce_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ecommerce_usuarios`
--
ALTER TABLE `ecommerce_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ecommerce_ventas`
--
ALTER TABLE `ecommerce_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ecommerce_detalle_ventas`
--
ALTER TABLE `ecommerce_detalle_ventas`
  ADD CONSTRAINT `ecommerce_detalle_ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `ecommerce_productos` (`id`),
  ADD CONSTRAINT `ecommerce_detalle_ventas_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ecommerce_ventas` (`id`);

--
-- Filtros para la tabla `ecommerce_productos`
--
ALTER TABLE `ecommerce_productos`
  ADD CONSTRAINT `ecommerce_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `ecommerce_categorias` (`id`);

--
-- Filtros para la tabla `ecommerce_ventas`
--
ALTER TABLE `ecommerce_ventas`
  ADD CONSTRAINT `ecommerce_ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `ecommerce_usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
