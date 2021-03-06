-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: gstlite
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `groupvariant`
--

DROP TABLE IF EXISTS `groupvariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupvariant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `variantname` varchar(45) NOT NULL,
  `product_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productID_idx` (`product_group_id`),
  CONSTRAINT `id` FOREIGN KEY (`product_group_id`) REFERENCES `productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupvariant`
--

LOCK TABLES `groupvariant` WRITE;
/*!40000 ALTER TABLE `groupvariant` DISABLE KEYS */;
INSERT INTO `groupvariant` VALUES (1,'New',1),(2,'Fake',2);
/*!40000 ALTER TABLE `groupvariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (20);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `total_price` float NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Beo','KTX',1234,'No',20000000,1),(2,'Bo','KTX',1234,'No',40000000,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderItemID` int NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `group_variant_id` int NOT NULL,
  PRIMARY KEY (`orderItemID`),
  KEY `id_idx` (`group_variant_id`),
  KEY `group_variant_id_idx` (`group_variant_id`),
  KEY `orderID_idx` (`orderID`),
  KEY `productID_idx` (`productID`),
  CONSTRAINT `group_variant_id` FOREIGN KEY (`group_variant_id`) REFERENCES `groupvariant` (`id`),
  CONSTRAINT `orderID` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`),
  CONSTRAINT `product` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1000000,1,1,1),(2,10000000,1,2,1);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_date` date NOT NULL,
  `price` float NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `product_group_id` int DEFAULT NULL,
  `userID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `userID_idx` (`userID`),
  KEY `product_group_id_idx` (`product_group_id`),
  CONSTRAINT `product_group_id` FOREIGN KEY (`product_group_id`) REFERENCES `productgroup` (`id`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone 7','2020-06-01',6000000,'iphone 754454566',1,1,100,NULL,NULL,NULL),(2,'Iphone 8','2020-06-01',9000000,'Iphone 8',1,1,200,NULL,NULL,NULL),(3,'Note 10','2020-01-02',10000000,'Note 10',1,1,50,NULL,NULL,NULL),(9,'Sámung 7888','2020-06-01',6000000,'iphone 754454566',1,1,10,NULL,NULL,NULL),(14,'Iphone 8988888','2020-06-01',9000000,'Iphone 8',1,1,200,NULL,NULL,NULL),(16,'Iphone 999999998','2020-06-01',9000000,'Iphone 8',1,1,200,NULL,NULL,NULL),(18,'Iphone 999999998','2020-06-01',9000000,'Iphone 8',1,1,200,NULL,NULL,'../../assets/images/iPhone-11-2.jpg'),(19,'Iphone 999999998','2020-06-01',9000000,'Iphone 8',1,1,200,NULL,NULL,'../../assets/images/iPhone-11-2.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productgroup`
--

DROP TABLE IF EXISTS `productgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupname` varchar(45) NOT NULL,
  `price` float DEFAULT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productgroup`
--

LOCK TABLES `productgroup` WRITE;
/*!40000 ALTER TABLE `productgroup` DISABLE KEYS */;
INSERT INTO `productgroup` VALUES (1,'Iphone',10000000,'2019-07-01'),(2,'SamSung',10000000,'2019-01-02');
/*!40000 ALTER TABLE `productgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimage`
--

DROP TABLE IF EXISTS `productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimage` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `productID` int NOT NULL,
  `path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  KEY `productID_idx` (`productID`),
  CONSTRAINT `FKptlxh7ri193ae421gs3sjsm8n` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimage`
--

LOCK TABLES `productimage` WRITE;
/*!40000 ALTER TABLE `productimage` DISABLE KEYS */;
INSERT INTO `productimage` VALUES (1,1,'../../assets/images/iPhone-11-2.jpg'),(2,2,'../../assets/images/iPhone-11-2.jpg'),(3,3,'../../assets/images/iPhone-11-2.jpg'),(4,9,'../../assets/images/iPhone-11-2.jpg'),(15,14,NULL),(17,16,NULL);
/*!40000 ALTER TABLE `productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productvariant`
--

DROP TABLE IF EXISTS `productvariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productvariant` (
  `id` int NOT NULL,
  `variantname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productvariant`
--

LOCK TABLES `productvariant` WRITE;
/*!40000 ALTER TABLE `productvariant` DISABLE KEYS */;
/*!40000 ALTER TABLE `productvariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `created_date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nam','nam@gmail.com','123','12/02/2020'),(2,'Cao','cao@gmail.com','321','12/02/2020'),(5,'Beo','beo@yahoo.com','1234','2000-01-01');
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

-- Dump completed on 2020-07-04 21:51:40
