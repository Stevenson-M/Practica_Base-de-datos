-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: notasdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Musica'),(2,'trabajo'),(3,'Ocio'),(4,'Tareas'),(5,'Lugares'),(6,'Comestibles'),(7,'Peliculas'),(8,'Series'),(9,'Citas'),(10,'Compras');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `Id_Nota` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `FechaModificacion` date NOT NULL,
  `Descripcion` text NOT NULL,
  `Mecanismo` varchar(45) NOT NULL,
  `Accion` varchar(45) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`Id_Nota`,`Id_Usuario`),
  KEY `fk_Notas_Usuarios1_idx` (`Id_Usuario`),
  CONSTRAINT `fk_Notas_Usuarios1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Escuchar','2010-01-01','0000-00-00','Escuchar el nuevo album de Harlow','Borrable','Crear Nota',1),(2,'Terminar Informe','2010-05-01','2010-05-09','Terminar informe de contabilidad','No Borrable','Editar Nota',1),(3,'Comprar Consola','2010-02-02','2010-02-12','Comprar xbox series x','Borrable','Editar Nota',2),(4,'Comprar Juego','2010-01-02','0000-00-00','Comprar juegos para el pc','No Borrable','Crear Nota',3),(5,'Game Of Trones','2010-06-03','0000-00-00','Terminar de ver el ultimo capitulo de game of trhones','No Borrable','Crear Nota',2),(6,'Liga De La Justicia','2010-02-06','0000-00-00','Ver la version extendida de la pelicula','Borrable','Crear Nota',5),(7,'Contactar Jefe','2010-03-04','2010-03-20','Enviar correco electronico a mi jefe','Borrable','Borrar Nota',2),(8,'Llamar Proveedor','2010-02-04','0000-00-00','Contactar proveedor para pedir mas insumos','Borrable','Crear Nota',3),(9,'Compra Carne','2010-03-20','2010-03-20','Comprar carne para cena del viernes','Borrable','Borrar Nota',7),(10,'Cita Medica','2010-03-20','2010-03-25','Recordar cita medica el sabado','No Borrable','Editar Nota',6);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_has_categorias`
--

DROP TABLE IF EXISTS `notas_has_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_has_categorias` (
  `Id_NotasCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Nota` int(11) NOT NULL,
  `Id_Categoria` int(11) NOT NULL,
  PRIMARY KEY (`Id_NotasCategorias`,`Id_Nota`,`Id_Categoria`),
  KEY `fk_Notas_has_Categorias_Categorias1_idx` (`Id_Categoria`),
  KEY `fk_Notas_has_Categorias_Notas_idx` (`Id_Nota`),
  CONSTRAINT `fk_Notas_has_Categorias_Categorias1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categorias` (`Id_Categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Notas_has_Categorias_Notas` FOREIGN KEY (`Id_Nota`) REFERENCES `notas` (`Id_Nota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_has_categorias`
--

LOCK TABLES `notas_has_categorias` WRITE;
/*!40000 ALTER TABLE `notas_has_categorias` DISABLE KEYS */;
INSERT INTO `notas_has_categorias` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,3),(5,5,8),(6,6,7),(7,7,2),(8,8,2),(9,9,5),(10,10,6);
/*!40000 ALTER TABLE `notas_has_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(85) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Usuario`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'ABARCA INGRID','iabarcae@yahoo.es'),(2,'ABRIGO IGNACIO','Sb.nashxo.sk8@hotmail.com'),(3,'ABUMOHOR FRANCISCA','fran.afull@live.cl'),(4,'AGUILERA LUIS ','capitanaguilera@hotmail.com	'),(5,'ALAMOS ANDREA ','apalamosg@hotmail.com	'),(6,'ANGULO CRISTIAN ','kristian_siempre_azul@hotmail.com	'),(7,'ARANCIBIA MARTA ','martacam2002@yahoo.com'),(8,'ARELLANO JOSEFINA ','bad.girl.-@hotmail.es'),(9,'ARMSTRONG ELIZABETH','elizabetharmstrong39@gmail.com	'),(10,'BARRERA JORGE ','jbarrera05@hotmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'notasdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-09 14:44:47
