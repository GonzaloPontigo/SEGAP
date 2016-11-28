-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: SEGAP-USM
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
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ad` varchar(30) NOT NULL,
  `mail_ad` varchar(255) NOT NULL,
  `clave_ad` char(60) NOT NULL,
  PRIMARY KEY (`idAdministrador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Alumno`
--

DROP TABLE IF EXISTS `Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumno` (
  `idAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `nom_al` varchar(30) NOT NULL,
  `apell_al` varchar(30) NOT NULL,
  `grupo_al` varchar(5) NOT NULL,
  `clave_al` char(60) NOT NULL,
  `mail_al` varchar(255) NOT NULL,
  PRIMARY KEY (`idAlumno`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Asignatura`
--

DROP TABLE IF EXISTS `Asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignatura` (
  `idAsignatura` varchar(10) NOT NULL,
  `nom_asig` varchar(55) NOT NULL,
  `Contenido_idContenido` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAsignatura`),
  KEY `fk_Asignatura_Contenido_idx` (`Contenido_idContenido`),
  CONSTRAINT `fk_Asignatura_a_Contenido` FOREIGN KEY (`Contenido_idContenido`) REFERENCES `Contenido` (`idContenido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Asignatura_Alumno`
--

DROP TABLE IF EXISTS `Asignatura_Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignatura_Alumno` (
  `Asignatura_idAsignatura` varchar(10) NOT NULL,
  `Alumno_idAlumno` int(11) NOT NULL,
  PRIMARY KEY (`Asignatura_idAsignatura`,`Alumno_idAlumno`),
  KEY `fk_Asignatura_has_Alumno_Alumnos_idx` (`Alumno_idAlumno`),
  KEY `fk_Asignatura_has_Alumno_Asignaturas_idx` (`Asignatura_idAsignatura`),
  CONSTRAINT `fk_Asignatura_has_Alumno_Alumno1` FOREIGN KEY (`Alumno_idAlumno`) REFERENCES `Alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignatura_has_Alumno_Asignatura` FOREIGN KEY (`Asignatura_idAsignatura`) REFERENCES `Asignatura` (`idAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Aula`
--

DROP TABLE IF EXISTS `Aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aula` (
  `idAula` int(11) NOT NULL,
  `nom_aul` varchar(30) DEFAULT NULL,
  `Administrador_idAdministrador` int(11) DEFAULT NULL,
  `Alumno_idAlumno` int(11) DEFAULT NULL,
  `Asignatura_idAsignatura` varchar(10) DEFAULT NULL,
  `Profesor_idProfesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAula`),
  UNIQUE KEY `idAula_UNIQUE` (`idAula`),
  KEY `fk_Aula_Alumno1_idx` (`Alumno_idAlumno`),
  KEY `fk_Aula_Asignatura1_idx` (`Asignatura_idAsignatura`),
  KEY `fk_Aula_Profesor1_idx` (`Profesor_idProfesor`),
  KEY `fk_Aula_Administrador1_idx` (`Administrador_idAdministrador`),
  CONSTRAINT `fk_Aula_Administrador1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `Administrador` (`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aula_Alumno1` FOREIGN KEY (`Alumno_idAlumno`) REFERENCES `Alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aula_Asignatura2` FOREIGN KEY (`Asignatura_idAsignatura`) REFERENCES `Asignatura` (`idAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aula_Profesor1` FOREIGN KEY (`Profesor_idProfesor`) REFERENCES `Profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Contenido`
--

DROP TABLE IF EXISTS `Contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contenido` (
  `idContenido` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cont` varchar(45) NOT NULL,
  PRIMARY KEY (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Profesor`
--

DROP TABLE IF EXISTS `Profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `nom_prof` varchar(30) NOT NULL,
  `apell_prof` varchar(30) NOT NULL,
  `mail_prof` varchar(255) NOT NULL,
  `clave_prof` char(60) NOT NULL,
  `Asignatura_idAsignatura` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProfesor`),
  KEY `fk_Profesor_Asignatura1_idx` (`Asignatura_idAsignatura`),
  CONSTRAINT `fk_Profesor_Asignatura1` FOREIGN KEY (`Asignatura_idAsignatura`) REFERENCES `Asignatura` (`idAsignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21 22:46:57
