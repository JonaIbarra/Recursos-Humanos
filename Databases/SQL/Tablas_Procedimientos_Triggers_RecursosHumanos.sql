-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: tablas_procedimientos_triggers_recursoshumanos
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento_puesto`
--

DROP TABLE IF EXISTS `departamento_puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento_puesto` (
  `Departamento_ID` int unsigned NOT NULL,
  `Puesto_ID` int unsigned NOT NULL,
  PRIMARY KEY (`Departamento_ID`,`Puesto_ID`),
  KEY `Puesto_ID` (`Puesto_ID`),
  CONSTRAINT `departamento_puesto_ibfk_1` FOREIGN KEY (`Departamento_ID`) REFERENCES `departamentos` (`ID`),
  CONSTRAINT `departamento_puesto_ibfk_2` FOREIGN KEY (`Puesto_ID`) REFERENCES `puesto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento_puesto`
--

LOCK TABLES `departamento_puesto` WRITE;
/*!40000 ALTER TABLE `departamento_puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento_puesto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamento_puesto_insert` AFTER INSERT ON `departamento_puesto` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "departamento_puesto", user(), 
       "Insert",
       CONCAT_WS(" ","Se ha agregado un nuevo departamento_puesto con el Departamento_ID:",
       NEW.Departamento_ID,", y el Puesto_ID:", NEW.Puesto_ID), 
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamento_puesto_before_update` BEFORE UPDATE ON `departamento_puesto` FOR EACH ROW BEGIN
    -- Puedes realizar aquí las validaciones necesarias antes de la actualización si las hay
    -- Por ejemplo, validar que los nuevos valores sean válidos.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamento_puesto_update` AFTER UPDATE ON `departamento_puesto` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "departamento_puesto", user(), 
       "Update",
       CONCAT_WS(" ","Se ha modificado el departamento_puesto con el Departamento_ID:", 
       OLD.Departamento_ID, "y el Puesto_ID:", OLD.Puesto_ID, "con los nuevos valores Departamento_ID:", 
       NEW.Departamento_ID, "y Puesto_ID:", NEW.Puesto_ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamento_puesto_delete` AFTER DELETE ON `departamento_puesto` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "departamento_puesto", user(), 
       "Delete",
       CONCAT_WS(" ","Se ha eliminado un registro de departamento_puesto con el Departamento_ID:", 
       OLD.Departamento_ID, "y el Puesto_ID:", OLD.Puesto_ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_insert` AFTER INSERT ON `departamentos` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "departamentos", user(), 
       "Insert",
       CONCAT_WS(" ","Se ha agregado un nuevo departamento con el ID:",
       NEW.ID,", Nombre:", NEW.Nombre,", Descripción:", NEW.Descripcion), 
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_before_update` BEFORE UPDATE ON `departamentos` FOR EACH ROW BEGIN
    -- Puedes realizar aquí las validaciones necesarias antes de la actualización si las hay
    -- Por ejemplo, validar que los nuevos valores sean válidos.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_update` AFTER UPDATE ON `departamentos` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "departamentos", user(), 
       "Update",
       CONCAT_WS(" ","Se ha modificado el departamento con el ID:", 
       OLD.ID, "con los nuevos valores Nombre:", 
       NEW.Nombre, "y Descripción:", NEW.Descripcion),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_departamentos_delete` AFTER DELETE ON `departamentos` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "departamentos", user(), 
       "Delete",
       CONCAT_WS(" ","Se ha eliminado un registro de departamento con el ID:", 
       OLD.ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `horario_personal`
--

DROP TABLE IF EXISTS `horario_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_personal` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Personal_ID` int unsigned DEFAULT NULL,
  `Fecha_inicio` date NOT NULL,
  `Dias_semana` varchar(50) DEFAULT NULL,
  `Turno` enum('Mañana','Tarde','Noche') NOT NULL,
  `Horario_entrada` varchar(20) NOT NULL,
  `Horario_salida` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Personal_ID` (`Personal_ID`),
  CONSTRAINT `horario_personal_ibfk_1` FOREIGN KEY (`Personal_ID`) REFERENCES `personal` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_personal`
--

LOCK TABLES `horario_personal` WRITE;
/*!40000 ALTER TABLE `horario_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_personal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_horario_personal_insert` AFTER INSERT ON `horario_personal` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "horario_personal", user(), 
       "Insert",
       CONCAT_WS(" ","Se ha agregado un nuevo registro en la tabla horario_personal con el ID:",
       NEW.ID,", Personal_ID:", NEW.Personal_ID, ", Fecha_inicio:", NEW.Fecha_inicio,
       ", Dias_semana:", NEW.Dias_semana, ", Turno:", NEW.Turno,
       ", Horario_entrada:", NEW.Horario_entrada, ", Horario_salida:", NEW.Horario_salida), 
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_horario_personal_before_update` BEFORE UPDATE ON `horario_personal` FOR EACH ROW BEGIN
    -- Puedes realizar aquí las validaciones necesarias antes de la actualización si las hay
    -- Por ejemplo, validar que los nuevos valores sean válidos.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_horario_personal_update` AFTER UPDATE ON `horario_personal` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "horario_personal", user(), 
       "Update",
       CONCAT_WS(" ","Se ha modificado un registro en la tabla horario_personal con el ID:", 
       OLD.ID, "con los nuevos valores Personal_ID:", 
       NEW.Personal_ID, ", Fecha_inicio:", NEW.Fecha_inicio, 
       ", Dias_semana:", NEW.Dias_semana, ", Turno:", NEW.Turno,
       ", Horario_entrada:", NEW.Horario_entrada, ", Horario_salida:", NEW.Horario_salida),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_horario_personal_delete` AFTER DELETE ON `horario_personal` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "horario_personal", user(), 
       "Delete",
       CONCAT_WS(" ","Se ha eliminado un registro en la tabla horario_personal con el ID:", 
       OLD.ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Persona_ID` int unsigned DEFAULT NULL,
  `Direccion` varchar(500) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Puesto_ID` int unsigned DEFAULT NULL,
  `Estatus` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`ID`),
  KEY `Puesto_ID` (`Puesto_ID`),
  KEY `Persona_ID` (`Persona_ID`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Puesto_ID`) REFERENCES `puesto` (`ID`),
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`Persona_ID`) REFERENCES `personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_personal_insert` AFTER INSERT ON `personal` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "personal", user(), 
       "Insert",
       CONCAT_WS(" ","Se ha agregado un nuevo registro en la tabla personal con el ID:",
       NEW.ID,", Persona_ID:", NEW.Persona_ID, ", Direccion:", NEW.Direccion,
       ", Telefono:", NEW.Telefono, ", Puesto_ID:", NEW.Puesto_ID, ", Estatus:", NEW.Estatus), 
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_personal_before_update` BEFORE UPDATE ON `personal` FOR EACH ROW BEGIN
    -- Validación: Verificar que el nuevo valor de Estatus sea 'activo' o 'inactivo'
    IF NEW.Estatus NOT IN ('activo', 'inactivo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El valor del campo Estatus debe ser "activo" o "inactivo".';
    END IF;
    
    -- Puedes agregar más validaciones según tus requisitos específicos aquí.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_personal_update` AFTER UPDATE ON `personal` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "personal", user(), 
       "Update",
       CONCAT_WS(" ","Se ha modificado un registro en la tabla personal con el ID:", 
       OLD.ID, "con los nuevos valores Persona_ID:", 
       NEW.Persona_ID, ", Direccion:", NEW.Direccion, 
       ", Telefono:", NEW.Telefono, ", Puesto_ID:", NEW.Puesto_ID,
       ", Estatus:", NEW.Estatus),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_personal_delete` AFTER DELETE ON `personal` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "personal", user(), 
       "Delete",
       CONCAT_WS(" ","Se ha eliminado un registro en la tabla personal con el ID:", 
       OLD.ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Requisitos` text,
  `Tipo_Contrato` varchar(50) DEFAULT NULL,
  `Salario_Minimo` decimal(10,2) DEFAULT NULL,
  `Salario_Maximo` decimal(10,2) DEFAULT NULL,
  `Estatus` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_puesto_insert` AFTER INSERT ON `puesto` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "puesto", user(), 
       "Insert",
       CONCAT_WS(" ","Se ha agregado un nuevo puesto con el ID:",
       NEW.ID,", Nombre:", NEW.Nombre, ", Descripción:", NEW.Descripcion,
       ", Requisitos:", NEW.Requisitos, ", Tipo_Contrato:", NEW.Tipo_Contrato,
       ", Salario_Minimo:", NEW.Salario_Minimo, ", Salario_Maximo:", NEW.Salario_Maximo,
       ", Estatus:", NEW.Estatus), 
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_puesto_before_update` BEFORE UPDATE ON `puesto` FOR EACH ROW BEGIN
    -- Validación: Verificar que el nuevo valor de Estatus sea 'activo' o 'inactivo'
    IF NEW.Estatus NOT IN ('activo', 'inactivo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El valor del campo Estatus debe ser "activo" o "inactivo".';
    END IF;

    -- Validación: Verificar que el salario mínimo no sea mayor que el salario máximo
    IF NEW.Salario_Minimo > NEW.Salario_Maximo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El salario mínimo no puede ser mayor que el salario máximo.';
    END IF;

    -- Puedes agregar más validaciones según tus requisitos específicos aquí.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_puesto_update` AFTER UPDATE ON `puesto` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "puesto", user(), 
       "Update",
       CONCAT_WS(" ","Se ha modificado un puesto con el ID:", 
       OLD.ID, "con los nuevos valores Nombre:", 
       NEW.Nombre, ", Descripción:", NEW.Descripcion,
       ", Requisitos:", NEW.Requisitos, ", Tipo_Contrato:", NEW.Tipo_Contrato,
       ", Salario_Minimo:", NEW.Salario_Minimo, ", Salario_Maximo:", NEW.Salario_Maximo,
       ", Estatus:", NEW.Estatus),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_puesto_delete` AFTER DELETE ON `puesto` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, "puesto", user(), 
       "Delete",
       CONCAT_WS(" ","Se ha eliminado un puesto con el ID:", 
       OLD.ID),
       NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'tablas_procedimientos_triggers_recursoshumanos'
--

--
-- Dumping routines for database 'tablas_procedimientos_triggers_recursoshumanos'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_direccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_direccion`() RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE tipo_via INT;
  DECLARE nombre_via VARCHAR(100);
  DECLARE numero_via INT;
  DECLARE colonia VARCHAR(50);
  DECLARE codigo_postal VARCHAR(5);
  DECLARE municipio VARCHAR(50);
  DECLARE estado VARCHAR(50);
  DECLARE pais VARCHAR(50);
  DECLARE direccion VARCHAR(255);

  SET tipo_via = FLOOR(RAND() * 3) + 1;
  SET nombre_via = CASE tipo_via
    WHEN 1 THEN 'Calle'
    WHEN 2 THEN 'Avenida'
    ELSE 'Plaza'
  END;
  SET numero_via = FLOOR(RAND() * 100) + 1;

  -- Seleccionar aleatoriamente un municipio
  SET municipio = CASE FLOOR(RAND() * 15)
    WHEN 0 THEN 'Puebla'
    WHEN 1 THEN 'Cholula'
    WHEN 2 THEN 'Atlixco'
    WHEN 3 THEN 'Tlaxcala'
    WHEN 4 THEN 'Cuautlancingo'
    WHEN 5 THEN 'Tehuacán'
    WHEN 6 THEN 'San Martín Texmelucan'
    WHEN 7 THEN 'Izúcar de Matamoros'
    WHEN 8 THEN 'Teziutlán'
    WHEN 9 THEN 'Huauchinango'
    WHEN 10 THEN 'Acatzingo'
    WHEN 11 THEN 'Zacatlán'
    WHEN 12 THEN 'Xicotepec'
    WHEN 13 THEN 'Tlatlauquitepec'
    ELSE 'Santa Clara Ocoyucan'
  END;

  -- Asignar código postal según el municipio
  CASE municipio
    WHEN 'Puebla' THEN SET codigo_postal = '72000';
    WHEN 'Cholula' THEN SET codigo_postal = '72760';
    WHEN 'Atlixco' THEN SET codigo_postal = '74200';
    WHEN 'Tlaxcala' THEN SET codigo_postal = '90000';
    WHEN 'Cuautlancingo' THEN SET codigo_postal = '72710';
    WHEN 'Tehuacán' THEN SET codigo_postal = '75700';
    WHEN 'San Martín Texmelucan' THEN SET codigo_postal = '74000';
    WHEN 'Izúcar de Matamoros' THEN SET codigo_postal = '74400';
    WHEN 'Teziutlán' THEN SET codigo_postal = '73800';
    WHEN 'Huauchinango' THEN SET codigo_postal = '73160';
    WHEN 'Acatzingo' THEN SET codigo_postal = '75150';
    WHEN 'Zacatlán' THEN SET codigo_postal = '73680';
    WHEN 'Xicotepec' THEN SET codigo_postal = '73080';
    WHEN 'Tlatlauquitepec' THEN SET codigo_postal = '73940';
    ELSE SET codigo_postal = '72700'; -- Para cualquier municipio no especificado
  END CASE;

  SET colonia = CONCAT('Colonia ', SUBSTRING(municipio, 1, 3)); -- Colonia basada en las primeras tres letras del municipio

  SET estado = 'Puebla';
  SET pais = 'México';

  SET direccion = CONCAT(tipo_via, ' ', nombre_via, ' ', numero_via, ', ', colonia, ', ', codigo_postal, ' ', municipio, ', ', estado, ', ', pais);

  RETURN direccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_generar_numero_telefono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_generar_numero_telefono`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE prefijo VARCHAR(4);
  DECLARE numero INT;
  DECLARE telefono VARCHAR(20);

  -- Seleccionar aleatoriamente un prefijo de ciudad en Puebla
  SET prefijo = CASE FLOOR(RAND() * 5)
    WHEN 0 THEN '222' -- Puebla
    WHEN 1 THEN '238' -- Tehuacán
    WHEN 2 THEN '231' -- Atlixco
    WHEN 3 THEN '276' -- Izúcar de Matamoros
    ELSE '233' -- San Martín Texmelucan
  END;

  -- Generar un número aleatorio
  SET numero = FLOOR(RAND() * 9000000) + 1000000;

  SET telefono = CONCAT(prefijo, numero);

  RETURN telefono;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_descripcion_puesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_descripcion_puesto`(p_nombre_puesto VARCHAR(100)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_descripcion TEXT;

    -- Asignar la descripción basada en el nombre del puesto
    CASE p_nombre_puesto
        WHEN 'Limpiador' THEN
            SET v_descripcion = 'Este puesto se encarga de mantener la limpieza y el orden en todas las áreas del hospital, incluyendo pasillos, habitaciones de pacientes y áreas comunes.';
        WHEN 'Auxiliar de limpieza' THEN
            SET v_descripcion = 'Los auxiliares de limpieza asisten en las tareas de limpieza del hospital bajo la supervisión de los limpiadores. Sus responsabilidades incluyen limpiar y desinfectar áreas asignadas, mover y organizar suministros, y ayudar en la eliminación segura de desechos médicos.';
        WHEN 'Encargado de Mantenimiento' THEN
            SET v_descripcion = 'El encargado de mantenimiento se encarga del mantenimiento general del hospital, incluyendo la reparación de equipos y mobiliario, y la gestión de sistemas de plomería y electricidad.';
        WHEN 'Recepcionista' THEN
            SET v_descripcion = 'Los recepcionistas son el primer punto de contacto para pacientes y visitantes en el hospital. Se encargan de recibir a los pacientes, programar citas y gestionar registros médicos.';
        WHEN 'Auxiliar Administrativo' THEN
            SET v_descripcion = 'Los auxiliares administrativos proporcionan apoyo administrativo en varias áreas del hospital, como recursos humanos, contabilidad y archivo. Sus responsabilidades incluyen la preparación de documentos, la entrada de datos y la coordinación de citas.';
        WHEN 'Técnico de Rayos X' THEN
            SET v_descripcion = 'Los técnicos de rayos X operan equipos de radiografía para realizar pruebas de diagnóstico por imágenes bajo la supervisión de radiólogos.';
        WHEN 'Técnico de Laboratorio' THEN
            SET v_descripcion = 'Los técnicos de laboratorio realizan pruebas de laboratorio médico para ayudar en el diagnóstico y tratamiento de enfermedades. Sus responsabilidades incluyen preparar muestras, realizar pruebas y mantener registros.';
        WHEN 'Enfermero/a' THEN
            SET v_descripcion = 'Los enfermeros/as proporcionan atención directa a los pacientes, incluyendo la administración de medicamentos, el monitoreo de signos vitales y la educación del paciente sobre la salud y el cuidado personal.';
        WHEN 'Médico Residente' THEN
            SET v_descripcion = 'Los médicos residentes son médicos en formación que brindan atención médica primaria y urgente a los pacientes bajo la supervisión de médicos más experimentados.';
        WHEN 'Médico de Guardia' THEN
            SET v_descripcion = 'Los médicos de guardia proporcionan atención médica urgente y de emergencia a los pacientes que llegan al hospital fuera del horario regular.';
        WHEN 'Especialista en Neurología' THEN
            SET v_descripcion = 'Los especialistas en neurología son médicos especializados en el diagnóstico y tratamiento de trastornos del sistema nervioso, incluyendo enfermedades cerebrales y de la médula espinal.';
        WHEN 'Especialista en Cardiología' THEN
            SET v_descripcion = 'Los especialistas en cardiología son médicos especializados en el diagnóstico y tratamiento de enfermedades del corazón y los vasos sanguíneos.';
        WHEN 'Especialista en Oncología' THEN
            SET v_descripcion = 'Los especialistas en oncología son médicos especializados en el diagnóstico y tratamiento del cáncer.';
        WHEN 'Especialista en Gastroenterología' THEN
            SET v_descripcion = 'Los especialistas en gastroenterología son médicos especializados en el diagnóstico y tratamiento de enfermedades del sistema digestivo, incluyendo el estómago, el intestino y el hígado.';
        WHEN 'Especialista en Pediatría' THEN
            SET v_descripcion = 'Los especialistas en pediatría son médicos especializados en el cuidado de niños y adolescentes, incluyendo el diagnóstico y tratamiento de enfermedades pediátricas.';
        WHEN 'Especialista en Ginecología' THEN
            SET v_descripcion = 'Los especialistas en ginecología son médicos especializados en el cuidado de la salud de la mujer, incluyendo el diagnóstico y tratamiento de enfermedades ginecológicas.';
        WHEN 'Especialista en Cirugía General' THEN
            SET v_descripcion = 'Los especialistas en cirugía general son médicos especializados en realizar procedimientos quirúrgicos para tratar una amplia variedad de condiciones médicas.';
        WHEN 'Especialista en Cirugía Plástica' THEN
            SET v_descripcion = 'Los especialistas en cirugía plástica son médicos especializados en realizar procedimientos quirúrgicos para mejorar la apariencia física o corregir defectos congénitos o adquiridos.';
        WHEN 'Especialista en Dermatología' THEN
            SET v_descripcion = 'Los especialistas en dermatología son médicos especializados en el diagnóstico y tratamiento de enfermedades de la piel, cabello y uñas.';
        WHEN 'Especialista en Oftalmología' THEN
            SET v_descripcion = 'Los especialistas en oftalmología son médicos especializados en el diagnóstico y tratamiento de enfermedades y trastornos oculares.';
        WHEN 'Especialista en Otorrinolaringología' THEN
            SET v_descripcion = 'Los especialistas en otorrinolaringología son médicos especializados en el diagnóstico y tratamiento de enfermedades del oído, la nariz, la garganta y estructuras relacionadas.';
        WHEN 'Especialista en Endocrinología' THEN
            SET v_descripcion = 'Los especialistas en endocrinología son médicos especializados en el diagnóstico y tratamiento de trastornos hormonales y endocrinos.';
        WHEN 'Especialista en Psiquiatría' THEN
            SET v_descripcion = 'Los especialistas en psiquiatría son médicos especializados en el diagnóstico y tratamiento de trastornos mentales y emocionales.';
        WHEN 'Especialista en Radiología' THEN
            SET v_descripcion = 'Los especialistas en radiología son médicos especializados en el uso de imágenes médicas para diagnosticar y tratar enfermedades.';
        WHEN 'Especialista en Medicina Interna' THEN
            SET v_descripcion = 'Los especialistas en medicina interna son médicos especializados en el diagnóstico y tratamiento de enfermedades en adultos.';
        WHEN 'Especialista en Anestesiología' THEN
            SET v_descripcion = 'Los especialistas en anestesiología son médicos especializados en el manejo del dolor y la administración de anestesia durante procedimientos quirúrgicos u otros procedimientos médicos.';
        WHEN 'Especialista en Urología' THEN
            SET v_descripcion = 'Los especialistas en urología son médicos especializados en el diagnóstico y tratamiento de trastornos del tracto urinario y el sistema reproductor masculino.';
        WHEN 'Especialista en Traumatología' THEN
            SET v_descripcion = 'Los especialistas en traumatología son médicos especializados en el diagnóstico y tratamiento de lesiones musculoesqueléticas, incluyendo fracturas óseas y lesiones de tejidos blandos.';
        WHEN 'Especialista en Rehabilitación' THEN
            SET v_descripcion = 'Los especialistas en rehabilitación son médicos especializados en ayudar a los pacientes a recuperarse de lesiones o enfermedades y mejorar su capacidad funcional.';
        WHEN 'Especialista en Medicina Física y Rehabilitación' THEN
            SET v_descripcion = 'Los especialistas en medicina física y rehabilitación son médicos especializados en el diagnóstico y tratamiento de trastornos musculoesqueléticos y neurológicos, y en la rehabilitación física.';
        WHEN 'Especialista en Nutrición' THEN
            SET v_descripcion = 'Los especialistas en nutrición son profesionales de la salud especializados en el estudio de la nutrición y su relación con la salud. Ofrecen asesoramiento y educación nutricional para promover una alimentación saludable y prevenir enfermedades relacionadas con la dieta.';
        WHEN 'Especialista en Terapia Respiratoria' THEN
            SET v_descripcion = 'Los especialistas en terapia respiratoria son profesionales de la salud especializados en el diagnóstico y tratamiento de trastornos respiratorios y pulmonares.';
        WHEN 'Especialista en Terapia Ocupacional' THEN
            SET v_descripcion = 'Los especialistas en terapia ocupacional son profesionales de la salud especializados en ayudar a las personas a mejorar su capacidad para realizar actividades cotidianas y participar en la vida diaria.';
        WHEN 'Especialista en Terapia del Habla y Lenguaje' THEN
            SET v_descripcion = 'Los especialistas en terapia del habla y lenguaje son profesionales de la salud especializados en evaluar y tratar trastornos del habla, lenguaje, comunicación y deglución.';
        WHEN 'Especialista en Fisioterapia' THEN
            SET v_descripcion = 'Los especialistas en fisioterapia son profesionales de la salud especializados en ayudar a las personas a recuperarse de lesiones o enfermedades mediante el uso de técnicas de ejercicio, estiramiento y terapia manual.';
        WHEN 'Especialista en Psicología Clínica' THEN
            SET v_descripcion = 'Los especialistas en psicología clínica son profesionales de la salud mental especializados en el diagnóstico y tratamiento de trastornos mentales, emocionales y del comportamiento.';
        WHEN 'Especialista en Trabajo Social' THEN
            SET v_descripcion = 'Los especialistas en trabajo social son profesionales de servicios sociales que trabajan con individuos, familias y comunidades para ayudarlos a superar problemas y mejorar su bienestar.';
        WHEN 'Especialista en Farmacia' THEN
            SET v_descripcion = 'Los especialistas en farmacia son profesionales de la salud especializados en el uso seguro y efectivo de medicamentos. Se encargan de dispensar medicamentos, proporcionar asesoramiento sobre su uso y supervisar su administración.';
        WHEN 'Especialista en Bioquímica' THEN
            SET v_descripcion = 'Los especialistas en bioquímica son científicos especializados en el estudio de las moléculas y procesos químicos que ocurren en los organismos vivos. Realizan investigaciones para comprender la base molecular de la vida y aplicar ese conocimiento en campos como la medicina y la biotecnología.';
        ELSE
            SET v_descripcion = 'Descripción no disponible';
    END CASE;

    RETURN v_descripcion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_direccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_direccion`() RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE direccion_generada VARCHAR(255) DEFAULT NULL;
    DECLARE tipos_via VARCHAR(50);
    DECLARE nombres_calles VARCHAR(50);
    DECLARE numero_aleatorio INT;
    DECLARE complemento VARCHAR(50);
    
    -- Lista de tipos de vía ficticios
    SET tipos_via = 'Calle,Avenida,Paseo,Carretera,Camino,Circuito';

    -- Lista de nombres de calles ficticias
    SET nombres_calles = 'Principal,Revolución,Independencia,Juárez,Hidalgo,Galeana,Allende,Zaragoza';

    -- Seleccionar un tipo de vía aleatorio
    SET direccion_generada = CONCAT(ELT(FLOOR(1 + RAND() * 6), tipos_via), ' ');

    -- Seleccionar un nombre de calle aleatorio
    SET direccion_generada = CONCAT(direccion_generada, ELT(FLOOR(1 + RAND() * 8), nombres_calles), ' ');

    -- Generar un número de calle aleatorio
    SET numero_aleatorio = FLOOR(1 + RAND() * 999);
    SET direccion_generada = CONCAT(direccion_generada, numero_aleatorio);

    -- Agregar complemento de dirección aleatorio
    SET complemento = 'Piso 1,Piso 2,Piso 3,Departamento A,Departamento B,Departamento C,Lote 1,Lote 2,Lote 3';
    IF RAND() < 0.3 THEN
        SET direccion_generada = CONCAT(direccion_generada, ', ', ELT(FLOOR(1 + RAND() * 9), complemento));
    END IF;

    RETURN direccion_generada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_nombre_puesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_puesto`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_puesto_generado VARCHAR(100) DEFAULT NULL;
    SET v_nombre_puesto_generado = ELT(fn_numero_aleatorio_rangos(1,40), 
            "Limpiador",
            "Auxiliar de limpieza",
            "Encargado de Mantenimiento",
            "Recepcionista",
            "Auxiliar Administrativo",
            "Técnico de Rayos X",
            "Técnico de Laboratorio",
            "Enfermero/a",
            "Médico Residente",
            "Médico de Guardia",
            "Especialista en Neurología",
            "Especialista en Cardiología",
            "Especialista en Oncología",
            "Especialista en Gastroenterología",
            "Especialista en Pediatría",
            "Especialista en Ginecología",
            "Especialista en Cirugía General",
            "Especialista en Cirugía Plástica",
            "Especialista en Dermatología",
            "Especialista en Oftalmología",
            "Especialista en Otorrinolaringología",
            "Especialista en Endocrinología",
            "Especialista en Psiquiatría",
            "Especialista en Radiología",
            "Especialista en Medicina Interna",
            "Especialista en Anestesiología",
            "Especialista en Urología",
            "Especialista en Traumatología",
            "Especialista en Rehabilitación",
            "Especialista en Medicina Física y Rehabilitación",
            "Especialista en Nutrición",
            "Especialista en Terapia Respiratoria",
            "Especialista en Terapia Ocupacional",
            "Especialista en Terapia del Habla y Lenguaje",
            "Especialista en Fisioterapia",
            "Especialista en Psicología Clínica",
            "Especialista en Trabajo Social",
            "Especialista en Farmacia",
            "Especialista en Bioquímica");
    
RETURN v_nombre_puesto_generado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_genera_requisitos_puesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_requisitos_puesto`(p_nombre_puesto VARCHAR(100)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_requisitos TEXT;

    -- Asignar requisitos según el nombre del puesto
    CASE p_nombre_puesto
        WHEN 'Auxiliar de limpieza' THEN
            SET v_requisitos = 'Experiencia previa en limpieza preferida. Capacidad para trabajar de forma autónoma y en equipo.';
        WHEN 'Encargado de Mantenimiento' THEN
            SET v_requisitos = 'Experiencia previa en mantenimiento de instalaciones. Conocimientos básicos en fontanería, electricidad y albañilería.';
        WHEN 'Recepcionista' THEN
            SET v_requisitos = 'Experiencia previa en atención al cliente. Buenas habilidades de comunicación y organización.';
        WHEN 'Auxiliar Administrativo' THEN
            SET v_requisitos = 'Conocimientos básicos en contabilidad y gestión de documentos. Habilidades informáticas avanzadas.';
        WHEN 'Técnico de Rayos X' THEN
            SET v_requisitos = 'Licencia o certificación vigente como técnico de rayos X. Experiencia previa en el manejo de equipos de radiología.';
        WHEN 'Técnico de Laboratorio' THEN
            SET v_requisitos = 'Título universitario en ciencias de laboratorio o campo relacionado. Experiencia previa en el manejo de equipos de laboratorio.';
        WHEN 'Enfermero/a' THEN
            SET v_requisitos = 'Título universitario en enfermería. Licencia vigente como enfermero/a. Experiencia previa en atención médica.';
        WHEN 'Médico Residente' THEN
            SET v_requisitos = 'Licenciatura en medicina. Haber completado el internado médico. Especialización en el área correspondiente.';
        WHEN 'Médico de Guardia' THEN
            SET v_requisitos = 'Licenciatura en medicina. Experiencia previa en urgencias o cuidados intensivos.';
        WHEN 'Especialista en Neurología' THEN
            SET v_requisitos = 'Título de especialidad en neurología. Experiencia previa en el diagnóstico y tratamiento de trastornos neurológicos.';
        WHEN 'Especialista en Cardiología' THEN
            SET v_requisitos = 'Título de especialidad en cardiología. Experiencia previa en el diagnóstico y tratamiento de enfermedades cardíacas.';
        WHEN 'Especialista en Oncología' THEN
            SET v_requisitos = 'Título de especialidad en oncología. Experiencia previa en el diagnóstico y tratamiento de enfermedades oncológicas.';
        WHEN 'Especialista en Gastroenterología' THEN
            SET v_requisitos = 'Título de especialidad en gastroenterología. Experiencia previa en el diagnóstico y tratamiento de trastornos gastrointestinales.';
        WHEN 'Especialista en Pediatría' THEN
            SET v_requisitos = 'Título de especialidad en pediatría. Experiencia previa en el cuidado de niños y adolescentes.';
        WHEN 'Especialista en Ginecología' THEN
            SET v_requisitos = 'Título de especialidad en ginecología. Experiencia previa en el diagnóstico y tratamiento de enfermedades ginecológicas.';
        WHEN 'Especialista en Cirugía General' THEN
            SET v_requisitos = 'Título de especialidad en cirugía general. Experiencia previa en cirugías generales.';
        WHEN 'Especialista en Cirugía Plástica' THEN
            SET v_requisitos = 'Título de especialidad en cirugía plástica. Experiencia previa en procedimientos estéticos y reconstructivos.';
        WHEN 'Especialista en Dermatología' THEN
            SET v_requisitos = 'Título de especialidad en dermatología. Experiencia previa en el diagnóstico y tratamiento de trastornos de la piel.';
        WHEN 'Especialista en Oftalmología' THEN
            SET v_requisitos = 'Título de especialidad en oftalmología. Experiencia previa en el diagnóstico y tratamiento de enfermedades oculares.';
        WHEN 'Especialista en Otorrinolaringología' THEN
            SET v_requisitos = 'Título de especialidad en otorrinolaringología. Experiencia previa en el diagnóstico y tratamiento de trastornos del oído, la nariz y la garganta.';
        WHEN 'Especialista en Endocrinología' THEN
            SET v_requisitos = 'Título de especialidad en endocrinología. Experiencia previa en el diagnóstico y tratamiento de trastornos endocrinos.';
        WHEN 'Especialista en Psiquiatría' THEN
            SET v_requisitos = 'Título de especialidad en psiquiatría. Experiencia previa en el diagnóstico y tratamiento de trastornos mentales.';
        WHEN 'Especialista en Radiología' THEN
            SET v_requisitos = 'Título de especialidad en radiología. Experiencia previa en el uso de técnicas de imagen para diagnóstico médico.';
        WHEN 'Especialista en Medicina Interna' THEN
            SET v_requisitos = 'Título de especialidad en medicina interna. Experiencia previa en el diagnóstico y tratamiento de enfermedades internas.';
        WHEN 'Especialista en Anestesiología' THEN
            SET v_requisitos = 'Título de especialidad en anestesiología. Experiencia previa en la administración de anestesia en procedimientos quirúrgicos.';
        WHEN 'Especialista en Urología' THEN
            SET v_requisitos = 'Título de especialidad en urología. Experiencia previa en el diagnóstico y tratamiento de enfermedades del tracto urinario y órganos reproductores masculinos.';
        WHEN 'Especialista en Traumatología' THEN
            SET v_requisitos = 'Título de especialidad en traumatología. Experiencia previa en el diagnóstico y tratamiento de lesiones musculoesqueléticas.';
        WHEN 'Especialista en Rehabilitación' THEN
            SET v_requisitos = 'Título de especialidad en rehabilitación. Experiencia previa en el tratamiento de pacientes con discapacidades físicas.';
        WHEN 'Especialista en Medicina Física y Rehabilitación' THEN
            SET v_requisitos = 'Título de especialidad en medicina física y rehabilitación. Experiencia previa en la rehabilitación de pacientes con discapacidades físicas y funcionales.';
        WHEN 'Especialista en Nutrición' THEN
            SET v_requisitos = 'Título de especialidad en nutrición. Experiencia previa en el asesoramiento dietético y nutricional.';
        WHEN 'Especialista en Terapia Respiratoria' THEN
            SET v_requisitos = 'Título de especialidad en terapia respiratoria. Experiencia previa en el tratamiento de trastornos respiratorios.';
        WHEN 'Especialista en Terapia Ocupacional' THEN
            SET v_requisitos = 'Título de especialidad en terapia ocupacional. Experiencia previa en el tratamiento de discapacidades físicas y mentales a través de actividades cotidianas.';
        WHEN 'Especialista en Terapia del Habla y Lenguaje' THEN
            SET v_requisitos = 'Título de especialidad en terapia del habla y lenguaje. Experiencia previa en el diagnóstico y tratamiento de trastornos del habla y del lenguaje.';
        WHEN 'Especialista en Fisioterapia' THEN
            SET v_requisitos = 'Título de especialidad en fisioterapia. Experiencia previa en el tratamiento de lesiones musculoesqueléticas y trastornos neurológicos.';
        WHEN 'Especialista en Psicología Clínica' THEN
            SET v_requisitos = 'Título de especialidad en psicología clínica. Experiencia previa en el diagnóstico y tratamiento de trastornos mentales.';
        WHEN 'Especialista en Trabajo Social' THEN
            SET v_requisitos = 'Título de especialidad en trabajo social. Experiencia previa en la intervención social y el apoyo a individuos y familias.';
        WHEN 'Especialista en Farmacia' THEN
            SET v_requisitos = 'Título de especialidad en farmacia. Licencia vigente como farmacéutico. Experiencia previa en la dispensación de medicamentos y el asesoramiento farmacéutico.';
        WHEN 'Especialista en Bioquímica' THEN
            SET v_requisitos = 'Título de especialidad en bioquímica. Experiencia previa en análisis de laboratorio y pruebas bioquímicas.';
        ELSE
            SET v_requisitos = 'Requisitos no especificados.';
    END CASE;

    RETURN v_requisitos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_personal`(IN v_cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_persona_id INT;
    DECLARE v_direccion VARCHAR(255);
    DECLARE v_telefono VARCHAR(15); -- Se ajusta la longitud del teléfono a 15
    DECLARE v_puesto_id INT;
    DECLARE v_estatus ENUM('activo', 'inactivo') DEFAULT 'activo';
    DECLARE v_max_persona_id INT; -- Variable para almacenar el máximo ID de persona existente
    DECLARE v_max_puesto_id INT; -- Variable para almacenar el máximo ID de puesto existente
    
    -- Obtener el máximo ID de persona existente
    SELECT MAX(id) INTO v_max_persona_id FROM personas;
    
    -- Obtener el máximo ID de puesto existente
    SELECT MAX(id) INTO v_max_puesto_id FROM puesto;
    
    WHILE i <= v_cantidad DO
        -- Generar un ID de persona aleatorio dentro del rango de IDs existentes
        SET v_persona_id = FLOOR(RAND() * v_max_persona_id) + 1;
        
        -- Generar una dirección ficticia utilizando la función fn_generar_direccion()
        SET v_direccion = fn_generar_direccion();
        
        -- Generar un número de teléfono ficticio utilizando la función fn_generar_numero_telefono()
        SET v_telefono = fn_generar_numero_telefono();
        
        -- Generar un ID de puesto aleatorio dentro del rango de IDs existentes
        SET v_puesto_id = FLOOR(RAND() * v_max_puesto_id) + 1;
        
        -- Insertar el nuevo registro en la tabla personal
        INSERT INTO personal (Persona_ID, Direccion, Telefono, Puesto_ID, Estatus) 
        VALUES (v_persona_id, v_direccion, v_telefono, v_puesto_id, v_estatus);
        
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_puestos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_puestos`(IN v_cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_descripcion TEXT;
    DECLARE v_requisitos TEXT;
    DECLARE v_salario_minimo DECIMAL(10, 2);
    DECLARE v_salario_maximo DECIMAL(10, 2);
    DECLARE v_estatus ENUM('activo', 'inactivo') DEFAULT 'activo';
    DECLARE v_tipo_contrato VARCHAR(50);

    WHILE i <= v_cantidad DO
        -- Generar valores aleatorios para nombre, descripción y requisitos
        SET v_nombre = CONCAT('Puesto ', i);
        SET v_descripcion = CONCAT('Descripción del puesto ', i);
        SET v_requisitos = CONCAT('Requisitos del puesto ', i);
        
        SET v_salario_minimo = ROUND(RAND() * 10000, 2);
        SET v_salario_maximo = v_salario_minimo + ROUND(RAND() * 5000, 2);
        
        -- Generar un tipo de contrato aleatorio
        SET v_tipo_contrato = CASE ROUND(RAND() * 2)
                        WHEN 0 THEN 'Contrato indefinido'
                        WHEN 1 THEN 'Contrato temporal'
                        WHEN 2 THEN 'Medio tiempo'
                        ELSE 'Otros'
                     END;
        
        -- Insertar los datos generados en la tabla "puesto"
        INSERT INTO puesto (Nombre, Descripcion, Requisitos, Salario_Minimo, Salario_Maximo, Tipo_Contrato, Estatus) 
        VALUES (v_nombre, v_descripcion, v_requisitos, v_salario_minimo, v_salario_maximo, v_tipo_contrato, v_estatus);

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-27  1:14:57
