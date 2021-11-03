-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2021 a las 16:14:30
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c4b7grupo1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `idUsuario` int(11) NOT NULL,
  `idCitas` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idCitas` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idMedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idCitas`, `idUsuario`, `fecha`, `idMedico`) VALUES
(1, 1, '2021-08-10', 3),
(2, 2, '2021-10-30', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL,
  `nombreMedicamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`idMedicamento`, `nombreMedicamento`) VALUES
(1, 'Ibuprofeno'),
(2, 'Aspirina'),
(3, 'Diclofenalco'),
(6, 'Clonazepam'),
(7, 'Teccardin'),
(8, 'Natsulin'),
(9, 'Aspirina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `idMedico` int(11) NOT NULL,
  `nombreMedico` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`idMedico`, `nombreMedico`, `especialidad`, `contrasenia`) VALUES
(1, 'Luis Pedro Alvarado', 'General', 'gato0'),
(2, 'Maria Fernanda Perez', 'Neurologia', 'gato1'),
(3, 'Carolina Gutierrez', 'General', 'Perro5'),
(4, 'Juliana Medellin', 'Terapia', 'gatico5021'),
(5, 'Luciana Ferrer', 'Terapia', 'raton1452');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(100) NOT NULL,
  `tipoDocumento` varchar(100) NOT NULL,
  `documentoUsuario` varchar(100) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `tipoPerfil` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `tipoDocumento`, `documentoUsuario`, `contrasenia`, `tipoPerfil`, `edad`) VALUES
(1, 'Johanna Rincon', 'CC', '80544689', '0000', 'PACIENTE', 40),
(2, 'Cesar Rodriguez', 'CC', '80563489', '0000', 'PACIENTE', 35),
(3, 'Catalina arciniegas', 'TI', '1456897545', '0000', 'PACIENTE', 71),
(4, 'Magdalena Pineda', 'CC', '53058695', '0000', 'SECRETARIA', 0),
(5, 'Mario Martinez', 'CC', '80545322', '0000', 'GUARDIA', 22),
(6, 'Tatiana Santamaria', 'TI', '145687952', '0000', 'PACIENTE', 14),
(7, 'null', '\"CC\"', '\"55669988\"', '\"0000\"', '\"PACIENTE\"', 55),
(8, '\"Rosalba Rincon\"', '\"CC\"', '\"85475566\"', '\"0000\"', '\"PACIENTE\"', 65),
(9, '\"Rosalba Rincon\"', '\"CC\"', '\"85475566\"', '\"0000\"', '\"PACIENTE\"', 65),
(10, 'null', 'CC', '55669988', '0000', 'PACIENTE', 84),
(11, 'Sonia Gamboa', 'CC', '53086547', '0000', 'PACIENTE', 25);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD KEY `asignacion_FK` (`idUsuario`),
  ADD KEY `asignacion_FK_1` (`idCitas`),
  ADD KEY `asignacion_FK_2` (`idMedicamento`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idCitas`),
  ADD KEY `citas_FK` (`idUsuario`),
  ADD KEY `citas_FK_1` (`idMedico`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idMedicamento`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`idMedico`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idCitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `idMedico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `asignacion_FK_1` FOREIGN KEY (`idCitas`) REFERENCES `citas` (`idCitas`),
  ADD CONSTRAINT `asignacion_FK_2` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamento` (`idMedicamento`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `citas_FK_1` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
