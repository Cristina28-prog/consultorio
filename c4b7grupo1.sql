-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: c4b7grupo1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion` (
  `idCitas` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  KEY `asignacion_FK_1` (`idCitas`),
  KEY `asignacion_FK_2` (`idMedicamento`),
  CONSTRAINT `asignacion_FK_1` FOREIGN KEY (`idCitas`) REFERENCES `citas` (`idCitas`),
  CONSTRAINT `asignacion_FK_2` FOREIGN KEY (`idMedicamento`) REFERENCES `medicamento` (`idMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (3,1),(6,2),(6,3),(5,3),(7,14),(8,10),(6,1),(9,10);
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas` (
  `idCitas` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idMedico` int(11) NOT NULL,
  PRIMARY KEY (`idCitas`),
  KEY `citas_FK` (`idUsuario`),
  KEY `citas_FK_1` (`idMedico`),
  CONSTRAINT `citas_FK` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `citas_FK_1` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (3,5,'2021-10-31',2),(4,14,'2021-11-02',7),(5,14,'2021-05-05',5),(6,14,'2021-04-01',7),(7,18,'2021-11-20',7),(8,18,'2021-11-21',5),(9,6,'2021-11-25',2);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMedicamento` varchar(100) NOT NULL,
  PRIMARY KEY (`idMedicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'Ibuprofeno'),(2,'Aspirina'),(3,'Diclofenalco'),(6,'Clonazepam'),(7,'Teccardin'),(8,'Natsulin'),(10,'Clozapina'),(14,'Tramadol'),(15,'Aspirineta'),(16,'Aspirina'),(17,'Insulina');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `idMedico` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMedico` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMedico`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Luis Pedro Alvarado','General','gato001','$Luis1'),(2,'Maria Fernanda Perez','Pediatria','gato51','$Maria2'),(3,'Juliana Medellin','General','gatico5021','$Juliana3'),(5,'Luciana Ferrer','Terapia','raton1452','$Luciana5'),(7,'Juan Pablo Rodriguez','Cardiologia','aufbiedenssen45','$Juan7'),(8,'Ricardo Contreras','General','loros4568','$Ricardo8');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) NOT NULL,
  `tipoDocumento` varchar(100) NOT NULL,
  `documentoUsuario` varchar(100) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `tipoPerfil` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Johanna Rincon','CC','80544689','0000','ADMINISTRADOR',40,'Johanna1'),(2,'Cesar Rodriguez','CC','80563489','0000','SECRETARIA',35,'Cesar2'),(3,'Catalina arciniegas','CC','35896547','0000','SECRETARIA',50,'Catalina3'),(4,'Magdalena Pineda','CC','53058695','0000','PACIENTE',45,'Magdalena4'),(5,'Mario Martinez','CC','80545322','0000','PACIENTE',22,'Mario5'),(6,'Tatiana Santamaria','TI','145687952','0000','PACIENTE',14,'Tatiana6'),(14,'Serafina Luna','CC','55669988','0000','Serafina14',56,'Serafina14'),(18,'Tom York','CE','456987423','0000','PACIENTE',54,'Tom18'),(20,'Matias de Jesus Rojas','TI','148569874','0000','PACIENTE',13,'Matias20'),(22,'Valentina Mantilla','TI','1456235879','0000','Valentina22',2,'Valentina22'),(23,'Socorro Martinez','CC','37568945','0000','PACIENTE',81,'Socorro23'),(24,'Alonso Rodriguez Luna','CC','90256478','0000','PACIENTE',63,'Alonso24'),(25,'Saul Gamboa','CC','56487965','0000','PACIENTE',64,'Saul25'),(27,'Juliana Maria Romero','CC','56457896','0000','PACIENTE',21,'Juliana27'),(28,'Ana Fernanda Ramirez','CC','54896547','0000','PACIENTE',55,'Ana27');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'c4b7grupo1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-16 22:26:21
