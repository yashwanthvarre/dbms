-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: PAPERREVIEW
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `AUTHOR`
--

DROP TABLE IF EXISTS `AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHOR` (
  `Emailaddress` varchar(255) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`Emailaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHOR`
--

LOCK TABLES `AUTHOR` WRITE;
/*!40000 ALTER TABLE `AUTHOR` DISABLE KEYS */;
INSERT INTO `AUTHOR` VALUES ('chetan@gmail.com','chetan','bhagat'),('dan@gmail.com','dan','brown'),('jane@gmail.com','jane','austen'),('sidney@gmail.com','sidney','sheldon');
/*!40000 ALTER TABLE `AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAPER`
--

DROP TABLE IF EXISTS `PAPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAPER` (
  `paperid` int unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `Emailaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`paperid`),
  KEY `Emailaddress` (`Emailaddress`),
  CONSTRAINT `PAPER_ibfk_1` FOREIGN KEY (`Emailaddress`) REFERENCES `AUTHOR` (`Emailaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAPER`
--

LOCK TABLES `PAPER` WRITE;
/*!40000 ALTER TABLE `PAPER` DISABLE KEYS */;
INSERT INTO `PAPER` VALUES (101,'davincicode','ignore the power of women at peril','code','dan@gmail.com'),(102,'pride n prejudice','classic comedy','prejudice','jane@gmail.com'),(103,'five point someone','a story about 3 guys at iit','btech','chetan@gmail.com'),(104,'if tommorrow comes','a revenge story','tommorrow','sidney@gmail.com');
/*!40000 ALTER TABLE `PAPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW`
--

DROP TABLE IF EXISTS `REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEW` (
  `reviewid` int unsigned NOT NULL,
  `recommendation` varchar(255) DEFAULT NULL,
  `meritscore` int DEFAULT NULL,
  `readabilityscore` int DEFAULT NULL,
  `originalityscore` int DEFAULT NULL,
  `relavancescore` int DEFAULT NULL,
  `paperid` int unsigned NOT NULL,
  `reviewerid` int unsigned NOT NULL,
  PRIMARY KEY (`reviewid`),
  KEY `paperid` (`paperid`),
  KEY `reviewerid` (`reviewerid`),
  CONSTRAINT `REVIEW_ibfk_1` FOREIGN KEY (`paperid`) REFERENCES `PAPER` (`paperid`),
  CONSTRAINT `REVIEW_ibfk_2` FOREIGN KEY (`reviewerid`) REFERENCES `REVIEWER` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW`
--

LOCK TABLES `REVIEW` WRITE;
/*!40000 ALTER TABLE `REVIEW` DISABLE KEYS */;
INSERT INTO `REVIEW` VALUES (401,'great',79,80,90,78,101,201),(402,'highly recommended',69,87,98,68,102,202),(403,'good',95,97,78,88,103,203),(404,'not recommended',85,77,77,58,104,204);
/*!40000 ALTER TABLE `REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEWER`
--

DROP TABLE IF EXISTS `REVIEWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEWER` (
  `reviewerid` int unsigned NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `Authorfeedback` varchar(255) DEFAULT NULL,
  `Commiteefeedback` varchar(255) DEFAULT NULL,
  `phone` int unsigned DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  `paperid` int unsigned NOT NULL,
  PRIMARY KEY (`reviewerid`),
  KEY `paperid` (`paperid`),
  CONSTRAINT `REVIEWER_ibfk_1` FOREIGN KEY (`paperid`) REFERENCES `PAPER` (`paperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEWER`
--

LOCK TABLES `REVIEWER` WRITE;
/*!40000 ALTER TABLE `REVIEWER` DISABLE KEYS */;
INSERT INTO `REVIEWER` VALUES (201,'yash','varre','good paper','useful',8989898,'yash@gmail.com',101),(202,'manoj','kumar','excellent','verygood',8989844,'manoj@gmail.com',102),(203,'kiran','sai','interesting','helpful',8989344,'kiran@gmail.com',103),(204,'raj','reddy','better','best',8989374,'raj@gmail.com',104);
/*!40000 ALTER TABLE `REVIEWER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOPIC`
--

DROP TABLE IF EXISTS `TOPIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TOPIC` (
  `topicid` int unsigned NOT NULL,
  `topicname` varchar(255) DEFAULT NULL,
  `reviewerid` int unsigned NOT NULL,
  PRIMARY KEY (`topicid`),
  KEY `reviewerid` (`reviewerid`),
  CONSTRAINT `TOPIC_ibfk_1` FOREIGN KEY (`reviewerid`) REFERENCES `REVIEWER` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOPIC`
--

LOCK TABLES `TOPIC` WRITE;
/*!40000 ALTER TABLE `TOPIC` DISABLE KEYS */;
INSERT INTO `TOPIC` VALUES (301,'ACTION',201),(302,'COMEDY',202),(303,'THRILLER',203),(304,'ROMANCE',204);
/*!40000 ALTER TABLE `TOPIC` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 23:29:49
