-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2025 a las 15:05:39
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
-- Base de datos: `futbolitoz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `id_asig` int(11) NOT NULL,
  `id_F` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `HrEnt` timestamp NOT NULL DEFAULT current_timestamp(),
  `HrSa` timestamp NOT NULL DEFAULT current_timestamp(),
  `PltsE` int(2) NOT NULL,
  `PltsS` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_det`
--

CREATE TABLE `corte_det` (
  `id_cortdet` int(11) NOT NULL,
  `id_F` int(11) NOT NULL,
  `acumulado` int(5) NOT NULL,
  `id_cort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_gen`
--

CREATE TABLE `corte_gen` (
  `id_cort` int(11) NOT NULL,
  `total` int(10) NOT NULL,
  `F_H` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dam_rep`
--

CREATE TABLE `dam_rep` (
  `id_rep` int(11) NOT NULL,
  `id_F` int(11) NOT NULL,
  `HrSa` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `manija1` tinyint(1) DEFAULT NULL,
  `manija2` tinyint(1) DEFAULT NULL,
  `manija3` tinyint(1) DEFAULT NULL,
  `manija4` tinyint(1) DEFAULT NULL,
  `manija5` tinyint(1) DEFAULT NULL,
  `manija6` tinyint(1) DEFAULT NULL,
  `manija7` tinyint(1) DEFAULT NULL,
  `manija8` tinyint(1) DEFAULT NULL,
  `Piston1` tinyint(1) DEFAULT NULL,
  `Piston2` tinyint(1) DEFAULT NULL,
  `Piston3` tinyint(1) DEFAULT NULL,
  `Piston4` tinyint(1) DEFAULT NULL,
  `Piston5` tinyint(1) DEFAULT NULL,
  `Piston6` tinyint(1) DEFAULT NULL,
  `Piston7` tinyint(1) DEFAULT NULL,
  `Piston8` tinyint(1) DEFAULT NULL,
  `seguro` tinyint(1) DEFAULT NULL,
  `resorte` tinyint(1) DEFAULT NULL,
  `tragamonedas` tinyint(1) DEFAULT NULL,
  `tabla_prin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `futbolito`
--

CREATE TABLE `futbolito` (
  `id_F` int(11) NOT NULL,
  `EdoFis` blob DEFAULT NULL,
  `Ocupado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `matricula` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id_asig`),
  ADD KEY `id_F` (`id_F`),
  ADD KEY `matricula` (`matricula`);

--
-- Indices de la tabla `corte_det`
--
ALTER TABLE `corte_det`
  ADD PRIMARY KEY (`id_cortdet`),
  ADD KEY `id_cort` (`id_cort`);

--
-- Indices de la tabla `corte_gen`
--
ALTER TABLE `corte_gen`
  ADD PRIMARY KEY (`id_cort`);

--
-- Indices de la tabla `dam_rep`
--
ALTER TABLE `dam_rep`
  ADD PRIMARY KEY (`id_rep`),
  ADD KEY `id_F` (`id_F`);

--
-- Indices de la tabla `futbolito`
--
ALTER TABLE `futbolito`
  ADD PRIMARY KEY (`id_F`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id_asig` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `corte_det`
--
ALTER TABLE `corte_det`
  MODIFY `id_cortdet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `corte_gen`
--
ALTER TABLE `corte_gen`
  MODIFY `id_cort` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dam_rep`
--
ALTER TABLE `dam_rep`
  MODIFY `id_rep` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `futbolito`
--
ALTER TABLE `futbolito`
  MODIFY `id_F` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`id_F`) REFERENCES `futbolito` (`id_F`),
  ADD CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`matricula`) REFERENCES `user` (`matricula`);

--
-- Filtros para la tabla `corte_det`
--
ALTER TABLE `corte_det`
  ADD CONSTRAINT `corte_det_ibfk_1` FOREIGN KEY (`id_cort`) REFERENCES `corte_gen` (`id_cort`);

--
-- Filtros para la tabla `dam_rep`
--
ALTER TABLE `dam_rep`
  ADD CONSTRAINT `dam_rep_ibfk_1` FOREIGN KEY (`id_F`) REFERENCES `futbolito` (`id_F`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
