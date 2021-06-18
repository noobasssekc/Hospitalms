-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalms
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `Doctor_id` int NOT NULL AUTO_INCREMENT,
  `Doctor_fname` tinytext,
  `Doctor_lname` tinytext,
  `Doctor_salary` int DEFAULT NULL,
  `Doctor_address` tinytext,
  PRIMARY KEY (`Doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Sahil','Khan',250000,'Shami Road'),(2,'Bilal','Khan',150000,'Warsak Road'),(3,'Shahmir','Ghani',350000,'Hayatabad'),(4,'Zayam','Ahmed',110500,'Gulbahar'),(5,'Ayesha','Sardar',160000,'Sarki');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalcentre`
--

DROP TABLE IF EXISTS `medicalcentre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalcentre` (
  `centre_id` int NOT NULL AUTO_INCREMENT,
  `centre_name` tinytext,
  `centre_rooms` int DEFAULT NULL,
  `center_address` tinytext,
  PRIMARY KEY (`centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalcentre`
--

LOCK TABLES `medicalcentre` WRITE;
/*!40000 ALTER TABLE `medicalcentre` DISABLE KEYS */;
INSERT INTO `medicalcentre` VALUES (1,'Hayatabad Medical Centre',5,'Phase 7 Peshawar');
/*!40000 ALTER TABLE `medicalcentre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecord`
--

DROP TABLE IF EXISTS `medicalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecord` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `Symptoms` tinytext,
  `doctor_name` tinytext,
  `Diagnosis` tinytext,
  `RecordDate` date DEFAULT NULL,
  `RecordTime` time DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `Room_req` tinytext,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `record_id_UNIQUE` (`record_id`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  CONSTRAINT `medicalrecord_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecord`
--

LOCK TABLES `medicalrecord` WRITE;
/*!40000 ALTER TABLE `medicalrecord` DISABLE KEYS */;
INSERT INTO `medicalrecord` VALUES (1,'flu',NULL,'malaria','2021-06-16','20:14:15',1,'Yes'),(4,'None',NULL,'None','2021-06-16','20:20:01',2,'No'),(7,'Flu and fever',NULL,'None','2021-06-18','01:08:37',3,'No'),(8,'none','sahil','Yes',NULL,NULL,4,'yes'),(9,'none',NULL,'none','2021-06-18','02:17:59',5,'Yes'),(11,'sda','Dr.Shahmir Ghani','sadad','2021-06-18','02:25:36',6,'    '),(13,'Flu and fever ','Dr.Zayam Ahmed','Nothing in particular','2021-06-18','02:41:23',7,'Yes'),(14,'dasdasdasdas','Dr.Ayesha Sardar','dasdasdas','2021-06-18','22:58:12',8,'Yes');
/*!40000 ALTER TABLE `medicalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `First_name` tinytext,
  `Last_name` tinytext,
  `Gender` tinytext,
  `Age` int DEFAULT NULL,
  `Mobile_num` varchar(255) DEFAULT NULL,
  `Disease` tinytext,
  `doctor_id` int DEFAULT NULL,
  `centre_id` int DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `Room_request` tinytext,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `centre_id` (`centre_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`Doctor_id`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`centre_id`) REFERENCES `medicalcentre` (`centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Sameer','Ahmed','Male	',21,'03109986450','none',NULL,NULL,NULL,NULL),(2,'Mansoor','Ahmed','Male	',46,'03219069860','None',NULL,NULL,NULL,NULL),(3,'Mian','Ahmad','Male	',12,'235123512412','Piles',NULL,NULL,NULL,NULL),(4,'Noor','Islam','Male	',21,'032169696969','none',NULL,NULL,NULL,NULL),(5,'safaf','rwrasdfas','Male	',12,'215151','nyyn',NULL,NULL,NULL,NULL),(6,'asdasd','asdfasdfa','Male	',412,'24124124','sdad',NULL,NULL,NULL,NULL),(7,'Sahil ','Ahmed','Male	',21,'0121241241','None',NULL,NULL,NULL,NULL),(8,'asdfasd','aasdasd','Male	',12,'15125151511','none',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-18 23:08:34
