-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 07:47 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gastroweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
--

CREATE TABLE `articulos` (
  `EAN` int(10) UNSIGNED NOT NULL,
  `nomArticulo` varchar(45) NOT NULL,
  `idSubGruArticulo` int(11) NOT NULL,
  `idMarcaArticulo` int(11) NOT NULL,
  `idPropiedad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bebidas`
--

CREATE TABLE `bebidas` (
  `EAN` int(10) UNSIGNED NOT NULL,
  `preBebida` int(11) NOT NULL,
  `volumen` char(15) NOT NULL,
  `tipBebida` enum('alcolica','no alcolica') NOT NULL,
  `idMarcaArticulo` int(11) NOT NULL,
  `codDescuento` smallint(5) UNSIGNED NOT NULL,
  `idEstado` tinyint(4) NOT NULL,
  `idPropiedad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comensales`
--

CREATE TABLE `comensales` (
  `idComensal` int(11) NOT NULL,
  `priNombre` varchar(40) NOT NULL,
  `segNombre` varchar(40) DEFAULT NULL,
  `terNombre` varchar(30) DEFAULT NULL,
  `priApellido` varchar(30) NOT NULL,
  `segApellido` varchar(30) DEFAULT NULL,
  `genero` enum('Hombre','Mujer') NOT NULL,
  `idIdentificacion` int(10) UNSIGNED NOT NULL,
  `idRoles` tinyint(4) NOT NULL,
  `idContacto` int(11) NOT NULL,
  `conComensales` varchar(15) DEFAULT NULL,
  `usuComensal` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactos`
--

CREATE TABLE `contactos` (
  `idContacto` int(11) NOT NULL,
  `numContacto` char(10) NOT NULL,
  `IdEstado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` tinyint(50) NOT NULL,
  `nomDepaartamento` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `descuentos`
--

CREATE TABLE `descuentos` (
  `codDescuento` smallint(5) UNSIGNED NOT NULL,
  `porcentaje` tinyint(100) NOT NULL,
  `fecIniDescuento` datetime NOT NULL,
  `fecFinPorcentaje` varchar(45) NOT NULL,
  `idEstado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `direcciones`
--

CREATE TABLE `direcciones` (
  `idDireccion` tinyint(4) NOT NULL,
  `carrera` varchar(15) DEFAULT NULL,
  `calle` varchar(15) DEFAULT NULL,
  `kilometraje` varchar(15) DEFAULT NULL,
  `avenida` varchar(15) DEFAULT NULL,
  `autopista` varchar(15) DEFAULT NULL,
  `trasversal` varchar(15) DEFAULT NULL,
  `via` varchar(15) DEFAULT NULL,
  `idDepartamento` tinyint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` smallint(5) UNSIGNED NOT NULL,
  `codEmpleado` smallint(5) UNSIGNED NOT NULL,
  `conUsuario` varchar(45) NOT NULL,
  `corUsuario` varchar(45) NOT NULL,
  `sueEmpleados` int(10) UNSIGNED NOT NULL,
  `idComensal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

CREATE TABLE `estados` (
  `idEstado` tinyint(4) NOT NULL,
  `nomEstado` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estados`
--

INSERT INTO `estados` (`idEstado`, `nomEstado`, `descripcion`) VALUES
(1, 'activo', 'válido o disponible para su uso'),
(2, 'desactivado', 'deshabilitado o no es válido');

-- --------------------------------------------------------

--
-- Table structure for table `gruposarticulos`
--

CREATE TABLE `gruposarticulos` (
  `idGruArticulo` tinyint(50) NOT NULL,
  `nomGruArtuculo` enum('Carnes y Salsamentaria','Pescados y mariscos','Avez y Cazas','Lacteos Distribuidos','Frutas y Verduras','Lacteos no Distribuidos''Enlatados y Envalsados','Granos') NOT NULL,
  `siglas` enum('CS','PM','AC','LI','FV','L2','EE','G') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `historialempleados`
--

CREATE TABLE `historialempleados` (
  `idHisEmpleado` int(11) NOT NULL,
  `fecEntrada` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecSalida` datetime DEFAULT NULL,
  `motivoSalida` varchar(255) DEFAULT NULL,
  `Empleados_codEmpleado` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `historicocontactos`
--

CREATE TABLE `historicocontactos` (
  `idHisContacto` int(11) NOT NULL,
  `idContacto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `identificaciones`
--

CREATE TABLE `identificaciones` (
  `idIdentificacion` int(10) UNSIGNED NOT NULL,
  `numIdentificacion` int(10) UNSIGNED NOT NULL,
  `sigla` enum('CC','TI','CE','PP') NOT NULL DEFAULT 'CC'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `marcasarticulos`
--

CREATE TABLE `marcasarticulos` (
  `idMarcaArticulo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `municipios`
--

CREATE TABLE `municipios` (
  `idMunicipio` smallint(5) UNSIGNED NOT NULL,
  `codMunicipio` smallint(5) UNSIGNED NOT NULL,
  `nomMunicipio` varchar(35) NOT NULL,
  `idProvincia` smallint(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `plazas`
--

CREATE TABLE `plazas` (
  `idPlaza` tinyint(30) NOT NULL,
  `nomPlaza` varchar(45) NOT NULL,
  `idEstado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plazas`
--

INSERT INTO `plazas` (`idPlaza`, `nomPlaza`, `idEstado`) VALUES
(2, '', 1),
(19, 'plaza bar', 1),
(20, 'plazaeditada', 1),
(22, 'plaza bar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `propiedadesarticulos`
--

CREATE TABLE `propiedadesarticulos` (
  `idPropiedad` int(10) UNSIGNED NOT NULL,
  `lote` varchar(15) NOT NULL,
  `fecha_vencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE `provincias` (
  `idProvincia` smallint(200) NOT NULL,
  `nomProbincias` varchar(35) NOT NULL,
  `idDepartamento` tinyint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `idRol` tinyint(4) NOT NULL,
  `nomRol` varchar(45) NOT NULL,
  `tipRol` enum('Comensales','Empleados') NOT NULL DEFAULT 'Empleados',
  `Descripcion` varchar(45) NOT NULL,
  `IdEstado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subgruposarticulos`
--

CREATE TABLE `subgruposarticulos` (
  `idSubGruArticulo` int(11) NOT NULL,
  `nomSubGruArticulo` enum('Res','Ternera','Cerdo','Cordero','Salsamentaria','Pescado','Mariscos','Aves caza','Lacteos','Panes','Huevos','Verduras','Frutas','Queso','enlatados','Envalsados') NOT NULL,
  `idGruArticulo` tinyint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`EAN`),
  ADD UNIQUE KEY `idArticulo_UNIQUE` (`EAN`),
  ADD KEY `fk_Articulos_SubGruposArticulos1_idx` (`idSubGruArticulo`),
  ADD KEY `fk_Articulos_MarcasArticulos1_idx` (`idMarcaArticulo`),
  ADD KEY `fk_Articulos_PropiedadesArticulo1` (`idPropiedad`);

--
-- Indexes for table `bebidas`
--
ALTER TABLE `bebidas`
  ADD PRIMARY KEY (`EAN`),
  ADD UNIQUE KEY `codBebida_UNIQUE` (`EAN`),
  ADD KEY `fk_Bebidas_Descuentos1_idx` (`codDescuento`),
  ADD KEY `fk_Bebidas_MarcasArticulos1_idx` (`idMarcaArticulo`),
  ADD KEY `fk_Bebidas_Estados1_idx` (`idEstado`),
  ADD KEY `fk_Bebidas_PropiedadesArticulo1` (`idPropiedad`);

--
-- Indexes for table `comensales`
--
ALTER TABLE `comensales`
  ADD PRIMARY KEY (`idComensal`),
  ADD KEY `idx_fk_idIdentificacion` (`idIdentificacion`),
  ADD KEY `idx_fk_idRoles` (`idRoles`),
  ADD KEY `idx_fk_idContacto` (`idContacto`);

--
-- Indexes for table `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`idContacto`),
  ADD KEY `fk_Contactos_IdEstado` (`IdEstado`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD KEY `idx_Roles_nomDepaartamento` (`nomDepaartamento`);

--
-- Indexes for table `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`codDescuento`),
  ADD UNIQUE KEY `codDescuento_UNIQUE` (`codDescuento`),
  ADD KEY `fk_Descuentos_Estados1` (`idEstado`);

--
-- Indexes for table `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`idDireccion`),
  ADD KEY `fk_direcciones_Departamentos1_idx` (`idDepartamento`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `codEmpleado` (`codEmpleado`),
  ADD KEY `idx_Empleados_codEmpleado` (`codEmpleado`),
  ADD KEY `idx_fk_idComensal` (`idComensal`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`),
  ADD KEY `idx_Estados_nomEstado` (`nomEstado`);

--
-- Indexes for table `gruposarticulos`
--
ALTER TABLE `gruposarticulos`
  ADD PRIMARY KEY (`idGruArticulo`),
  ADD KEY `idx_idGruArticulo` (`idGruArticulo`);

--
-- Indexes for table `historialempleados`
--
ALTER TABLE `historialempleados`
  ADD PRIMARY KEY (`idHisEmpleado`,`Empleados_codEmpleado`),
  ADD KEY `fk_HistorialEmpleados_Empleados1_idx` (`Empleados_codEmpleado`);

--
-- Indexes for table `historicocontactos`
--
ALTER TABLE `historicocontactos`
  ADD PRIMARY KEY (`idHisContacto`),
  ADD KEY `fk_HistoricoContactos_idContacto` (`idContacto`);

--
-- Indexes for table `identificaciones`
--
ALTER TABLE `identificaciones`
  ADD PRIMARY KEY (`idIdentificacion`),
  ADD UNIQUE KEY `numIdentificacion` (`numIdentificacion`),
  ADD KEY `idx_Identificaciones_numIdentificacion` (`numIdentificacion`);

--
-- Indexes for table `marcasarticulos`
--
ALTER TABLE `marcasarticulos`
  ADD PRIMARY KEY (`idMarcaArticulo`);

--
-- Indexes for table `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idMunicipio`),
  ADD KEY `fk_Municipios_Provincias1_idx` (`idProvincia`);

--
-- Indexes for table `plazas`
--
ALTER TABLE `plazas`
  ADD PRIMARY KEY (`idPlaza`),
  ADD KEY `fk_Plazas_Estados1_idx` (`idEstado`);

--
-- Indexes for table `propiedadesarticulos`
--
ALTER TABLE `propiedadesarticulos`
  ADD PRIMARY KEY (`idPropiedad`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idProvincia`),
  ADD KEY `fk_Probincias_Departamentos1_idx` (`idDepartamento`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`),
  ADD KEY `idx_Roles_nomRol` (`nomRol`),
  ADD KEY `fk_Roles_IdEstado` (`IdEstado`);

--
-- Indexes for table `subgruposarticulos`
--
ALTER TABLE `subgruposarticulos`
  ADD PRIMARY KEY (`idSubGruArticulo`),
  ADD KEY `fk_SubGruposArticulos_GruposArticulos1_idx` (`idGruArticulo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comensales`
--
ALTER TABLE `comensales`
  MODIFY `idComensal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactos`
--
ALTER TABLE `contactos`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` tinyint(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `idDireccion` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstado` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `historialempleados`
--
ALTER TABLE `historialempleados`
  MODIFY `idHisEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historicocontactos`
--
ALTER TABLE `historicocontactos`
  MODIFY `idHisContacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identificaciones`
--
ALTER TABLE `identificaciones`
  MODIFY `idIdentificacion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipios`
--
ALTER TABLE `municipios`
  MODIFY `idMunicipio` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plazas`
--
ALTER TABLE `plazas`
  MODIFY `idPlaza` tinyint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `propiedadesarticulos`
--
ALTER TABLE `propiedadesarticulos`
  MODIFY `idPropiedad` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idProvincia` smallint(200) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subgruposarticulos`
--
ALTER TABLE `subgruposarticulos`
  MODIFY `idSubGruArticulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `fk_Articulos_ArticuloMarca1` FOREIGN KEY (`idMarcaArticulo`) REFERENCES `marcasarticulos` (`idMarcaArticulo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Articulos_PropiedadesArticulo1` FOREIGN KEY (`idPropiedad`) REFERENCES `propiedadesarticulos` (`idPropiedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Articulos_SubGruposArticulos1` FOREIGN KEY (`idSubGruArticulo`) REFERENCES `subgruposarticulos` (`idSubGruArticulo`) ON UPDATE CASCADE;

--
-- Constraints for table `bebidas`
--
ALTER TABLE `bebidas`
  ADD CONSTRAINT `fk_Bebidas_Descuentos1` FOREIGN KEY (`codDescuento`) REFERENCES `descuentos` (`codDescuento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Bebidas_Estados1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Bebidas_MarcasArticulos1` FOREIGN KEY (`idMarcaArticulo`) REFERENCES `marcasarticulos` (`idMarcaArticulo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Bebidas_PropiedadesArticulo1` FOREIGN KEY (`idPropiedad`) REFERENCES `propiedadesarticulos` (`idPropiedad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comensales`
--
ALTER TABLE `comensales`
  ADD CONSTRAINT `comensales_ibfk_1` FOREIGN KEY (`idIdentificacion`) REFERENCES `identificaciones` (`idIdentificacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comensales_ibfk_2` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comensales_ibfk_3` FOREIGN KEY (`idContacto`) REFERENCES `contactos` (`idContacto`) ON UPDATE CASCADE;

--
-- Constraints for table `contactos`
--
ALTER TABLE `contactos`
  ADD CONSTRAINT `fk_Contactos_IdEstado` FOREIGN KEY (`IdEstado`) REFERENCES `estados` (`idEstado`) ON UPDATE CASCADE;

--
-- Constraints for table `descuentos`
--
ALTER TABLE `descuentos`
  ADD CONSTRAINT `fk_Descuentos_Estados1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`);

--
-- Constraints for table `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `fk_direcciones_Departamentos1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`) ON UPDATE CASCADE;

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idComensal`) REFERENCES `comensales` (`idComensal`) ON UPDATE CASCADE;

--
-- Constraints for table `historialempleados`
--
ALTER TABLE `historialempleados`
  ADD CONSTRAINT `fk_HistorialEmpleados_Empleados1` FOREIGN KEY (`Empleados_codEmpleado`) REFERENCES `empleados` (`codEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `historicocontactos`
--
ALTER TABLE `historicocontactos`
  ADD CONSTRAINT `fk_HistoricoContactos_idContacto` FOREIGN KEY (`idContacto`) REFERENCES `contactos` (`idContacto`) ON UPDATE CASCADE;

--
-- Constraints for table `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_Municipios_Provincias1` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`idProvincia`) ON UPDATE CASCADE;

--
-- Constraints for table `plazas`
--
ALTER TABLE `plazas`
  ADD CONSTRAINT `fk_Plazas_Estados1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`) ON UPDATE CASCADE;

--
-- Constraints for table `provincias`
--
ALTER TABLE `provincias`
  ADD CONSTRAINT `fk_Probincias_Departamentos1` FOREIGN KEY (`idDepartamento`) REFERENCES `departamentos` (`idDepartamento`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `fk_Roles_IdEstado` FOREIGN KEY (`IdEstado`) REFERENCES `estados` (`idEstado`) ON UPDATE CASCADE;

--
-- Constraints for table `subgruposarticulos`
--
ALTER TABLE `subgruposarticulos`
  ADD CONSTRAINT `fk_SubGruposArticulos_GruposArticulos1` FOREIGN KEY (`idGruArticulo`) REFERENCES `gruposarticulos` (`idGruArticulo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
