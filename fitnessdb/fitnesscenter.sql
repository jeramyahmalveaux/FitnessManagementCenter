-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: fitnesscenter
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `CheckInTime` datetime NOT NULL,
  `CheckOutTime` datetime DEFAULT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `ClassID` int NOT NULL,
  `BookingDate` date NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `ClassID` (`ClassID`),
  KEY `bookings_ibfk_1` (`MemberID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`) ON DELETE CASCADE,
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `fk_member` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,77,2,'2024-12-24'),(2,87,1,'2024-12-10'),(3,93,4,'2024-12-08'),(4,16,3,'2024-12-26'),(5,12,1,'2024-12-06'),(6,8,1,'2024-12-05'),(7,3,4,'2024-12-29'),(8,24,5,'2024-12-21'),(9,64,2,'2024-12-17'),(10,96,2,'2024-12-31'),(11,4,2,'2024-12-05'),(12,91,2,'2024-12-23'),(13,28,4,'2024-12-11'),(14,96,1,'2024-12-25'),(15,30,5,'2024-12-24');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classcategories`
--

DROP TABLE IF EXISTS `classcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classcategories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classcategories`
--

LOCK TABLES `classcategories` WRITE;
/*!40000 ALTER TABLE `classcategories` DISABLE KEYS */;
INSERT INTO `classcategories` VALUES (1,'Yoga'),(2,'Cardio'),(3,'Strength Training');
/*!40000 ALTER TABLE `classcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `ClassID` int NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(100) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `TrainerID` int NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `TrainerID` (`TrainerID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainers` (`TrainerID`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `classcategories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Strength Training','06:00:00','08:00:00',29,3,1),(2,'Yoga Class','11:00:00','13:00:00',20,2,2),(3,'Strength Training','10:45:00','12:45:00',12,1,2),(4,'Cardio Blast','16:30:00','18:30:00',17,4,2),(5,'Yoga Class','10:45:00','11:45:00',20,5,2);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `MembershipTypeID` int NOT NULL,
  `JoinDate` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `MembershipTypeID` (`MembershipTypeID`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`MembershipTypeID`) REFERENCES `membershiptypes` (`MembershipTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Dr. Brent Kuhlman','838.428.4674 x5','dr..brent@example.com',2,'2024-04-16','2025-09-24'),(2,'Geoffrey Hodkiewicz','1-832-382-9188 ','geoffrey.hodkiewicz@example.com',2,'2024-02-24','2024-12-27'),(3,'Dr. Doreen Adams','559.278.4083 x3','dr..doreen@example.com',4,'2024-03-22','2025-01-15'),(4,'Josefina Dickens','(671) 299-1452 ','josefina.dickens@example.com',2,'2024-01-31','2025-06-18'),(5,'Nathan Raynor','1-336-326-9099','nathan.raynor@example.com',2,'2024-08-12','2024-12-20'),(6,'Harry Funk','1-691-484-6347 ','harry.funk@example.com',4,'2024-04-26','2025-06-27'),(7,'Margaret Feest','479-930-1747 x3','margaret.feest@example.com',4,'2024-09-02','2025-09-06'),(8,'Curtis West','915.468.9806 x1','curtis.west@example.com',4,'2024-05-31','2025-06-10'),(9,'Mr. Terrell Von','(493) 205-6731 ','mr..terrell@example.com',1,'2024-08-02','2025-10-02'),(10,'Lynn Gutkowski','(642) 419-1908 ','lynn.gutkowski@example.com',4,'2024-09-25','2025-07-14'),(11,'Horace Huel','1-274-880-4092','horace.huel@example.com',4,'2024-07-14','2025-05-04'),(12,'Larry Gutmann','594.962.6077 x4','larry.gutmann@example.com',2,'2024-04-07','2025-02-06'),(13,'Mattie Wolff Jr.','422-539-2362 x4','mattie.wolff@example.com',2,'2024-03-21','2025-08-06'),(14,'Krista Hyatt','1-966-781-9898 ','krista.hyatt@example.com',2,'2024-04-28','2025-01-03'),(15,'Eunice Rutherford','531-708-8951','eunice.rutherford@example.com',4,'2024-11-27','2025-11-26'),(16,'Dr. Rita Krajcik','409.968.6262 x5','dr..rita@example.com',1,'2024-04-12','2025-03-22'),(17,'Shawna Schulist','(593) 397-3775 ','shawna.schulist@example.com',4,'2024-11-24','2025-08-19'),(18,'Mr. Shane Herman','1-307-400-8929 ','mr..shane@example.com',2,'2024-08-19','2025-04-02'),(19,'Christy Predovic','(818) 841-3484 ','christy.predovic@example.com',4,'2024-07-29','2025-04-26'),(20,'Janie Hermann','889-546-9065 x0','janie.hermann@example.com',2,'2024-11-11','2025-03-06'),(21,'Oliver Sanford','610.414.6188 x2','oliver.sanford@example.com',1,'2024-10-19','2025-06-12'),(22,'Robert Kris II','214-508-4396 x4','robert.kris@example.com',4,'2023-12-04','2025-01-02'),(23,'Brittany Green','758-861-8785','brittany.green@example.com',1,'2024-08-03','2025-10-13'),(24,'Victor Mills MD','643.971.3536 x4','victor.mills@example.com',2,'2024-09-11','2025-02-18'),(25,'Jeff Heathcote','(577) 394-1580 ','jeff.heathcote@example.com',4,'2024-07-20','2025-10-01'),(26,'Don Roberts','461.603.3476 x4','don.roberts@example.com',4,'2024-05-17','2025-04-01'),(27,'Traci Herman','1-369-282-2003','traci.herman@example.com',3,'2024-09-26','2024-12-22'),(28,'Mae Hackett','1-669-393-8205 ','mae.hackett@example.com',3,'2024-06-25','2025-07-23'),(29,'Claire Kulas-Hudson','(938) 757-5095 ','claire.kulas-hudson@example.com',3,'2024-01-12','2025-04-02'),(30,'Mable Cummings Sr.','1-381-722-3682','mable.cummings@example.com',2,'2024-07-30','2025-06-17'),(31,'Elvira Hyatt','1-498-206-8002 ','elvira.hyatt@example.com',1,'2024-06-01','2025-05-06'),(32,'Roosevelt Rohan','638.527.1358','roosevelt.rohan@example.com',3,'2024-07-26','2025-09-26'),(33,'Tonya Herman V','593.891.6140 x3','tonya.herman@example.com',3,'2024-09-21','2025-08-14'),(34,'Sidney Jaskolski','243-299-0932 x1','sidney.jaskolski@example.com',3,'2024-01-09','2025-01-27'),(35,'Jenny Kessler','796.743.6683 x5','jenny.kessler@example.com',2,'2024-04-23','2025-10-13'),(36,'Megan Schmeler','241-433-4768 x2','megan.schmeler@example.com',2,'2024-11-10','2025-04-22'),(37,'Chris Tillman','1-890-945-0303 ','chris.tillman@example.com',1,'2024-05-20','2025-08-24'),(38,'Gordon Denesik','856.635.2778 x2','gordon.denesik@example.com',3,'2024-06-03','2025-09-03'),(39,'Ana Steuber IV','(851) 816-9111 ','ana.steuber@example.com',1,'2024-10-27','2025-05-10'),(40,'Todd Marquardt','1-778-560-1321 ','todd.marquardt@example.com',1,'2024-09-04','2025-01-11'),(41,'Irma Kertzmann','267.652.2164 x9','irma.kertzmann@example.com',3,'2024-08-25','2024-12-04'),(42,'Mario Kessler-Mosciski','(403) 994-8022 ','mario.kessler-mosciski@example.com',4,'2024-08-02','2025-08-26'),(43,'Carroll Hilpert','971-891-6090','carroll.hilpert@example.com',2,'2024-08-24','2025-10-31'),(44,'Toni Nitzsche','689-582-3488 x2','toni.nitzsche@example.com',4,'2024-04-11','2025-04-20'),(45,'Kevin Conn','288.547.9084 x2','kevin.conn@example.com',3,'2024-01-02','2025-06-23'),(46,'Carrie Pacocha','227.766.3756','carrie.pacocha@example.com',1,'2024-07-01','2025-04-09'),(47,'Mr. Greg Pagac','808.200.7846 x3','mr..greg@example.com',3,'2024-10-27','2025-11-25'),(48,'Anne Pagac','1-588-612-5625 ','anne.pagac@example.com',1,'2024-01-12','2025-04-25'),(49,'Orville Crist','(611) 761-6150','orville.crist@example.com',2,'2024-04-01','2025-01-10'),(50,'Erika Pacocha','346-639-5187 x2','erika.pacocha@example.com',2,'2024-03-17','2025-09-19'),(51,'Pedro Kohler Jr.','(797) 250-4821 ','pedro.kohler@example.com',2,'2024-11-02','2024-12-06'),(52,'Kerry Rolfson','848-553-3231 x4','kerry.rolfson@example.com',4,'2024-05-01','2024-12-03'),(53,'Iris Skiles','937-439-3764','iris.skiles@example.com',4,'2023-12-19','2025-01-29'),(54,'Jennifer Turcotte','391-284-6217','jennifer.turcotte@example.com',4,'2024-10-07','2025-03-17'),(55,'Cathy Stokes','(493) 477-7223 ','cathy.stokes@example.com',4,'2024-06-12','2025-10-11'),(56,'Raul Witting','(406) 334-6827 ','raul.witting@example.com',3,'2024-07-26','2025-02-03'),(57,'Jackie Little','1-377-985-1786 ','jackie.little@example.com',2,'2023-12-22','2025-08-08'),(58,'Cesar Wolff','1-880-892-6475','cesar.wolff@example.com',3,'2024-11-16','2025-09-18'),(59,'Simon Conroy','668.457.7086 x5','simon.conroy@example.com',2,'2024-04-25','2025-07-27'),(60,'Mr. Alan Torphy','1-307-255-4462 ','mr..alan@example.com',3,'2024-12-02','2025-08-16'),(61,'Bill Prohaska','1-405-760-0324 ','bill.prohaska@example.com',1,'2024-05-02','2025-07-28'),(62,'Vickie Watsica','591.861.2425','vickie.watsica@example.com',3,'2024-08-15','2025-11-25'),(63,'Myra Gleason','1-650-305-3061 ','myra.gleason@example.com',3,'2024-08-13','2025-10-23'),(64,'Jennifer Schuster','242.895.7321','jennifer.schuster@example.com',3,'2024-01-21','2025-11-12'),(65,'Larry Berge','1-859-484-8728','larry.berge@example.com',4,'2024-05-31','2025-09-11'),(66,'Jack Graham','1-645-399-6917 ','jack.graham@example.com',2,'2024-11-12','2025-02-21'),(67,'Nicholas Hagenes','1-552-521-9546 ','nicholas.hagenes@example.com',1,'2024-11-16','2025-02-10'),(68,'Sylvester Schmeler','(509) 974-3399 ','sylvester.schmeler@example.com',1,'2024-07-28','2025-09-09'),(69,'Roderick Bernhard','679.470.9339','roderick.bernhard@example.com',3,'2023-12-30','2025-02-15'),(70,'Jodi Huels','750-647-3648 x1','jodi.huels@example.com',2,'2024-04-24','2025-05-28'),(71,'Dawn O\'Kon','247-783-0601 x2','dawn.o\'kon@example.com',4,'2024-10-19','2025-05-26'),(72,'Jose Howe','897.764.5960','jose.howe@example.com',2,'2024-02-03','2025-06-16'),(73,'Jean Mosciski','1-566-394-2543','jean.mosciski@example.com',3,'2024-05-02','2025-01-21'),(74,'Mable Grady','991-283-2425','mable.grady@example.com',2,'2024-02-22','2025-10-26'),(75,'Roy Swaniawski','996-961-7203','roy.swaniawski@example.com',2,'2024-04-02','2025-11-20'),(76,'Sandra Doyle','662.785.0181','sandra.doyle@example.com',3,'2024-05-05','2025-05-20'),(77,'Wayne Ledner','1-278-858-4448 ','wayne.ledner@example.com',3,'2024-11-05','2025-08-21'),(78,'Violet Lowe','395.664.1503 x3','violet.lowe@example.com',3,'2024-06-02','2025-10-05'),(79,'Dr. Freda Weber-Barton','333.498.9749','dr..freda@example.com',4,'2024-06-01','2025-02-14'),(80,'Mr. Wilbert Haag','(524) 639-8252 ','mr..wilbert@example.com',1,'2024-02-29','2025-11-21'),(81,'Margaret Jaskolski','1-256-744-9984 ','margaret.jaskolski@example.com',3,'2024-05-10','2025-10-21'),(82,'Dr. Guillermo Heaney','1-861-533-3913 ','dr..guillermo@example.com',3,'2024-09-28','2025-06-07'),(83,'Blanca McGlynn','776-229-4675','blanca.mcglynn@example.com',1,'2024-08-01','2025-09-03'),(84,'Miss Margarita Cronin MD','417.654.3127 x7','miss.margarita@example.com',4,'2024-01-25','2025-08-12'),(85,'Elena Schmidt','475.867.5088 x3','elena.schmidt@example.com',3,'2023-12-25','2025-06-05'),(86,'Jackie O\'Reilly','452.700.4618 x0','jackie.o\'reilly@example.com',3,'2024-09-19','2025-09-17'),(87,'Robin Turcotte','(544) 820-3626 ','robin.turcotte@example.com',3,'2024-07-19','2025-01-31'),(88,'Dr. Bill Bernhard','440.529.3868 x6','dr..bill@example.com',3,'2024-09-23','2025-03-05'),(89,'Kay Hahn','917.218.1494 x9','kay.hahn@example.com',1,'2024-08-31','2025-01-22'),(90,'Laverne Schamberger','(676) 484-8744','laverne.schamberger@example.com',4,'2023-12-27','2025-07-23'),(91,'Mrs. Joanne Hane','428.976.5043 x0','mrs..joanne@example.com',4,'2024-01-02','2025-08-26'),(92,'Felicia Howe','684.296.6714 x1','felicia.howe@example.com',1,'2024-04-24','2025-08-31'),(93,'Mr. Mario Hilll-Kozey','543.708.9133 x2','mr..mario@example.com',1,'2024-01-01','2025-10-02'),(94,'Miss Jennifer Wisozk-Buckridge V','(282) 319-0719 ','miss.jennifer@example.com',3,'2024-10-08','2024-12-09'),(95,'Rudolph Okuneva','1-916-471-4090 ','rudolph.okuneva@example.com',4,'2024-04-10','2025-08-24'),(96,'Dr. Benny Hagenes','(459) 673-7407 ','dr..benny@example.com',4,'2024-05-09','2025-03-25'),(97,'Joanna Swift','1-298-728-0882','joanna.swift@example.com',4,'2024-08-31','2025-10-16'),(98,'Erin Jast','572.592.9226 x9','erin.jast@example.com',2,'2024-06-13','2025-09-19'),(99,'Elisa Howell-Thompson','1-498-771-7065 ','elisa.howell-thompson@example.com',4,'2024-06-26','2025-09-25'),(100,'Christopher Dare','1-217-970-3544 ','christopher.dare@example.com',4,'2024-05-15','2025-08-26');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershiptypes`
--

DROP TABLE IF EXISTS `membershiptypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membershiptypes` (
  `MembershipTypeID` int NOT NULL AUTO_INCREMENT,
  `MembershipName` varchar(50) NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `DurationMonths` int NOT NULL,
  PRIMARY KEY (`MembershipTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiptypes`
--

LOCK TABLES `membershiptypes` WRITE;
/*!40000 ALTER TABLE `membershiptypes` DISABLE KEYS */;
INSERT INTO `membershiptypes` VALUES (1,'Bronze',50.00,1),(2,'Silver',125.00,3),(3,'Gold',200.00,6),(4,'Platinum',350.00,12);
/*!40000 ALTER TABLE `membershiptypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Rodney Swift','Manager','734-792-8977','rodney.swift@fitnesscenter.com','2015-09-25'),(2,'Paul Rohan','Manager','(545) 409-8325 ','paul.rohan@fitnesscenter.com','2024-03-11'),(3,'Lucille Shields','Manager','599.936.1589 x5','lucille.shields@fitnesscenter.com','2021-04-27'),(4,'Pearl Upton','Janitor','(724) 976-8363 ','pearl.upton@fitnesscenter.com','2021-02-10'),(5,'Shirley Torp','Front Desk','977.487.6514 x9','shirley.torp@fitnesscenter.com','2020-08-14'),(6,'Lola Beahan','Maintenance','(786) 929-2213 ','lola.beahan@fitnesscenter.com','2015-12-28'),(7,'Carla Gleichner','Front Desk','1-612-270-8355','carla.gleichner@fitnesscenter.com','2021-06-30'),(8,'Vera Abshire','Janitor','(256) 834-9714','vera.abshire@fitnesscenter.com','2019-08-09'),(9,'Bernice Morissette','Maintenance','1-560-939-1379 ','bernice.morissette@fitnesscenter.com','2024-09-03'),(10,'Barbara Abernathy','Maintenance','(962) 572-3820','barbara.abernathy@fitnesscenter.com','2018-07-07');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `TrainerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Schedule` text,
  PRIMARY KEY (`TrainerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Vera Kerluke','Strength Training','1-937-984-3006 ','vera.kerluke@example.com','Sat-Sun: 8 AM - 11 AM'),(2,'Phil Moen','Strength Training','(372) 952-7533 ','phil.moen@example.com','Fri-Sun: 2 PM - 6 PM'),(3,'Antoinette Hegmann','Yoga','1-541-936-9472','antoinette.hegmann@example.com','Tue-Thu: 10 AM - 2 PM'),(4,'Neil Treutel','Yoga','1-773-605-8227','neil.treutel@example.com','Mon-Wed: 1 PM - 5 PM'),(5,'Angie Jenkins','Yoga','1-481-920-8510 ','angie.jenkins@example.com','Fri-Sun: 2 PM - 6 PM');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingsessions`
--

DROP TABLE IF EXISTS `trainingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingsessions` (
  `SessionID` int NOT NULL AUTO_INCREMENT,
  `TrainerID` int NOT NULL,
  `MemberID` int NOT NULL,
  `SessionDate` datetime NOT NULL,
  `DurationMinutes` int DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`SessionID`),
  KEY `TrainerID` (`TrainerID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `trainingsessions_ibfk_1` FOREIGN KEY (`TrainerID`) REFERENCES `trainers` (`TrainerID`),
  CONSTRAINT `trainingsessions_ibfk_2` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingsessions`
--

LOCK TABLES `trainingsessions` WRITE;
/*!40000 ALTER TABLE `trainingsessions` DISABLE KEYS */;
INSERT INTO `trainingsessions` VALUES (1,2,89,'2025-01-09 01:00:00',79,'Cursus arceo pauper territo.'),(2,2,74,'2025-01-14 12:45:00',67,'Ascit arcesso vinum deleniti curis.'),(3,2,35,'2025-01-09 22:30:00',80,'Vulpes acervus cado pauper.'),(4,5,67,'2025-01-25 00:30:00',64,'Complectus acidus crur.'),(5,3,76,'2024-12-14 15:30:00',52,'Supplanto vomito earum vulgo iste.'),(6,2,35,'2025-01-22 02:30:00',50,'Deprimo cimentarius pecco.'),(7,1,99,'2024-12-24 21:00:00',66,'Ullus stabilis dicta appono depraedor laborum cimentarius.'),(8,4,40,'2025-01-01 19:15:00',69,'Deduco aqua atavus.'),(9,1,40,'2025-01-25 13:45:00',31,'Ullam blanditiis arx adflicto optio vicinus atque denego.'),(10,2,60,'2025-01-04 01:30:00',86,'Desparatus bardus quo cohors.'),(11,4,60,'2025-01-04 12:30:00',38,'Crudelis vomer accusamus peior.'),(12,5,96,'2024-12-08 18:45:00',51,'Conicio aeger defleo caute umquam curo suggero avarus.'),(13,2,96,'2024-12-04 20:00:00',77,'Labore aetas tunc tero creo laudantium temptatio amor neque amplus.'),(14,5,49,'2024-12-26 13:00:00',120,'Claustrum demonstro spiritus alioqui bene teres bellicus subito clamo.'),(15,4,100,'2024-12-07 23:00:00',113,'Conatus tondeo cohaero vox auxilium.'),(16,5,99,'2025-01-24 21:45:00',80,'Perferendis tibi concido soleo.'),(17,1,72,'2024-12-08 19:45:00',63,'Sollicito deputo adamo subvenio usque aro cumque.'),(18,4,24,'2024-12-18 18:30:00',43,'Sortitus universe cervus deporto depraedor cubicularis.'),(19,1,43,'2025-01-21 19:30:00',44,'Crustulum sulum quisquam.'),(20,1,3,'2024-12-20 23:15:00',99,'Congregatio admoneo quia cupiditas carus coepi uterque.');
/*!40000 ALTER TABLE `trainingsessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03  3:23:01
