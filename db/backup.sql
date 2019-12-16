-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookit
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `business_id` (`business_id`),
  KEY `user_id` (`user_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (6,'12/16/2019','2019-12-16 02:20:42','2019-12-16 02:20:42',1,1,3),(7,'12/18/2019','2019-12-16 02:20:59','2019-12-16 02:20:59',1,1,56),(8,'12/19/2019','2019-12-16 02:21:05','2019-12-16 02:21:05',1,1,64),(9,'12/21/2019','2019-12-16 02:21:11','2019-12-16 02:21:11',1,1,96);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `street_address` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businesses`
--

LOCK TABLES `businesses` WRITE;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
INSERT INTO `businesses` VALUES (1,'Newell Strength','12 Minneakoning Road','Flemington','NJ','08822','2019-12-15 21:04:10','2019-12-15 21:04:10'),(2,'Newell Strength','2 Ilene Court','Hillsborough','NJ','08844','2019-12-15 21:04:10','2019-12-15 21:04:10'),(3,'Hunterdon Wellness Center','1738 NJ-31','Clinton','NJ','08809','2019-12-15 21:04:10','2019-12-15 21:04:10'),(4,'HealthQuest Fitness','310 NJ-31','Flemington','NJ','08822','2019-12-15 21:04:10','2019-12-15 21:04:10');
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(150) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `start_time` time NOT NULL,
  `day_of_week` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `business_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_id` (`business_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Small Group Weight Training',15.00,'05:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(2,'Small Group Weight Training',15.00,'06:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(3,'Small Group Weight Training',15.00,'07:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(4,'Small Group Weight Training',10.00,'08:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(5,'Small Group Weight Training',15.00,'09:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(6,'Small Group Weight Training',15.00,'10:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(7,'Small Group Weight Training',15.00,'11:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(8,'Small Group Weight Training',15.00,'12:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(9,'Small Group Weight Training',15.00,'13:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(10,'Small Group Weight Training',15.00,'14:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(11,'Small Group Weight Training',15.00,'15:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(12,'Small Group Weight Training',15.00,'16:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(13,'Small Group Weight Training',15.00,'17:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(14,'Small Group Weight Training',15.00,'18:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(15,'Small Group Weight Training',15.00,'19:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(16,'Small Group Weight Training',15.00,'20:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(17,'Small Group Weight Training',15.00,'21:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(18,'Metabolic Enhancement Training',15.00,'06:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(19,'Metabolic Enhancement Training',15.00,'18:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(20,'Small Group Weight Training',15.00,'05:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(21,'Small Group Weight Training',15.00,'06:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(22,'Small Group Weight Training',15.00,'07:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(23,'Small Group Weight Training',10.00,'08:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(24,'Small Group Weight Training',15.00,'09:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(25,'Small Group Weight Training',15.00,'10:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(26,'Small Group Weight Training',15.00,'11:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(27,'Small Group Weight Training',15.00,'12:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(28,'Small Group Weight Training',15.00,'13:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(29,'Small Group Weight Training',15.00,'14:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(30,'Small Group Weight Training',15.00,'15:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(31,'Small Group Weight Training',15.00,'16:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(32,'Small Group Weight Training',15.00,'17:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(33,'Small Group Weight Training',15.00,'18:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(34,'Small Group Weight Training',15.00,'19:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(35,'Small Group Weight Training',15.00,'20:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(36,'Small Group Weight Training',15.00,'21:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(37,'Metabolic Enhancement Training',15.00,'06:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(38,'Metabolic Enhancement Training',15.00,'18:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(39,'Small Group Weight Training',15.00,'05:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(40,'Small Group Weight Training',15.00,'06:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(41,'Small Group Weight Training',15.00,'07:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(42,'Small Group Weight Training',10.00,'08:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(43,'Small Group Weight Training',15.00,'09:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(44,'Small Group Weight Training',15.00,'10:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(45,'Small Group Weight Training',15.00,'11:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(46,'Small Group Weight Training',15.00,'12:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(47,'Small Group Weight Training',15.00,'13:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(48,'Small Group Weight Training',15.00,'14:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(49,'Small Group Weight Training',15.00,'15:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(50,'Small Group Weight Training',15.00,'16:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(51,'Small Group Weight Training',15.00,'17:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(52,'Small Group Weight Training',15.00,'18:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(53,'Small Group Weight Training',15.00,'19:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(54,'Small Group Weight Training',15.00,'20:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(55,'Small Group Weight Training',15.00,'21:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(56,'Metabolic Enhancement Training',15.00,'06:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(57,'Metabolic Enhancement Training',15.00,'18:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(58,'Small Group Weight Training',15.00,'05:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(59,'Small Group Weight Training',15.00,'06:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(60,'Small Group Weight Training',15.00,'07:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(61,'Small Group Weight Training',10.00,'08:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(62,'Small Group Weight Training',15.00,'09:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(63,'Small Group Weight Training',15.00,'10:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(64,'Small Group Weight Training',15.00,'11:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(65,'Small Group Weight Training',15.00,'12:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(66,'Small Group Weight Training',15.00,'13:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(67,'Small Group Weight Training',15.00,'14:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(68,'Small Group Weight Training',15.00,'15:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(69,'Small Group Weight Training',15.00,'16:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(70,'Small Group Weight Training',15.00,'17:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(71,'Small Group Weight Training',15.00,'18:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(72,'Small Group Weight Training',15.00,'19:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(73,'Small Group Weight Training',15.00,'20:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(74,'Small Group Weight Training',15.00,'21:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(75,'Metabolic Enhancement Training',15.00,'06:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(76,'Metabolic Enhancement Training',15.00,'18:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(77,'Small Group Weight Training',15.00,'05:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(78,'Small Group Weight Training',15.00,'06:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(79,'Small Group Weight Training',15.00,'07:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(80,'Small Group Weight Training',10.00,'08:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(81,'Small Group Weight Training',15.00,'09:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(82,'Small Group Weight Training',15.00,'10:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(83,'Small Group Weight Training',15.00,'11:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(84,'Small Group Weight Training',15.00,'12:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(85,'Small Group Weight Training',15.00,'13:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(86,'Small Group Weight Training',15.00,'14:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(87,'Small Group Weight Training',15.00,'15:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(88,'Small Group Weight Training',15.00,'16:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(89,'Small Group Weight Training',15.00,'17:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(90,'Small Group Weight Training',15.00,'18:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(91,'Small Group Weight Training',15.00,'19:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(92,'Small Group Weight Training',15.00,'20:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(93,'Small Group Weight Training',15.00,'21:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(94,'Metabolic Enhancement Training',15.00,'06:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(95,'Metabolic Enhancement Training',15.00,'18:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(96,'Small Group Weight Training',15.00,'06:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(97,'Small Group Weight Training',15.00,'07:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(98,'Small Group Weight Training',10.00,'08:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(99,'Small Group Weight Training',15.00,'09:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(100,'Small Group Weight Training',15.00,'10:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(101,'Small Group Weight Training',15.00,'11:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(102,'Metabolic Enhancement Training',15.00,'06:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(103,'Metabolic Enhancement Training',15.00,'18:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(104,'Small Group Weight Training',15.00,'05:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(105,'Small Group Weight Training',15.00,'06:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(106,'Small Group Weight Training',15.00,'07:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(107,'Small Group Weight Training',10.00,'08:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(108,'Small Group Weight Training',15.00,'09:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(109,'Small Group Weight Training',15.00,'10:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(110,'Small Group Weight Training',15.00,'11:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(111,'Small Group Weight Training',15.00,'12:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(112,'Small Group Weight Training',15.00,'13:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(113,'Small Group Weight Training',15.00,'14:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(114,'Small Group Weight Training',15.00,'15:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(115,'Small Group Weight Training',15.00,'16:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(116,'Small Group Weight Training',15.00,'17:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(117,'Small Group Weight Training',15.00,'18:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(118,'Small Group Weight Training',15.00,'19:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(119,'Small Group Weight Training',15.00,'20:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(120,'Small Group Weight Training',15.00,'21:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(121,'Metabolic Enhancement Training',15.00,'06:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(122,'Metabolic Enhancement Training',15.00,'18:00:00',0,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(123,'Small Group Weight Training',15.00,'05:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(124,'Small Group Weight Training',15.00,'06:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(125,'Small Group Weight Training',15.00,'07:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(126,'Small Group Weight Training',10.00,'08:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(127,'Small Group Weight Training',15.00,'09:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(128,'Small Group Weight Training',15.00,'10:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(129,'Small Group Weight Training',15.00,'11:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(130,'Small Group Weight Training',15.00,'12:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(131,'Small Group Weight Training',15.00,'13:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(132,'Small Group Weight Training',15.00,'14:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(133,'Small Group Weight Training',15.00,'15:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(134,'Small Group Weight Training',15.00,'16:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(135,'Small Group Weight Training',15.00,'17:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(136,'Small Group Weight Training',15.00,'18:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(137,'Small Group Weight Training',15.00,'19:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(138,'Small Group Weight Training',15.00,'20:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(139,'Small Group Weight Training',15.00,'21:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(140,'Metabolic Enhancement Training',15.00,'06:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(141,'Metabolic Enhancement Training',15.00,'18:00:00',1,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(142,'Small Group Weight Training',15.00,'05:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(143,'Small Group Weight Training',15.00,'06:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(144,'Small Group Weight Training',15.00,'07:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(145,'Small Group Weight Training',10.00,'08:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(146,'Small Group Weight Training',15.00,'09:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(147,'Small Group Weight Training',15.00,'10:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(148,'Small Group Weight Training',15.00,'11:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(149,'Small Group Weight Training',15.00,'12:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(150,'Small Group Weight Training',15.00,'13:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(151,'Small Group Weight Training',15.00,'14:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(152,'Small Group Weight Training',15.00,'15:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(153,'Small Group Weight Training',15.00,'16:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(154,'Small Group Weight Training',15.00,'17:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(155,'Small Group Weight Training',15.00,'18:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(156,'Small Group Weight Training',15.00,'19:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(157,'Small Group Weight Training',15.00,'20:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(158,'Small Group Weight Training',15.00,'21:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(159,'Metabolic Enhancement Training',15.00,'06:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(160,'Metabolic Enhancement Training',15.00,'18:00:00',2,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(161,'Small Group Weight Training',15.00,'05:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(162,'Small Group Weight Training',15.00,'06:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(163,'Small Group Weight Training',15.00,'07:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(164,'Small Group Weight Training',10.00,'08:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(165,'Small Group Weight Training',15.00,'09:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(166,'Small Group Weight Training',15.00,'10:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(167,'Small Group Weight Training',15.00,'11:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(168,'Small Group Weight Training',15.00,'12:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(169,'Small Group Weight Training',15.00,'13:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(170,'Small Group Weight Training',15.00,'14:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(171,'Small Group Weight Training',15.00,'15:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(172,'Small Group Weight Training',15.00,'16:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(173,'Small Group Weight Training',15.00,'17:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(174,'Small Group Weight Training',15.00,'18:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(175,'Small Group Weight Training',15.00,'19:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(176,'Small Group Weight Training',15.00,'20:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(177,'Small Group Weight Training',15.00,'21:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(178,'Metabolic Enhancement Training',15.00,'06:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(179,'Metabolic Enhancement Training',15.00,'18:00:00',3,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(180,'Small Group Weight Training',15.00,'05:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(181,'Small Group Weight Training',15.00,'06:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(182,'Small Group Weight Training',15.00,'07:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(183,'Small Group Weight Training',10.00,'08:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(184,'Small Group Weight Training',15.00,'09:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(185,'Small Group Weight Training',15.00,'10:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(186,'Small Group Weight Training',15.00,'11:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(187,'Small Group Weight Training',15.00,'12:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(188,'Small Group Weight Training',15.00,'13:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(189,'Small Group Weight Training',15.00,'14:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(190,'Small Group Weight Training',15.00,'15:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(191,'Small Group Weight Training',15.00,'16:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(192,'Small Group Weight Training',15.00,'17:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(193,'Small Group Weight Training',15.00,'18:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(194,'Small Group Weight Training',15.00,'19:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(195,'Small Group Weight Training',15.00,'20:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(196,'Small Group Weight Training',15.00,'21:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(197,'Metabolic Enhancement Training',15.00,'06:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(198,'Metabolic Enhancement Training',15.00,'18:00:00',4,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(199,'Small Group Weight Training',15.00,'06:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(200,'Small Group Weight Training',15.00,'07:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(201,'Small Group Weight Training',10.00,'08:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(202,'Small Group Weight Training',15.00,'09:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(203,'Small Group Weight Training',15.00,'10:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(204,'Small Group Weight Training',15.00,'11:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(205,'Metabolic Enhancement Training',15.00,'06:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(206,'Metabolic Enhancement Training',15.00,'18:00:00',5,'2019-12-15 21:04:10','2019-12-15 21:04:10',2),(207,'Specialized Lift Training',20.00,'11:00:00',6,'2019-12-15 21:04:10','2019-12-15 21:04:10',1),(208,'Specialized Lift Training',20.00,'11:00:00',6,'2019-12-15 21:04:10','2019-12-15 21:04:10',2);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jay@jay.com','$2a$10$XNowq4t9yUf0jXTIHtW2v.AdMcN/sPvvMSP9bJCWqDUVKyvrGwEjO','2019-12-16 02:04:42','2019-12-16 02:04:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-15 21:47:25
