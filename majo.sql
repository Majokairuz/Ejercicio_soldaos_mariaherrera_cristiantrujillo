-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2024 a las 03:18:31
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `majo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

CREATE TABLE `compañia` (
  `Id_Compañia` int(5) NOT NULL,
  `Actividad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuartel`
--

CREATE TABLE `cuartel` (
  `Id_Cuartel` int(5) NOT NULL,
  `Nombre_Cuartel` varchar(30) DEFAULT NULL,
  `Pais_Cuartel` varchar(30) DEFAULT NULL,
  `Departamento_Cuartel` varchar(30) DEFAULT NULL,
  `Ciudad_Cuartel` varchar(30) DEFAULT NULL,
  `Barrio_Cuartel` varchar(30) DEFAULT NULL,
  `Direccion_Cuartel` varchar(30) DEFAULT NULL,
  `ubicacion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuartel_compañia`
--

CREATE TABLE `cuartel_compañia` (
  `Id_Cuartel` int(5) DEFAULT NULL,
  `Id_Compañia` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpo`
--

CREATE TABLE `cuerpo` (
  `Id_Cuerpo` int(5) NOT NULL,
  `Denominacion_Infanteria` varchar(30) DEFAULT NULL,
  `Denominacion_Artilleria` varchar(30) DEFAULT NULL,
  `Denominacion_Armada` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `Id_Servicio` int(5) NOT NULL,
  `Actividad_Guardia` varchar(20) DEFAULT NULL,
  `Actividad_Cuartelero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_soldado`
--

CREATE TABLE `servicio_soldado` (
  `Id_servicio` int(5) DEFAULT NULL,
  `Id_Soldado` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `Id_Soldado` int(5) NOT NULL,
  `Nombre_Soldado` varchar(30) DEFAULT NULL,
  `Apellido_Soldado` varchar(30) DEFAULT NULL,
  `Grado` varchar(10) DEFAULT NULL,
  `Id_cuartel1` int(5) DEFAULT NULL,
  `Id_cuerpo1` int(5) DEFAULT NULL,
  `Id_Compañia1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`Id_Compañia`);

--
-- Indices de la tabla `cuartel`
--
ALTER TABLE `cuartel`
  ADD PRIMARY KEY (`Id_Cuartel`);

--
-- Indices de la tabla `cuartel_compañia`
--
ALTER TABLE `cuartel_compañia`
  ADD KEY `fk_Idcuatro` (`Id_Compañia`),
  ADD KEY `fk_Idcinco` (`Id_Cuartel`);

--
-- Indices de la tabla `cuerpo`
--
ALTER TABLE `cuerpo`
  ADD PRIMARY KEY (`Id_Cuerpo`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`Id_Servicio`);

--
-- Indices de la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD KEY `fk_Idseis` (`Id_servicio`),
  ADD KEY `fk_Idsiete` (`Id_Soldado`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`Id_Soldado`),
  ADD KEY `fk_Iduno` (`Id_cuartel1`),
  ADD KEY `fk_Iddos` (`Id_cuerpo1`),
  ADD KEY `fk_Idtres` (`Id_Compañia1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañia`
--
ALTER TABLE `compañia`
  MODIFY `Id_Compañia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuartel`
--
ALTER TABLE `cuartel`
  MODIFY `Id_Cuartel` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpo`
--
ALTER TABLE `cuerpo`
  MODIFY `Id_Cuerpo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `Id_Servicio` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `Id_Soldado` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuartel_compañia`
--
ALTER TABLE `cuartel_compañia`
  ADD CONSTRAINT `fk_Idcinco` FOREIGN KEY (`Id_Cuartel`) REFERENCES `cuartel` (`Id_Cuartel`),
  ADD CONSTRAINT `fk_Idcuatro` FOREIGN KEY (`Id_Compañia`) REFERENCES `compañia` (`Id_Compañia`);

--
-- Filtros para la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD CONSTRAINT `fk_Idseis` FOREIGN KEY (`Id_servicio`) REFERENCES `servicio` (`Id_Servicio`),
  ADD CONSTRAINT `fk_Idsiete` FOREIGN KEY (`Id_Soldado`) REFERENCES `soldado` (`Id_Soldado`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_Iddos` FOREIGN KEY (`Id_cuerpo1`) REFERENCES `cuerpo` (`Id_Cuerpo`),
  ADD CONSTRAINT `fk_Idtres` FOREIGN KEY (`Id_Compañia1`) REFERENCES `compañia` (`Id_Compañia`),
  ADD CONSTRAINT `fk_Iduno` FOREIGN KEY (`Id_cuartel1`) REFERENCES `cuartel` (`Id_Cuartel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
