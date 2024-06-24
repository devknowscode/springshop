-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: springshop
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cart_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_variant_id` int DEFAULT NULL,
  `product_qty` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_id` (`product_id`),
  KEY `product_variant_id` (`product_variant_id`),
  CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_products_ibfk_3` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
INSERT INTO `cart_products` VALUES (41,13,84,78,1);
INSERT INTO `cart_products` VALUES (42,13,87,92,3);
INSERT INTO `cart_products` VALUES (43,13,87,93,1);
INSERT INTO `cart_products` VALUES (47,14,87,93,2);
INSERT INTO `cart_products` VALUES (48,14,89,102,5);
INSERT INTO `cart_products` VALUES (49,15,84,77,1);
INSERT INTO `cart_products` VALUES (50,16,84,77,1);
INSERT INTO `cart_products` VALUES (51,17,83,72,1);
INSERT INTO `cart_products` VALUES (52,18,83,72,1);
INSERT INTO `cart_products` VALUES (53,19,83,72,1);
INSERT INTO `cart_products` VALUES (56,20,85,84,1);
INSERT INTO `cart_products` VALUES (57,20,85,88,1);
INSERT INTO `cart_products` VALUES (58,21,83,72,1);
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_state` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (13,'inactive',2);
INSERT INTO `carts` VALUES (14,'inactive',2);
INSERT INTO `carts` VALUES (15,'inactive',2);
INSERT INTO `carts` VALUES (16,'inactive',2);
INSERT INTO `carts` VALUES (17,'inactive',2);
INSERT INTO `carts` VALUES (18,'inactive',2);
INSERT INTO `carts` VALUES (19,'inactive',2);
INSERT INTO `carts` VALUES (20,'inactive',4);
INSERT INTO `carts` VALUES (21,'active',4);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Thời trang nam','Thời trang nam');
INSERT INTO `categories` VALUES (2,'Thời trang nữ','Thời trang nữ');
INSERT INTO `categories` VALUES (3,'Túi xách','Túi xách');
INSERT INTO `categories` VALUES (4,'Phụ kiện','Phụ kiện');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_variants`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `category_variants_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_variants_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_variants`
--

LOCK TABLES `category_variants` WRITE;
/*!40000 ALTER TABLE `category_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_checkouts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_checkouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_amount` int DEFAULT NULL,
  `fee_ship` int DEFAULT NULL,
  `total_checkout` int DEFAULT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_checkouts_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_checkouts`
--

