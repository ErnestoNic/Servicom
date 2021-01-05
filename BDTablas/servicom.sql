-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2021 a las 00:03:33
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `servicom`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPrestador` int(11) NOT NULL,
  `calificaciones` int(2) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT NULL,
  `eliminado` tinyint(4) DEFAULT NULL,
  `tsCreate` timestamp NULL DEFAULT current_timestamp(),
  `tsUpdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `tiposOficio` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eliminado` tinyint(4) DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT 1,
  `tsUpdate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tsCreate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `tiposOficio`, `eliminado`, `habilitado`, `tsUpdate`, `tsCreate`) VALUES
(1, 'Hogar y Construcción', NULL, NULL, '2020-12-17 23:00:08', '2020-12-17 23:00:08'),
(2, 'Textil', NULL, 1, '2020-12-17 23:06:32', '2020-12-17 23:06:32'),
(3, 'Hogar y Construcción', NULL, 1, '2020-12-17 23:07:14', '2020-12-17 23:07:14'),
(4, 'Salud y Belleza', NULL, 1, '2020-12-17 23:59:15', '2020-12-17 23:59:15'),
(5, 'Legales', NULL, 1, '2020-12-20 15:15:02', '2020-12-20 15:15:02'),
(6, 'Higiene y Desinfección', NULL, 1, '2020-12-21 21:16:30', '2020-12-21 21:16:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficios`
--

CREATE TABLE `oficios` (
  `id` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `nombreOficio` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT 1,
  `eliminado` tinyint(4) DEFAULT NULL,
  `tsCreate` timestamp NULL DEFAULT current_timestamp(),
  `tsUpdate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `oficios`
--

INSERT INTO `oficios` (`id`, `idCategoria`, `nombreOficio`, `habilitado`, `eliminado`, `tsCreate`, `tsUpdate`) VALUES
(1, 5, 'Escribano', 1, NULL, '2020-12-20 15:30:17', '2020-12-24 13:05:57'),
(2, 3, 'Plomero', 1, NULL, '2020-12-20 15:30:38', '2020-12-24 13:09:01'),
(3, 4, 'Estilista', 1, NULL, '2020-12-20 15:37:27', '2020-12-24 13:09:51'),
(4, 6, 'Fumigador', 1, NULL, '2020-12-20 15:44:41', '2020-12-21 23:57:09'),
(5, 4, 'Podologa', 1, NULL, '2020-12-20 16:56:33', '2020-12-24 13:11:05'),
(6, 3, 'Carpintero', 1, NULL, '2020-12-20 16:57:32', '2020-12-27 12:46:04'),
(7, 5, 'Abogado', 1, NULL, '2020-12-21 21:17:10', '2020-12-24 13:12:07'),
(8, 3, 'Albañil', 1, NULL, '2020-12-21 23:57:40', '2020-12-21 23:57:40'),
(9, 3, 'Gasista', 1, NULL, '2020-12-24 14:53:48', '2020-12-24 14:53:48'),
(10, 2, 'Sastre', 1, NULL, '2020-12-24 23:51:08', '2020-12-24 23:51:08'),
(11, 6, 'Servicio Doméstico', 1, NULL, '2020-12-26 13:44:30', '2020-12-27 12:45:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cuit` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `domicilio` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `altura` int(5) DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `eliminado` tinyint(4) DEFAULT 0,
  `habilitado` tinyint(4) DEFAULT 1,
  `tsCreate` timestamp NULL DEFAULT current_timestamp(),
  `tsUpdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellido`, `cuit`, `domicilio`, `altura`, `email`, `telefono`, `eliminado`, `habilitado`, `tsCreate`, `tsUpdate`) VALUES
(1, 'Ernesto', 'Lopez', '2147483647', 'Joaquin V Gonzalez', 2322, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:17:07', '2020-12-12 21:17:07'),
(2, 'Ernesto', 'Lopez', '2147483647', 'Barrio Infanta M34 C', 28, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:19:41', '2020-12-12 21:19:41'),
(3, 'Enzo', 'Lopez', '2147483647', 'Barrio Infanta M34 C', 28, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:22:49', '2020-12-12 21:22:49'),
(4, 'Enzo', 'Lopez', '2147483647', 'Barrio Infanta M34 C', 28, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:24:53', '2020-12-12 21:24:53'),
(5, 'Andrea', 'Costa', '2147483647', 'Joaquin V Gonzalez', 2322, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:35:20', '2020-12-12 21:35:20'),
(6, 'ERNESTO', 'LOPEZ', '20310840565', 'Alzaga', 24, 'mail@mail.com.ar', '2514369654', 0, 1, '2020-12-12 21:36:29', '2020-12-12 21:36:29'),
(7, 'Pedro', 'Gonzalez', '20310840565', 'Alzaga', 24, 'mail@mail.com.ar', '2514369654', 0, 1, '2020-12-12 21:36:43', '2020-12-12 21:36:43'),
(8, 'Ernesto', 'Lopez', '2147483647', 'Barrio Infanta M34 C', 28, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:41:45', '2020-12-12 21:41:45'),
(9, 'Ernesto', 'Lopez', '2147483647', 'Joaquin V Gonzalez', 2322, 'lopezerneston@gmail.com', '2514369654', 0, 1, '2020-12-12 21:55:50', '2020-12-12 21:55:50'),
(10, 'Ernesto', 'Lopez', '2147483647', 'Joaquin V Gonzalez', 28, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-12 21:59:20', '2020-12-12 21:59:20'),
(11, 'Andrea', 'Costa', '2147483647', 'Barrio Infanta M34 C', 28, 'lopezerneston@gmail.com', '2615108043', 0, 1, '2020-12-12 22:04:54', '2020-12-12 22:04:54'),
(12, 'Ernesto', 'Lopez', '2147483647', 'Joaquin V Gonzalez', 2322, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-12 22:09:28', '2020-12-12 22:09:28'),
(13, 'Ernesto', 'Lopez', '2147483647', 'Joaquin V Gonzalez', 2322, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-12 22:18:01', '2020-12-12 22:18:01'),
(14, 'Ernesto', 'Lopez', '2147483647', 'Joaquin', 2322, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-12 22:28:38', '2020-12-12 22:28:38'),
(15, 'Ernesto', 'Lopez', '2147483647', 'Joaquin V Gonzalez', 28, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-12 22:31:58', '2020-12-12 22:31:58'),
(16, 'Ernesto', 'Lopez', '20310840565', 'Joaquin V Gonzalez', 2322, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-13 14:12:30', '2020-12-13 14:12:30'),
(17, 'Andrea', 'Costa', '27291486091', 'Joaquin', 28, 'lopezerneston@gmail.com', '2615108043', 0, 1, '2020-12-13 14:48:13', '2020-12-13 14:48:13'),
(18, 'Ernesto', 'Lopez', '20310840565', 'Joaquin', 28, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-13 14:55:48', '2020-12-13 14:55:48'),
(19, 'Andrea', 'Costa', '27291486091', 'Joaquin', 28, 'lopezerneston@gmail.com', '2615108043', 0, 1, '2020-12-13 15:40:27', '2020-12-13 15:40:27'),
(20, 'Enzo', 'Lopez', '20310840565', 'Joaquin', 28, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-13 15:54:45', '2020-12-13 15:54:45'),
(21, 'Ernesto', 'Lopez', '20310840565', 'Joaquin', 28, 'lopezerneston@gmail.com', '2616125315', 0, 1, '2020-12-14 21:36:46', '2020-12-14 21:36:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestadores`
--

CREATE TABLE `prestadores` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idOficio` int(11) NOT NULL,
  `uid` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `matriculas` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT 1,
  `eliminado` tinyint(4) DEFAULT NULL,
  `tsCreate` timestamp NULL DEFAULT current_timestamp(),
  `tsUpdate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `role` tinyint(4) DEFAULT 0,
  `usuario` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `confirmacionCorreo` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `habilitado` tinyint(4) DEFAULT 0,
  `eliminado` tinyint(4) DEFAULT 0,
  `tsUpdate` timestamp NULL DEFAULT current_timestamp(),
  `tsCreate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `idPersona`, `role`, `usuario`, `password`, `confirmacionCorreo`, `habilitado`, `eliminado`, `tsUpdate`, `tsCreate`) VALUES
(1, 1, 0, 'ERNEST', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, NULL, NULL, '2020-12-12 21:17:07', '2020-12-12 21:17:07'),
(2, 2, 0, 'Ernes', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL, NULL, NULL, '2020-12-12 21:19:41', '2020-12-12 21:19:41'),
(3, 3, 0, 'Enzo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL, NULL, NULL, '2020-12-12 21:22:49', '2020-12-12 21:22:49'),
(4, 4, 0, 'Enzo', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL, NULL, NULL, '2020-12-12 21:24:53', '2020-12-12 21:24:53'),
(5, 5, 0, 'Andre', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL, NULL, NULL, '2020-12-12 21:35:20', '2020-12-12 21:35:20'),
(6, 8, 0, 'ERNEST', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', NULL, NULL, NULL, '2020-12-12 21:41:45', '2020-12-12 21:41:45'),
(7, 10, 0, 'Ernes', '7c4a8d09ca3762af61e59520943dc26494f8941b', '572c0049-e83d-4f56-998b-8d14996b4485', NULL, NULL, '2020-12-12 21:59:20', '2020-12-12 21:59:20'),
(8, 11, 0, 'Andre', 'fc1200c7a7aa52109d762a9f005b149abef01479', 'c6c36239-7bf1-46c1-8194-1e14effeeb34', NULL, NULL, '2020-12-12 22:04:54', '2020-12-12 22:04:54'),
(9, 12, 0, 'ERNEST', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'd3545d57-6d3b-415c-ba14-d61022ff29cc', NULL, NULL, '2020-12-12 22:09:28', '2020-12-12 22:09:28'),
(10, 13, 0, 'Nico', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '0a7d48dd-f808-4920-9083-cfe6734df180', NULL, NULL, '2020-12-12 22:18:01', '2020-12-12 22:18:01'),
(11, 14, 0, 'ERNEST', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'db66d87e-1f23-4b87-b60a-1a8c233f808c', 0, 0, '2020-12-12 22:28:38', '2020-12-12 22:28:38'),
(12, 15, 0, 'ERNEST', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '65aa0a70-5852-4d87-8489-949eeae23886', 0, 0, '2020-12-12 22:31:58', '2020-12-12 22:31:58'),
(13, 16, 0, 'ERNEST', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '7415a95e-a014-4330-bcb9-e4121348c4e0', 0, 0, '2020-12-13 14:12:30', '2020-12-13 14:12:30'),
(14, 17, 0, 'Andre', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '99569322-4cc3-4224-b02f-8c88bbd77e62', 0, 0, '2020-12-13 14:48:13', '2020-12-13 14:48:13'),
(15, 18, 0, 'ERNEST', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '35ab042e-055e-4f05-a5ee-06c91414221a', 1, 0, '2020-12-13 14:55:48', '2020-12-13 14:55:48'),
(16, 19, 0, 'Andre', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'a0e5f361-ab11-41b1-bb2e-af5829560085', 1, 0, '2020-12-13 15:40:27', '2020-12-13 15:40:27'),
(17, 20, 0, 'ernesto', '8cb2237d0679ca88db6464eac60da96345513964', '366f1c35-95a6-489d-9204-2abe5f0eeb5c', 1, 0, '2020-12-13 15:54:45', '2020-12-13 15:54:45'),
(18, 21, 0, 'Ernest', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'da79247a-35f0-4073-83f7-128ec6b6eec3', 1, 0, '2020-12-14 21:36:46', '2020-12-14 21:36:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPrestador` (`idPrestador`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficios`
--
ALTER TABLE `oficios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPersona` (`id`);

--
-- Indices de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idOficio` (`idOficio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPersona` (`idPersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `oficios`
--
ALTER TABLE `oficios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`idPrestador`) REFERENCES `prestadores` (`id`);

--
-- Filtros para la tabla `oficios`
--
ALTER TABLE `oficios`
  ADD CONSTRAINT `oficios_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `prestadores`
--
ALTER TABLE `prestadores`
  ADD CONSTRAINT `prestadores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `prestadores_ibfk_2` FOREIGN KEY (`idOficio`) REFERENCES `oficios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
