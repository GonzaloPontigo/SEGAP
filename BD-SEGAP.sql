-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: SEGAP
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrador` (
  `id_admin` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `contraseña_admin` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_admin` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alumno`
--

DROP TABLE IF EXISTS `Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumno` (
  `id_alumno` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `orden` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contraseña_alumno` varchar(10) CHARACTER SET utf8 NOT NULL,
  `correo_alumno` varchar(255) CHARACTER SET utf8 NOT NULL,
  `id_admin` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `id_admin_idx` (`id_admin`),
  CONSTRAINT `id_admin` FOREIGN KEY (`id_admin`) REFERENCES `Administrador` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno`
--

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alumno_Asignatura`
--

DROP TABLE IF EXISTS `Alumno_Asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumno_Asignatura` (
  `id_alumnos` smallint(5) unsigned NOT NULL,
  `id_asignaturas` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_alumnos`,`id_asignaturas`),
  KEY `id_asignatura_idx` (`id_asignaturas`),
  CONSTRAINT `id_alumnos` FOREIGN KEY (`id_alumnos`) REFERENCES `Alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_asignaturas` FOREIGN KEY (`id_asignaturas`) REFERENCES `Asignatura` (`id_asignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno_Asignatura`
--

LOCK TABLES `Alumno_Asignatura` WRITE;
/*!40000 ALTER TABLE `Alumno_Asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumno_Asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asignatura`
--

DROP TABLE IF EXISTS `Asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignatura` (
  `id_asignatura` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sigla_asignatura` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_asignatura` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `id_admins` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_asignatura`),
  KEY `id_admin_idx` (`id_admins`),
  CONSTRAINT `id_admins` FOREIGN KEY (`id_admins`) REFERENCES `Administrador` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignatura`
--

LOCK TABLES `Asignatura` WRITE;
/*!40000 ALTER TABLE `Asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Encuesta`
--

DROP TABLE IF EXISTS `Encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Encuesta` (
  `resultado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_alumno` smallint(5) unsigned NOT NULL,
  KEY `id_alumno_idx` (`id_alumno`),
  CONSTRAINT `id_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `Alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Encuesta`
--

LOCK TABLES `Encuesta` WRITE;
/*!40000 ALTER TABLE `Encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Material` (
  `id_contenido` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_contenido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_asignatura` smallint(5) unsigned NOT NULL,
  `id_profesor` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_contenido`),
  KEY `id_asignatura_idx` (`id_asignatura`),
  KEY `id_profesor_idx` (`id_profesor`),
  CONSTRAINT `id_asignatura` FOREIGN KEY (`id_asignatura`) REFERENCES `Asignatura` (`id_asignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `Profesor` (`id_profesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Material`
--

LOCK TABLES `Material` WRITE;
/*!40000 ALTER TABLE `Material` DISABLE KEYS */;
/*!40000 ALTER TABLE `Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesor`
--

DROP TABLE IF EXISTS `Profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesor` (
  `id_profesor` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_profesor` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `correo_profesor` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `contrasela_profesor` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesor`
--

LOCK TABLES `Profesor` WRITE;
/*!40000 ALTER TABLE `Profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-11 23:38:16
