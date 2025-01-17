-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: weather_forecast
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `ApiKeys`
--

DROP TABLE IF EXISTS `ApiKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApiKeys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyName` varchar(255) NOT NULL,
  `keyValue` text NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyName` (`keyName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApiKeys`
--

LOCK TABLES `ApiKeys` WRITE;
/*!40000 ALTER TABLE `ApiKeys` DISABLE KEYS */;
INSERT INTO `ApiKeys` VALUES (1,'MAPBOX_API_KEY','pk.eyJ1IjoibGFsaXRuIiwiYSI6ImNtNXc5ZmY1djBiYWMya3F6enhvbDhjdnoifQ.SwF5BwqWgDh_ZRXQIjqKxg','2025-01-16 06:34:36','2025-01-16 06:34:36'),(2,'OPENWEATHERMAP_API_KEY','5ff88c102adde81b0cc80f227f88b4bb','2025-01-16 06:34:36','2025-01-16 06:34:36');
/*!40000 ALTER TABLE `ApiKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeatherRequests`
--

DROP TABLE IF EXISTS `WeatherRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WeatherRequests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `weather` json NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeatherRequests`
--

LOCK TABLES `WeatherRequests` WRITE;
/*!40000 ALTER TABLE `WeatherRequests` DISABLE KEYS */;
INSERT INTO `WeatherRequests` VALUES (1,'nashik',20.00665800,73.78947700,'{\"temp\": 27.29, \"humidity\": 33, \"temp_max\": 27.29, \"temp_min\": 27.29, \"feels_like\": 26.73, \"description\": \"scattered clouds\"}','2025-01-14 11:31:33','2025-01-14 11:31:33'),(2,'pune',18.51566900,73.85628700,'{\"temp\": 30.64, \"humidity\": 27, \"temp_max\": 30.64, \"temp_min\": 30.64, \"feels_like\": 29.14, \"description\": \"clear sky\"}','2025-01-14 11:33:16','2025-01-14 11:33:16');
/*!40000 ALTER TABLE `WeatherRequests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-17 13:13:49
