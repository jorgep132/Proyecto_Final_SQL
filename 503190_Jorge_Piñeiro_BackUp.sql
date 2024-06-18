CREATE DATABASE  IF NOT EXISTS `503190_jorge_pineiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `503190_jorge_pineiro`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 503190_jorge_pineiro
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
-- Table structure for table `desarrolladoras`
--

DROP TABLE IF EXISTS `desarrolladoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desarrolladoras` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DESARROLLADORA` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desarrolladoras`
--

LOCK TABLES `desarrolladoras` WRITE;
/*!40000 ALTER TABLE `desarrolladoras` DISABLE KEYS */;
INSERT INTO `desarrolladoras` VALUES (1,'CD Projekt Red'),(2,'Capcom'),(3,'Konami'),(4,'Ubisoft'),(5,'Nintendo'),(6,'Rockstar Games'),(7,'Number None'),(8,'Riot Games');
/*!40000 ALTER TABLE `desarrolladoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GENERO` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Rol'),(2,'Accion'),(3,'Aventura'),(4,'Estrategia'),(5,'Simulacion'),(6,'Terror'),(7,'Plataformas'),(8,'Peleas');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idiomas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDIOMA` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idiomas`
--

LOCK TABLES `idiomas` WRITE;
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` VALUES (1,'Espanol'),(2,'Ingles'),(3,'Frances'),(4,'Aleman'),(5,'Italiano'),(6,'Portugues'),(7,'Japones'),(8,'Chino'),(9,'Coreano'),(10,'Ruso');
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_desarrolladora`
--

DROP TABLE IF EXISTS `juego_desarrolladora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego_desarrolladora` (
  `ID_JUEGO` int NOT NULL,
  `ID_DESARROLLADORA` int NOT NULL,
  PRIMARY KEY (`ID_JUEGO`,`ID_DESARROLLADORA`),
  KEY `ID_DESARROLLADORA` (`ID_DESARROLLADORA`),
  CONSTRAINT `juego_desarrolladora_ibfk_1` FOREIGN KEY (`ID_JUEGO`) REFERENCES `juegos` (`ID`),
  CONSTRAINT `juego_desarrolladora_ibfk_2` FOREIGN KEY (`ID_DESARROLLADORA`) REFERENCES `desarrolladoras` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_desarrolladora`
--

