CREATE DATABASE  IF NOT EXISTS `games_dw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `games_dw`;
-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: games_dw
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Table structure for table `dim_game`
--

DROP TABLE IF EXISTS `dim_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_title` varchar(150) NOT NULL,
  `game_year` year(4) NOT NULL,
  `game_publisher` varchar(100) NOT NULL,
  `game_platform` varchar(25) NOT NULL,
  `game_genre` varchar(25) NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `idx_game_title` (`game_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_genre`
--

DROP TABLE IF EXISTS `dim_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(25) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_platform`
--

DROP TABLE IF EXISTS `dim_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_platform` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(25) NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_publisher`
--

DROP TABLE IF EXISTS `dim_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fato_sales`
--

DROP TABLE IF EXISTS `fato_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fato_sales` (
  `id_sales` int(11) NOT NULL AUTO_INCREMENT,
  `id_game` int(11) NOT NULL,
  `id_publisher` int(11) NOT NULL,
  `id_platform` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `year_sales` year(4) NOT NULL,
  `na_sales` decimal(5,2) NOT NULL COMMENT 'Sales in North America (in millions).',
  `eu_sales` decimal(5,2) NOT NULL COMMENT 'Sales in Europe (in millions).',
  `jp_sales` decimal(5,2) NOT NULL COMMENT 'Sales in Japan (in millions).',
  `ot_sales` decimal(5,2) NOT NULL COMMENT 'Sales in the rest of the world (in millions).',
  `gb_sales` decimal(5,2) NOT NULL COMMENT 'Total worldwide sales.',
  PRIMARY KEY (`id_sales`),
  KEY `fk_sales_game_idx` (`id_game`),
  KEY `fk_sales_publisher_idx` (`id_publisher`),
  KEY `fk_sales_platform_idx` (`id_platform`),
  KEY `fk_sales_genre_idx` (`id_genre`),
  CONSTRAINT `fk_sales_game` FOREIGN KEY (`id_game`) REFERENCES `dim_game` (`game_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_genre` FOREIGN KEY (`id_genre`) REFERENCES `dim_genre` (`genre_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_platform` FOREIGN KEY (`id_platform`) REFERENCES `dim_platform` (`platform_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_publisher` FOREIGN KEY (`id_publisher`) REFERENCES `dim_publisher` (`publisher_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'games_dw'
--

--
-- Dumping routines for database 'games_dw'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-27  9:24:07