LOCK TABLES `order_checkouts` WRITE;
/*!40000 ALTER TABLE `order_checkouts` DISABLE KEYS */;
INSERT INTO `order_checkouts` VALUES (7,2548000,30000,2578000,7);
INSERT INTO `order_checkouts` VALUES (8,2548000,30000,2578000,8);
INSERT INTO `order_checkouts` VALUES (9,3153000,30000,3183000,9);
INSERT INTO `order_checkouts` VALUES (10,490000,30000,520000,10);
INSERT INTO `order_checkouts` VALUES (11,490000,30000,520000,11);
INSERT INTO `order_checkouts` VALUES (12,1345000,30000,1375000,12);
INSERT INTO `order_checkouts` VALUES (13,1345000,30000,1375000,13);
INSERT INTO `order_checkouts` VALUES (14,1345000,30000,1375000,14);
INSERT INTO `order_checkouts` VALUES (15,982000,30000,1012000,15);
/*!40000 ALTER TABLE `order_checkouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_qty` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_variant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `fk_product_variant` (`product_variant_id`),
  CONSTRAINT `fk_product_variant` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (19,1,7,84,78);
INSERT INTO `order_products` VALUES (20,3,7,87,92);
INSERT INTO `order_products` VALUES (21,1,7,87,93);
INSERT INTO `order_products` VALUES (22,1,8,84,78);
INSERT INTO `order_products` VALUES (23,3,8,87,92);
INSERT INTO `order_products` VALUES (24,1,8,87,93);
INSERT INTO `order_products` VALUES (25,2,9,87,93);
INSERT INTO `order_products` VALUES (26,5,9,89,102);
INSERT INTO `order_products` VALUES (27,1,10,84,77);
INSERT INTO `order_products` VALUES (28,1,11,84,77);
INSERT INTO `order_products` VALUES (29,1,12,83,72);
INSERT INTO `order_products` VALUES (30,1,13,83,72);
INSERT INTO `order_products` VALUES (31,1,14,83,72);
INSERT INTO `order_products` VALUES (32,1,15,85,84);
INSERT INTO `order_products` VALUES (33,1,15,85,88);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` text,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` varchar(50) NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh','abcxyz','2024-06-20 20:08:28','cod','20240620200827-294509-cc354fe7','pending',0,2);
INSERT INTO `orders` VALUES (8,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh','Đây là ghi chú.','2024-06-20 20:32:45','cod','20240620203245-834186-c8831520','pending',0,2);
INSERT INTO `orders` VALUES (9,'Tét','0989600449','272/3A Khu phố Thạnh Lợi, phường An Thạnh','Đây là ghi chú 01.','2024-06-20 21:28:57','cod','20240620212857-704492-6cbbb016','pending',0,2);
INSERT INTO `orders` VALUES (10,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh',NULL,'2024-06-20 21:36:21','cod','20240620213621-803773-99248b53','pending',0,2);
INSERT INTO `orders` VALUES (11,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh',NULL,'2024-06-20 21:40:13','cod','20240620214013-153518-2b64c06b','pending',0,2);
INSERT INTO `orders` VALUES (12,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh',NULL,'2024-06-20 21:40:44','cod','20240620214043-666317-d14c7354','pending',0,2);
INSERT INTO `orders` VALUES (13,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh',NULL,'2024-06-20 21:41:29','cod','20240620214129-939073-44cefc73','pending',0,2);
INSERT INTO `orders` VALUES (14,'Nguyễn Lý Phát','(+84) 356 576 808','272/3A Khu phố Thạnh Lợi, phường An Thạnh',NULL,'2024-06-20 21:41:58','cod','20240620214157-641341-84b0e2a5','pending',0,2);
INSERT INTO `orders` VALUES (15,'Nguyễn Lý Phát','0989600449','272/3A Khu phố Thạnh Lợi, phường An Thạnh','Đây là ghi chú.','2024-06-20 22:52:37','cod','20240620225237-901017-4a7013b8','pending',0,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_variant_id` int DEFAULT NULL,
  `variant_value_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variant_id` (`product_variant_id`),
  KEY `variant_value_id` (`variant_value_id`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`),
  CONSTRAINT `product_details_ibfk_2` FOREIGN KEY (`variant_value_id`) REFERENCES `variant_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (241,71,77);
INSERT INTO `product_details` VALUES (242,71,65);
INSERT INTO `product_details` VALUES (243,72,77);
INSERT INTO `product_details` VALUES (244,72,63);
INSERT INTO `product_details` VALUES (245,73,77);
INSERT INTO `product_details` VALUES (246,73,59);
INSERT INTO `product_details` VALUES (247,74,78);
INSERT INTO `product_details` VALUES (248,74,65);
INSERT INTO `product_details` VALUES (249,75,78);
INSERT INTO `product_details` VALUES (250,75,63);
INSERT INTO `product_details` VALUES (251,76,78);
INSERT INTO `product_details` VALUES (252,76,59);
INSERT INTO `product_details` VALUES (253,77,79);
INSERT INTO `product_details` VALUES (254,77,65);
INSERT INTO `product_details` VALUES (255,78,79);
INSERT INTO `product_details` VALUES (256,78,63);
INSERT INTO `product_details` VALUES (257,79,79);
INSERT INTO `product_details` VALUES (258,79,59);
INSERT INTO `product_details` VALUES (259,80,80);
INSERT INTO `product_details` VALUES (260,80,65);
INSERT INTO `product_details` VALUES (261,81,80);
INSERT INTO `product_details` VALUES (262,81,63);
INSERT INTO `product_details` VALUES (263,82,80);
INSERT INTO `product_details` VALUES (264,82,59);
INSERT INTO `product_details` VALUES (265,83,81);
INSERT INTO `product_details` VALUES (266,83,65);
INSERT INTO `product_details` VALUES (267,84,81);
INSERT INTO `product_details` VALUES (268,84,63);
INSERT INTO `product_details` VALUES (269,85,81);
INSERT INTO `product_details` VALUES (270,85,59);
INSERT INTO `product_details` VALUES (271,86,82);
INSERT INTO `product_details` VALUES (272,86,65);
INSERT INTO `product_details` VALUES (273,87,82);
INSERT INTO `product_details` VALUES (274,87,63);
INSERT INTO `product_details` VALUES (275,88,82);
INSERT INTO `product_details` VALUES (276,88,59);
INSERT INTO `product_details` VALUES (277,89,83);
INSERT INTO `product_details` VALUES (278,89,65);
INSERT INTO `product_details` VALUES (279,90,83);
INSERT INTO `product_details` VALUES (280,90,63);
INSERT INTO `product_details` VALUES (281,91,83);
INSERT INTO `product_details` VALUES (282,91,59);
INSERT INTO `product_details` VALUES (283,92,84);
INSERT INTO `product_details` VALUES (284,92,65);
INSERT INTO `product_details` VALUES (285,93,84);
INSERT INTO `product_details` VALUES (286,93,63);
INSERT INTO `product_details` VALUES (287,94,84);
INSERT INTO `product_details` VALUES (288,94,59);
INSERT INTO `product_details` VALUES (289,95,85);
INSERT INTO `product_details` VALUES (290,95,65);
INSERT INTO `product_details` VALUES (291,96,85);
INSERT INTO `product_details` VALUES (292,96,63);
INSERT INTO `product_details` VALUES (293,97,85);
INSERT INTO `product_details` VALUES (294,97,59);
INSERT INTO `product_details` VALUES (295,98,86);
INSERT INTO `product_details` VALUES (296,98,65);
INSERT INTO `product_details` VALUES (297,99,86);
INSERT INTO `product_details` VALUES (298,99,63);
INSERT INTO `product_details` VALUES (299,100,86);
INSERT INTO `product_details` VALUES (300,100,59);
INSERT INTO `product_details` VALUES (301,101,83);
INSERT INTO `product_details` VALUES (302,101,65);
INSERT INTO `product_details` VALUES (303,102,83);
INSERT INTO `product_details` VALUES (304,102,63);
INSERT INTO `product_details` VALUES (305,103,83);
INSERT INTO `product_details` VALUES (306,103,59);
INSERT INTO `product_details` VALUES (307,104,87);
INSERT INTO `product_details` VALUES (308,104,65);
INSERT INTO `product_details` VALUES (309,105,87);
INSERT INTO `product_details` VALUES (310,105,63);
INSERT INTO `product_details` VALUES (311,106,87);
INSERT INTO `product_details` VALUES (312,106,59);
INSERT INTO `product_details` VALUES (313,107,83);
INSERT INTO `product_details` VALUES (314,107,65);
INSERT INTO `product_details` VALUES (315,108,83);
INSERT INTO `product_details` VALUES (316,108,63);
INSERT INTO `product_details` VALUES (317,109,83);
INSERT INTO `product_details` VALUES (318,109,59);
INSERT INTO `product_details` VALUES (319,110,84);
INSERT INTO `product_details` VALUES (320,110,65);
INSERT INTO `product_details` VALUES (321,111,84);
INSERT INTO `product_details` VALUES (322,111,63);
INSERT INTO `product_details` VALUES (323,112,84);
INSERT INTO `product_details` VALUES (324,112,59);
INSERT INTO `product_details` VALUES (325,113,66);
INSERT INTO `product_details` VALUES (326,113,65);
INSERT INTO `product_details` VALUES (327,114,66);
INSERT INTO `product_details` VALUES (328,114,63);
INSERT INTO `product_details` VALUES (329,115,66);
INSERT INTO `product_details` VALUES (330,115,59);
INSERT INTO `product_details` VALUES (331,116,58);
INSERT INTO `product_details` VALUES (332,116,65);
INSERT INTO `product_details` VALUES (333,117,58);
INSERT INTO `product_details` VALUES (334,117,63);
INSERT INTO `product_details` VALUES (335,118,58);
INSERT INTO `product_details` VALUES (336,118,59);
INSERT INTO `product_details` VALUES (337,119,66);
INSERT INTO `product_details` VALUES (338,119,65);
INSERT INTO `product_details` VALUES (339,120,66);
INSERT INTO `product_details` VALUES (340,120,63);
INSERT INTO `product_details` VALUES (341,121,66);
INSERT INTO `product_details` VALUES (342,121,59);
INSERT INTO `product_details` VALUES (343,122,58);
INSERT INTO `product_details` VALUES (344,122,65);
INSERT INTO `product_details` VALUES (345,123,58);
INSERT INTO `product_details` VALUES (346,123,63);
INSERT INTO `product_details` VALUES (347,124,58);
INSERT INTO `product_details` VALUES (348,124,59);
INSERT INTO `product_details` VALUES (349,125,66);
INSERT INTO `product_details` VALUES (350,125,65);
INSERT INTO `product_details` VALUES (351,126,66);
INSERT INTO `product_details` VALUES (352,126,63);
INSERT INTO `product_details` VALUES (353,127,66);
INSERT INTO `product_details` VALUES (354,127,59);
INSERT INTO `product_details` VALUES (355,128,58);
INSERT INTO `product_details` VALUES (356,128,65);
INSERT INTO `product_details` VALUES (357,129,58);
INSERT INTO `product_details` VALUES (358,129,63);
INSERT INTO `product_details` VALUES (359,130,58);
INSERT INTO `product_details` VALUES (360,130,59);
INSERT INTO `product_details` VALUES (361,131,66);
INSERT INTO `product_details` VALUES (362,131,65);
INSERT INTO `product_details` VALUES (363,132,66);
INSERT INTO `product_details` VALUES (364,132,63);
INSERT INTO `product_details` VALUES (365,133,66);
INSERT INTO `product_details` VALUES (366,133,59);
INSERT INTO `product_details` VALUES (367,134,58);
INSERT INTO `product_details` VALUES (368,134,65);
INSERT INTO `product_details` VALUES (369,135,58);
INSERT INTO `product_details` VALUES (370,135,63);
INSERT INTO `product_details` VALUES (371,136,58);
INSERT INTO `product_details` VALUES (372,136,59);
INSERT INTO `product_details` VALUES (373,137,66);
INSERT INTO `product_details` VALUES (374,137,65);
INSERT INTO `product_details` VALUES (375,138,66);
INSERT INTO `product_details` VALUES (376,138,63);
INSERT INTO `product_details` VALUES (377,139,66);
INSERT INTO `product_details` VALUES (378,139,59);
INSERT INTO `product_details` VALUES (379,140,58);
INSERT INTO `product_details` VALUES (380,140,65);
INSERT INTO `product_details` VALUES (381,141,58);
INSERT INTO `product_details` VALUES (382,141,63);
INSERT INTO `product_details` VALUES (383,142,58);
INSERT INTO `product_details` VALUES (384,142,59);
INSERT INTO `product_details` VALUES (385,143,66);
INSERT INTO `product_details` VALUES (386,143,65);
INSERT INTO `product_details` VALUES (387,144,66);
INSERT INTO `product_details` VALUES (388,144,63);
INSERT INTO `product_details` VALUES (389,145,66);
INSERT INTO `product_details` VALUES (390,145,59);
INSERT INTO `product_details` VALUES (391,146,58);
INSERT INTO `product_details` VALUES (392,146,65);
INSERT INTO `product_details` VALUES (393,147,58);
INSERT INTO `product_details` VALUES (394,147,63);
INSERT INTO `product_details` VALUES (395,148,58);
INSERT INTO `product_details` VALUES (396,148,59);
INSERT INTO `product_details` VALUES (397,149,66);
INSERT INTO `product_details` VALUES (398,149,65);
INSERT INTO `product_details` VALUES (399,150,66);
INSERT INTO `product_details` VALUES (400,150,63);
INSERT INTO `product_details` VALUES (401,151,66);
INSERT INTO `product_details` VALUES (402,151,59);
INSERT INTO `product_details` VALUES (403,152,58);
INSERT INTO `product_details` VALUES (404,152,65);
INSERT INTO `product_details` VALUES (405,153,58);
INSERT INTO `product_details` VALUES (406,153,63);
INSERT INTO `product_details` VALUES (407,154,58);
INSERT INTO `product_details` VALUES (408,154,59);
INSERT INTO `product_details` VALUES (409,155,66);
INSERT INTO `product_details` VALUES (410,155,65);
INSERT INTO `product_details` VALUES (411,156,66);
INSERT INTO `product_details` VALUES (412,156,63);
INSERT INTO `product_details` VALUES (413,157,66);
INSERT INTO `product_details` VALUES (414,157,59);
INSERT INTO `product_details` VALUES (415,158,58);
INSERT INTO `product_details` VALUES (416,158,65);
INSERT INTO `product_details` VALUES (417,159,58);
INSERT INTO `product_details` VALUES (418,159,63);
INSERT INTO `product_details` VALUES (419,160,58);
INSERT INTO `product_details` VALUES (420,160,59);
INSERT INTO `product_details` VALUES (421,161,66);
INSERT INTO `product_details` VALUES (422,161,65);
INSERT INTO `product_details` VALUES (423,162,66);
INSERT INTO `product_details` VALUES (424,162,63);
INSERT INTO `product_details` VALUES (425,163,66);
INSERT INTO `product_details` VALUES (426,163,59);
INSERT INTO `product_details` VALUES (427,164,58);
INSERT INTO `product_details` VALUES (428,164,65);
INSERT INTO `product_details` VALUES (429,165,58);
INSERT INTO `product_details` VALUES (430,165,63);
INSERT INTO `product_details` VALUES (431,166,58);
INSERT INTO `product_details` VALUES (432,166,59);
INSERT INTO `product_details` VALUES (433,167,66);
INSERT INTO `product_details` VALUES (434,167,65);
INSERT INTO `product_details` VALUES (435,168,66);
INSERT INTO `product_details` VALUES (436,168,63);
INSERT INTO `product_details` VALUES (437,169,66);
INSERT INTO `product_details` VALUES (438,169,59);
INSERT INTO `product_details` VALUES (439,170,58);
INSERT INTO `product_details` VALUES (440,170,65);
INSERT INTO `product_details` VALUES (441,171,58);
INSERT INTO `product_details` VALUES (442,171,63);
INSERT INTO `product_details` VALUES (443,172,58);
INSERT INTO `product_details` VALUES (444,172,59);
INSERT INTO `product_details` VALUES (445,173,66);
INSERT INTO `product_details` VALUES (446,173,65);
INSERT INTO `product_details` VALUES (447,174,66);
INSERT INTO `product_details` VALUES (448,174,63);
INSERT INTO `product_details` VALUES (449,175,66);
INSERT INTO `product_details` VALUES (450,175,59);
INSERT INTO `product_details` VALUES (451,176,58);
INSERT INTO `product_details` VALUES (452,176,65);
INSERT INTO `product_details` VALUES (453,177,58);
INSERT INTO `product_details` VALUES (454,177,63);
INSERT INTO `product_details` VALUES (455,178,58);
INSERT INTO `product_details` VALUES (456,178,59);
INSERT INTO `product_details` VALUES (457,179,66);
INSERT INTO `product_details` VALUES (458,179,65);
INSERT INTO `product_details` VALUES (459,180,66);
INSERT INTO `product_details` VALUES (460,180,63);
INSERT INTO `product_details` VALUES (461,181,66);
INSERT INTO `product_details` VALUES (462,181,59);
INSERT INTO `product_details` VALUES (463,182,58);
INSERT INTO `product_details` VALUES (464,182,65);
INSERT INTO `product_details` VALUES (465,183,58);
INSERT INTO `product_details` VALUES (466,183,63);
INSERT INTO `product_details` VALUES (467,184,58);
INSERT INTO `product_details` VALUES (468,184,59);
INSERT INTO `product_details` VALUES (469,185,66);
INSERT INTO `product_details` VALUES (470,185,65);
INSERT INTO `product_details` VALUES (471,186,66);
INSERT INTO `product_details` VALUES (472,186,63);
INSERT INTO `product_details` VALUES (473,187,66);
INSERT INTO `product_details` VALUES (474,187,59);
INSERT INTO `product_details` VALUES (475,188,58);
INSERT INTO `product_details` VALUES (476,188,65);
INSERT INTO `product_details` VALUES (477,189,58);
INSERT INTO `product_details` VALUES (478,189,63);
INSERT INTO `product_details` VALUES (479,190,58);
INSERT INTO `product_details` VALUES (480,190,59);
INSERT INTO `product_details` VALUES (481,191,66);
INSERT INTO `product_details` VALUES (482,191,65);
INSERT INTO `product_details` VALUES (483,192,66);
INSERT INTO `product_details` VALUES (484,192,63);
INSERT INTO `product_details` VALUES (485,193,66);
INSERT INTO `product_details` VALUES (486,193,59);
INSERT INTO `product_details` VALUES (487,194,58);
INSERT INTO `product_details` VALUES (488,194,65);
INSERT INTO `product_details` VALUES (489,195,58);
INSERT INTO `product_details` VALUES (490,195,63);
INSERT INTO `product_details` VALUES (491,196,58);
INSERT INTO `product_details` VALUES (492,196,59);
INSERT INTO `product_details` VALUES (493,197,66);
INSERT INTO `product_details` VALUES (494,197,65);
INSERT INTO `product_details` VALUES (495,198,66);
INSERT INTO `product_details` VALUES (496,198,63);
INSERT INTO `product_details` VALUES (497,199,66);
INSERT INTO `product_details` VALUES (498,199,59);
INSERT INTO `product_details` VALUES (499,200,58);
INSERT INTO `product_details` VALUES (500,200,65);
INSERT INTO `product_details` VALUES (501,201,58);
INSERT INTO `product_details` VALUES (502,201,63);
INSERT INTO `product_details` VALUES (503,202,58);
INSERT INTO `product_details` VALUES (504,202,59);
INSERT INTO `product_details` VALUES (505,203,66);
INSERT INTO `product_details` VALUES (506,203,65);
INSERT INTO `product_details` VALUES (507,204,66);
INSERT INTO `product_details` VALUES (508,204,63);
INSERT INTO `product_details` VALUES (509,205,66);
INSERT INTO `product_details` VALUES (510,205,59);
INSERT INTO `product_details` VALUES (511,206,58);
INSERT INTO `product_details` VALUES (512,206,65);
INSERT INTO `product_details` VALUES (513,207,58);
INSERT INTO `product_details` VALUES (514,207,63);
INSERT INTO `product_details` VALUES (515,208,58);
INSERT INTO `product_details` VALUES (516,208,59);
INSERT INTO `product_details` VALUES (517,209,66);
INSERT INTO `product_details` VALUES (518,209,65);
INSERT INTO `product_details` VALUES (519,210,66);
INSERT INTO `product_details` VALUES (520,210,63);
INSERT INTO `product_details` VALUES (521,211,66);
INSERT INTO `product_details` VALUES (522,211,59);
INSERT INTO `product_details` VALUES (523,212,58);
INSERT INTO `product_details` VALUES (524,212,65);
INSERT INTO `product_details` VALUES (525,213,58);
INSERT INTO `product_details` VALUES (526,213,63);
INSERT INTO `product_details` VALUES (527,214,58);
INSERT INTO `product_details` VALUES (528,214,59);
INSERT INTO `product_details` VALUES (529,215,66);
INSERT INTO `product_details` VALUES (530,215,65);
INSERT INTO `product_details` VALUES (531,216,66);
INSERT INTO `product_details` VALUES (532,216,63);
INSERT INTO `product_details` VALUES (533,217,66);
INSERT INTO `product_details` VALUES (534,217,59);
INSERT INTO `product_details` VALUES (535,218,58);
INSERT INTO `product_details` VALUES (536,218,65);
INSERT INTO `product_details` VALUES (537,219,58);
INSERT INTO `product_details` VALUES (538,219,63);
INSERT INTO `product_details` VALUES (539,220,58);
INSERT INTO `product_details` VALUES (540,220,59);
INSERT INTO `product_details` VALUES (541,221,66);
INSERT INTO `product_details` VALUES (542,221,65);
INSERT INTO `product_details` VALUES (543,222,66);
INSERT INTO `product_details` VALUES (544,222,63);
INSERT INTO `product_details` VALUES (545,223,66);
INSERT INTO `product_details` VALUES (546,223,59);
INSERT INTO `product_details` VALUES (547,224,58);
INSERT INTO `product_details` VALUES (548,224,65);
INSERT INTO `product_details` VALUES (549,225,58);
INSERT INTO `product_details` VALUES (550,225,63);
INSERT INTO `product_details` VALUES (551,226,58);
INSERT INTO `product_details` VALUES (552,226,59);
INSERT INTO `product_details` VALUES (553,227,66);
INSERT INTO `product_details` VALUES (554,227,65);
INSERT INTO `product_details` VALUES (555,228,66);
INSERT INTO `product_details` VALUES (556,228,63);
INSERT INTO `product_details` VALUES (557,229,66);
INSERT INTO `product_details` VALUES (558,229,59);
INSERT INTO `product_details` VALUES (559,230,58);
INSERT INTO `product_details` VALUES (560,230,65);
INSERT INTO `product_details` VALUES (561,231,58);
INSERT INTO `product_details` VALUES (562,231,63);
INSERT INTO `product_details` VALUES (563,232,58);
INSERT INTO `product_details` VALUES (564,232,59);
INSERT INTO `product_details` VALUES (565,233,66);
INSERT INTO `product_details` VALUES (566,233,65);
INSERT INTO `product_details` VALUES (567,234,66);
INSERT INTO `product_details` VALUES (568,234,63);
INSERT INTO `product_details` VALUES (569,235,66);
INSERT INTO `product_details` VALUES (570,235,59);
INSERT INTO `product_details` VALUES (571,236,58);
INSERT INTO `product_details` VALUES (572,236,65);
INSERT INTO `product_details` VALUES (573,237,58);
INSERT INTO `product_details` VALUES (574,237,63);
INSERT INTO `product_details` VALUES (575,238,58);
INSERT INTO `product_details` VALUES (576,238,59);
INSERT INTO `product_details` VALUES (577,239,66);
INSERT INTO `product_details` VALUES (578,239,65);
INSERT INTO `product_details` VALUES (579,240,66);
INSERT INTO `product_details` VALUES (580,240,63);
INSERT INTO `product_details` VALUES (581,241,66);
INSERT INTO `product_details` VALUES (582,241,59);
INSERT INTO `product_details` VALUES (583,242,58);
INSERT INTO `product_details` VALUES (584,242,65);
INSERT INTO `product_details` VALUES (585,243,58);
INSERT INTO `product_details` VALUES (586,243,63);
INSERT INTO `product_details` VALUES (587,244,58);
INSERT INTO `product_details` VALUES (588,244,59);
INSERT INTO `product_details` VALUES (589,245,66);
INSERT INTO `product_details` VALUES (590,245,65);
INSERT INTO `product_details` VALUES (591,246,66);
INSERT INTO `product_details` VALUES (592,246,63);
INSERT INTO `product_details` VALUES (593,247,66);
INSERT INTO `product_details` VALUES (594,247,59);
INSERT INTO `product_details` VALUES (595,248,58);
INSERT INTO `product_details` VALUES (596,248,65);
INSERT INTO `product_details` VALUES (597,249,58);
INSERT INTO `product_details` VALUES (598,249,63);
INSERT INTO `product_details` VALUES (599,250,58);
INSERT INTO `product_details` VALUES (600,250,59);
INSERT INTO `product_details` VALUES (601,251,66);
INSERT INTO `product_details` VALUES (602,251,65);
INSERT INTO `product_details` VALUES (603,252,66);
INSERT INTO `product_details` VALUES (604,252,63);
INSERT INTO `product_details` VALUES (605,253,66);
INSERT INTO `product_details` VALUES (606,253,59);
INSERT INTO `product_details` VALUES (607,254,58);
INSERT INTO `product_details` VALUES (608,254,65);
INSERT INTO `product_details` VALUES (609,255,58);
INSERT INTO `product_details` VALUES (610,255,63);
INSERT INTO `product_details` VALUES (611,256,58);
INSERT INTO `product_details` VALUES (612,256,59);
INSERT INTO `product_details` VALUES (613,257,66);
INSERT INTO `product_details` VALUES (614,257,65);
INSERT INTO `product_details` VALUES (615,258,66);
INSERT INTO `product_details` VALUES (616,258,63);
INSERT INTO `product_details` VALUES (617,259,66);
INSERT INTO `product_details` VALUES (618,259,59);
INSERT INTO `product_details` VALUES (619,260,58);
INSERT INTO `product_details` VALUES (620,260,65);
INSERT INTO `product_details` VALUES (621,261,58);
INSERT INTO `product_details` VALUES (622,261,63);
INSERT INTO `product_details` VALUES (623,262,58);
INSERT INTO `product_details` VALUES (624,262,59);
INSERT INTO `product_details` VALUES (625,263,66);
INSERT INTO `product_details` VALUES (626,263,65);
INSERT INTO `product_details` VALUES (627,264,66);
INSERT INTO `product_details` VALUES (628,264,63);
INSERT INTO `product_details` VALUES (629,265,66);
INSERT INTO `product_details` VALUES (630,265,59);
INSERT INTO `product_details` VALUES (631,266,58);
INSERT INTO `product_details` VALUES (632,266,65);
INSERT INTO `product_details` VALUES (633,267,58);
INSERT INTO `product_details` VALUES (634,267,63);
INSERT INTO `product_details` VALUES (635,268,58);
INSERT INTO `product_details` VALUES (636,268,59);
INSERT INTO `product_details` VALUES (637,269,66);
INSERT INTO `product_details` VALUES (638,269,65);
INSERT INTO `product_details` VALUES (639,270,66);
INSERT INTO `product_details` VALUES (640,270,63);
INSERT INTO `product_details` VALUES (641,271,66);
INSERT INTO `product_details` VALUES (642,271,59);
INSERT INTO `product_details` VALUES (643,272,58);
INSERT INTO `product_details` VALUES (644,272,65);
INSERT INTO `product_details` VALUES (645,273,58);
INSERT INTO `product_details` VALUES (646,273,63);
INSERT INTO `product_details` VALUES (647,274,58);
INSERT INTO `product_details` VALUES (648,274,59);
INSERT INTO `product_details` VALUES (649,275,66);
INSERT INTO `product_details` VALUES (650,275,65);
INSERT INTO `product_details` VALUES (651,276,66);
INSERT INTO `product_details` VALUES (652,276,63);
INSERT INTO `product_details` VALUES (653,277,66);
INSERT INTO `product_details` VALUES (654,277,59);
INSERT INTO `product_details` VALUES (655,278,58);
INSERT INTO `product_details` VALUES (656,278,65);
INSERT INTO `product_details` VALUES (657,279,58);
INSERT INTO `product_details` VALUES (658,279,63);
INSERT INTO `product_details` VALUES (659,280,58);
INSERT INTO `product_details` VALUES (660,280,59);
INSERT INTO `product_details` VALUES (661,281,66);
INSERT INTO `product_details` VALUES (662,281,65);
INSERT INTO `product_details` VALUES (663,282,66);
INSERT INTO `product_details` VALUES (664,282,63);
INSERT INTO `product_details` VALUES (665,283,66);
INSERT INTO `product_details` VALUES (666,283,59);
INSERT INTO `product_details` VALUES (667,284,58);
INSERT INTO `product_details` VALUES (668,284,65);
INSERT INTO `product_details` VALUES (669,285,58);
INSERT INTO `product_details` VALUES (670,285,63);
INSERT INTO `product_details` VALUES (671,286,58);
INSERT INTO `product_details` VALUES (672,286,59);
INSERT INTO `product_details` VALUES (673,287,66);
INSERT INTO `product_details` VALUES (674,287,65);
INSERT INTO `product_details` VALUES (675,288,66);
INSERT INTO `product_details` VALUES (676,288,63);
INSERT INTO `product_details` VALUES (677,289,66);
INSERT INTO `product_details` VALUES (678,289,59);
INSERT INTO `product_details` VALUES (679,290,58);
INSERT INTO `product_details` VALUES (680,290,65);
INSERT INTO `product_details` VALUES (681,291,58);
INSERT INTO `product_details` VALUES (682,291,63);
INSERT INTO `product_details` VALUES (683,292,58);
INSERT INTO `product_details` VALUES (684,292,59);
INSERT INTO `product_details` VALUES (685,293,66);
INSERT INTO `product_details` VALUES (686,293,65);
INSERT INTO `product_details` VALUES (687,294,66);
INSERT INTO `product_details` VALUES (688,294,63);
INSERT INTO `product_details` VALUES (689,295,66);
INSERT INTO `product_details` VALUES (690,295,59);
INSERT INTO `product_details` VALUES (691,296,58);
INSERT INTO `product_details` VALUES (692,296,65);
INSERT INTO `product_details` VALUES (693,297,58);
INSERT INTO `product_details` VALUES (694,297,63);
INSERT INTO `product_details` VALUES (695,298,58);
INSERT INTO `product_details` VALUES (696,298,59);
INSERT INTO `product_details` VALUES (697,299,66);
INSERT INTO `product_details` VALUES (698,299,65);
INSERT INTO `product_details` VALUES (699,300,66);
INSERT INTO `product_details` VALUES (700,300,63);
INSERT INTO `product_details` VALUES (701,301,66);
INSERT INTO `product_details` VALUES (702,301,59);
INSERT INTO `product_details` VALUES (703,302,58);
INSERT INTO `product_details` VALUES (704,302,65);
INSERT INTO `product_details` VALUES (705,303,58);
INSERT INTO `product_details` VALUES (706,303,63);
INSERT INTO `product_details` VALUES (707,304,58);
INSERT INTO `product_details` VALUES (708,304,59);
INSERT INTO `product_details` VALUES (709,305,84);
INSERT INTO `product_details` VALUES (710,305,88);
INSERT INTO `product_details` VALUES (711,306,89);
INSERT INTO `product_details` VALUES (712,306,88);
INSERT INTO `product_details` VALUES (713,307,90);
INSERT INTO `product_details` VALUES (714,307,88);
INSERT INTO `product_details` VALUES (715,308,83);
INSERT INTO `product_details` VALUES (716,308,88);
INSERT INTO `product_details` VALUES (717,309,84);
INSERT INTO `product_details` VALUES (718,309,88);
INSERT INTO `product_details` VALUES (719,310,89);
INSERT INTO `product_details` VALUES (720,310,88);
INSERT INTO `product_details` VALUES (721,311,90);
INSERT INTO `product_details` VALUES (722,311,88);
INSERT INTO `product_details` VALUES (723,312,83);
INSERT INTO `product_details` VALUES (724,312,88);
INSERT INTO `product_details` VALUES (725,313,84);
INSERT INTO `product_details` VALUES (726,313,88);
INSERT INTO `product_details` VALUES (727,314,89);
INSERT INTO `product_details` VALUES (728,314,88);
INSERT INTO `product_details` VALUES (729,315,90);
INSERT INTO `product_details` VALUES (730,315,88);
INSERT INTO `product_details` VALUES (731,316,83);
INSERT INTO `product_details` VALUES (732,316,88);
INSERT INTO `product_details` VALUES (733,317,84);
INSERT INTO `product_details` VALUES (734,317,88);
INSERT INTO `product_details` VALUES (735,318,89);
INSERT INTO `product_details` VALUES (736,318,88);
INSERT INTO `product_details` VALUES (737,319,90);
INSERT INTO `product_details` VALUES (738,319,88);
INSERT INTO `product_details` VALUES (739,320,83);
INSERT INTO `product_details` VALUES (740,320,88);
INSERT INTO `product_details` VALUES (741,321,84);
INSERT INTO `product_details` VALUES (742,321,88);
INSERT INTO `product_details` VALUES (743,322,89);
INSERT INTO `product_details` VALUES (744,322,88);
INSERT INTO `product_details` VALUES (745,323,90);
INSERT INTO `product_details` VALUES (746,323,88);
INSERT INTO `product_details` VALUES (747,324,83);
INSERT INTO `product_details` VALUES (748,324,88);
INSERT INTO `product_details` VALUES (749,325,84);
INSERT INTO `product_details` VALUES (750,325,88);
INSERT INTO `product_details` VALUES (751,326,89);
INSERT INTO `product_details` VALUES (752,326,88);
INSERT INTO `product_details` VALUES (753,327,90);
INSERT INTO `product_details` VALUES (754,327,88);
INSERT INTO `product_details` VALUES (755,328,83);
INSERT INTO `product_details` VALUES (756,328,88);
INSERT INTO `product_details` VALUES (757,329,84);
INSERT INTO `product_details` VALUES (758,329,88);
INSERT INTO `product_details` VALUES (759,330,89);
INSERT INTO `product_details` VALUES (760,330,88);
INSERT INTO `product_details` VALUES (761,331,90);
INSERT INTO `product_details` VALUES (762,331,88);
INSERT INTO `product_details` VALUES (763,332,83);
INSERT INTO `product_details` VALUES (764,332,88);
INSERT INTO `product_details` VALUES (765,333,84);
INSERT INTO `product_details` VALUES (766,333,88);
INSERT INTO `product_details` VALUES (767,334,89);
INSERT INTO `product_details` VALUES (768,334,88);
INSERT INTO `product_details` VALUES (769,335,90);
INSERT INTO `product_details` VALUES (770,335,88);
INSERT INTO `product_details` VALUES (771,336,83);
INSERT INTO `product_details` VALUES (772,336,88);
INSERT INTO `product_details` VALUES (773,337,84);
INSERT INTO `product_details` VALUES (774,337,88);
INSERT INTO `product_details` VALUES (775,338,89);
INSERT INTO `product_details` VALUES (776,338,88);
INSERT INTO `product_details` VALUES (777,339,90);
INSERT INTO `product_details` VALUES (778,339,88);
INSERT INTO `product_details` VALUES (779,340,83);
INSERT INTO `product_details` VALUES (780,340,88);
INSERT INTO `product_details` VALUES (781,341,84);
INSERT INTO `product_details` VALUES (782,341,88);
INSERT INTO `product_details` VALUES (783,342,89);
INSERT INTO `product_details` VALUES (784,342,88);
INSERT INTO `product_details` VALUES (785,343,90);
INSERT INTO `product_details` VALUES (786,343,88);
INSERT INTO `product_details` VALUES (787,344,83);
INSERT INTO `product_details` VALUES (788,344,88);
INSERT INTO `product_details` VALUES (789,345,84);
INSERT INTO `product_details` VALUES (790,345,88);
INSERT INTO `product_details` VALUES (791,346,89);
INSERT INTO `product_details` VALUES (792,346,88);
INSERT INTO `product_details` VALUES (793,347,90);
INSERT INTO `product_details` VALUES (794,347,88);
INSERT INTO `product_details` VALUES (795,348,83);
INSERT INTO `product_details` VALUES (796,348,88);
INSERT INTO `product_details` VALUES (797,349,84);
INSERT INTO `product_details` VALUES (798,349,88);
INSERT INTO `product_details` VALUES (799,350,89);
INSERT INTO `product_details` VALUES (800,350,88);
INSERT INTO `product_details` VALUES (801,351,90);
INSERT INTO `product_details` VALUES (802,351,88);
INSERT INTO `product_details` VALUES (803,352,83);
INSERT INTO `product_details` VALUES (804,352,88);
INSERT INTO `product_details` VALUES (805,353,84);
INSERT INTO `product_details` VALUES (806,353,88);
INSERT INTO `product_details` VALUES (807,354,89);
INSERT INTO `product_details` VALUES (808,354,88);
INSERT INTO `product_details` VALUES (809,355,90);
INSERT INTO `product_details` VALUES (810,355,88);
INSERT INTO `product_details` VALUES (811,356,83);
INSERT INTO `product_details` VALUES (812,356,88);
INSERT INTO `product_details` VALUES (813,357,84);
INSERT INTO `product_details` VALUES (814,357,88);
INSERT INTO `product_details` VALUES (815,358,89);
INSERT INTO `product_details` VALUES (816,358,88);
INSERT INTO `product_details` VALUES (817,359,90);
INSERT INTO `product_details` VALUES (818,359,88);
INSERT INTO `product_details` VALUES (819,360,83);
INSERT INTO `product_details` VALUES (820,360,88);
INSERT INTO `product_details` VALUES (821,361,84);
INSERT INTO `product_details` VALUES (822,361,88);
INSERT INTO `product_details` VALUES (823,362,89);
INSERT INTO `product_details` VALUES (824,362,88);
INSERT INTO `product_details` VALUES (825,363,90);
INSERT INTO `product_details` VALUES (826,363,88);
INSERT INTO `product_details` VALUES (827,364,83);
INSERT INTO `product_details` VALUES (828,364,88);
INSERT INTO `product_details` VALUES (829,365,84);
INSERT INTO `product_details` VALUES (830,365,88);
INSERT INTO `product_details` VALUES (831,366,89);
INSERT INTO `product_details` VALUES (832,366,88);
INSERT INTO `product_details` VALUES (833,367,90);
INSERT INTO `product_details` VALUES (834,367,88);
INSERT INTO `product_details` VALUES (835,368,83);
INSERT INTO `product_details` VALUES (836,368,88);
INSERT INTO `product_details` VALUES (837,369,84);
INSERT INTO `product_details` VALUES (838,369,88);
INSERT INTO `product_details` VALUES (839,370,89);
INSERT INTO `product_details` VALUES (840,370,88);
INSERT INTO `product_details` VALUES (841,371,90);
INSERT INTO `product_details` VALUES (842,371,88);
INSERT INTO `product_details` VALUES (843,372,83);
INSERT INTO `product_details` VALUES (844,372,88);
INSERT INTO `product_details` VALUES (845,373,84);
INSERT INTO `product_details` VALUES (846,373,88);
INSERT INTO `product_details` VALUES (847,374,83);
INSERT INTO `product_details` VALUES (848,374,88);
INSERT INTO `product_details` VALUES (849,375,90);
INSERT INTO `product_details` VALUES (850,375,88);
INSERT INTO `product_details` VALUES (851,376,84);
INSERT INTO `product_details` VALUES (852,376,88);
INSERT INTO `product_details` VALUES (853,377,83);
INSERT INTO `product_details` VALUES (854,377,88);
INSERT INTO `product_details` VALUES (855,378,90);
INSERT INTO `product_details` VALUES (856,378,88);
INSERT INTO `product_details` VALUES (857,379,84);
INSERT INTO `product_details` VALUES (858,379,88);
INSERT INTO `product_details` VALUES (859,380,83);
INSERT INTO `product_details` VALUES (860,380,88);
INSERT INTO `product_details` VALUES (861,381,90);
INSERT INTO `product_details` VALUES (862,381,88);
INSERT INTO `product_details` VALUES (863,382,84);
INSERT INTO `product_details` VALUES (864,382,88);
INSERT INTO `product_details` VALUES (865,383,83);
INSERT INTO `product_details` VALUES (866,383,88);
INSERT INTO `product_details` VALUES (867,384,90);
INSERT INTO `product_details` VALUES (868,384,88);
INSERT INTO `product_details` VALUES (869,385,84);
INSERT INTO `product_details` VALUES (870,385,88);
INSERT INTO `product_details` VALUES (871,386,83);
INSERT INTO `product_details` VALUES (872,386,88);
INSERT INTO `product_details` VALUES (873,387,90);
INSERT INTO `product_details` VALUES (874,387,88);
INSERT INTO `product_details` VALUES (875,388,84);
INSERT INTO `product_details` VALUES (876,388,88);
INSERT INTO `product_details` VALUES (877,389,83);
INSERT INTO `product_details` VALUES (878,389,88);
INSERT INTO `product_details` VALUES (879,390,90);
INSERT INTO `product_details` VALUES (880,390,88);
INSERT INTO `product_details` VALUES (881,391,84);
INSERT INTO `product_details` VALUES (882,391,88);
INSERT INTO `product_details` VALUES (883,392,83);
INSERT INTO `product_details` VALUES (884,392,88);
INSERT INTO `product_details` VALUES (885,393,90);
INSERT INTO `product_details` VALUES (886,393,88);
INSERT INTO `product_details` VALUES (887,394,84);
INSERT INTO `product_details` VALUES (888,394,88);
INSERT INTO `product_details` VALUES (889,395,83);
INSERT INTO `product_details` VALUES (890,395,88);
INSERT INTO `product_details` VALUES (891,396,90);
INSERT INTO `product_details` VALUES (892,396,88);
INSERT INTO `product_details` VALUES (893,397,84);
INSERT INTO `product_details` VALUES (894,397,88);
INSERT INTO `product_details` VALUES (895,398,83);
INSERT INTO `product_details` VALUES (896,398,88);
INSERT INTO `product_details` VALUES (897,399,90);
INSERT INTO `product_details` VALUES (898,399,88);
INSERT INTO `product_details` VALUES (899,400,84);
INSERT INTO `product_details` VALUES (900,400,88);
INSERT INTO `product_details` VALUES (901,401,83);
INSERT INTO `product_details` VALUES (902,401,88);
INSERT INTO `product_details` VALUES (903,402,90);
INSERT INTO `product_details` VALUES (904,402,88);
INSERT INTO `product_details` VALUES (905,403,84);
INSERT INTO `product_details` VALUES (906,403,88);
INSERT INTO `product_details` VALUES (907,404,83);
INSERT INTO `product_details` VALUES (908,404,88);
INSERT INTO `product_details` VALUES (909,405,90);
INSERT INTO `product_details` VALUES (910,405,88);
INSERT INTO `product_details` VALUES (911,406,84);
INSERT INTO `product_details` VALUES (912,406,88);
INSERT INTO `product_details` VALUES (913,407,83);
INSERT INTO `product_details` VALUES (914,407,88);
INSERT INTO `product_details` VALUES (915,408,90);
INSERT INTO `product_details` VALUES (916,408,88);
INSERT INTO `product_details` VALUES (917,409,84);
INSERT INTO `product_details` VALUES (918,409,88);
INSERT INTO `product_details` VALUES (919,410,83);
INSERT INTO `product_details` VALUES (920,410,88);
INSERT INTO `product_details` VALUES (921,411,90);
INSERT INTO `product_details` VALUES (922,411,88);
INSERT INTO `product_details` VALUES (923,412,84);
INSERT INTO `product_details` VALUES (924,412,88);
INSERT INTO `product_details` VALUES (925,413,83);
INSERT INTO `product_details` VALUES (926,413,88);
INSERT INTO `product_details` VALUES (927,414,90);
INSERT INTO `product_details` VALUES (928,414,88);
INSERT INTO `product_details` VALUES (929,415,84);
INSERT INTO `product_details` VALUES (930,415,88);
INSERT INTO `product_details` VALUES (931,416,83);
INSERT INTO `product_details` VALUES (932,416,88);
INSERT INTO `product_details` VALUES (933,417,90);
INSERT INTO `product_details` VALUES (934,417,88);
INSERT INTO `product_details` VALUES (935,418,84);
INSERT INTO `product_details` VALUES (936,418,88);
INSERT INTO `product_details` VALUES (937,419,83);
INSERT INTO `product_details` VALUES (938,419,88);
INSERT INTO `product_details` VALUES (939,420,90);
INSERT INTO `product_details` VALUES (940,420,88);
INSERT INTO `product_details` VALUES (941,421,84);
INSERT INTO `product_details` VALUES (942,421,88);
INSERT INTO `product_details` VALUES (943,422,83);
INSERT INTO `product_details` VALUES (944,422,88);
INSERT INTO `product_details` VALUES (945,423,90);
INSERT INTO `product_details` VALUES (946,423,88);
INSERT INTO `product_details` VALUES (947,424,84);
INSERT INTO `product_details` VALUES (948,424,88);
INSERT INTO `product_details` VALUES (949,425,83);
INSERT INTO `product_details` VALUES (950,425,88);
INSERT INTO `product_details` VALUES (951,426,90);
INSERT INTO `product_details` VALUES (952,426,88);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `src` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (90,'6ed28d09-a729-46f6-88a3-97f2ea683778_1.jpg','6ed28d09-a729-46f6-88a3-97f2ea683778_1.jpg',83);
INSERT INTO `product_images` VALUES (91,'3b057c80-f862-49f1-9f52-f94a30c4cfd1_1.jpg.webp','3b057c80-f862-49f1-9f52-f94a30c4cfd1_1.jpg.webp',83);
INSERT INTO `product_images` VALUES (92,'ed345ee5-8627-4247-ae6d-09f896a51de8_1__1_jpg.webp','ed345ee5-8627-4247-ae6d-09f896a51de8_1__1_jpg.webp',83);
INSERT INTO `product_images` VALUES (93,'6327dfb4-bcf0-4d07-b1a1-a8ece7bded6a_2.jpg','6327dfb4-bcf0-4d07-b1a1-a8ece7bded6a_2.jpg',84);
INSERT INTO `product_images` VALUES (94,'ac977efd-6433-4570-83a9-5d220af1e7b1_2_1.jpg.webp','ac977efd-6433-4570-83a9-5d220af1e7b1_2_1.jpg.webp',84);
INSERT INTO `product_images` VALUES (95,'77a1b88c-c1de-4631-b826-4e9a633a4be7_3.jpg','77a1b88c-c1de-4631-b826-4e9a633a4be7_3.jpg',85);
INSERT INTO `product_images` VALUES (96,'72359848-b8e4-487a-9b18-9ab1b9778709_3_1.jpg.webp','72359848-b8e4-487a-9b18-9ab1b9778709_3_1.jpg.webp',85);
INSERT INTO `product_images` VALUES (97,'50ab971e-171a-44bc-a6e4-7f7f16f4e9e1_3_1_1.jpg.webp','50ab971e-171a-44bc-a6e4-7f7f16f4e9e1_3_1_1.jpg.webp',85);
INSERT INTO `product_images` VALUES (98,'59825265-2790-4d86-ba33-6b55c341163a_3_1_1.jpg.webp','59825265-2790-4d86-ba33-6b55c341163a_3_1_1.jpg.webp',86);
INSERT INTO `product_images` VALUES (99,'ddeb02ba-f6b6-4d1a-9cfa-d00e9e3f8cb7_3_1.jpg.webp','ddeb02ba-f6b6-4d1a-9cfa-d00e9e3f8cb7_3_1.jpg.webp',86);
INSERT INTO `product_images` VALUES (100,'f8ad7e97-89a0-42cf-9c7d-a66c38cbfe3b_4.jpg','f8ad7e97-89a0-42cf-9c7d-a66c38cbfe3b_4.jpg',87);
INSERT INTO `product_images` VALUES (101,'dcaf2c0e-e902-43b7-b6d0-fb6a004769b8_4_1_jpg.webp','dcaf2c0e-e902-43b7-b6d0-fb6a004769b8_4_1_jpg.webp',87);
INSERT INTO `product_images` VALUES (102,'eee8b39e-73e4-4c80-96fe-fbe1b968f209_5.jpg','eee8b39e-73e4-4c80-96fe-fbe1b968f209_5.jpg',88);
INSERT INTO `product_images` VALUES (103,'acfd6d2c-9764-40fb-b21a-9d2f7e431889_5_1.jpg.webp','acfd6d2c-9764-40fb-b21a-9d2f7e431889_5_1.jpg.webp',88);
INSERT INTO `product_images` VALUES (104,'aa497e9e-20ca-4d3f-8872-c0602ffe1c3d_6.jpg','aa497e9e-20ca-4d3f-8872-c0602ffe1c3d_6.jpg',89);
INSERT INTO `product_images` VALUES (105,'dea3674a-8647-4d29-83db-a3cc4e823cff_7.1.jpg','dea3674a-8647-4d29-83db-a3cc4e823cff_7.1.jpg',90);
INSERT INTO `product_images` VALUES (106,'37d7a554-ae03-4f32-a47b-abf83dae1b2b_7.2.jpg','37d7a554-ae03-4f32-a47b-abf83dae1b2b_7.2.jpg',90);
INSERT INTO `product_images` VALUES (107,'72710d34-5506-4e36-8db9-4f56b904c277_8.1.jpg','72710d34-5506-4e36-8db9-4f56b904c277_8.1.jpg',91);
INSERT INTO `product_images` VALUES (108,'21b837e4-af56-4dc5-b385-56cd77aeb2c5_8.2.jpg','21b837e4-af56-4dc5-b385-56cd77aeb2c5_8.2.jpg',91);
INSERT INTO `product_images` VALUES (109,'901bbcf7-c846-42db-bbbc-d70382d73ad4_9.jpg','901bbcf7-c846-42db-bbbc-d70382d73ad4_9.jpg',92);
INSERT INTO `product_images` VALUES (110,'f47f7d3d-d872-4ab1-bda1-918ff254c2f7_9_2.jpg','f47f7d3d-d872-4ab1-bda1-918ff254c2f7_9_2.jpg',92);
INSERT INTO `product_images` VALUES (111,'bb447b35-1ebe-4483-981f-408828a2bdd5_10.jpg','bb447b35-1ebe-4483-981f-408828a2bdd5_10.jpg',93);
INSERT INTO `product_images` VALUES (112,'c9243d0f-fd59-4e44-9600-0035f96ce48b_10_1_jpg.webp','c9243d0f-fd59-4e44-9600-0035f96ce48b_10_1_jpg.webp',93);
INSERT INTO `product_images` VALUES (113,'ee4e6cf8-9740-4669-939b-d9540c30e36d_11_1.jpg.webp','ee4e6cf8-9740-4669-939b-d9540c30e36d_11_1.jpg.webp',94);
INSERT INTO `product_images` VALUES (114,'c9e3656e-c1de-4d41-b77e-2cd1424539a7_12.jpg','c9e3656e-c1de-4d41-b77e-2cd1424539a7_12.jpg',95);
INSERT INTO `product_images` VALUES (115,'9c453d08-b667-432a-acd1-3bfc95e168fe_13.jpg','9c453d08-b667-432a-acd1-3bfc95e168fe_13.jpg',96);
INSERT INTO `product_images` VALUES (116,'04ee85c4-65a2-4cf0-8543-1097e9780167_14.jpg','04ee85c4-65a2-4cf0-8543-1097e9780167_14.jpg',97);
INSERT INTO `product_images` VALUES (117,'9604618b-283a-434b-81ed-090e4e578927_15.jpg','9604618b-283a-434b-81ed-090e4e578927_15.jpg',98);
INSERT INTO `product_images` VALUES (118,'7c95d715-3d2b-49f7-821e-42c65b2b783c_16.jpg','7c95d715-3d2b-49f7-821e-42c65b2b783c_16.jpg',99);
INSERT INTO `product_images` VALUES (119,'a2a03e7c-d904-4bfd-932e-8eabfd0dd8b0_17.jpg','a2a03e7c-d904-4bfd-932e-8eabfd0dd8b0_17.jpg',100);
INSERT INTO `product_images` VALUES (120,'3d52402c-18c7-4b3b-9440-d9f33411486b_19.jpg','3d52402c-18c7-4b3b-9440-d9f33411486b_19.jpg',101);
INSERT INTO `product_images` VALUES (121,'5962fd27-64bd-4805-8ff6-26801e69292f_19.jpg','5962fd27-64bd-4805-8ff6-26801e69292f_19.jpg',102);
INSERT INTO `product_images` VALUES (122,'6c159882-d7d2-4512-b8f3-4d2c7934c320_20.jpg','6c159882-d7d2-4512-b8f3-4d2c7934c320_20.jpg',103);
INSERT INTO `product_images` VALUES (123,'80a9b57d-cf5c-4724-9b92-056d0707f285_22.jpg','80a9b57d-cf5c-4724-9b92-056d0707f285_22.jpg',104);
INSERT INTO `product_images` VALUES (124,'ef5edd47-fddf-4a7f-b7c3-eac761338510_21.jpg','ef5edd47-fddf-4a7f-b7c3-eac761338510_21.jpg',104);
INSERT INTO `product_images` VALUES (125,'b26d502e-e556-46e7-b6af-c46b8f254f12_23.jpg','b26d502e-e556-46e7-b6af-c46b8f254f12_23.jpg',104);
INSERT INTO `product_images` VALUES (126,'1571e10e-d94a-49e0-b2d5-c378b538b937_24.jpg','1571e10e-d94a-49e0-b2d5-c378b538b937_24.jpg',104);
INSERT INTO `product_images` VALUES (127,'748b94f9-7a41-4ccd-acee-f2871cdae3da_5.jpg','748b94f9-7a41-4ccd-acee-f2871cdae3da_5.jpg',105);
INSERT INTO `product_images` VALUES (128,'e69c293d-cc1f-4dc9-ba77-dc8c526703bd_7.jpg','e69c293d-cc1f-4dc9-ba77-dc8c526703bd_7.jpg',106);
INSERT INTO `product_images` VALUES (129,'5c654abf-4d50-4d42-8eb9-cdae64a03144_8_2_jpg.webp','5c654abf-4d50-4d42-8eb9-cdae64a03144_8_2_jpg.webp',107);
INSERT INTO `product_images` VALUES (130,'76083948-4e29-48a6-b0e8-b71a279be8c8_8_3_jpg.webp','76083948-4e29-48a6-b0e8-b71a279be8c8_8_3_jpg.webp',107);
INSERT INTO `product_images` VALUES (131,'dd6dd15a-c26a-4388-bf8b-986f3321788a_6.jpg','dd6dd15a-c26a-4388-bf8b-986f3321788a_6.jpg',108);
INSERT INTO `product_images` VALUES (132,'5444d180-29af-4031-8791-21296000e5db_6_2.jpg','5444d180-29af-4031-8791-21296000e5db_6_2.jpg',108);
INSERT INTO `product_images` VALUES (133,'f9e7af8d-53aa-48b0-8713-ce459dafcd57_6_4.jpg','f9e7af8d-53aa-48b0-8713-ce459dafcd57_6_4.jpg',109);
INSERT INTO `product_images` VALUES (134,'9e8cca1e-fe39-475c-a71a-5749c16a7c51_6_3.jpg','9e8cca1e-fe39-475c-a71a-5749c16a7c51_6_3.jpg',109);
INSERT INTO `product_images` VALUES (135,'496faa4d-ff02-40d8-ac55-2ff28d48b71b_10.jpg','496faa4d-ff02-40d8-ac55-2ff28d48b71b_10.jpg',110);
INSERT INTO `product_images` VALUES (136,'e4f1b383-adf3-472f-b0ad-976da2fc974a_10_1_jpg.webp','e4f1b383-adf3-472f-b0ad-976da2fc974a_10_1_jpg.webp',110);
INSERT INTO `product_images` VALUES (137,'418ab48b-ef67-4cfd-a042-e583f18f4280_10_2_jpg.webp','418ab48b-ef67-4cfd-a042-e583f18f4280_10_2_jpg.webp',110);
INSERT INTO `product_images` VALUES (138,'139e0dfd-a812-4256-b726-601fcafece33_11.jpg','139e0dfd-a812-4256-b726-601fcafece33_11.jpg',111);
INSERT INTO `product_images` VALUES (139,'1e529480-8063-4826-b378-eee3a41df62a_10_4_jpg.webp','1e529480-8063-4826-b378-eee3a41df62a_10_4_jpg.webp',111);
INSERT INTO `product_images` VALUES (140,'53a99d59-0ca1-424c-919f-ce16ab996095_10_3_jpg.webp','53a99d59-0ca1-424c-919f-ce16ab996095_10_3_jpg.webp',111);
INSERT INTO `product_images` VALUES (141,'24820a97-ddc0-446b-8e7f-c2f3b4b1910f_8_1_jpg.webp','24820a97-ddc0-446b-8e7f-c2f3b4b1910f_8_1_jpg.webp',112);
INSERT INTO `product_images` VALUES (142,'a2dbc7f2-3a00-4c0a-b839-5380c4e61326_8.jpg','a2dbc7f2-3a00-4c0a-b839-5380c4e61326_8.jpg',112);
INSERT INTO `product_images` VALUES (143,'28eab187-814d-4675-9092-aa0713b657bc_14.jpg','28eab187-814d-4675-9092-aa0713b657bc_14.jpg',113);
INSERT INTO `product_images` VALUES (144,'854e107a-e02e-4dc4-85bf-3c03d8af1ceb_15.jpg','854e107a-e02e-4dc4-85bf-3c03d8af1ceb_15.jpg',114);
INSERT INTO `product_images` VALUES (145,'1d67dec6-27c9-49de-b66b-8b0953e5edc7_17.jpg','1d67dec6-27c9-49de-b66b-8b0953e5edc7_17.jpg',115);
INSERT INTO `product_images` VALUES (146,'38bfa9de-91eb-471e-b91b-101ffc104b25_18.jpg','38bfa9de-91eb-471e-b91b-101ffc104b25_18.jpg',116);
INSERT INTO `product_images` VALUES (147,'0c0e06b4-23bf-4278-9d4c-067c71f2fd32_19.jpg','0c0e06b4-23bf-4278-9d4c-067c71f2fd32_19.jpg',117);
INSERT INTO `product_images` VALUES (148,'53b1235d-71d7-448e-938e-fbc9b23af11f_20.jpg','53b1235d-71d7-448e-938e-fbc9b23af11f_20.jpg',118);
INSERT INTO `product_images` VALUES (149,'6720dce8-110b-45dc-8ba6-12bb2b6e6e64_18.jpg','6720dce8-110b-45dc-8ba6-12bb2b6e6e64_18.jpg',118);
INSERT INTO `product_images` VALUES (150,'8391ee18-0be7-4bb0-acde-bb381915e467_21.jpg','8391ee18-0be7-4bb0-acde-bb381915e467_21.jpg',119);
INSERT INTO `product_images` VALUES (151,'dc7849c3-4745-4a68-b493-aa182cd3b34a_12.jpg','dc7849c3-4745-4a68-b493-aa182cd3b34a_12.jpg',119);
INSERT INTO `product_images` VALUES (152,'d7d91b4f-f5e7-49d2-8347-c85873b0ce7c_22.jpg','d7d91b4f-f5e7-49d2-8347-c85873b0ce7c_22.jpg',120);
INSERT INTO `product_images` VALUES (153,'cd49d7a6-8f13-4d44-882c-981449ed9fe0_11.jpg','cd49d7a6-8f13-4d44-882c-981449ed9fe0_11.jpg',120);
INSERT INTO `product_images` VALUES (154,'fa808b2b-4c26-4b3b-aa8c-c369601880ab_10_2_jpg.webp','fa808b2b-4c26-4b3b-aa8c-c369601880ab_10_2_jpg.webp',120);
INSERT INTO `product_images` VALUES (155,'7e63cd80-dd50-4588-8646-b7f40e3ee219_23.jpg','7e63cd80-dd50-4588-8646-b7f40e3ee219_23.jpg',121);
INSERT INTO `product_images` VALUES (156,'2f0eccda-8f57-4ecc-b98f-29d3f01892b8_11.jpg','2f0eccda-8f57-4ecc-b98f-29d3f01892b8_11.jpg',121);
INSERT INTO `product_images` VALUES (157,'349615c1-a54e-4075-bab3-6f55801949a7_6_4.jpg','349615c1-a54e-4075-bab3-6f55801949a7_6_4.jpg',121);
INSERT INTO `product_images` VALUES (158,'a80f8969-8d35-4630-8bdc-eb0f18b4c0d0_24.jpg','a80f8969-8d35-4630-8bdc-eb0f18b4c0d0_24.jpg',122);
INSERT INTO `product_images` VALUES (159,'be3c6595-0a96-44f1-99b5-46983c4c7cf3_20.jpg','be3c6595-0a96-44f1-99b5-46983c4c7cf3_20.jpg',122);
INSERT INTO `product_images` VALUES (160,'52942ad7-eed5-4b04-afd8-32488d5f1091_12.jpg','52942ad7-eed5-4b04-afd8-32488d5f1091_12.jpg',122);
INSERT INTO `product_images` VALUES (161,'8751d3ae-b5ec-42e6-8bfc-79927ee21681_1.jpeg','8751d3ae-b5ec-42e6-8bfc-79927ee21681_1.jpeg',123);
INSERT INTO `product_images` VALUES (162,'26c34086-f4dd-4f34-ab7a-f06d7c2a344c_19.jpeg','26c34086-f4dd-4f34-ab7a-f06d7c2a344c_19.jpeg',123);
INSERT INTO `product_images` VALUES (163,'a32744a5-9918-4f87-9184-3dd75e420fcd_18.jpeg','a32744a5-9918-4f87-9184-3dd75e420fcd_18.jpeg',123);
INSERT INTO `product_images` VALUES (164,'aaacf4e7-4621-4b53-bbd3-32e1c456c33a_2.jpeg','aaacf4e7-4621-4b53-bbd3-32e1c456c33a_2.jpeg',124);
INSERT INTO `product_images` VALUES (165,'c9fe80ae-dbea-44fb-8875-c41a6e947c6c_15.jpeg','c9fe80ae-dbea-44fb-8875-c41a6e947c6c_15.jpeg',124);
INSERT INTO `product_images` VALUES (166,'d91325b7-983c-44ac-a07c-62f331f045ba_16.jpeg','d91325b7-983c-44ac-a07c-62f331f045ba_16.jpeg',124);
INSERT INTO `product_images` VALUES (167,'d732f030-051d-4123-af79-2d8c8a7e3c6f_3.jpeg','d732f030-051d-4123-af79-2d8c8a7e3c6f_3.jpeg',125);
INSERT INTO `product_images` VALUES (168,'ba028c4f-3d8e-41f4-9c37-3e80726826d6_13.jpeg','ba028c4f-3d8e-41f4-9c37-3e80726826d6_13.jpeg',125);
INSERT INTO `product_images` VALUES (169,'ebab9796-211d-439d-b539-06c77cbb8b82_14.jpeg','ebab9796-211d-439d-b539-06c77cbb8b82_14.jpeg',125);
INSERT INTO `product_images` VALUES (170,'12ab4d93-5bfa-4dcc-8163-730685669dc5_4.jpeg','12ab4d93-5bfa-4dcc-8163-730685669dc5_4.jpeg',126);
INSERT INTO `product_images` VALUES (171,'8f1d3a08-a656-4bff-809c-668219c915ef_9.jpeg','8f1d3a08-a656-4bff-809c-668219c915ef_9.jpeg',126);
INSERT INTO `product_images` VALUES (172,'35d5aceb-d242-4da2-85b6-93a9d49de30e_10.jpeg','35d5aceb-d242-4da2-85b6-93a9d49de30e_10.jpeg',126);
INSERT INTO `product_images` VALUES (173,'5e48cce8-37b2-4864-8572-9692b941f3a1_5.jpeg','5e48cce8-37b2-4864-8572-9692b941f3a1_5.jpeg',127);
INSERT INTO `product_images` VALUES (174,'2313bc6c-7032-40a2-96b3-c0925a94183e_8.jpeg','2313bc6c-7032-40a2-96b3-c0925a94183e_8.jpeg',127);
INSERT INTO `product_images` VALUES (175,'86cccf4b-8f29-4c61-8507-dfac6862f822_9.jpeg','86cccf4b-8f29-4c61-8507-dfac6862f822_9.jpeg',127);
INSERT INTO `product_images` VALUES (176,'28ddb212-3e1a-4a75-9258-4b55ed42c7df_6.jpeg','28ddb212-3e1a-4a75-9258-4b55ed42c7df_6.jpeg',128);
INSERT INTO `product_images` VALUES (177,'31d1781f-04cc-4651-ba94-817eac375766_14.jpeg','31d1781f-04cc-4651-ba94-817eac375766_14.jpeg',128);
INSERT INTO `product_images` VALUES (178,'2c9841bf-9348-43a4-8b14-ca4a56de1420_15.jpeg','2c9841bf-9348-43a4-8b14-ca4a56de1420_15.jpeg',128);
INSERT INTO `product_images` VALUES (179,'f2e82f7e-39d7-484c-b119-5e83c42113fc_7.jpeg','f2e82f7e-39d7-484c-b119-5e83c42113fc_7.jpeg',129);
INSERT INTO `product_images` VALUES (180,'e928d94d-ef82-4e0b-b333-d9fcc4258597_3.jpeg','e928d94d-ef82-4e0b-b333-d9fcc4258597_3.jpeg',129);
INSERT INTO `product_images` VALUES (181,'b477301c-f621-4274-94d3-a48a1a04f68c_4.jpeg','b477301c-f621-4274-94d3-a48a1a04f68c_4.jpeg',129);
INSERT INTO `product_images` VALUES (182,'87c57701-64b6-47ca-baf5-8db0cae5019e_8.jpeg','87c57701-64b6-47ca-baf5-8db0cae5019e_8.jpeg',130);
INSERT INTO `product_images` VALUES (183,'378cf088-cda5-47c1-b82a-f267cb9e0b94_13.jpeg','378cf088-cda5-47c1-b82a-f267cb9e0b94_13.jpeg',130);
INSERT INTO `product_images` VALUES (184,'eca40a11-786a-494c-8f5b-a29c7170aece_14.jpeg','eca40a11-786a-494c-8f5b-a29c7170aece_14.jpeg',130);
INSERT INTO `product_images` VALUES (185,'5c3827a4-100d-46f3-b469-8ffb0c4b60b4_9.jpeg','5c3827a4-100d-46f3-b469-8ffb0c4b60b4_9.jpeg',131);
INSERT INTO `product_images` VALUES (186,'de98eb7f-7f56-4da7-8bc8-186a4aaf56fb_18.jpeg','de98eb7f-7f56-4da7-8bc8-186a4aaf56fb_18.jpeg',131);
INSERT INTO `product_images` VALUES (187,'c69b8f43-a598-4e33-8ac7-5195ef76b19d_19.jpeg','c69b8f43-a598-4e33-8ac7-5195ef76b19d_19.jpeg',131);
INSERT INTO `product_images` VALUES (188,'065b0b15-1e1b-455d-989b-3c6cf00baecb_10.jpeg','065b0b15-1e1b-455d-989b-3c6cf00baecb_10.jpeg',132);
INSERT INTO `product_images` VALUES (189,'a52322c9-b0a0-49da-a66d-ac99040fd732_1.jpeg','a52322c9-b0a0-49da-a66d-ac99040fd732_1.jpeg',132);
INSERT INTO `product_images` VALUES (190,'1691feb2-7823-486b-ab1b-5dfc2fdb3c15_2.jpeg','1691feb2-7823-486b-ab1b-5dfc2fdb3c15_2.jpeg',132);
INSERT INTO `product_images` VALUES (191,'b608d594-863c-4e4f-821a-5a81f5380c16_13.jpeg','b608d594-863c-4e4f-821a-5a81f5380c16_13.jpeg',133);
INSERT INTO `product_images` VALUES (192,'14ce52fc-2623-42b0-bfe1-818ace5d6cd4_4.jpeg','14ce52fc-2623-42b0-bfe1-818ace5d6cd4_4.jpeg',133);
INSERT INTO `product_images` VALUES (193,'1879ebcf-7c5a-4957-9e7e-80f8005e263d_7.jpeg','1879ebcf-7c5a-4957-9e7e-80f8005e263d_7.jpeg',133);
INSERT INTO `product_images` VALUES (194,'3d081f22-53ea-4e03-85ef-cc530024685d_14.jpeg','3d081f22-53ea-4e03-85ef-cc530024685d_14.jpeg',134);
INSERT INTO `product_images` VALUES (195,'d142c314-0101-44f2-b141-14f7b2ff346f_6.jpeg','d142c314-0101-44f2-b141-14f7b2ff346f_6.jpeg',134);
INSERT INTO `product_images` VALUES (196,'6af3717f-62a3-4172-af01-fac79539caf2_10.jpeg','6af3717f-62a3-4172-af01-fac79539caf2_10.jpeg',134);
INSERT INTO `product_images` VALUES (197,'916e0f56-22f0-4a43-a651-9be04ad41827_15.jpeg','916e0f56-22f0-4a43-a651-9be04ad41827_15.jpeg',135);
INSERT INTO `product_images` VALUES (198,'57a40e8a-af07-4c24-9209-d53eec6bf780_14.jpeg','57a40e8a-af07-4c24-9209-d53eec6bf780_14.jpeg',135);
INSERT INTO `product_images` VALUES (199,'9b23359a-d882-4bee-a9a0-27181b62a730_13.jpeg','9b23359a-d882-4bee-a9a0-27181b62a730_13.jpeg',135);
INSERT INTO `product_images` VALUES (200,'cc9e07d5-5ef3-46f7-b79d-9a6929bf9849_16.jpeg','cc9e07d5-5ef3-46f7-b79d-9a6929bf9849_16.jpeg',136);
INSERT INTO `product_images` VALUES (201,'f7604f4d-3e96-49ee-8551-0eed0af11f2d_17.jpeg','f7604f4d-3e96-49ee-8551-0eed0af11f2d_17.jpeg',136);
INSERT INTO `product_images` VALUES (202,'85739e92-2042-4352-8a07-ea395bbe733d_18.jpeg','85739e92-2042-4352-8a07-ea395bbe733d_18.jpeg',136);
INSERT INTO `product_images` VALUES (203,'3b0b7344-4e17-4b2a-8773-1b43730c072c_17.jpeg','3b0b7344-4e17-4b2a-8773-1b43730c072c_17.jpeg',137);
INSERT INTO `product_images` VALUES (204,'dbfc7fba-aa48-4d63-a830-ed4f8a6f347e_18.jpeg','dbfc7fba-aa48-4d63-a830-ed4f8a6f347e_18.jpeg',137);
INSERT INTO `product_images` VALUES (205,'653ee307-e16a-49a5-8ed9-b73ef1f0cfda_5.jpeg','653ee307-e16a-49a5-8ed9-b73ef1f0cfda_5.jpeg',137);
INSERT INTO `product_images` VALUES (206,'5aeb36bb-02f9-4a18-bc47-c85e0a214ef6_18.jpeg','5aeb36bb-02f9-4a18-bc47-c85e0a214ef6_18.jpeg',138);
INSERT INTO `product_images` VALUES (207,'ca7279e1-a7fb-4251-aed8-d29041628cf2_5.jpeg','ca7279e1-a7fb-4251-aed8-d29041628cf2_5.jpeg',138);
INSERT INTO `product_images` VALUES (208,'a4b77944-d53b-40eb-9f2e-d06451e6455e_2.jpeg','a4b77944-d53b-40eb-9f2e-d06451e6455e_2.jpeg',138);
INSERT INTO `product_images` VALUES (209,'9f3d7d3d-5572-4d4b-a2f4-e453c50ed960_19.jpeg','9f3d7d3d-5572-4d4b-a2f4-e453c50ed960_19.jpeg',139);
INSERT INTO `product_images` VALUES (210,'4e6ebdba-564e-4c14-99be-d8d82a15eafd_14.jpeg','4e6ebdba-564e-4c14-99be-d8d82a15eafd_14.jpeg',139);
INSERT INTO `product_images` VALUES (211,'7636be83-3feb-4818-88c4-aefc2b3400db_13.jpeg','7636be83-3feb-4818-88c4-aefc2b3400db_13.jpeg',139);
INSERT INTO `product_images` VALUES (212,'2533a147-6e7b-4546-a6d7-b4fdd6a228f5_1.jpeg','2533a147-6e7b-4546-a6d7-b4fdd6a228f5_1.jpeg',140);
INSERT INTO `product_images` VALUES (213,'be69ad60-c007-468a-a426-46e46ec7976a_6.jpeg','be69ad60-c007-468a-a426-46e46ec7976a_6.jpeg',140);
INSERT INTO `product_images` VALUES (214,'f6bbd2f1-85da-46bd-8817-8ce90be5c1ef_7.jpeg','f6bbd2f1-85da-46bd-8817-8ce90be5c1ef_7.jpeg',140);
INSERT INTO `product_images` VALUES (215,'2a702e63-707d-4539-88c3-10250b8012d3_6.jpeg','2a702e63-707d-4539-88c3-10250b8012d3_6.jpeg',141);
INSERT INTO `product_images` VALUES (216,'29911d1b-0b6c-4c7e-8f27-9541e522626a_7.jpeg','29911d1b-0b6c-4c7e-8f27-9541e522626a_7.jpeg',141);
INSERT INTO `product_images` VALUES (217,'0afafa24-dbd1-4499-afb0-c3c56b08d0b4_8.jpeg','0afafa24-dbd1-4499-afb0-c3c56b08d0b4_8.jpeg',141);
INSERT INTO `product_images` VALUES (218,'8ddee714-2c4a-4b1b-bc96-2f35c1e3b058_8.jpeg','8ddee714-2c4a-4b1b-bc96-2f35c1e3b058_8.jpeg',142);
INSERT INTO `product_images` VALUES (219,'3415ba48-c301-46ee-baf4-1ff8574d2137_9.jpeg','3415ba48-c301-46ee-baf4-1ff8574d2137_9.jpeg',142);
INSERT INTO `product_images` VALUES (220,'54536103-c66c-4b1e-b0d1-016a270bc867_10.jpeg','54536103-c66c-4b1e-b0d1-016a270bc867_10.jpeg',142);
INSERT INTO `product_images` VALUES (221,'15011df7-f164-411e-9780-cb99cbdf12d6_9.jpeg','15011df7-f164-411e-9780-cb99cbdf12d6_9.jpeg',143);
INSERT INTO `product_images` VALUES (222,'5a982764-3f95-409a-9ce1-407f842a5198_10.jpeg','5a982764-3f95-409a-9ce1-407f842a5198_10.jpeg',143);
INSERT INTO `product_images` VALUES (223,'022d3b5a-f6fc-459e-abae-a18c51f7dc7f_11.jpeg','022d3b5a-f6fc-459e-abae-a18c51f7dc7f_11.jpeg',143);
INSERT INTO `product_images` VALUES (224,'6fe9e424-6d90-48e1-9756-ea100e0690d2_10.jpeg','6fe9e424-6d90-48e1-9756-ea100e0690d2_10.jpeg',144);
INSERT INTO `product_images` VALUES (225,'0cdd276d-6173-4bc1-89dd-c1059a576d50_11.jpeg','0cdd276d-6173-4bc1-89dd-c1059a576d50_11.jpeg',144);
INSERT INTO `product_images` VALUES (226,'bb1ddd14-9bd4-4646-b070-cb5ef0aa1a3f_12.jpeg','bb1ddd14-9bd4-4646-b070-cb5ef0aa1a3f_12.jpeg',144);
INSERT INTO `product_images` VALUES (227,'ec011512-d606-4c1b-98c1-d91c9464dd34_11.jpeg','ec011512-d606-4c1b-98c1-d91c9464dd34_11.jpeg',145);
INSERT INTO `product_images` VALUES (228,'ae90ffe0-7825-4924-9add-64981e746da5_12.jpeg','ae90ffe0-7825-4924-9add-64981e746da5_12.jpeg',145);
INSERT INTO `product_images` VALUES (229,'c5e912db-2ade-4bce-ad7c-3c69af0c3ad6_13.jpeg','c5e912db-2ade-4bce-ad7c-3c69af0c3ad6_13.jpeg',145);
INSERT INTO `product_images` VALUES (230,'f486638f-6b9f-4ea0-84f3-72de1df590df_12.jpeg','f486638f-6b9f-4ea0-84f3-72de1df590df_12.jpeg',146);
INSERT INTO `product_images` VALUES (231,'77a0c676-509a-4358-a75c-77a94de4502d_13.jpeg','77a0c676-509a-4358-a75c-77a94de4502d_13.jpeg',146);
INSERT INTO `product_images` VALUES (232,'1be0fc14-52b3-4f03-b57d-63e8fed6aaf6_14.jpeg','1be0fc14-52b3-4f03-b57d-63e8fed6aaf6_14.jpeg',146);
INSERT INTO `product_images` VALUES (233,'593f27f3-6e17-48ed-8b97-c9e707fbf875_13.jpeg','593f27f3-6e17-48ed-8b97-c9e707fbf875_13.jpeg',147);
INSERT INTO `product_images` VALUES (234,'c00bd537-0038-45a9-9cb9-71f062123892_14.jpeg','c00bd537-0038-45a9-9cb9-71f062123892_14.jpeg',147);
INSERT INTO `product_images` VALUES (235,'bebf47e5-8e19-4896-b979-9eba5a1e75be_15.jpeg','bebf47e5-8e19-4896-b979-9eba5a1e75be_15.jpeg',147);
INSERT INTO `product_images` VALUES (236,'e3e15913-bc46-4197-ab4b-ef416f2448b9_14.jpeg','e3e15913-bc46-4197-ab4b-ef416f2448b9_14.jpeg',148);
INSERT INTO `product_images` VALUES (237,'a9433175-4b2e-4a78-991a-34f190169461_15.jpeg','a9433175-4b2e-4a78-991a-34f190169461_15.jpeg',148);
INSERT INTO `product_images` VALUES (238,'8fa7dc8e-2150-4f72-971d-ab5cfb5da664_16.jpeg','8fa7dc8e-2150-4f72-971d-ab5cfb5da664_16.jpeg',148);
INSERT INTO `product_images` VALUES (239,'22293c43-c5df-4c29-bdaa-5c83182e6546_15.jpeg','22293c43-c5df-4c29-bdaa-5c83182e6546_15.jpeg',149);
INSERT INTO `product_images` VALUES (240,'6cccafaf-83bb-4fed-9f98-6f5f495c0f8d_16.jpeg','6cccafaf-83bb-4fed-9f98-6f5f495c0f8d_16.jpeg',149);
INSERT INTO `product_images` VALUES (241,'24e62208-34d2-4627-af2d-d60688208342_17.jpeg','24e62208-34d2-4627-af2d-d60688208342_17.jpeg',149);
INSERT INTO `product_images` VALUES (242,'9a2193e0-3a04-4085-b68b-f61f5fa651f4_16.jpeg','9a2193e0-3a04-4085-b68b-f61f5fa651f4_16.jpeg',150);
INSERT INTO `product_images` VALUES (243,'d66f8c74-22a5-4931-8cf2-d31fef3fd49a_17.jpeg','d66f8c74-22a5-4931-8cf2-d31fef3fd49a_17.jpeg',150);
INSERT INTO `product_images` VALUES (244,'62580fef-8dca-4cd3-ace7-920717c39739_18.jpeg','62580fef-8dca-4cd3-ace7-920717c39739_18.jpeg',150);
INSERT INTO `product_images` VALUES (245,'4b0fdff3-ccea-4680-b088-5ab45a6f2296_17.jpeg','4b0fdff3-ccea-4680-b088-5ab45a6f2296_17.jpeg',151);
INSERT INTO `product_images` VALUES (246,'0e9fc890-1c79-4b44-a4ef-4b8a0719a90e_18.jpeg','0e9fc890-1c79-4b44-a4ef-4b8a0719a90e_18.jpeg',151);
INSERT INTO `product_images` VALUES (247,'78f70014-505a-4d33-a43a-f03d073f970c_19.jpeg','78f70014-505a-4d33-a43a-f03d073f970c_19.jpeg',151);
INSERT INTO `product_images` VALUES (248,'4a710978-046e-4864-b31c-aca518f63e79_18.jpeg','4a710978-046e-4864-b31c-aca518f63e79_18.jpeg',152);
INSERT INTO `product_images` VALUES (249,'8b6e13d6-d608-424e-80a1-ad297448572a_19.jpeg','8b6e13d6-d608-424e-80a1-ad297448572a_19.jpeg',152);
INSERT INTO `product_images` VALUES (250,'bd7ab91c-5bf7-4469-af35-dbfaeec7df03_20.jpeg','bd7ab91c-5bf7-4469-af35-dbfaeec7df03_20.jpeg',152);
INSERT INTO `product_images` VALUES (251,'948f0c89-a674-4c5c-ab29-40e672c8b37f_19.jpeg','948f0c89-a674-4c5c-ab29-40e672c8b37f_19.jpeg',153);
INSERT INTO `product_images` VALUES (252,'849ca695-4e62-49d5-92a4-5a20644f41aa_20.jpeg','849ca695-4e62-49d5-92a4-5a20644f41aa_20.jpeg',153);
INSERT INTO `product_images` VALUES (253,'7463ab8d-ed22-4fc4-89b9-8bbba86ca428_21.jpeg','7463ab8d-ed22-4fc4-89b9-8bbba86ca428_21.jpeg',153);
INSERT INTO `product_images` VALUES (254,'b4a239c1-1abd-4f4f-be22-47d1dcad6103_20.jpeg','b4a239c1-1abd-4f4f-be22-47d1dcad6103_20.jpeg',154);
INSERT INTO `product_images` VALUES (255,'9bd07137-f73e-4e73-b628-19312115cfb8_21.jpeg','9bd07137-f73e-4e73-b628-19312115cfb8_21.jpeg',154);
INSERT INTO `product_images` VALUES (256,'c63cd884-76e1-46eb-ad76-8ac00da8e558_22.jpeg','c63cd884-76e1-46eb-ad76-8ac00da8e558_22.jpeg',154);
INSERT INTO `product_images` VALUES (257,'5f448f46-10f2-401d-a833-4b588b6e7da1_21.jpeg','5f448f46-10f2-401d-a833-4b588b6e7da1_21.jpeg',155);
INSERT INTO `product_images` VALUES (258,'05c123f0-ceb0-4573-ada9-1f225f9e7ed5_22.jpeg','05c123f0-ceb0-4573-ada9-1f225f9e7ed5_22.jpeg',155);
INSERT INTO `product_images` VALUES (259,'2ba4dec8-3eb0-4360-a625-bc991f829642_23.jpeg','2ba4dec8-3eb0-4360-a625-bc991f829642_23.jpeg',155);
INSERT INTO `product_images` VALUES (260,'495d8eb1-d8a5-492d-ba04-b3e428aaa459_22.jpeg','495d8eb1-d8a5-492d-ba04-b3e428aaa459_22.jpeg',156);
INSERT INTO `product_images` VALUES (261,'476fb001-5fc9-4d65-8b7c-3be463ca92ec_23.jpeg','476fb001-5fc9-4d65-8b7c-3be463ca92ec_23.jpeg',156);
INSERT INTO `product_images` VALUES (262,'c976e716-373d-4bfd-9677-cbec817bb9e6_1.jpeg','c976e716-373d-4bfd-9677-cbec817bb9e6_1.jpeg',156);
INSERT INTO `product_images` VALUES (263,'cf23c336-8328-491f-9476-53a84a4da643_23.jpeg','cf23c336-8328-491f-9476-53a84a4da643_23.jpeg',157);
INSERT INTO `product_images` VALUES (264,'c7d80e94-1ad5-4861-8789-85bcf9435944_1.jpeg','c7d80e94-1ad5-4861-8789-85bcf9435944_1.jpeg',157);
INSERT INTO `product_images` VALUES (265,'3f1642ac-0b8e-43bc-8431-6cc6eb23ed1e_6.jpeg','3f1642ac-0b8e-43bc-8431-6cc6eb23ed1e_6.jpeg',157);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_variant_name` varchar(100) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `price` int DEFAULT NULL,
  `stock` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: out of stock, 1: in stock ',
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (71,'trắng xám-S','ÁOK-FAS-0480FE33',1326000,214,1,83);
INSERT INTO `product_variants` VALUES (72,'trắng xám-M','ÁOK-FAS-F553B019',1345000,224,1,83);
INSERT INTO `product_variants` VALUES (73,'trắng xám-L','ÁOK-FAS-F62421D5',1385000,335,1,83);
INSERT INTO `product_variants` VALUES (74,'xanh xám-S','ÁOK-FAS-FE638F82',1326000,327,1,83);
INSERT INTO `product_variants` VALUES (75,'xanh xám-M','ÁOK-FAS-CA74A95B',1375000,474,1,83);
INSERT INTO `product_variants` VALUES (76,'xanh xám-L','ÁOK-FAS-BBA013EA',1395000,83,1,83);
INSERT INTO `product_variants` VALUES (77,'đỏ coffee-S','ÁOT-FAS-D63B215D',490000,2,1,84);
INSERT INTO `product_variants` VALUES (78,'đỏ coffee-M','ÁOT-FAS-7FDCABC0',529000,2,1,84);
INSERT INTO `product_variants` VALUES (79,'đỏ coffee-L','ÁOT-FAS-84E11B12',569000,2,1,84);
INSERT INTO `product_variants` VALUES (80,'hàu xám-S','ÁOT-FAS-2D199F50',490000,2,1,84);
INSERT INTO `product_variants` VALUES (81,'hàu xám-M','ÁOT-FAS-E7ADCBA6',519000,2,1,84);
INSERT INTO `product_variants` VALUES (82,'hàu xám-L','ÁOT-FAS-BD43FBE6',549000,2,1,84);
INSERT INTO `product_variants` VALUES (83,'Đá phiến xanh-S','ÁOT-FAS-A36B5EE0',422000,245,1,85);
INSERT INTO `product_variants` VALUES (84,'Đá phiến xanh-M','ÁOT-FAS-2286A661',481000,108,1,85);
INSERT INTO `product_variants` VALUES (85,'Đá phiến xanh-L','ÁOT-FAS-6A790B53',501000,159,1,85);
INSERT INTO `product_variants` VALUES (86,'nâu sáng-S','ÁOT-FAS-7FEDDA64',422000,208,1,85);
INSERT INTO `product_variants` VALUES (87,'nâu sáng-M','ÁOT-FAS-69FB3429',461000,254,1,85);
INSERT INTO `product_variants` VALUES (88,'nâu sáng-L','ÁOT-FAS-41A3BFE5',501000,405,1,85);
INSERT INTO `product_variants` VALUES (89,'đen-S','ÁOT-FAS-6A37DCAD',422000,473,1,86);
INSERT INTO `product_variants` VALUES (90,'đen-M','ÁOT-FAS-E4973EE2',471000,290,1,86);
INSERT INTO `product_variants` VALUES (91,'đen-L','ÁOT-FAS-2C621195',511000,218,1,86);
INSERT INTO `product_variants` VALUES (92,'trắng-S','ÁOT-FAS-09013BE0',490000,91,1,87);
INSERT INTO `product_variants` VALUES (93,'trắng-M','ÁOT-FAS-3BBE90CF',549000,440,1,87);
INSERT INTO `product_variants` VALUES (94,'trắng-L','ÁOT-FAS-D5B5761F',589000,298,1,87);
INSERT INTO `product_variants` VALUES (95,'lichen xanh-S','ÁOS-FAS-4D769449',490000,375,1,88);
INSERT INTO `product_variants` VALUES (96,'lichen xanh-M','ÁOS-FAS-D4369A07',519000,353,1,88);
INSERT INTO `product_variants` VALUES (97,'lichen xanh-L','ÁOS-FAS-E30317A8',549000,427,1,88);
INSERT INTO `product_variants` VALUES (98,'peyote-S','ÁOS-FAS-48926FFE',490000,208,1,88);
INSERT INTO `product_variants` VALUES (99,'peyote-M','ÁOS-FAS-891D66D5',549000,57,1,88);
INSERT INTO `product_variants` VALUES (100,'peyote-L','ÁOS-FAS-FB3397C6',579000,102,1,88);
INSERT INTO `product_variants` VALUES (101,'đen-S','ÁOT-FAS-A38AA5A1',392000,401,1,89);
INSERT INTO `product_variants` VALUES (102,'đen-M','ÁOT-FAS-0F83A8B7',411000,329,1,89);
INSERT INTO `product_variants` VALUES (103,'đen-L','ÁOT-FAS-98E7789F',461000,410,1,89);
INSERT INTO `product_variants` VALUES (104,'vàng nâu-S','ÁOT-FAS-B1EA3914',392000,446,1,89);
INSERT INTO `product_variants` VALUES (105,'vàng nâu-M','ÁOT-FAS-5BD8B86A',451000,463,1,89);
INSERT INTO `product_variants` VALUES (106,'vàng nâu-L','ÁOT-FAS-06563402',461000,337,1,89);
INSERT INTO `product_variants` VALUES (107,'đen-S','ÁOT-FAS-CAD89C28',441000,186,1,90);
INSERT INTO `product_variants` VALUES (108,'đen-M','ÁOT-FAS-4B51B3BF',480000,352,1,90);
INSERT INTO `product_variants` VALUES (109,'đen-L','ÁOT-FAS-27EEC959',520000,61,1,90);
INSERT INTO `product_variants` VALUES (110,'trắng-S','ÁOT-FAS-BC7701F0',441000,55,1,90);
INSERT INTO `product_variants` VALUES (111,'trắng-M','ÁOT-FAS-89A02298',490000,368,1,90);
INSERT INTO `product_variants` VALUES (112,'trắng-L','ÁOT-FAS-A730EC17',510000,132,1,90);
INSERT INTO `product_variants` VALUES (113,'white-S','ÁOT-FAS-DA58A114',343000,145,1,91);
INSERT INTO `product_variants` VALUES (114,'white-M','ÁOT-FAS-0CCCA416',402000,91,1,91);
INSERT INTO `product_variants` VALUES (115,'white-L','ÁOT-FAS-B6DEFD60',442000,248,1,91);
INSERT INTO `product_variants` VALUES (116,'blue-S','ÁOT-FAS-DBF5F47E',343000,359,1,91);
INSERT INTO `product_variants` VALUES (117,'blue-M','ÁOT-FAS-3721403E',362000,465,1,91);
INSERT INTO `product_variants` VALUES (118,'blue-L','ÁOT-FAS-802FA3C0',412000,384,1,91);
INSERT INTO `product_variants` VALUES (119,'white-S','ÁOT-FAS-CC370D66',392000,401,1,92);
INSERT INTO `product_variants` VALUES (120,'white-M','ÁOT-FAS-85C4EDBD',421000,118,1,92);
INSERT INTO `product_variants` VALUES (121,'white-L','ÁOT-FAS-5B23A65E',481000,414,1,92);
INSERT INTO `product_variants` VALUES (122,'blue-S','ÁOT-FAS-A5E47A1F',392000,175,1,92);
INSERT INTO `product_variants` VALUES (123,'blue-M','ÁOT-FAS-3B7E805B',411000,412,1,92);
INSERT INTO `product_variants` VALUES (124,'blue-L','ÁOT-FAS-EFB5F3B8',451000,166,1,92);
INSERT INTO `product_variants` VALUES (125,'white-S','ÁOT-FAS-9ECB279A',392000,146,1,93);
INSERT INTO `product_variants` VALUES (126,'white-M','ÁOT-FAS-77A9348C',411000,447,1,93);
INSERT INTO `product_variants` VALUES (127,'white-L','ÁOT-FAS-73100C5F',451000,299,1,93);
INSERT INTO `product_variants` VALUES (128,'blue-S','ÁOT-FAS-98531014',392000,488,1,93);
INSERT INTO `product_variants` VALUES (129,'blue-M','ÁOT-FAS-04E5495A',411000,273,1,93);
INSERT INTO `product_variants` VALUES (130,'blue-L','ÁOT-FAS-62391797',481000,196,1,93);
INSERT INTO `product_variants` VALUES (131,'white-S','ÁOS-FAS-5C080FC3',471000,376,1,94);
INSERT INTO `product_variants` VALUES (132,'white-M','ÁOS-FAS-B46F64EA',490000,207,1,94);
INSERT INTO `product_variants` VALUES (133,'white-L','ÁOS-FAS-310559B1',560000,151,1,94);
INSERT INTO `product_variants` VALUES (134,'blue-S','ÁOS-FAS-0F213402',471000,169,1,94);
INSERT INTO `product_variants` VALUES (135,'blue-M','ÁOS-FAS-17A28223',500000,179,1,94);
INSERT INTO `product_variants` VALUES (136,'blue-L','ÁOS-FAS-80932454',530000,335,1,94);
INSERT INTO `product_variants` VALUES (137,'white-S','ÁOT-FAS-65F7684C',540000,413,1,95);
INSERT INTO `product_variants` VALUES (138,'white-M','ÁOT-FAS-691658DA',589000,185,1,95);
INSERT INTO `product_variants` VALUES (139,'white-L','ÁOT-FAS-215FB0A3',599000,160,1,95);
INSERT INTO `product_variants` VALUES (140,'blue-S','ÁOT-FAS-BA0FF2F3',540000,213,1,95);
INSERT INTO `product_variants` VALUES (141,'blue-M','ÁOT-FAS-5680EAB2',589000,127,1,95);
INSERT INTO `product_variants` VALUES (142,'blue-L','ÁOT-FAS-F62B5EA6',599000,403,1,95);
INSERT INTO `product_variants` VALUES (143,'white-S','ÁOP-FAS-F035D9FD',471000,72,1,96);
INSERT INTO `product_variants` VALUES (144,'white-M','ÁOP-FAS-594AB9A9',520000,157,1,96);
INSERT INTO `product_variants` VALUES (145,'white-L','ÁOP-FAS-A4CDBAD2',570000,142,1,96);
INSERT INTO `product_variants` VALUES (146,'blue-S','ÁOP-FAS-81EC4134',471000,357,1,96);
INSERT INTO `product_variants` VALUES (147,'blue-M','ÁOP-FAS-1BB6F354',520000,357,1,96);
INSERT INTO `product_variants` VALUES (148,'blue-L','ÁOP-FAS-C504A567',560000,191,1,96);
INSERT INTO `product_variants` VALUES (149,'white-S','ÁOP-FAS-6C3EAF60',471000,279,1,97);
INSERT INTO `product_variants` VALUES (150,'white-M','ÁOP-FAS-AC19E566',520000,440,1,97);
INSERT INTO `product_variants` VALUES (151,'white-L','ÁOP-FAS-086B4A49',570000,147,1,97);
INSERT INTO `product_variants` VALUES (152,'blue-S','ÁOP-FAS-01137D71',471000,88,1,97);
INSERT INTO `product_variants` VALUES (153,'blue-M','ÁOP-FAS-3783E25D',520000,111,1,97);
INSERT INTO `product_variants` VALUES (154,'blue-L','ÁOP-FAS-3A3C28F3',570000,439,1,97);
INSERT INTO `product_variants` VALUES (155,'white-S','ÁOT-FAS-4E330DB7',441000,93,1,98);
INSERT INTO `product_variants` VALUES (156,'white-M','ÁOT-FAS-35E904B2',490000,486,1,98);
INSERT INTO `product_variants` VALUES (157,'white-L','ÁOT-FAS-000FEBCF',520000,445,1,98);
INSERT INTO `product_variants` VALUES (158,'blue-S','ÁOT-FAS-4EF42558',441000,403,1,98);
INSERT INTO `product_variants` VALUES (159,'blue-M','ÁOT-FAS-CFFBAA9D',490000,268,1,98);
INSERT INTO `product_variants` VALUES (160,'blue-L','ÁOT-FAS-5C0BD2B3',510000,455,1,98);
INSERT INTO `product_variants` VALUES (161,'white-S','ÁOS-FAS-DA3475E9',540000,304,1,99);
INSERT INTO `product_variants` VALUES (162,'white-M','ÁOS-FAS-A28EC82F',589000,408,1,99);
INSERT INTO `product_variants` VALUES (163,'white-L','ÁOS-FAS-FE5D87E3',639000,231,1,99);
INSERT INTO `product_variants` VALUES (164,'blue-S','ÁOS-FAS-63C40626',540000,176,1,99);
INSERT INTO `product_variants` VALUES (165,'blue-M','ÁOS-FAS-7CAE2605',579000,291,1,99);
INSERT INTO `product_variants` VALUES (166,'blue-L','ÁOS-FAS-487DB26D',629000,357,1,99);
INSERT INTO `product_variants` VALUES (167,'white-S','ÁOS-FAS-676AC825',540000,339,1,100);
INSERT INTO `product_variants` VALUES (168,'white-M','ÁOS-FAS-CB1F766B',559000,349,1,100);
INSERT INTO `product_variants` VALUES (169,'white-L','ÁOS-FAS-4E81EB5D',629000,70,1,100);
INSERT INTO `product_variants` VALUES (170,'blue-S','ÁOS-FAS-060556F8',540000,336,1,100);
INSERT INTO `product_variants` VALUES (171,'blue-M','ÁOS-FAS-B6DA26D5',559000,476,1,100);
INSERT INTO `product_variants` VALUES (172,'blue-L','ÁOS-FAS-E8B9573A',609000,80,1,100);
INSERT INTO `product_variants` VALUES (173,'white-S','ÁOS-FAS-4C6637D3',540000,238,1,101);
INSERT INTO `product_variants` VALUES (174,'white-M','ÁOS-FAS-74BDD8A7',579000,333,1,101);
INSERT INTO `product_variants` VALUES (175,'white-L','ÁOS-FAS-A41DF3E2',629000,427,1,101);
INSERT INTO `product_variants` VALUES (176,'blue-S','ÁOS-FAS-6C0B684A',540000,462,1,101);
INSERT INTO `product_variants` VALUES (177,'blue-M','ÁOS-FAS-A67AB719',589000,260,1,101);
INSERT INTO `product_variants` VALUES (178,'blue-L','ÁOS-FAS-7F69915C',619000,101,1,101);
INSERT INTO `product_variants` VALUES (179,'white-S','ÁOS-FAS-A659CB6B',540000,238,1,102);
INSERT INTO `product_variants` VALUES (180,'white-M','ÁOS-FAS-7B295138',579000,333,1,102);
INSERT INTO `product_variants` VALUES (181,'white-L','ÁOS-FAS-050770EC',629000,427,1,102);
INSERT INTO `product_variants` VALUES (182,'blue-S','ÁOS-FAS-DB4FBB76',540000,462,1,102);
INSERT INTO `product_variants` VALUES (183,'blue-M','ÁOS-FAS-2617A8BA',589000,260,1,102);
INSERT INTO `product_variants` VALUES (184,'blue-L','ÁOS-FAS-CB65A2BB',619000,101,1,102);
INSERT INTO `product_variants` VALUES (185,'white-S','ÁOT-FAS-D989C101',441000,416,1,103);
INSERT INTO `product_variants` VALUES (186,'white-M','ÁOT-FAS-B4EE6449',500000,230,1,103);
INSERT INTO `product_variants` VALUES (187,'white-L','ÁOT-FAS-320AEAD9',530000,415,1,103);
INSERT INTO `product_variants` VALUES (188,'blue-S','ÁOT-FAS-1439F104',441000,211,1,103);
INSERT INTO `product_variants` VALUES (189,'blue-M','ÁOT-FAS-2734E566',460000,122,1,103);
INSERT INTO `product_variants` VALUES (190,'blue-L','ÁOT-FAS-2E0F8920',530000,363,1,103);
INSERT INTO `product_variants` VALUES (191,'white-S','ÁOS-FAS-776C7F83',540000,112,1,104);
INSERT INTO `product_variants` VALUES (192,'white-M','ÁOS-FAS-71C8A9BC',579000,362,1,104);
INSERT INTO `product_variants` VALUES (193,'white-L','ÁOS-FAS-8702FDE0',619000,371,1,104);
INSERT INTO `product_variants` VALUES (194,'blue-S','ÁOS-FAS-9FA72B45',540000,374,1,104);
INSERT INTO `product_variants` VALUES (195,'blue-M','ÁOS-FAS-1261EF8D',599000,395,1,104);
INSERT INTO `product_variants` VALUES (196,'blue-L','ÁOS-FAS-F66D2DD5',599000,52,1,104);
INSERT INTO `product_variants` VALUES (197,'white-S','QUẦ-FAS-6C515436',410000,322,1,105);
INSERT INTO `product_variants` VALUES (198,'white-M','QUẦ-FAS-3D7893D1',900000,274,1,105);
INSERT INTO `product_variants` VALUES (199,'white-L','QUẦ-FAS-71FCEE21',900000,241,1,105);
INSERT INTO `product_variants` VALUES (200,'blue-S','QUẦ-FAS-2BBB25E6',410000,272,1,105);
INSERT INTO `product_variants` VALUES (201,'blue-M','QUẦ-FAS-9CBE29ED',430000,116,1,105);
INSERT INTO `product_variants` VALUES (202,'blue-L','QUẦ-FAS-6B5B9598',480000,398,1,105);
INSERT INTO `product_variants` VALUES (203,'white-S','QUẦ-FAS-6D4D73E4',410000,89,1,106);
INSERT INTO `product_variants` VALUES (204,'white-M','QUẦ-FAS-5354C256',900000,445,1,106);
INSERT INTO `product_variants` VALUES (205,'white-L','QUẦ-FAS-3849E1D9',9000000,230,1,106);
INSERT INTO `product_variants` VALUES (206,'blue-S','QUẦ-FAS-B7CC5B1B',410000,433,1,106);
INSERT INTO `product_variants` VALUES (207,'blue-M','QUẦ-FAS-761E13A5',430000,92,1,106);
INSERT INTO `product_variants` VALUES (208,'blue-L','QUẦ-FAS-B947A5F3',9000000,272,1,106);
INSERT INTO `product_variants` VALUES (209,'white-S','ĐẦM-FAS-742DF9F0',540000,94,1,107);
INSERT INTO `product_variants` VALUES (210,'white-M','ĐẦM-FAS-F8AB97F4',579000,387,1,107);
INSERT INTO `product_variants` VALUES (211,'white-L','ĐẦM-FAS-7183D09E',629000,411,1,107);
INSERT INTO `product_variants` VALUES (212,'blue-S','ĐẦM-FAS-A2ABB624',540000,403,1,107);
INSERT INTO `product_variants` VALUES (213,'blue-M','ĐẦM-FAS-0CF715D8',569000,447,1,107);
INSERT INTO `product_variants` VALUES (214,'blue-L','ĐẦM-FAS-4DC10D94',639000,122,1,107);
INSERT INTO `product_variants` VALUES (215,'white-S','QUẦ-FAS-C92E6447',410000,181,1,108);
INSERT INTO `product_variants` VALUES (216,'white-M','QUẦ-FAS-44E5B270',430000,205,1,108);
INSERT INTO `product_variants` VALUES (217,'white-L','QUẦ-FAS-CA2C12EE',510000,192,1,108);
INSERT INTO `product_variants` VALUES (218,'blue-S','QUẦ-FAS-BC6CD06B',410000,201,1,108);
INSERT INTO `product_variants` VALUES (219,'blue-M','QUẦ-FAS-89BD2F67',900000,236,1,108);
INSERT INTO `product_variants` VALUES (220,'blue-L','QUẦ-FAS-C381D6F7',900000,224,1,108);
INSERT INTO `product_variants` VALUES (221,'white-S','ÁOP-FAS-998E112E',295400,442,1,109);
INSERT INTO `product_variants` VALUES (222,'white-M','ÁOP-FAS-C7F7B528',349000,405,1,109);
INSERT INTO `product_variants` VALUES (223,'white-L','ÁOP-FAS-16BEB82E',369000,410,1,109);
INSERT INTO `product_variants` VALUES (224,'blue-S','ÁOP-FAS-F77205B2',295400,492,1,109);
INSERT INTO `product_variants` VALUES (225,'blue-M','ÁOP-FAS-B3A9F0C9',349000,429,1,109);
INSERT INTO `product_variants` VALUES (226,'blue-L','ÁOP-FAS-BC703B3D',359000,195,1,109);
INSERT INTO `product_variants` VALUES (227,'white-S','ÁOP-FAS-73A63B20',309000,103,1,110);
INSERT INTO `product_variants` VALUES (228,'white-M','ÁOP-FAS-90DC1CBF',359000,72,1,110);
INSERT INTO `product_variants` VALUES (229,'white-L','ÁOP-FAS-6A925BAC',379000,144,1,110);
INSERT INTO `product_variants` VALUES (230,'blue-S','ÁOP-FAS-7B443788',309000,497,1,110);
INSERT INTO `product_variants` VALUES (231,'blue-M','ÁOP-FAS-48FDBF24',349000,143,1,110);
INSERT INTO `product_variants` VALUES (232,'blue-L','ÁOP-FAS-68F8D167',379000,306,1,110);
INSERT INTO `product_variants` VALUES (233,'white-S','ÁOP-FAS-0E38E6E3',309000,466,1,111);
INSERT INTO `product_variants` VALUES (234,'white-M','ÁOP-FAS-D4D99F4C',359000,153,1,111);
INSERT INTO `product_variants` VALUES (235,'white-L','ÁOP-FAS-31383D85',389000,162,1,111);
INSERT INTO `product_variants` VALUES (236,'blue-S','ÁOP-FAS-2290C0AB',309000,255,1,111);
INSERT INTO `product_variants` VALUES (237,'blue-M','ÁOP-FAS-77DC82D8',339000,77,1,111);
INSERT INTO `product_variants` VALUES (238,'blue-L','ÁOP-FAS-54141BC3',369000,471,1,111);
INSERT INTO `product_variants` VALUES (239,'white-S','ĐẦM-FAS-C0B4E9D7',399000,78,1,112);
INSERT INTO `product_variants` VALUES (240,'white-M','ĐẦM-FAS-F1942331',459000,9000,1,112);
INSERT INTO `product_variants` VALUES (241,'white-L','ĐẦM-FAS-D099996F',469000,126,1,112);
INSERT INTO `product_variants` VALUES (242,'blue-S','ĐẦM-FAS-AE8E9125',399000,387,1,112);
INSERT INTO `product_variants` VALUES (243,'blue-M','ĐẦM-FAS-71986C03',459000,202,1,112);
INSERT INTO `product_variants` VALUES (244,'blue-L','ĐẦM-FAS-74DA8041',499000,63,1,112);
INSERT INTO `product_variants` VALUES (245,'white-S','QUẦ-FAS-434F4251',432600,220,1,113);
INSERT INTO `product_variants` VALUES (246,'white-M','QUẦ-FAS-641BE547',461600,205,1,113);
INSERT INTO `product_variants` VALUES (247,'white-L','QUẦ-FAS-6E0CB640',501600,198,1,113);
INSERT INTO `product_variants` VALUES (248,'blue-S','QUẦ-FAS-5F7D20F7',432600,188,1,113);
INSERT INTO `product_variants` VALUES (249,'blue-M','QUẦ-FAS-62FFA072',481600,142,1,113);
INSERT INTO `product_variants` VALUES (250,'blue-L','QUẦ-FAS-FC276B58',531600,438,1,113);
INSERT INTO `product_variants` VALUES (251,'white-S','ÁOS-FAS-57D2AAD4',378000,400,1,114);
INSERT INTO `product_variants` VALUES (252,'white-M','ÁOS-FAS-FD8846E4',490000,116,1,114);
INSERT INTO `product_variants` VALUES (253,'white-L','ÁOS-FAS-F9280C63',490000,313,1,114);
INSERT INTO `product_variants` VALUES (254,'blue-S','ÁOS-FAS-5B8A2360',378000,205,1,114);
INSERT INTO `product_variants` VALUES (255,'blue-M','ÁOS-FAS-465FFC2F',490000,267,1,114);
INSERT INTO `product_variants` VALUES (256,'blue-L','ÁOS-FAS-E5D53DAA',490000,58,1,114);
INSERT INTO `product_variants` VALUES (257,'white-S','QUẦ-FAS-75787CF8',295400,53,1,115);
INSERT INTO `product_variants` VALUES (258,'white-M','QUẦ-FAS-44BADCA8',339000,72,1,115);
INSERT INTO `product_variants` VALUES (259,'white-L','QUẦ-FAS-16B95923',359000,441,1,115);
INSERT INTO `product_variants` VALUES (260,'blue-S','QUẦ-FAS-C1EA29D5',295400,320,1,115);
INSERT INTO `product_variants` VALUES (261,'blue-M','QUẦ-FAS-D0A73CEB',349000,115,1,115);
INSERT INTO `product_variants` VALUES (262,'blue-L','QUẦ-FAS-DD40805F',369000,431,1,115);
INSERT INTO `product_variants` VALUES (263,'white-S','QUẦ-FAS-451E3CC6',295400,390,1,116);
INSERT INTO `product_variants` VALUES (264,'white-M','QUẦ-FAS-C01CA616',329000,293,1,116);
INSERT INTO `product_variants` VALUES (265,'white-L','QUẦ-FAS-AFB7FA80',369000,479,1,116);
INSERT INTO `product_variants` VALUES (266,'blue-S','QUẦ-FAS-66D406B9',295400,237,1,116);
INSERT INTO `product_variants` VALUES (267,'blue-M','QUẦ-FAS-B5417A77',359000,275,1,116);
INSERT INTO `product_variants` VALUES (268,'blue-L','QUẦ-FAS-C04AA29A',369000,181,1,116);
INSERT INTO `product_variants` VALUES (269,'white-S','ÁOS-FAS-BEC8F5D0',379000,499,1,117);
INSERT INTO `product_variants` VALUES (270,'white-M','ÁOS-FAS-158E5E57',459000,266,1,117);
INSERT INTO `product_variants` VALUES (271,'white-L','ÁOS-FAS-8CDF8E24',490000,100,1,117);
INSERT INTO `product_variants` VALUES (272,'blue-S','ÁOS-FAS-E28EA9EF',379000,129,1,117);
INSERT INTO `product_variants` VALUES (273,'blue-M','ÁOS-FAS-901975FB',479000,135,1,117);
INSERT INTO `product_variants` VALUES (274,'blue-L','ÁOS-FAS-9B3D0351',490000,408,1,117);
INSERT INTO `product_variants` VALUES (275,'white-S','ÁOT-FAS-5F05D149',199000,70,1,118);
INSERT INTO `product_variants` VALUES (276,'white-M','ÁOT-FAS-7043B895',219000,355,1,118);
INSERT INTO `product_variants` VALUES (277,'white-L','ÁOT-FAS-45561F25',269000,153,1,118);
INSERT INTO `product_variants` VALUES (278,'blue-S','ÁOT-FAS-39F5A308',199000,347,1,118);
INSERT INTO `product_variants` VALUES (279,'blue-M','ÁOT-FAS-A7357AD9',239000,178,1,118);
INSERT INTO `product_variants` VALUES (280,'blue-L','ÁOT-FAS-3B90EFDD',279000,150,1,118);
INSERT INTO `product_variants` VALUES (281,'white-S','ÁOT-FAS-CDC51309',229000,208,1,119);
INSERT INTO `product_variants` VALUES (282,'white-M','ÁOT-FAS-7F0FE942',259000,287,1,119);
INSERT INTO `product_variants` VALUES (283,'white-L','ÁOT-FAS-4075590A',309000,252,1,119);
INSERT INTO `product_variants` VALUES (284,'blue-S','ÁOT-FAS-7EF128CE',229000,358,1,119);
INSERT INTO `product_variants` VALUES (285,'blue-M','ÁOT-FAS-C4D0F147',289000,374,1,119);
INSERT INTO `product_variants` VALUES (286,'blue-L','ÁOT-FAS-7E6606D7',309000,351,1,119);
INSERT INTO `product_variants` VALUES (287,'white-S','ÁOT-FAS-8DDAD1EE',199000,221,1,120);
INSERT INTO `product_variants` VALUES (288,'white-M','ÁOT-FAS-A3B7902F',230000,267,1,120);
INSERT INTO `product_variants` VALUES (289,'white-L','ÁOT-FAS-4BE6B40A',250000,197,1,120);
INSERT INTO `product_variants` VALUES (290,'blue-S','ÁOT-FAS-796DB389',199000,64,1,120);
INSERT INTO `product_variants` VALUES (291,'blue-M','ÁOT-FAS-4171F3DD',210000,117,1,120);
INSERT INTO `product_variants` VALUES (292,'blue-L','ÁOT-FAS-D11EFA58',250000,407,1,120);
INSERT INTO `product_variants` VALUES (293,'white-S','ÁOB-FAS-07A38525',800000,202,1,121);
INSERT INTO `product_variants` VALUES (294,'white-M','ÁOB-FAS-36A44255',932000,299,1,121);
INSERT INTO `product_variants` VALUES (295,'white-L','ÁOB-FAS-CC2907AA',972000,478,1,121);
INSERT INTO `product_variants` VALUES (296,'blue-S','ÁOB-FAS-7018A50E',800000,226,1,121);
INSERT INTO `product_variants` VALUES (297,'blue-M','ÁOB-FAS-86641054',942000,330,1,121);
INSERT INTO `product_variants` VALUES (298,'blue-L','ÁOB-FAS-46B65937',982000,160,1,121);
INSERT INTO `product_variants` VALUES (299,'white-S','ÁOT-FAS-C36C3973',179000,227,1,122);
INSERT INTO `product_variants` VALUES (300,'white-M','ÁOT-FAS-C42C4849',209000,361,1,122);
INSERT INTO `product_variants` VALUES (301,'white-L','ÁOT-FAS-37FC80E6',279000,335,1,122);
INSERT INTO `product_variants` VALUES (302,'blue-S','ÁOT-FAS-FEF4FCD0',179000,201,1,122);
INSERT INTO `product_variants` VALUES (303,'blue-M','ÁOT-FAS-1FCE79CC',239000,66,1,122);
INSERT INTO `product_variants` VALUES (304,'blue-L','ÁOT-FAS-E8026B4E',279000,353,1,122);
INSERT INTO `product_variants` VALUES (305,'Trắng-Đủ kích cỡ','TÚI-HAN-903604A7',392000,181,1,123);
INSERT INTO `product_variants` VALUES (306,'Xanh-Đủ kích cỡ','TÚI-HAN-81B7C9F7',462000,52,1,123);
INSERT INTO `product_variants` VALUES (307,'Vàng-Đủ kích cỡ','TÚI-HAN-A2EFC7EF',442000,132,1,123);
INSERT INTO `product_variants` VALUES (308,'Đen-Đủ kích cỡ','TÚI-HAN-7EB9F7AF',412000,121,1,123);
INSERT INTO `product_variants` VALUES (309,'Trắng-Đủ kích cỡ','TÚI-HAN-E26F5E71',343000,67,1,124);
INSERT INTO `product_variants` VALUES (310,'Xanh-Đủ kích cỡ','TÚI-HAN-BCD9F627',393000,116,1,124);
INSERT INTO `product_variants` VALUES (311,'Vàng-Đủ kích cỡ','TÚI-HAN-2C11FFBE',363000,112,1,124);
INSERT INTO `product_variants` VALUES (312,'Đen-Đủ kích cỡ','TÚI-HAN-D3BFC5D5',413000,102,1,124);
INSERT INTO `product_variants` VALUES (313,'Trắng-Đủ kích cỡ','TÚI-HAN-495D6C5D',392000,156,1,125);
INSERT INTO `product_variants` VALUES (314,'Xanh-Đủ kích cỡ','TÚI-HAN-6E2D0983',462000,125,1,125);
INSERT INTO `product_variants` VALUES (315,'Vàng-Đủ kích cỡ','TÚI-HAN-216B24EC',482000,58,1,125);
INSERT INTO `product_variants` VALUES (316,'Đen-Đủ kích cỡ','TÚI-HAN-5AF6AD3A',422000,55,1,125);
INSERT INTO `product_variants` VALUES (317,'Trắng-Đủ kích cỡ','TÚI-HAN-E2F714B8',490000,59,1,126);
INSERT INTO `product_variants` VALUES (318,'Xanh-Đủ kích cỡ','TÚI-HAN-8E8E7080',510000,92,1,126);
INSERT INTO `product_variants` VALUES (319,'Vàng-Đủ kích cỡ','TÚI-HAN-FA25680C',520000,183,1,126);
INSERT INTO `product_variants` VALUES (320,'Đen-Đủ kích cỡ','TÚI-HAN-C4A130FF',520000,113,1,126);
INSERT INTO `product_variants` VALUES (321,'Trắng-Đủ kích cỡ','TÚI-HAN-BC4ADF78',265000,116,1,127);
INSERT INTO `product_variants` VALUES (322,'Xanh-Đủ kích cỡ','TÚI-HAN-ABD97FDE',285000,139,1,127);
INSERT INTO `product_variants` VALUES (323,'Vàng-Đủ kích cỡ','TÚI-HAN-B5398D19',355000,91,1,127);
INSERT INTO `product_variants` VALUES (324,'Đen-Đủ kích cỡ','TÚI-HAN-A8DD4137',355000,126,1,127);
INSERT INTO `product_variants` VALUES (325,'Trắng-Đủ kích cỡ','BAL-HAN-24DFAC1B',490000,190,1,128);
INSERT INTO `product_variants` VALUES (326,'Xanh-Đủ kích cỡ','BAL-HAN-7113A44B',580000,123,1,128);
INSERT INTO `product_variants` VALUES (327,'Vàng-Đủ kích cỡ','BAL-HAN-977D612A',510000,172,1,128);
INSERT INTO `product_variants` VALUES (328,'Đen-Đủ kích cỡ','BAL-HAN-69A303F4',540000,156,1,128);
INSERT INTO `product_variants` VALUES (329,'Trắng-Đủ kích cỡ','TÚI-HAN-B4044D87',245000,152,1,129);
INSERT INTO `product_variants` VALUES (330,'Xanh-Đủ kích cỡ','TÚI-HAN-66B4ED5E',295000,62,1,129);
INSERT INTO `product_variants` VALUES (331,'Vàng-Đủ kích cỡ','TÚI-HAN-6A615493',275000,141,1,129);
INSERT INTO `product_variants` VALUES (332,'Đen-Đủ kích cỡ','TÚI-HAN-9540EA3E',265000,87,1,129);
INSERT INTO `product_variants` VALUES (333,'Trắng-Đủ kích cỡ','BÓP-HAN-35501000',392000,177,1,130);
INSERT INTO `product_variants` VALUES (334,'Xanh-Đủ kích cỡ','BÓP-HAN-5974B73D',422000,81,1,130);
INSERT INTO `product_variants` VALUES (335,'Vàng-Đủ kích cỡ','BÓP-HAN-0DBF8A38',412000,97,1,130);
INSERT INTO `product_variants` VALUES (336,'Đen-Đủ kích cỡ','BÓP-HAN-457DCD4E',442000,111,1,130);
INSERT INTO `product_variants` VALUES (337,'Trắng-Đủ kích cỡ','TÚI-HAN-CC8B84D9',540000,164,1,131);
INSERT INTO `product_variants` VALUES (338,'Xanh-Đủ kích cỡ','TÚI-HAN-F23E15D8',630000,141,1,131);
INSERT INTO `product_variants` VALUES (339,'Vàng-Đủ kích cỡ','TÚI-HAN-72B74BF0',630000,89,1,131);
INSERT INTO `product_variants` VALUES (340,'Đen-Đủ kích cỡ','TÚI-HAN-830834A2',570000,123,1,131);
INSERT INTO `product_variants` VALUES (341,'Trắng-Đủ kích cỡ','BAL-HAN-83257E1E',785000,111,1,132);
INSERT INTO `product_variants` VALUES (342,'Xanh-Đủ kích cỡ','BAL-HAN-A1C86C42',855000,102,1,132);
INSERT INTO `product_variants` VALUES (343,'Vàng-Đủ kích cỡ','BAL-HAN-5C19D1F7',805000,52,1,132);
INSERT INTO `product_variants` VALUES (344,'Đen-Đủ kích cỡ','BAL-HAN-B9567020',805000,61,1,132);
INSERT INTO `product_variants` VALUES (345,'Trắng-Đủ kích cỡ','TÚI-HAN-BDC98599',490000,180,1,133);
INSERT INTO `product_variants` VALUES (346,'Xanh-Đủ kích cỡ','TÚI-HAN-367D9BDF',540000,137,1,133);
INSERT INTO `product_variants` VALUES (347,'Vàng-Đủ kích cỡ','TÚI-HAN-5F3411FE',560000,186,1,133);
INSERT INTO `product_variants` VALUES (348,'Đen-Đủ kích cỡ','TÚI-HAN-B6A46608',540000,73,1,133);
INSERT INTO `product_variants` VALUES (349,'Trắng-Đủ kích cỡ','TÚI-HAN-9D840602',245000,140,1,134);
INSERT INTO `product_variants` VALUES (350,'Xanh-Đủ kích cỡ','TÚI-HAN-0B957A78',335000,74,1,134);
INSERT INTO `product_variants` VALUES (351,'Vàng-Đủ kích cỡ','TÚI-HAN-74069EC1',335000,169,1,134);
INSERT INTO `product_variants` VALUES (352,'Đen-Đủ kích cỡ','TÚI-HAN-50863D3C',275000,168,1,134);
INSERT INTO `product_variants` VALUES (353,'Trắng-Đủ kích cỡ','TÚI-HAN-056600C4',638000,197,1,135);
INSERT INTO `product_variants` VALUES (354,'Xanh-Đủ kích cỡ','TÚI-HAN-E9F02C8B',688000,83,1,135);
INSERT INTO `product_variants` VALUES (355,'Vàng-Đủ kích cỡ','TÚI-HAN-2E707E0E',708000,174,1,135);
INSERT INTO `product_variants` VALUES (356,'Đen-Đủ kích cỡ','TÚI-HAN-5C81EF01',658000,115,1,135);
INSERT INTO `product_variants` VALUES (357,'Trắng-Đủ kích cỡ','TÚI-HAN-BAA247C5',785000,150,1,136);
INSERT INTO `product_variants` VALUES (358,'Xanh-Đủ kích cỡ','TÚI-HAN-2A588ABF',815000,77,1,136);
INSERT INTO `product_variants` VALUES (359,'Vàng-Đủ kích cỡ','TÚI-HAN-7AC5CF14',815000,77,1,136);
INSERT INTO `product_variants` VALUES (360,'Đen-Đủ kích cỡ','TÚI-HAN-FF99D844',815000,95,1,136);
INSERT INTO `product_variants` VALUES (361,'Trắng-Đủ kích cỡ','VÍD-HAN-A1B7F71B',111000,124,1,137);
INSERT INTO `product_variants` VALUES (362,'Xanh-Đủ kích cỡ','VÍD-HAN-843DDA05',141000,126,1,137);
INSERT INTO `product_variants` VALUES (363,'Vàng-Đủ kích cỡ','VÍD-HAN-7797E7E3',181000,52,1,137);
INSERT INTO `product_variants` VALUES (364,'Đen-Đủ kích cỡ','VÍD-HAN-12A08540',131000,60,1,137);
INSERT INTO `product_variants` VALUES (365,'Trắng-Đủ kích cỡ','TÚI-HAN-94C6A443',343000,152,1,138);
INSERT INTO `product_variants` VALUES (366,'Xanh-Đủ kích cỡ','TÚI-HAN-99EACAE7',393000,176,1,138);
INSERT INTO `product_variants` VALUES (367,'Vàng-Đủ kích cỡ','TÚI-HAN-E8E1497B',373000,108,1,138);
INSERT INTO `product_variants` VALUES (368,'Đen-Đủ kích cỡ','TÚI-HAN-F0B90A23',363000,81,1,138);
INSERT INTO `product_variants` VALUES (369,'Trắng-Đủ kích cỡ','BAL-HAN-83E576C9',736000,153,1,139);
INSERT INTO `product_variants` VALUES (370,'Xanh-Đủ kích cỡ','BAL-HAN-9BC2211D',766000,171,1,139);
INSERT INTO `product_variants` VALUES (371,'Vàng-Đủ kích cỡ','BAL-HAN-0B61A961',766000,191,1,139);
INSERT INTO `product_variants` VALUES (372,'Đen-Đủ kích cỡ','BAL-HAN-F0839926',806000,140,1,139);
INSERT INTO `product_variants` VALUES (373,'Trắng-Đủ kích cỡ','VỚH-HAN-8D07A999',39000,154,1,140);
INSERT INTO `product_variants` VALUES (374,'Đen-Đủ kích cỡ','VỚH-HAN-B2210EB6',54000,74,1,140);
INSERT INTO `product_variants` VALUES (375,'Vàng-Đủ kích cỡ','VỚH-HAN-FC020C82',49000,70,1,140);
INSERT INTO `product_variants` VALUES (376,'Trắng-Đủ kích cỡ','VỚH-HAN-930C76DB',39000,163,1,141);
INSERT INTO `product_variants` VALUES (377,'Đen-Đủ kích cỡ','VỚH-HAN-3BFF3B20',59000,84,1,141);
INSERT INTO `product_variants` VALUES (378,'Vàng-Đủ kích cỡ','VỚH-HAN-A3CADA8B',49000,74,1,141);
INSERT INTO `product_variants` VALUES (379,'Trắng-Đủ kích cỡ','VỚD-HAN-C96E0CCD',58000,187,1,142);
INSERT INTO `product_variants` VALUES (380,'Đen-Đủ kích cỡ','VỚD-HAN-469CE85B',68000,131,1,142);
INSERT INTO `product_variants` VALUES (381,'Vàng-Đủ kích cỡ','VỚD-HAN-2D7CDDB3',68000,152,1,142);
INSERT INTO `product_variants` VALUES (382,'Trắng-Đủ kích cỡ','VỚD-HAN-152E23DE',49000,154,1,143);
INSERT INTO `product_variants` VALUES (383,'Đen-Đủ kích cỡ','VỚD-HAN-3267C3B5',59000,56,1,143);
INSERT INTO `product_variants` VALUES (384,'Vàng-Đủ kích cỡ','VỚD-HAN-45CAF6BA',69000,73,1,143);
INSERT INTO `product_variants` VALUES (385,'Trắng-Đủ kích cỡ','VỚD-HAN-16CED9C7',49000,75,1,144);
INSERT INTO `product_variants` VALUES (386,'Đen-Đủ kích cỡ','VỚD-HAN-16D23363',69000,98,1,144);
INSERT INTO `product_variants` VALUES (387,'Vàng-Đủ kích cỡ','VỚD-HAN-5C68DFFA',69000,178,1,144);
INSERT INTO `product_variants` VALUES (388,'Trắng-Đủ kích cỡ','VỚN-HAN-D8C4C9CB',39000,139,1,145);
INSERT INTO `product_variants` VALUES (389,'Đen-Đủ kích cỡ','VỚN-HAN-C3BB43A1',59000,197,1,145);
INSERT INTO `product_variants` VALUES (390,'Vàng-Đủ kích cỡ','VỚN-HAN-6362E6D2',54000,68,1,145);
INSERT INTO `product_variants` VALUES (391,'Trắng-Đủ kích cỡ','VỚC-HAN-F9C6F79C',58000,84,1,146);
INSERT INTO `product_variants` VALUES (392,'Đen-Đủ kích cỡ','VỚC-HAN-E2C3E465',78000,190,1,146);
INSERT INTO `product_variants` VALUES (393,'Vàng-Đủ kích cỡ','VỚC-HAN-C3AA94C5',78000,50,1,146);
INSERT INTO `product_variants` VALUES (394,'Trắng-Đủ kích cỡ','VỚC-HAN-A73DFC9C',78000,112,1,147);
INSERT INTO `product_variants` VALUES (395,'Đen-Đủ kích cỡ','VỚC-HAN-93E09C18',88000,104,1,147);
INSERT INTO `product_variants` VALUES (396,'Vàng-Đủ kích cỡ','VỚC-HAN-D699BF86',93000,194,1,147);
INSERT INTO `product_variants` VALUES (397,'Trắng-Đủ kích cỡ','VỚD-HAN-94C3C326',49000,155,1,148);
INSERT INTO `product_variants` VALUES (398,'Đen-Đủ kích cỡ','VỚD-HAN-D58E6362',69000,168,1,148);
INSERT INTO `product_variants` VALUES (399,'Vàng-Đủ kích cỡ','VỚD-HAN-961021DB',59000,93,1,148);
INSERT INTO `product_variants` VALUES (400,'Trắng-Đủ kích cỡ','VỚN-HAN-D71AA5AC',39000,120,1,149);
INSERT INTO `product_variants` VALUES (401,'Đen-Đủ kích cỡ','VỚN-HAN-8BB92C3E',54000,93,1,149);
INSERT INTO `product_variants` VALUES (402,'Vàng-Đủ kích cỡ','VỚN-HAN-DD499D09',54000,184,1,149);
INSERT INTO `product_variants` VALUES (403,'Trắng-Đủ kích cỡ','VỚN-HAN-4A764573',49000,162,1,150);
INSERT INTO `product_variants` VALUES (404,'Đen-Đủ kích cỡ','VỚN-HAN-0A1C85AF',59000,73,1,150);
INSERT INTO `product_variants` VALUES (405,'Vàng-Đủ kích cỡ','VỚN-HAN-8F3E8D9C',69000,167,1,150);
INSERT INTO `product_variants` VALUES (406,'Trắng-Đủ kích cỡ','VỚN-HAN-35AFAD18',49000,149,1,151);
INSERT INTO `product_variants` VALUES (407,'Đen-Đủ kích cỡ','VỚN-HAN-4A3995DB',69000,200,1,151);
INSERT INTO `product_variants` VALUES (408,'Vàng-Đủ kích cỡ','VỚN-HAN-9DBA7C2C',59000,162,1,151);
INSERT INTO `product_variants` VALUES (409,'Trắng-Đủ kích cỡ','VỚD-HAN-F16546D0',49000,173,1,152);
INSERT INTO `product_variants` VALUES (410,'Đen-Đủ kích cỡ','VỚD-HAN-0FB7BA81',64000,59,1,152);
INSERT INTO `product_variants` VALUES (411,'Vàng-Đủ kích cỡ','VỚD-HAN-43B2AC5D',59000,74,1,152);
INSERT INTO `product_variants` VALUES (412,'Trắng-Đủ kích cỡ','VỚN-HAN-E3C7B114',39000,69,1,153);
INSERT INTO `product_variants` VALUES (413,'Đen-Đủ kích cỡ','VỚN-HAN-73638270',54000,79,1,153);
INSERT INTO `product_variants` VALUES (414,'Vàng-Đủ kích cỡ','VỚN-HAN-EF0F5677',54000,96,1,153);
INSERT INTO `product_variants` VALUES (415,'Trắng-Đủ kích cỡ','VỚD-HAN-5BC6B815',49000,150,1,154);
INSERT INTO `product_variants` VALUES (416,'Đen-Đủ kích cỡ','VỚD-HAN-EACC4438',64000,197,1,154);
INSERT INTO `product_variants` VALUES (417,'Vàng-Đủ kích cỡ','VỚD-HAN-089B6111',59000,195,1,154);
INSERT INTO `product_variants` VALUES (418,'Trắng-Đủ kích cỡ','VỚH-HAN-387B9BCF',25000,68,1,155);
INSERT INTO `product_variants` VALUES (419,'Đen-Đủ kích cỡ','VỚH-HAN-DB737A72',35000,97,1,155);
INSERT INTO `product_variants` VALUES (420,'Vàng-Đủ kích cỡ','VỚH-HAN-827D2279',45000,144,1,155);
INSERT INTO `product_variants` VALUES (421,'Trắng-Đủ kích cỡ','VỚN-HAN-4B50F490',29000,85,1,156);
INSERT INTO `product_variants` VALUES (422,'Đen-Đủ kích cỡ','VỚN-HAN-CE6127BD',44000,176,1,156);
INSERT INTO `product_variants` VALUES (423,'Vàng-Đủ kích cỡ','VỚN-HAN-8F7E4861',49000,153,1,156);
INSERT INTO `product_variants` VALUES (424,'Trắng-Đủ kích cỡ','VỚD-HAN-D4EA9C1A',35000,181,1,157);
INSERT INTO `product_variants` VALUES (425,'Đen-Đủ kích cỡ','VỚD-HAN-69BAE867',55000,57,1,157);
INSERT INTO `product_variants` VALUES (426,'Vàng-Đủ kích cỡ','VỚD-HAN-86091DC2',55000,56,1,157);
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `rating_average` float DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT '1',
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int DEFAULT NULL,
  `sale` tinyint(1) DEFAULT '0',
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (83,'Áo Khoác Blazer Nam Kiểu Ôm Dệt Jacquard Form Fitted','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Khoác-Blazer-Nam-Kiểu-Ôm-Dệt-Jacquard-Form-Fitted-i.cc023791.ffa0.44b7.a7ce.47cf81d8b304',0,'2024-06-14 11:48:44','2024-06-14 11:48:44',1,0,0);
INSERT INTO `products` VALUES (84,'Áo Thun Nam Tay Ngắn Café Thêu Họa Tiết Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Café-Thêu-Họa-Tiết-Form-Loose-i.09b360ea.5d53.4442.9349.d237c64e2a9b',0,'2024-06-14 11:53:40','2024-06-14 11:53:40',1,0,0);
INSERT INTO `products` VALUES (85,'Áo Thun Nam Tay Ngắn Coffee Lovers Trơn Form Fitted','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Coffee-Lovers-Trơn-Form-Fitted-i.bfe30696.4393.4333.b3c9.1fe8b1a71349',0,'2024-06-14 11:54:25','2024-06-14 11:54:25',1,0,0);
INSERT INTO `products` VALUES (86,'Áo Thun Nam Tay Ngắn Vải S.Café In Chữ Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Vải-SCafé-In-Chữ-Form-Loose-i.54ce4679.3bcd.40a4.83c9.19df16e8b8ce',0,'2024-06-14 11:55:28','2024-06-14 11:55:28',1,0,0);
INSERT INTO `products` VALUES (87,'Áo Thun Tay Ngắn Sinh Nhật Routine 11 Tuổi Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Tay-Ngắn-Sinh-Nhật-Routine-11-Tuổi-Form-Loose-i.8a6d67e4.e0ae.4599.9b06.a2c20a1983d2',0,'2024-06-14 11:56:08','2024-06-14 11:56:08',1,0,0);
INSERT INTO `products` VALUES (88,'Áo Sơ Mi Nam Tay Ngắn Cotton Túi Đắp Trơn Form Regular','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Nam-Tay-Ngắn-Cotton-Túi-Đắp-Trơn-Form-Regular-i.064cf689.8b23.4ed4.ba76.c1d06857790d',0,'2024-06-14 11:56:47','2024-06-14 11:56:47',1,0,0);
INSERT INTO `products` VALUES (89,'Áo Thun Tay Ngắn Unisex Cotton In Hình Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Tay-Ngắn-Unisex-Cotton-In-Hình-Form-Loose-i.0bf7e5f4.ff3b.4381.bc57.79ea6cc5b709',0,'2024-06-14 11:57:27','2024-06-14 11:57:27',1,0,0);
INSERT INTO `products` VALUES (90,'Áo Thun Nam Tay Ngắn Premium Jacquard Trơn Form Fitted','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Premium-Jacquard-Trơn-Form-Fitted-i.bdcbf353.ed42.4a2f.9b57.3013b34d6a6c',0,'2024-06-14 11:57:51','2024-06-14 11:57:51',1,0,0);
INSERT INTO `products` VALUES (91,'Áo Thun Nam Tay Ngắn 100% Cotton In Hình Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-100-Cotton-In-Hình-Form-Loose-i.15668096.58f3.4b9c.92b7.c8a7b04e65b3',0,'2024-06-14 11:58:29','2024-06-14 11:58:29',1,0,0);
INSERT INTO `products` VALUES (92,'Áo Thun Nam Tay Ngắn Dệt Jacquard Phối Nhãn Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Dệt-Jacquard-Phối-Nhãn-Form-Loose-i.426c0bc6.1e98.45cc.97a8.9440eb6a6e32',0,'2024-06-14 11:58:51','2024-06-14 11:58:51',1,0,0);
INSERT INTO `products` VALUES (93,'Áo Thun Nam Tay Ngắn Cổ Tròn Phối Rib Trơn Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Cổ-Tròn-Phối-Rib-Trơn-Form-Loose-i.aeb39596.0756.4db9.8c66.9bfe9ee4caa0',0,'2024-06-14 11:59:30','2024-06-14 11:59:30',1,0,0);
INSERT INTO `products` VALUES (94,'Áo Sơ Mi Nam Tay Ngắn Họa Tiết Kẻ Sọc Form Oversize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Nam-Tay-Ngắn-Họa-Tiết-Kẻ-Sọc-Form-Oversize-i.98f6c0c3.cecd.46e7.8d6c.e2ac304b3a48',0,'2024-06-14 11:59:56','2024-06-14 11:59:56',1,0,0);
INSERT INTO `products` VALUES (95,'Áo Thun Polo Nam Tay Bo Trơn Form Fitted','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Polo-Nam-Tay-Bo-Trơn-Form-Fitted-i.f9943d9e.c7a0.47fb.b916.89f30ab61585',0,'2024-06-14 12:02:22','2024-06-14 12:02:22',1,0,0);
INSERT INTO `products` VALUES (96,'Áo Polo Nam Tay Ngắn Dệt Jacquard Phối Nhãn Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Polo-Nam-Tay-Ngắn-Dệt-Jacquard-Phối-Nhãn-Form-Loose-i.4698d256.0bdb.4bea.b4d5.d4a30baa52cd',0,'2024-06-14 12:02:38','2024-06-14 12:02:38',1,0,0);
INSERT INTO `products` VALUES (97,'Áo Polo Nam Tay Ngắn Cotton Pique Phối Màu Form Regular','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Polo-Nam-Tay-Ngắn-Cotton-Pique-Phối-Màu-Form-Regular-i.81d5c4f9.2086.4a2e.b55d.ec30e48aeea3',0,'2024-06-14 12:02:54','2024-06-14 12:02:54',1,0,0);
INSERT INTO `products` VALUES (98,'Áo Thun Nam Tay Ngắn Sọc Ngang Cotton Pique Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Sọc-Ngang-Cotton-Pique-Form-Loose-i.cba46b21.ffe8.4046.a942.d0926737e71f',0,'2024-06-14 12:03:12','2024-06-14 12:03:12',1,0,0);
INSERT INTO `products` VALUES (99,'Áo Sơ Mi Nam Tay Dài Kẻ Sọc 100% Cotton Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Nam-Tay-Dài-Kẻ-Sọc-100-Cotton-Form-Loose-i.170833d3.154f.4c6d.a6ef.0473f990320e',0,'2024-06-14 12:03:32','2024-06-14 12:03:32',1,0,0);
INSERT INTO `products` VALUES (100,'Áo Sơ Mi Denim Nam Tay Ngắn Thêu Chữ Form Regular','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Denim-Nam-Tay-Ngắn-Thêu-Chữ-Form-Regular-i.cd0cd35b.4c89.468a.ad9f.7c0dbf88be47',0,'2024-06-14 12:04:02','2024-06-14 12:04:02',1,0,0);
INSERT INTO `products` VALUES (101,'Áo Sơ Mi Jean Unisex 100% Cotton Trơn Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Jean-Unisex-100-Cotton-Trơn-Form-Loose-i.fcb4cee2.7abc.4a06.8af2.f4059cf508ae',0,'2024-06-14 12:04:50','2024-06-14 12:04:50',1,0,0);
INSERT INTO `products` VALUES (102,'Áo Sơ Mi Jean Unisex 100% Cotton Trơn Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Jean-Unisex-100-Cotton-Trơn-Form-Loose-i.88ebccc7.7009.484c.bbae.0a89497aa5f3',0,'2024-06-14 12:06:47','2024-06-14 12:06:47',1,0,0);
INSERT INTO `products` VALUES (103,'Áo Thun Nam Tay Ngắn Cotton Polyester In Hình Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nam-Tay-Ngắn-Cotton-Polyester-In-Hình-Form-Loose-i.2d5f60a7.3a5b.4d0c.b799.d18c028ddae4',0,'2024-06-14 12:07:05','2024-06-14 12:07:05',1,0,0);
INSERT INTO `products` VALUES (104,'Áo Sơ Mi Nam Tay Dài Kẻ Sọc Họa Tiết Thêu Form Oversize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Nam-Tay-Dài-Kẻ-Sọc-Họa-Tiết-Thêu-Form-Oversize-i.e247cd9e.9839.4fac.a933.f03614fb3626',0,'2024-06-14 12:07:34','2024-06-14 12:07:34',1,0,0);
INSERT INTO `products` VALUES (105,'Quần Jean Nữ Ống Rộng Trơn Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Quần-Jean-Nữ-Ống-Rộng-Trơn-Form-Loose-i.5c96b017.7046.498b.8363.3ebcadc522f7',0,'2024-06-14 15:48:08','2024-06-14 15:48:08',2,0,0);
INSERT INTO `products` VALUES (106,'Quần Jean Nữ Ống Suông Túi Thêu Form Straight Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Quần-Jean-Nữ-Ống-Suông-Túi-Thêu-Form-Straight-Cropped-i.006c704f.f815.47fc.9d3f.a3d9cd3ac4ac',0,'2024-06-14 15:48:54','2024-06-14 15:48:54',2,0,0);
INSERT INTO `products` VALUES (107,'Đầm Polo Nữ Tay Ngắn Cổ Gài Nút Trơn Form Regular','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Đầm-Polo-Nữ-Tay-Ngắn-Cổ-Gài-Nút-Trơn-Form-Regular-i.027fd49f.0b8f.4f88.b534.fd7f9dd2f609',0,'2024-06-14 15:49:43','2024-06-14 15:49:43',2,0,0);
INSERT INTO `products` VALUES (108,'Quần Vải Nữ Viscose Diễu Ly Trơn Form Slim Crop','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Quần-Vải-Nữ-Viscose-Diễu-Ly-Trơn-Form-Slim-Crop-i.d94df0bf.c580.4fc5.9aec.208481909ab8',0,'2024-06-14 15:50:24','2024-06-14 15:50:24',2,0,0);
INSERT INTO `products` VALUES (109,'Áo Polo Nữ Lửng Tay Ngắn Cotton Trơn Form Regular Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Polo-Nữ-Lửng-Tay-Ngắn-Cotton-Trơn-Form-Regular-Cropped-i.db875f4b.5497.4c23.804f.62f60dc0c516',0,'2024-06-14 15:50:48','2024-06-14 15:50:48',2,0,0);
INSERT INTO `products` VALUES (110,'Áo Polo Nữ Lửng Tay Dài Cotton Trơn Form Fitted Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Polo-Nữ-Lửng-Tay-Dài-Cotton-Trơn-Form-Fitted-Cropped-i.f43eb3c4.385f.43c6.90ea.9b2c4bb8e1c5',0,'2024-06-14 15:51:29','2024-06-14 15:51:29',2,0,0);
INSERT INTO `products` VALUES (111,'Áo Polo Nữ Lửng Tay Dài Trơn Form Slim Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Polo-Nữ-Lửng-Tay-Dài-Trơn-Form-Slim-Cropped-i.2fd610b4.6770.4996.bfdf.28258513f0f5',0,'2024-06-14 15:52:31','2024-06-14 15:52:31',2,0,0);
INSERT INTO `products` VALUES (112,'Đầm Suông Nữ Chéo Dây Polyester Cổ Tròn Trơn Form Midi','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Đầm-Suông-Nữ-Chéo-Dây-Polyester-Cổ-Tròn-Trơn-Form-Midi-i.52885ac7.ddad.49e5.8edf.495d63932169',0,'2024-06-14 15:53:09','2024-06-14 15:53:09',2,0,0);
INSERT INTO `products` VALUES (113,'Quần Dài Vải Nữ Ống Rộng Lưng Thun Dây Rút Form Relax','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Quần-Dài-Vải-Nữ-Ống-Rộng-Lưng-Thun-Dây-Rút-Form-Relax-i.3a14153f.af5d.48b8.8afe.c4691950c87c',0,'2024-06-14 15:53:28','2024-06-14 15:53:28',2,0,0);
INSERT INTO `products` VALUES (114,'Áo Sơ Mi Nữ Tay Dài 100% Cotton Kẻ Sọc Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Nữ-Tay-Dài-100-Cotton-Kẻ-Sọc-Form-Loose-i.b5b2ae36.f176.4539.a5cb.0606f243fbf0',0,'2024-06-14 15:54:01','2024-06-14 15:54:01',2,0,0);
INSERT INTO `products` VALUES (115,'Quần Short Jean Nữ Ống Suông Trơn Form Straight','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Quần-Short-Jean-Nữ-Ống-Suông-Trơn-Form-Straight-i.9f8936b2.9d27.4194.ab30.e5f0ed926fd4',0,'2024-06-14 15:54:48','2024-06-14 15:54:48',2,0,0);
INSERT INTO `products` VALUES (116,'Quần Short Jean Nữ Ống Suông Trơn Form Straight','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Quần-Short-Jean-Nữ-Ống-Suông-Trơn-Form-Straight-i.30b2ef05.04ff.4bad.9001.a4b0b1e7758c',0,'2024-06-14 15:55:15','2024-06-14 15:55:15',2,0,0);
INSERT INTO `products` VALUES (117,'Áo Sơ Mi Unisex Tay Dài Kẻ Sọc Caro Form Loose','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Sơ-Mi-Unisex-Tay-Dài-Kẻ-Sọc-Caro-Form-Loose-i.20e52705.fe13.45ad.b384.4691494a72a2',0,'2024-06-14 15:55:32','2024-06-14 15:55:32',2,0,0);
INSERT INTO `products` VALUES (118,'Áo Thun Nữ Lửng Sát Nách Cổ Mockneck Form Slim Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nữ-Lửng-Sát-Nách-Cổ-Mockneck-Form-Slim-Cropped-i.70149eb1.52eb.4fb3.986a.ad0e4f315d3c',0,'2024-06-14 15:55:53','2024-06-14 15:55:53',2,0,0);
INSERT INTO `products` VALUES (119,'Áo Thun Nữ Tay Lỡ Cotton Cổ Cao Sọc Gân Form Slim','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nữ-Tay-Lỡ-Cotton-Cổ-Cao-Sọc-Gân-Form-Slim-i.9f726488.94f9.4bee.9c08.902a87981e84',0,'2024-06-14 15:56:43','2024-06-14 15:56:43',2,0,0);
INSERT INTO `products` VALUES (120,'Áo Thun Nữ Lửng Tay Ngắn Sọc Gân Form Fitted Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Nữ-Lửng-Tay-Ngắn-Sọc-Gân-Form-Fitted-Cropped-i.61cf5594.81ea.4dbf.9f9c.f29702002c3c',0,'2024-06-14 15:57:07','2024-06-14 15:57:07',2,0,0);
INSERT INTO `products` VALUES (121,'Áo Blazer Nữ Lửng Tay Ngắn Vải Tweed Form Regular Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Blazer-Nữ-Lửng-Tay-Ngắn-Vải-Tweed-Form-Regular-Cropped-i.1f051160.4f99.4f76.8440.db79376d3b01',0,'2024-06-14 15:57:40','2024-06-14 15:57:40',2,0,0);
INSERT INTO `products` VALUES (122,'Áo Thun Tanktop Nữ Cổ Halter Trơn Form Slim Cropped','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Áo-Thun-Tanktop-Nữ-Cổ-Halter-Trơn-Form-Slim-Cropped-i.8de00aa8.d6c5.463e.9b2a.95c56a4cdbf3',0,'2024-06-14 15:58:07','2024-06-14 15:58:07',2,0,0);
INSERT INTO `products` VALUES (123,'Túi Tote Unisex Trơn Phối Nhãn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Tote-Unisex-Trơn-Phối-Nhãn-Freesize-i.9ba23eac.9b7a.45fc.ad88.4e48a23b890b',0,'2024-06-14 16:54:04','2024-06-14 16:54:04',3,0,0);
INSERT INTO `products` VALUES (124,'Túi Đeo Bán Nguyệt Dành Cho Nữ Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Đeo-Bán-Nguyệt-Dành-Cho-Nữ-Trơn-Freesize-i.884139ff.5c81.4ca9.9e11.d80736915300',0,'2024-06-14 16:54:32','2024-06-14 16:54:32',3,0,0);
INSERT INTO `products` VALUES (125,'Túi Tote Unisex Kẻ Sọc Phối Màu Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Tote-Unisex-Kẻ-Sọc-Phối-Màu-Freesize-i.97b0cbd2.3cef.4d3e.bddb.178c00e845cc',0,'2024-06-14 16:54:57','2024-06-14 16:54:57',3,0,0);
INSERT INTO `products` VALUES (126,'Túi Đeo Chéo Phối Màu Chống Thấm Thiết Kế Basic','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Đeo-Chéo-Phối-Màu-Chống-Thấm-Thiết-Kế-Basic-i.b889bb09.ae13.4b8d.bd98.a697d68a66e1',0,'2024-06-14 16:55:31','2024-06-14 16:55:31',3,0,0);
INSERT INTO `products` VALUES (127,'Túi Đeo Chéo Unisex Thêu Nhãn Trang Trí','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Đeo-Chéo-Unisex-Thêu-Nhãn-Trang-Trí-i.df0c4093.5eb0.47b2.8f75.1a005e802885',0,'2024-06-14 16:55:56','2024-06-14 16:55:56',3,0,0);
INSERT INTO `products` VALUES (128,'Balo canvas túi hộp nhãn trang trí','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Balo-canvas-túi-hộp-nhãn-trang-trí-i.f309056f.9063.4ca4.b395.2708dea495aa',0,'2024-06-14 16:56:16','2024-06-14 16:56:16',3,0,0);
INSERT INTO `products` VALUES (129,'Túi Tote Vải Unisex Xếp Ly Trơn Form Basic','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Tote-Vải-Unisex-Xếp-Ly-Trơn-Form-Basic-i.c3a79b9e.ca23.4ed1.9ddb.1322a124768c',0,'2024-06-14 16:56:39','2024-06-14 16:56:39',3,0,0);
INSERT INTO `products` VALUES (130,'Bóp Da Mini Đeo Chéo Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Bóp-Da-Mini-Đeo-Chéo-Trơn-Freesize-i.c0d4800a.63ef.4a46.a87b.5a9e645b6933',0,'2024-06-14 16:57:01','2024-06-14 16:57:01',3,0,0);
INSERT INTO `products` VALUES (131,'Túi Đeo Chéo Unisex Da PU Phối Dây Basic','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Đeo-Chéo-Unisex-Da-PU-Phối-Dây-Basic-i.4511d4be.6ef0.4bef.82e4.e6ab0557559c',0,'2024-06-14 16:57:25','2024-06-14 16:57:25',3,0,0);
INSERT INTO `products` VALUES (132,'Balo Da PU Trơn Thời Trang Thiết Kế Basic Phối Dây Kéo','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Balo-Da-PU-Trơn-Thời-Trang-Thiết-Kế-Basic-Phối-Dây-Kéo-i.e6e6d3e3.34e8.4428.9801.c18a69af16e2',0,'2024-06-14 16:57:45','2024-06-14 16:57:45',3,0,0);
INSERT INTO `products` VALUES (133,'Túi Da Đeo Chéo Nữ Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Da-Đeo-Chéo-Nữ-Trơn-Freesize-i.a2b73dd3.0624.49f6.a8f5.de8529b85b91',0,'2024-06-14 16:58:49','2024-06-14 16:58:49',3,0,0);
INSERT INTO `products` VALUES (134,'Túi Tote Da Unisex Dây Đeo In Logo Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Tote-Da-Unisex-Dây-Đeo-In-Logo-Freesize-i.40dcbce1.9a87.402f.9d6e.1e2555bffe81',0,'2024-06-14 16:59:11','2024-06-14 16:59:11',3,0,0);
INSERT INTO `products` VALUES (135,'Túi Da Đeo Vai Tubular Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Da-Đeo-Vai-Tubular-Trơn-Freesize-i.9fa734ee.bddb.4568.8472.54d00262ab63',0,'2024-06-14 16:59:32','2024-06-14 16:59:32',3,0,0);
INSERT INTO `products` VALUES (136,'Túi Da Bán Nguyệt Đeo Vai Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Da-Bán-Nguyệt-Đeo-Vai-Trơn-Freesize-i.7f42deff.8657.4dd5.8394.3336c4f8bfe5',0,'2024-06-14 16:59:50','2024-06-14 16:59:50',3,0,0);
INSERT INTO `products` VALUES (137,'Ví Da Trơn Form Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Ví-Da-Trơn-Form-Freesize-i.15a90687.373d.4c6e.bbbb.0e99132bee91',0,'2024-06-14 17:00:08','2024-06-14 17:00:08',3,0,0);
INSERT INTO `products` VALUES (138,'Túi Đeo Chéo Phối Màu Thời Trang','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Túi-Đeo-Chéo-Phối-Màu-Thời-Trang-i.72375b8e.3461.48af.9c38.8a02101f0461',0,'2024-06-14 17:00:26','2024-06-14 17:00:26',3,0,0);
INSERT INTO `products` VALUES (139,'Balo Da Trơn Form Basic','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Balo-Da-Trơn-Form-Basic-i.218ed0c3.6dce.430c.826d.a644e4891d88',0,'2024-06-14 17:00:44','2024-06-14 17:00:44',3,0,0);
INSERT INTO `products` VALUES (140,'Vớ Hài Nam Cotton Polyester Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Hài-Nam-Cotton-Polyester-Trơn-Freesize-i.255e4574.be50.4235.a9a9.6a069f7d8411',0,'2024-06-14 17:52:55','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (141,'Vớ Hài Nam Cotton Polyester Họa Tiết Kẻ Sọc Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Hài-Nam-Cotton-Polyester-Họa-Tiết-Kẻ-Sọc-Freesize-i.f16d8e17.c7b0.4166.b35f.0348578a426d',0,'2024-06-14 17:53:13','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (142,'Vớ Dài Nam Cotton Thêu Chữ Coffee Lovers Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Nam-Cotton-Thêu-Chữ-Coffee-Lovers-Freesize-i.614f06ff.90bb.4e93.af30.260e2c7acd6e',0,'2024-06-14 17:54:05','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (143,'Vớ Dài Nam Cotton Phối Màu Thêu Chữ Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Nam-Cotton-Phối-Màu-Thêu-Chữ-Freesize-i.5927bf3e.b991.45bb.ab34.24df4fe6113c',0,'2024-06-14 17:54:50','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (144,'Vớ Dài Nam Cotton Thêu Chữ Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Nam-Cotton-Thêu-Chữ-Freesize-i.fbd6e14c.66c5.4bbd.893e.5c2c24fc518e',0,'2024-06-14 17:55:19','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (145,'Vớ Nam Cổ Ngắn Cotton Phối Màu Kẻ Sọc Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Nam-Cổ-Ngắn-Cotton-Phối-Màu-Kẻ-Sọc-Freesize-i.21a42489.6eea.4dbf.9ebe.bfa03fa82b4e',0,'2024-06-14 17:55:49','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (146,'Vớ Cổ Ngắn Thể Thao Cotton Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Cổ-Ngắn-Thể-Thao-Cotton-Trơn-Freesize-i.76eddb05.cd1e.4dc1.9b37.346d11a2460b',0,'2024-06-14 17:56:02','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (147,'Vớ Cổ Dài Cotton Thể Thao Thêu Chữ Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Cổ-Dài-Cotton-Thể-Thao-Thêu-Chữ-Freesize-i.5b8f0045.d5ac.4b68.aaf0.0d480049264c',0,'2024-06-14 17:56:16','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (148,'Vớ Dài Cotton Thêu Chữ Coffee Lovers Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Cotton-Thêu-Chữ-Coffee-Lovers-Freesize-i.3fb208b6.a632.4bfa.8a17.21d0b3b2c205',0,'2024-06-14 17:56:32','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (149,'Vớ Nam Cổ Ngắn Cotton Thêu Họa Tiết Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Nam-Cổ-Ngắn-Cotton-Thêu-Họa-Tiết-Freesize-i.bd434890.c740.4d4e.a757.fc8a1500419b',0,'2024-06-14 17:56:45','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (150,'Vớ Nam Dài Cotton Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Nam-Dài-Cotton-Trơn-Freesize-i.ba6c3be7.9807.49d4.959f.c7ec81b5cb09',0,'2024-06-14 17:56:56','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (151,'Vớ Nam Dài Cotton Trơn Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Nam-Dài-Cotton-Trơn-Freesize-i.d0d73ccc.4fdd.41ff.98e7.9fc3d3713850',0,'2024-06-14 17:57:12','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (152,'Vớ Dài Polyester Họa Tiết Dệt Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Polyester-Họa-Tiết-Dệt-Freesize-i.c242ba08.65a2.48c0.8c1e.f02b83923aa5',0,'2024-06-14 17:57:26','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (153,'Vớ Ngắn Phối Sọc Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Ngắn-Phối-Sọc-Freesize-i.e4b7091b.39e4.4514.b614.b7d156401843',0,'2024-06-14 17:57:38','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (154,'Vớ Dài Cổ Cao Dệt Họa Tiết Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Cổ-Cao-Dệt-Họa-Tiết-Freesize-i.49a0d4a6.561e.43fe.b9a0.45d1062aaffc',0,'2024-06-14 17:57:49','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (155,'Vớ Hài Trơn Có Logo Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Hài-Trơn-Có-Logo-Freesize-i.b8ea64a4.eb1c.4191.913f.9e3c34b6e4d2',0,'2024-06-14 17:58:01','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (156,'Vớ Ngắn Thể Thao Trơn Có Logo Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Ngắn-Thể-Thao-Trơn-Có-Logo-Freesize-i.f56b2d03.99f1.419b.b369.b31ef7f603ff',0,'2024-06-14 17:58:13','2024-06-16 06:58:26',4,0,0);
INSERT INTO `products` VALUES (157,'Vớ Dài Thể Thao Cổ Cao Trơn Có Logo Freesize','Mô tả sản phẩm chưa có sẵn.',4.5,1,0,'Vớ-Dài-Thể-Thao-Cổ-Cao-Trơn-Có-Logo-Freesize-i.ef21bed2.5480.495d.b335.eedae06f8a08',0,'2024-06-14 17:58:24','2024-06-16 06:58:26',4,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin');
INSERT INTO `roles` VALUES (2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(20) NOT NULL,
  `expired` tinyint(1) DEFAULT '0',
  `revoked` tinyint(1) DEFAULT '0',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDA3NjAwLCJleHAiOjE3MTgwMTEyMDB9.9Skb1v87rnOAL0QykrJdxDjIbhlwRjyG-nBO-Zq-_B4','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDEzMTk3LCJleHAiOjE3MTgwMTY3OTd9.eGlGwHAo1kPH21xSwkCyrdSN2sQ0fnabM2rIayw3_Hs','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (3,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDEzMjQzLCJleHAiOjE3MTgwMTY4NDN9.A4CWQIBQ6ivvuvSpsU1BiGSwV2KsORCaK-UO4NhCOpA','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (4,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDEzNDIzLCJleHAiOjE3MTgwMTcwMjN9.NrUwnZ_7a9HEm7RAWZyQzZNcN8GRuRNEsn0kvTagV5E','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (5,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDE3NjkzLCJleHAiOjE3MTgwMjEyOTN9.Uejbak-UN38S6jAK9m9HZqSOeE5KGpxtEsBGllVqLvM','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (6,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDIzODkwLCJleHAiOjE3MTgwMjc0OTB9._ZEVDTcfAd9-JiH3KEnsHGrQ_smlCrKQRUSnsZ0cjr4','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (7,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDI5MTMyLCJleHAiOjE3MTgwMzI3MzJ9.M-99B8MZgZF60LMsNGU5WPt1sUSDt5nbB3xwD39S9uk','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (8,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDM4NDQ1LCJleHAiOjE3MTgwNDIwNDV9.PI79gXjeoyc0-_RpnsdHm5WT_cKmpP4iUc9wZxIsQwE','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (9,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDQ1Mjc4LCJleHAiOjE3MTgwNDg4Nzh9.vQzNHjfb3B9lXDnsyuH-LO7-u8dUJe7KI7VtuIbMOh4','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (10,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDUxMTYwLCJleHAiOjE3MTgwNTQ3NjB9.rPjWRGfgbQjMGAUNiH0drkrRGDM2XZyKPQ1GnhQtUt8','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (11,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDU4MTE5LCJleHAiOjE3MTgwNjE3MTl9.2IIW9c25AgsC7l5s4Nr5UyCgSXDv8tjyK1w3yjkyZ_U','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (12,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDU4MTIxLCJleHAiOjE3MTgwNjE3MjF9.uO4CkY-tvNTfVZZNTSi-jy3hhoz0ZnAZa9YMkv8Lja8','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (13,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDU4MTgzLCJleHAiOjE3MTgwNjE3ODN9.hIEBMvvrvglLET1n0BBonmfqmelT0C-soJjtJGGAtw8','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (14,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDU4MzczLCJleHAiOjE3MTgwNjE5NzN9.0rHL1ad263Qi9vGqYj05TphCcElMz0pIuwPz7NBmHNM','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (15,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDYwNDQ0LCJleHAiOjE3MTgwNjQwNDR9.WPvIgt937Li8uw8fgqkVCpNR8MUx8qYW_-BRbxO2TOU','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (16,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDYwNDk1LCJleHAiOjE3MTgwNjQwOTV9.-Ej9XG6tscY_yrC_ziPavIYJR_dlaU8wA2zX_fDGWqI','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (17,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDY0NjQ2LCJleHAiOjE3MTgwNjgyNDZ9.rm4gRVcFEnzk2j0VAltiYwpkWMkX9MbwTZjlMY_2HnI','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (18,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDcxNTU3LCJleHAiOjE3MTgwNzUxNTd9.uxUk8lZxUZLk4ioqeG5NTS3VQbDHaAmemU-dk196tgM','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (19,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDcyODQ2LCJleHAiOjE3MTgwNzY0NDZ9.NIU0iRVnUft7GDm2WfoAYytsyAJMY4fjWyMkCbcxI5o','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (20,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MDcyODQ3LCJleHAiOjE3MTgwNzY0NDd9.ZFc0dSpGul2KZb7bYnwIWCEZGSU1oDXS1CTvWnv_Ydk','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (21,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODA3OTk4MywiZXhwIjoxNzE4MDgzNTgzfQ.yTkIARB-0uGkAI_lQ7yqmfwYuS5wy9jmoj6gQiJodN8','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (22,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MzUxNTQxLCJleHAiOjE3MTgzNTUxNDF9.md5AadpjFo-tQZP1gKvWgyab_utZkEBhV_Sp6xSC3HY','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (23,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MzU2MDE5LCJleHAiOjE3MTgzNTk2MTl9.2HJzGmhbOe_Cuc0cfLT5r1VEjQR3oW40VWhvReohsbw','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (24,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MzU5ODkxLCJleHAiOjE3MTgzNjM0OTF9.y9Rc6_pTnBRTSy7SKNl1xTcEUxS45XtxzFTyfy_tyAk','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (25,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MzY1NDg1LCJleHAiOjE3MTgzNjkwODV9.ziNz7k2NUdYm1MvcwDrj2hkeV63wdhRfU1LqCHGtdQY','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (26,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4MzY3MDgxLCJleHAiOjE3MTgzNzA2ODF9.N8Czyj0rNL_8-C209BmUbLHLncsdJsTLYRh8IqrSemo','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (27,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODM4NTM5MSwiZXhwIjoxNzE4Mzg4OTkxfQ.pUVOgNB3yV1EoPwpuX86ZpEicZLidUO7nUMysOhxc4w','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (28,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODM4NjgyOCwiZXhwIjoxNzE4MzkwNDI4fQ.WzWGiR4t1AaOlK4WBoZw4UhyDpO1TY09ciwn9PvdBjc','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (29,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODU0MTM4MSwiZXhwIjoxNzE4NTQ0OTgxfQ.0cntcc-3zvyf6L9RC7J3wg-XRSoCKFY8ABr7X6fBOTA','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (30,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODU0MTQ2OSwiZXhwIjoxNzE4NTQ1MDY5fQ.hI1HGQK8vn5G4G9c7Bjp1R1ib8SjoOi9A-JbA_CFte0','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (31,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4Nzg5NzEzLCJleHAiOjE3MTg3OTMzMTN9.2XDwxLPI9cUa_WaiJOIzoAz-oK-Ggqrexg_fnSuPLP8','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (32,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4NzkzODgxLCJleHAiOjE3MTg3OTc0ODF9.h6Dm6czOwIkw2VMJd__p-Feb2FKTCQmFQNt13u_rUWA','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (33,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4Nzk3OTA0LCJleHAiOjE3MTg4MDE1MDR9.HfQIghyNphOJsIhIGFDG2ROZHM9wHct_gstCsBsSwAQ','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (34,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODc5ODcwMCwiZXhwIjoxNzE4ODAyMzAwfQ.WcEYiTbNXPeGCmir_9vRln9B2QN245WiS-Oj0saVDio','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (35,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODc5ODg0MCwiZXhwIjoxNzE4ODAyNDQwfQ.pxGOC-Z2to_XlyQVs8GkK13thzJArveiVDTFZAG7BpQ','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (36,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODgwNDg2OCwiZXhwIjoxNzE4ODA4NDY4fQ.KdeW5dmSQwLsXw8UI7TjKJ-0NQGT7emyzIiwo-Q48Zw','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (37,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4ODA4NzEzLCJleHAiOjE3MTg4MTIzMTN9.Y2vv9JmNEBh-8ZGxJ5wvL7xECZ_gi_JWq9ASni_6L54','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (38,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODgwODgzNCwiZXhwIjoxNzE4ODEyNDM0fQ.97Mzuh2_uVYvgfz3lpSjzISCWxBuLtV1hszZneuZteA','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (39,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODgwOTI4MSwiZXhwIjoxNzE4ODEyODgxfQ.eYOxmWAjdthsONkznSIZTWbmS3NEocJkS3XO9n8i-Gk','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (40,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODgxNzY2MCwiZXhwIjoxNzE4ODIxMjYwfQ.mRiPe4yK2ni7WLiG5FRwpi7tUCLxZfrNKkPGQPyV9wY','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (41,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODgyMTk0MywiZXhwIjoxNzE4ODI1NTQzfQ.LDxHeDJSW6JDAdYHocFf3miY8PJy8sPJn6hXuP6rhIs','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (42,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg3MDQ0MSwiZXhwIjoxNzE4ODc0MDQxfQ.pf36Fjah2uYRMyZfLsbm1OJJMCy0thWgFisXefg5RjY','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (43,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg3MDYzMSwiZXhwIjoxNzE4ODc0MjMxfQ.cEQZAm3-a5Cr4GO53UL2cvzZgo8asGVKMOIt277m1CQ','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (44,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg3NDI1OCwiZXhwIjoxNzE4ODc3ODU4fQ.EEwLzoFL2TsDca-vwGaw5D60M1J33j3gIh1rctB4oNE','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (45,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg3ODA1MSwiZXhwIjoxNzE4ODgxNjUxfQ.2muahpco_E63I3AaF1Ic1rgeurxQhVdkEBhjtVFi7Xk','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (46,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg4MTIyNSwiZXhwIjoxNzE4ODg0ODI1fQ.5h-5BH9sNlfn6wLqNfyL5Ldh5lyJioLTfTm8UArOvBk','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (47,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMDFAbG9jYWxob3N0IiwiaWF0IjoxNzE4ODg2Nzg4LCJleHAiOjE3MTg4OTAzODh9.YLIPwGr7bCo5nWnx9CULtBhIWHwe4IRF_-uq3c1TAlo','BEARER',1,1,1);
INSERT INTO `tokens` VALUES (48,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg4ODQ4MSwiZXhwIjoxNzE4ODkyMDgxfQ.kxE7KCQ8OdJ26mID5RCovPs65EaqhRg9OgEH16XmmIo','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (49,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg5MzMyMywiZXhwIjoxNzE4ODk2OTIzfQ.4WRgTDN7GkzE5Nbb8QuOLdTxCx-Eu2f0qDJv45Qr6Ws','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (50,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW5seXBoYXQzMDEyMDJAZ21haWwuY29tIiwiaWF0IjoxNzE4ODk1NTY4LCJleHAiOjE3MTg4OTkxNjh9.tsV8z5SjKG88wpP2k_I47PXcz3p4ZkxYrJ9Fpgvp-sQ','BEARER',1,1,3);
INSERT INTO `tokens` VALUES (51,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VydGVzdEBnbWFpbC5jb20iLCJpYXQiOjE3MTg4OTg0OTUsImV4cCI6MTcxODkwMjA5NX0.BOy-mZ-8hRzxFvV09dTi7V83bjfcV3y-ZtOfPlTdMv4','BEARER',1,1,4);
INSERT INTO `tokens` VALUES (52,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg5OTMxNiwiZXhwIjoxNzE4OTAyOTE2fQ.XauYlQBO1a-04P6wtDcV7ja4yCo96altJ5E-s22GuHE','BEARER',1,1,2);
INSERT INTO `tokens` VALUES (53,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwaGF0QGxvY2FsaG9zdCIsImlhdCI6MTcxODg5OTQ0OCwiZXhwIjoxNzE4OTAzMDQ4fQ.QWIU8KbdcpHlXX62GaZeXL5DGT1hyn5FD3KopS250CU','BEARER',0,0,2);
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `is_verify` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user01@localhost','user01@localhost','$2a$10$cih/oWYGUsLg6M.8B/TMTe3no9jDAquTwgTRymmRI5g7I7w0DFXKS','','272/3A Khu phố Thạnh Lợi, phường An Thạnh','12345678',NULL,0,1,'2024-06-10 08:20:00','2024-06-11 02:52:19',2);
INSERT INTO `users` VALUES (2,'phat@localhost','phat@localhost','$2a$10$wTpvQxfR4tqisKqvcCgzPuISZnlgAn13/cMzbUO6TMBy8pFDAYKwW','Nguyen Ly Phat','','',NULL,0,1,'2024-06-11 04:26:23','2024-06-20 16:04:43',2);
INSERT INTO `users` VALUES (3,NULL,'nguyenlyphat301202@gmail.com','$2a$10$oBUz3Rv9lxKTqeQzFEDQwuD06Bhu/mcqqioq.x6nMzZ98zRGFlboG','Nguyen Ly Phat',NULL,NULL,NULL,0,1,'2024-06-20 14:59:28','2024-06-20 14:59:28',2);
INSERT INTO `users` VALUES (4,'usertest@gmail.com','usertest@gmail.com','$2a$10$AxTNa3lglW1B/WfuqY17L.AZgFveWMby79PUxI69CtEXJcbg3UjXW','usertest','272/3A Khu phố Thạnh Lợi, phường An Thạnh','0989600449',NULL,0,1,'2024-06-20 15:48:15','2024-06-20 15:57:07',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_value`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `variant_value_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_value`
--

LOCK TABLES `variant_value` WRITE;
/*!40000 ALTER TABLE `variant_value` DISABLE KEYS */;
INSERT INTO `variant_value` VALUES (58,'blue',39);
INSERT INTO `variant_value` VALUES (59,'L',40);
INSERT INTO `variant_value` VALUES (62,'red',39);
INSERT INTO `variant_value` VALUES (63,'M',40);
INSERT INTO `variant_value` VALUES (65,'S',40);
INSERT INTO `variant_value` VALUES (66,'white',39);
INSERT INTO `variant_value` VALUES (67,'black',39);
INSERT INTO `variant_value` VALUES (69,'yellow',39);
INSERT INTO `variant_value` VALUES (74,'Màu vàng',39);
INSERT INTO `variant_value` VALUES (77,'trắng xám',39);
INSERT INTO `variant_value` VALUES (78,'xanh xám',39);
INSERT INTO `variant_value` VALUES (79,'đỏ coffee',39);
INSERT INTO `variant_value` VALUES (80,'hàu xám',39);
INSERT INTO `variant_value` VALUES (81,'Đá phiến xanh',39);
INSERT INTO `variant_value` VALUES (82,'nâu sáng',39);
INSERT INTO `variant_value` VALUES (83,'đen',39);
INSERT INTO `variant_value` VALUES (84,'trắng',39);
INSERT INTO `variant_value` VALUES (85,'lichen xanh',39);
INSERT INTO `variant_value` VALUES (86,'peyote',39);
INSERT INTO `variant_value` VALUES (87,'vàng nâu',39);
INSERT INTO `variant_value` VALUES (88,'Đủ kích cỡ',40);
INSERT INTO `variant_value` VALUES (89,'Xanh',39);
INSERT INTO `variant_value` VALUES (90,'Vàng',39);
/*!40000 ALTER TABLE `variant_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `variant` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variant` (`variant`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (40,'kích cỡ');
INSERT INTO `variants` VALUES (39,'màu sắc');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'springshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20 23:16:42
