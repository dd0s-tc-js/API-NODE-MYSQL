-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: api_supermarket
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (0000000001,'Cereales'),(0000000002,'Endulzantes'),(0000000003,'Aceites'),(0000000004,'Condimentos'),(0000000005,'Lácteos'),(0000000006,'Proteínas'),(0000000007,'Panadería'),(0000000008,'Bebidas'),(0000000009,'Limpieza'),(0000000010,'Snacks'),(0000000011,'Salsas'),(0000000012,'Enlatados'),(0000000013,'Granos'),(0000000014,'Huevos'),(0000000015,'Aseo Personal');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (0000000001,'Pedido realizado'),(0000000002,'Preparación en proceso'),(0000000003,'Listo para recoger'),(0000000004,'En tránsito'),(0000000005,'Entregado'),(0000000006,'Confirmado'),(0000000007,'Cancelado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `persona` bigint(20) unsigned zerofill NOT NULL,
  `id_estado` int(10) unsigned zerofill NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `productos` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estado_idx` (`id_estado`),
  KEY `numero_documento_idx` (`persona`),
  CONSTRAINT `id_estado` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id`),
  CONSTRAINT `numero_documento` FOREIGN KEY (`persona`) REFERENCES `personas` (`numero_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `numero_documento` bigint(20) unsigned zerofill NOT NULL,
  `tipo_documento` varchar(45) NOT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) NOT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) NOT NULL,
  `id_rol` int unsigned NOT NULL,
  PRIMARY KEY (`numero_documento`),
  UNIQUE KEY `numero_documento_UNIQUE` (`numero_documento`),
  KEY `id_idx` (`id_rol`),
  CONSTRAINT `id` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `id_categoria` int unsigned NOT NULL,
  `marca` varchar(255) NOT NULL,
  `cantidad` int(10) unsigned zerofill NOT NULL,
  `precio` bigint unsigned NOT NULL,
  `imagen` text,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`id_categoria`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (0000000001,'Arroz',13,'Diana',0000000050,5000,NULL),(0000000002,'Azúcar',2,'Incauca',0000000050,3000,NULL),(0000000003,'Sal',4,'Refisal',0000000050,2000,NULL),(0000000004,'Aceite',3,'Premier',0000000050,10000,NULL),(0000000005,'Leche',5,'Alpina',0000000050,2500,NULL),(0000000006,'Huevos',14,'Campollo',0000000050,6000,NULL),(0000000007,'Pan',7,'Bimbo',0000000050,3500,NULL),(0000000008,'Café',8,'Juan Valdez',0000000050,8000,NULL),(0000000009,'Atún',12,'Van Camp\'s',0000000050,3500,NULL),(0000000010,'Galletas',10,'Noel',0000000050,3000,NULL),(0000000011,'Jabón',15,'Protex',0000000050,3500,NULL),(0000000012,'Pasta',13,'La Muñeca',0000000050,1500,NULL),(0000000013,'Salsa de tomate',11,'Heinz',0000000050,5000,NULL),(0000000014,'Cerveza',8,'Aguila',0000000050,2500,NULL),(0000000015,'Queso',5,'Alpina',0000000050,7000,NULL),(0000000016,'Mantequilla',5,'Alpina',0000000050,5500,NULL),(0000000017,'Cereal',1,'Kellogg\'s',0000000050,6000,NULL),(0000000018,'Soda',8,'Coca Cola',0000000050,2000,NULL),(0000000019,'Detergente',9,'FAB',0000000050,3500,NULL),(0000000020,'Papel higiénico',15,'Scott',0000000050,3000,NULL),(0000000021,'Jabón de baño',15,'Dove',0000000050,3000,NULL),(0000000022,'Cepillo de dientes',15,'Colgate',0000000050,2500,NULL),(0000000023,'Pasta de dientes',15,'Colgate',0000000050,3500,NULL),(0000000024,'Shampoo',15,'Pantene',0000000050,6000,NULL),(0000000025,'Acondicionador',15,'Pantene',0000000050,6500,NULL),(0000000026,'Gel de ducha',15,'Nivea',0000000050,5000,NULL),(0000000027,'Desodorante',15,'Rexona',0000000050,3500,NULL),(0000000028,'Cepillo de pelo',15,'Tangle Teezer',0000000050,8000,NULL),(0000000029,'Crema dental',15,'Colgate',0000000050,3000,NULL),(0000000030,'Jabón en polvo',9,'FAB',0000000050,7000,NULL),(0000000031,'Café instantáneo',8,'Nescafé',0000000050,9000,NULL),(0000000032,'Te',8,'Lipton',0000000050,3000,NULL),(0000000033,'Mermelada',2,'Diana',0000000050,3500,NULL),(0000000034,'Yogurt',5,'Alpina',0000000050,3000,NULL),(0000000035,'Cereal de arroz',1,'Nestlé',0000000050,3500,NULL),(0000000036,'Pan integral',7,'Bimbo',0000000050,3000,NULL),(0000000037,'Pasta de trigo',13,'La Muñeca',0000000050,2000,NULL),(0000000038,'Salsa de soja',4,'Kikkoman',0000000050,5500,NULL),(0000000039,'Vino',8,'Casa Madero',0000000050,15000,NULL),(0000000040,'Cerveza sin alcohol',8,'Bavaria 0',0000000050,3000,NULL),(0000000041,'Leche de almendras',5,'Silk',0000000050,10000,NULL),(0000000042,'Leche de coco',5,'Goya',0000000050,8000,NULL),(0000000043,'Leche en polvo',5,'Alpina',0000000050,7000,NULL),(0000000044,'Leche condensada',5,'Alpina',0000000050,6000,NULL),(0000000045,'Leche evaporada',5,'Nestlé',0000000050,5500,NULL),(0000000046,'Leche de cabra',5,'Alpina',0000000050,9000,NULL),(0000000047,'Leche de oveja',5,'Alpina',0000000050,10000,NULL),(0000000049,'Leche de avena',5,'Alpina',0000000050,8500,NULL),(0000000050,'Arroz',13,'Roa',0000000050,5000,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_x_pedido`
--

DROP TABLE IF EXISTS `productos_x_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_x_pedido` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_pedidos` int(10) unsigned zerofill NOT NULL,
  `id_productos` int(10) unsigned zerofill NOT NULL,
  `productos_vendidos` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_productos_idx` (`id_productos`),
  KEY `referencia_idx` (`id_pedidos`),
  CONSTRAINT `id_productos` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id`),
  CONSTRAINT `referencia` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_x_pedido`
--

LOCK TABLES `productos_x_pedido` WRITE;
/*!40000 ALTER TABLE `productos_x_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_x_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idroles_UNIQUE` (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (0000000001,'administrador'),(0000000002,'usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07 14:39:29