LOCK TABLES `juego_desarrolladora` WRITE;
/*!40000 ALTER TABLE `juego_desarrolladora` DISABLE KEYS */;
INSERT INTO `juego_desarrolladora` VALUES (1,1),(7,1),(2,2),(3,3),(4,4),(5,5),(6,5),(8,6),(9,7),(10,8);
/*!40000 ALTER TABLE `juego_desarrolladora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_genero`
--

DROP TABLE IF EXISTS `juego_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego_genero` (
  `ID_JUEGO` int NOT NULL,
  `ID_GENERO` int NOT NULL,
  PRIMARY KEY (`ID_JUEGO`,`ID_GENERO`),
  KEY `ID_GENERO` (`ID_GENERO`),
  CONSTRAINT `juego_genero_ibfk_1` FOREIGN KEY (`ID_JUEGO`) REFERENCES `juegos` (`ID`),
  CONSTRAINT `juego_genero_ibfk_2` FOREIGN KEY (`ID_GENERO`) REFERENCES `generos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_genero`
--

LOCK TABLES `juego_genero` WRITE;
/*!40000 ALTER TABLE `juego_genero` DISABLE KEYS */;
INSERT INTO `juego_genero` VALUES (1,1),(7,1),(2,2),(4,2),(6,2),(7,2),(8,2),(10,2),(1,3),(3,3),(4,3),(5,3),(6,3),(8,3),(9,3),(10,4),(5,5),(2,6),(3,6),(9,7);
/*!40000 ALTER TABLE `juego_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_idioma`
--

DROP TABLE IF EXISTS `juego_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego_idioma` (
  `ID_JUEGO` int NOT NULL,
  `ID_IDIOMA` int NOT NULL,
  PRIMARY KEY (`ID_JUEGO`,`ID_IDIOMA`),
  KEY `ID_IDIOMA` (`ID_IDIOMA`),
  CONSTRAINT `juego_idioma_ibfk_1` FOREIGN KEY (`ID_JUEGO`) REFERENCES `juegos` (`ID`),
  CONSTRAINT `juego_idioma_ibfk_2` FOREIGN KEY (`ID_IDIOMA`) REFERENCES `idiomas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_idioma`
--

LOCK TABLES `juego_idioma` WRITE;
/*!40000 ALTER TABLE `juego_idioma` DISABLE KEYS */;
INSERT INTO `juego_idioma` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(1,2),(2,2),(3,2),(4,2),(6,2),(7,2),(8,2),(9,2),(10,2),(1,3),(2,3),(3,3),(4,3),(5,3),(7,3),(8,3),(9,3),(10,3),(1,4),(2,4),(3,4),(4,4),(5,4),(7,4),(8,4),(9,4),(10,4),(1,5),(2,5),(3,5),(4,5),(5,5),(7,5),(8,5),(9,5),(10,5),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(5,7),(7,7),(8,7),(9,7),(10,7),(5,8),(7,8),(8,8),(9,8),(10,8),(5,9),(7,9),(8,9),(9,9),(10,9);
/*!40000 ALTER TABLE `juego_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_plataforma`
--

DROP TABLE IF EXISTS `juego_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego_plataforma` (
  `ID_JUEGO` int NOT NULL,
  `ID_PLATAFORMA` int NOT NULL,
  PRIMARY KEY (`ID_JUEGO`,`ID_PLATAFORMA`),
  KEY `ID_PLATAFORMA` (`ID_PLATAFORMA`),
  CONSTRAINT `juego_plataforma_ibfk_1` FOREIGN KEY (`ID_JUEGO`) REFERENCES `juegos` (`ID`),
  CONSTRAINT `juego_plataforma_ibfk_2` FOREIGN KEY (`ID_PLATAFORMA`) REFERENCES `plataformas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego_plataforma`
--

LOCK TABLES `juego_plataforma` WRITE;
/*!40000 ALTER TABLE `juego_plataforma` DISABLE KEYS */;
INSERT INTO `juego_plataforma` VALUES (1,1),(2,1),(7,1),(9,1),(10,1),(1,2),(2,2),(4,2),(7,2),(2,3),(8,3),(3,4),(1,5),(5,5),(6,5),(1,6),(2,6),(7,6),(8,6);
/*!40000 ALTER TABLE `juego_plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juegos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(50) NOT NULL,
  `VALORACION` decimal(10,0) DEFAULT NULL,
  `FECHA_L` date NOT NULL,
  `PEGI` varchar(4) DEFAULT NULL,
  `DESCRIPCION` text NOT NULL,
  `DESARROLLADORA` varchar(50) DEFAULT NULL,
  `MULTIPLAYER` enum('SI','NO') DEFAULT NULL,
  `CANTIDAD_J` varchar(8) DEFAULT NULL,
  `PRECIO` double DEFAULT NULL,
  `DURACION` varchar(20) DEFAULT NULL,
  `FECHA_CREACION` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_ULTIMA_MODIFICACION` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (1,'The Witcher 3 - Modificado',10,'2015-05-19','+18','Juego de rol y aventura en un mundo abierto.','CD Projekt Red','NO','1',39.99,'50-200hs','2024-06-18 22:04:32','2024-06-18 22:04:32'),(2,'Resident Evil 4 Remake',9,'2023-03-24','+18','Remake del clasico juego de terror y supervivencia.','Capcom','NO','1',59.99,'15-20hs','2024-06-18 22:04:32',NULL),(3,'Silent Hill 2',9,'2001-09-24','+18','Juego de terror psicologico.','Konami','NO','1',29.99,'8-12hs','2024-06-18 22:04:32',NULL),(4,'Prince of Persia: The Lost Crown',8,'2024-01-18','+16','Juego de plataformas y accion con elementos de aventura.','Ubisoft','NO','1',49.99,'15-20hs','2024-06-18 22:04:32',NULL),(5,'Animal Crossing: New Horizons',9,'2020-03-20','E','Juego de simulacion de vida en una isla desierta.','Nintendo','SI','1-8',59.99,'50-500hs','2024-06-18 22:04:32',NULL),(6,'Metroid Dread',9,'2021-10-08','+12','Juego de accion y aventura en 2D.','Nintendo','NO','1',59.99,'8-12hs','2024-06-18 22:04:32',NULL),(7,'Cyberpunk 2077',8,'2020-12-10','+18','Juego de rol y accion en un mundo abierto futurista.','CD Projekt Red','NO','1',59.99,'20-100hs','2024-06-18 22:04:32',NULL),(8,'Red Dead Redemption 2',10,'2018-10-26','+18','Juego de accion y aventura en un mundo abierto del Viejo Oeste.','Rockstar Games','SI','1-32',59.99,'40-150hs','2024-06-18 22:04:32',NULL),(9,'Braid',9,'2008-08-06','E','Juego de plataformas y rompecabezas con manipulacion del tiempo.','Number None','NO','1',14.99,'5-7hs','2024-06-18 22:04:32',NULL),(10,'League of Legends',9,'2009-10-27','+12','Juego de estrategia y accion multijugador en línea.','Riot Games','SI','1-10',0,'Indefinido','2024-06-18 22:04:32',NULL);
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_FECHA_CREACION` AFTER INSERT ON `juegos` FOR EACH ROW BEGIN
    UPDATE JUEGOS SET FECHA_CREACION = CURRENT_TIMESTAMP WHERE ID = NEW.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ULTIMA_MODIFICACION` BEFORE UPDATE ON `juegos` FOR EACH ROW BEGIN
    SET NEW.FECHA_ULTIMA_MODIFICACION = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PLATAFORMA` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (1,'PC'),(2,'PlayStation 5'),(3,'PlayStation 4'),(4,'PlayStation 2'),(5,'Nintendo Switch'),(6,'Xbox One'),(7,'Android'),(8,'iOS');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_juegos_generos`
--

DROP TABLE IF EXISTS `vw_juegos_generos`;
/*!50001 DROP VIEW IF EXISTS `vw_juegos_generos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_juegos_generos` AS SELECT 
 1 AS `TITULO`,
 1 AS `GENEROS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_juegos_idiomas`
--

DROP TABLE IF EXISTS `vw_juegos_idiomas`;
/*!50001 DROP VIEW IF EXISTS `vw_juegos_idiomas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_juegos_idiomas` AS SELECT 
 1 AS `TITULO`,
 1 AS `IDIOMAS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_juegos_info_completa`
--

DROP TABLE IF EXISTS `vw_juegos_info_completa`;
/*!50001 DROP VIEW IF EXISTS `vw_juegos_info_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_juegos_info_completa` AS SELECT 
 1 AS `TITULO`,
 1 AS `VALORACION`,
 1 AS `FECHA_L`,
 1 AS `PEGI`,
 1 AS `DESCRIPCION`,
 1 AS `DESARROLLADORA`,
 1 AS `MULTIPLAYER`,
 1 AS `CANTIDAD_J`,
 1 AS `PRECIO`,
 1 AS `DURACION`,
 1 AS `GENEROS`,
 1 AS `PLATAFORMAS`,
 1 AS `IDIOMAS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_juegos_plataformas`
--

DROP TABLE IF EXISTS `vw_juegos_plataformas`;
/*!50001 DROP VIEW IF EXISTS `vw_juegos_plataformas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_juegos_plataformas` AS SELECT 
 1 AS `TITULO`,
 1 AS `PLATAFORMAS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pegi`
--

DROP TABLE IF EXISTS `vw_pegi`;
/*!50001 DROP VIEW IF EXISTS `vw_pegi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pegi` AS SELECT 
 1 AS `TITULO`,
 1 AS `PEGI`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_precios_en_pesos`
--

DROP TABLE IF EXISTS `vw_precios_en_pesos`;
/*!50001 DROP VIEW IF EXISTS `vw_precios_en_pesos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_precios_en_pesos` AS SELECT 
 1 AS `TITULO`,
 1 AS `PRECIO_PESOS`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_valoracion`
--

DROP TABLE IF EXISTS `vw_valoracion`;
/*!50001 DROP VIEW IF EXISTS `vw_valoracion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_valoracion` AS SELECT 
 1 AS `TITULO`,
 1 AS `VALORACION`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database '503190_jorge_pineiro'
--

--
-- Dumping routines for database '503190_jorge_pineiro'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_ADULTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_ADULTOS`(NOMBRE_JUEGO VARCHAR(50)) RETURNS varchar(3) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE PEGI_JUEGO VARCHAR(4);
	DECLARE MAYOR_EDAD VARCHAR(3);
    
	SELECT PEGI INTO PEGI_JUEGO FROM JUEGOS WHERE TITULO = NOMBRE_JUEGO;
    
	IF PEGI_JUEGO = '+18' THEN
		SET MAYOR_EDAD = 'Si';
	ELSE
		SET MAYOR_EDAD = 'No';
	END IF;
    
    RETURN MAYOR_EDAD;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_PESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_PESOS`(NOMBRE_JUEGO VARCHAR(50), PRECIO_DOLAR DECIMAL (10,2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	DECLARE PRECIO_JUEGO DECIMAL;
	SELECT PRECIO INTO PRECIO_JUEGO FROM JUEGOS WHERE TITULO = NOMBRE_JUEGO;
	RETURN (PRECIO_JUEGO * PRECIO_DOLAR) * 1.75;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_BUSCAR_JUEGOS_GENERO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_JUEGOS_GENERO`(IN BUSCAR VARCHAR(50), IN TIPO_BUSQUEDA VARCHAR(10))
BEGIN
    IF TIPO_BUSQUEDA = 'TITULO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(G.GENERO SEPARATOR ', ') AS GENEROS
        FROM
            JUEGOS J
            JOIN JUEGO_GENERO JG ON J.ID = JG.ID_JUEGO
            JOIN GENEROS G ON JG.ID_GENERO = G.ID
        WHERE
            J.TITULO = BUSCAR
		GROUP BY
			J.TITULO;
    ELSEIF TIPO_BUSQUEDA = 'GENERO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(G.GENERO SEPARATOR ', ') AS GENEROS
        FROM
            JUEGOS J
            JOIN JUEGO_GENERO JG ON J.ID = JG.ID_JUEGO
            JOIN GENEROS G ON JG.ID_GENERO = G.ID
        WHERE
            G.GENERO = BUSCAR
		GROUP BY
			J.TITULO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_BUSCAR_JUEGOS_IDIOMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_JUEGOS_IDIOMA`(IN BUSCAR VARCHAR(50), IN TIPO_BUSQUEDA VARCHAR(10))
BEGIN
    IF TIPO_BUSQUEDA = 'TITULO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(I.IDIOMA SEPARATOR ', ') AS IDIOMAS
        FROM
            JUEGOS J
            JOIN JUEGO_IDIOMA JI ON J.ID = JI.ID_JUEGO
            JOIN IDIOMAS I ON JI.ID_IDIOMA = I.ID
        WHERE
            J.TITULO = BUSCAR
		GROUP BY
			J.TITULO;
    ELSEIF TIPO_BUSQUEDA = 'IDIOMA' THEN
        SELECT
            J.TITULO,
			GROUP_CONCAT(I.IDIOMA SEPARATOR ', ') AS IDIOMAS
        FROM
            JUEGOS J
            JOIN JUEGO_IDIOMA JI ON J.ID = JI.ID_JUEGO
            JOIN IDIOMAS I ON JI.ID_IDIOMA = I.ID
        WHERE
            I.IDIOMA = BUSCAR
		GROUP BY
			J.TITULO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_BUSCAR_JUEGOS_PLATAFORMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BUSCAR_JUEGOS_PLATAFORMA`(IN BUSCAR VARCHAR(50), IN TIPO_BUSQUEDA VARCHAR(10))
BEGIN
    IF TIPO_BUSQUEDA = 'TITULO' THEN
        SELECT
            J.TITULO,
            GROUP_CONCAT(P.PLATAFORMA SEPARATOR ', ') AS PLATAFORMAS
        FROM
            JUEGOS J
            JOIN JUEGO_PLATAFORMA JP ON J.ID = JP.ID_JUEGO
            JOIN PLATAFORMAS P ON JP.ID_PLATAFORMA = P.ID
        WHERE
            J.TITULO = BUSCAR
		GROUP BY
			J.TITULO;
    ELSEIF TIPO_BUSQUEDA = 'PLATAFORMA' THEN
        SELECT
            J.TITULO,
			GROUP_CONCAT(P.PLATAFORMA SEPARATOR ', ') AS PLATAFORMAS
        FROM
            JUEGOS J
            JOIN JUEGO_PLATAFORMA JP ON J.ID = JP.ID_JUEGO
            JOIN PLATAFORMAS P ON JP.ID_PLATAFORMA = P.ID
        WHERE
            P.PLATAFORMA = BUSCAR
		GROUP BY
			J.TITULO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_juegos_generos`
--

/*!50001 DROP VIEW IF EXISTS `vw_juegos_generos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_juegos_generos` AS select `j`.`TITULO` AS `TITULO`,group_concat(`g`.`GENERO` separator ', ') AS `GENEROS` from ((`juegos` `j` join `juego_genero` `jg` on((`j`.`ID` = `jg`.`ID_JUEGO`))) join `generos` `g` on((`jg`.`ID_GENERO` = `g`.`ID`))) group by `j`.`TITULO` order by `j`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_juegos_idiomas`
--

/*!50001 DROP VIEW IF EXISTS `vw_juegos_idiomas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_juegos_idiomas` AS select `j`.`TITULO` AS `TITULO`,group_concat(`i`.`IDIOMA` separator ', ') AS `IDIOMAS` from ((`juegos` `j` join `juego_idioma` `ji` on((`j`.`ID` = `ji`.`ID_JUEGO`))) join `idiomas` `i` on((`ji`.`ID_IDIOMA` = `i`.`ID`))) group by `j`.`TITULO` order by `j`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_juegos_info_completa`
--

/*!50001 DROP VIEW IF EXISTS `vw_juegos_info_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_juegos_info_completa` AS select `j`.`TITULO` AS `TITULO`,`j`.`VALORACION` AS `VALORACION`,`j`.`FECHA_L` AS `FECHA_L`,`j`.`PEGI` AS `PEGI`,`j`.`DESCRIPCION` AS `DESCRIPCION`,`j`.`DESARROLLADORA` AS `DESARROLLADORA`,`j`.`MULTIPLAYER` AS `MULTIPLAYER`,`j`.`CANTIDAD_J` AS `CANTIDAD_J`,`j`.`PRECIO` AS `PRECIO`,`j`.`DURACION` AS `DURACION`,group_concat(distinct `g`.`GENERO` separator ', ') AS `GENEROS`,group_concat(distinct `p`.`PLATAFORMA` separator ', ') AS `PLATAFORMAS`,group_concat(distinct `i`.`IDIOMA` separator ', ') AS `IDIOMAS` from ((((((`juegos` `j` join `juego_genero` `jg` on((`j`.`ID` = `jg`.`ID_JUEGO`))) join `generos` `g` on((`jg`.`ID_GENERO` = `g`.`ID`))) join `juego_plataforma` `jp` on((`j`.`ID` = `jp`.`ID_JUEGO`))) join `plataformas` `p` on((`jp`.`ID_PLATAFORMA` = `p`.`ID`))) join `juego_idioma` `ji` on((`j`.`ID` = `ji`.`ID_JUEGO`))) join `idiomas` `i` on((`ji`.`ID_IDIOMA` = `i`.`ID`))) group by `j`.`TITULO`,`j`.`VALORACION`,`j`.`FECHA_L`,`j`.`PEGI`,`j`.`DESCRIPCION`,`j`.`DESARROLLADORA`,`j`.`MULTIPLAYER`,`j`.`CANTIDAD_J`,`j`.`PRECIO`,`j`.`DURACION` order by `j`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_juegos_plataformas`
--

/*!50001 DROP VIEW IF EXISTS `vw_juegos_plataformas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_juegos_plataformas` AS select `j`.`TITULO` AS `TITULO`,group_concat(`p`.`PLATAFORMA` separator ', ') AS `PLATAFORMAS` from ((`juegos` `j` join `juego_plataforma` `jp` on((`j`.`ID` = `jp`.`ID_JUEGO`))) join `plataformas` `p` on((`jp`.`ID_PLATAFORMA` = `p`.`ID`))) group by `j`.`TITULO` order by `j`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pegi`
--

/*!50001 DROP VIEW IF EXISTS `vw_pegi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pegi` AS select `juegos`.`TITULO` AS `TITULO`,(case when (`FN_ADULTOS`(`juegos`.`TITULO`) = 'Si') then 'Para adultos' else 'Para todos los públicos' end) AS `PEGI` from `juegos` order by `juegos`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_precios_en_pesos`
--

/*!50001 DROP VIEW IF EXISTS `vw_precios_en_pesos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_precios_en_pesos` AS select `juegos`.`TITULO` AS `TITULO`,`FN_PESOS`(`juegos`.`TITULO`,865.50) AS `PRECIO_PESOS` from `juegos` order by `juegos`.`TITULO` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_valoracion`
--

/*!50001 DROP VIEW IF EXISTS `vw_valoracion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_valoracion` AS select `juegos`.`TITULO` AS `TITULO`,`juegos`.`VALORACION` AS `VALORACION` from `juegos` order by `juegos`.`VALORACION` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 19:05:14
