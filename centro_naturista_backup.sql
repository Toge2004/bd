-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: centro_naturista
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Current Database: `centro_naturista`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `centro_naturista` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `centro_naturista`;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `imagen_url` varchar(255) NOT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT 0,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Nueva temporada de tes','/imagenes/Logo.png','/medicamentos',1,1,'2026-07-14 23:58:56','2026-11-11 20:08:37'),(2,'Vitamina C en oferta','/imagenes/b-12-100tab.jpeg','/medicamentos',2,1,'2026-07-15 00:03:23','2026-11-11 20:13:05'),(3,'Colagenos premium','/imagenes/Logo.png','/medicamentos',3,1,'2026-07-14 23:41:24','2026-11-11 15:50:45'),(4,'Envios a todo Ecuador','/imagenes/Logo.png','/contacto',4,1,'2026-07-14 17:49:58','2026-11-11 22:37:15');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_metas`
--

DROP TABLE IF EXISTS `bsc_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bsc_metas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `kpi` varchar(60) NOT NULL,
  `valor` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_bsc_metas` (`mes`,`anio`,`kpi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_metas`
--

LOCK TABLES `bsc_metas` WRITE;
/*!40000 ALTER TABLE `bsc_metas` DISABLE KEYS */;
INSERT INTO `bsc_metas` VALUES (2,9,2026,'fin_ingresos',0.00);
/*!40000 ALTER TABLE `bsc_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_movimientos`
--

DROP TABLE IF EXISTS `caja_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja_movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caja_sesion_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `concepto` varchar(200) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_caja_sesion` (`caja_sesion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_movimientos`
--

LOCK TABLES `caja_movimientos` WRITE;
/*!40000 ALTER TABLE `caja_movimientos` DISABLE KEYS */;
INSERT INTO `caja_movimientos` VALUES (1,7,1,'Egreso',24.50,'Anulacion venta POS #20',1,'2026-08-06 16:53:35'),(2,8,1,'Egreso',7.00,'Devolucion #1',1,'2026-08-10 23:21:30');
/*!40000 ALTER TABLE `caja_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_sesiones`
--

DROP TABLE IF EXISTS `caja_sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja_sesiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `monto_apertura` decimal(10,2) NOT NULL,
  `monto_cierre` decimal(10,2) DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL,
  `estado` enum('Abierta','Cerrada') DEFAULT 'Abierta',
  `notas` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `caja_sesiones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_sesiones`
--

LOCK TABLES `caja_sesiones` WRITE;
/*!40000 ALTER TABLE `caja_sesiones` DISABLE KEYS */;
INSERT INTO `caja_sesiones` VALUES (5,1,30.00,69.75,'2026-06-19 13:13:28','2026-06-25 00:24:14','Cerrada','Cierre de turno'),(6,1,40.00,62.25,'2026-07-14 13:04:09','2026-07-15 00:16:48','Cerrada','Cierre de turno'),(7,1,50.00,66.00,'2026-08-03 13:48:23','2026-08-04 00:38:45','Cerrada','Cierre de turno'),(8,1,50.00,NULL,'2026-08-13 13:20:07',NULL,'Abierta','Turno actual');
/*!40000 ALTER TABLE `caja_sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campanas_marketing`
--

DROP TABLE IF EXISTS `campanas_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campanas_marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `tipo` enum('Descuento','2x1','Combo','Envío gratis','Cashback','Otro') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `descuento_porcentaje` decimal(5,2) DEFAULT NULL,
  `descuento_monto` decimal(10,2) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `activa` tinyint(1) DEFAULT 1,
  `usos_realizados` int(11) DEFAULT 0,
  `usos_maximos` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `campanas_marketing_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campanas_marketing`
--

LOCK TABLES `campanas_marketing` WRITE;
/*!40000 ALTER TABLE `campanas_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `campanas_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_items`
--

DROP TABLE IF EXISTS `carrito_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrito_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `fecha_agregado` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `carrito_id` (`carrito_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `carrito_items_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carritos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carrito_items_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_items`
--

LOCK TABLES `carrito_items` WRITE;
/*!40000 ALTER TABLE `carrito_items` DISABLE KEYS */;
INSERT INTO `carrito_items` VALUES (1,1,3,2,'2026-08-12 17:31:05'),(2,1,7,1,'2026-08-11 22:01:11'),(3,1,5,1,'2026-08-13 22:01:15'),(4,2,4,2,'2026-08-13 14:38:11'),(5,2,2,1,'2026-08-12 19:36:27'),(6,2,13,2,'2026-08-11 22:43:45'),(7,3,7,1,'2026-08-13 16:23:40'),(8,4,13,1,'2026-08-12 17:37:34'),(9,4,11,1,'2026-08-12 15:04:34'),(10,4,5,1,'2026-08-10 17:01:21'),(11,5,4,1,'2026-08-12 14:03:37'),(12,5,11,1,'2026-08-10 23:50:59'),(13,5,6,1,'2026-08-11 22:31:48');
/*!40000 ALTER TABLE `carrito_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES (1,2,'2026-08-08 14:55:18'),(2,11,'2026-08-06 22:03:11'),(3,12,'2026-08-13 15:59:16'),(4,13,'2026-08-07 16:40:59'),(5,14,'2026-08-10 00:55:17');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Suplementos',NULL),(2,'Vitaminas',NULL),(3,'Aceites',NULL),(4,'Cabello',NULL),(5,'Esotéricos',NULL),(6,'Hepáticos',NULL),(7,'Cuidado de la Piel',NULL),(8,'Cardiovascular',NULL),(9,'Analgésicos',NULL),(10,'Relajantes',NULL),(11,'Sistema Inmune',NULL),(12,'Minerales',NULL),(13,'Energéticos',NULL),(14,'Digestivos',NULL),(15,'Circulación',NULL),(16,'Renales',NULL),(17,'Salud Femenina',NULL),(18,'Desintoxicantes',NULL),(19,'Colágenos',NULL),(20,'Naturales',NULL),(21,'Hogar',NULL),(22,'Tés',NULL),(23,'Cerebral',NULL),(24,'Antioxidantes',NULL),(25,'Salud Masculina',NULL),(26,'Endulzantes',NULL),(32,'test','');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_conversaciones`
--

DROP TABLE IF EXISTS `chat_conversaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_conversaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `asunto` varchar(200) DEFAULT 'Consulta general',
  `estado` enum('Abierta','Cerrada') DEFAULT 'Abierta',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_cierre` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `chat_conversaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_conversaciones`
--

LOCK TABLES `chat_conversaciones` WRITE;
/*!40000 ALTER TABLE `chat_conversaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_conversaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_mensajes`
--

DROP TABLE IF EXISTS `chat_mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversacion_id` int(11) NOT NULL,
  `remitente` enum('cliente','soporte') NOT NULL,
  `mensaje` text NOT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conversacion_id` (`conversacion_id`),
  CONSTRAINT `chat_mensajes_ibfk_1` FOREIGN KEY (`conversacion_id`) REFERENCES `chat_conversaciones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_mensajes`
--

LOCK TABLES `chat_mensajes` WRITE;
/*!40000 ALTER TABLE `chat_mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion` (
  `clave` varchar(100) NOT NULL,
  `valor` text DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES ('horario','Lun-Sab 9:00-19:00','Horario de atencion'),('idioma_default','ES','Idioma por defecto (ES/EN)'),('moneda','USD','Moneda usada en precios'),('nombre_tienda','Centro Naturista','Nombre público de la tienda'),('whatsapp_numero','593939736066','Número de WhatsApp para pedidos');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos_importacion`
--

DROP TABLE IF EXISTS `costos_importacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos_importacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lote_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `tipo_costo` enum('Flete','Aduana','Seguro','Almacenamiento','Otro') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `costos_importacion_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos_importacion`
--

LOCK TABLES `costos_importacion` WRITE;
/*!40000 ALTER TABLE `costos_importacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos_importacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos_operativos`
--

DROP TABLE IF EXISTS `costos_operativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos_operativos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` enum('Alquiler','Servicios','Sueldos','Marketing','Mantenimiento','Transporte','Seguros','Impuestos','Otro') NOT NULL,
  `concepto` varchar(300) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `recurrente` tinyint(1) DEFAULT 0,
  `fecha` date DEFAULT curdate(),
  `notas` text DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sucursal_id` (`sucursal_id`),
  CONSTRAINT `costos_operativos_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos_operativos`
--

LOCK TABLES `costos_operativos` WRITE;
/*!40000 ALTER TABLE `costos_operativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos_operativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupones`
--

DROP TABLE IF EXISTS `cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `tipo` enum('porcentaje','monto_fijo','envio_gratis') NOT NULL DEFAULT 'porcentaje',
  `valor` decimal(10,2) NOT NULL,
  `monto_minimo` decimal(10,2) DEFAULT 0.00,
  `usos_maximos` int(11) DEFAULT NULL,
  `usos_actuales` int(11) DEFAULT 0,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupones`
--

LOCK TABLES `cupones` WRITE;
/*!40000 ALTER TABLE `cupones` DISABLE KEYS */;
INSERT INTO `cupones` VALUES (7,'BIENVENIDA10','porcentaje',10.00,20.00,200,15,'2026-06-29 19:07:08','2026-10-30 21:21:01',1),(8,'NATURISTA15','porcentaje',15.00,30.00,150,22,'2026-06-29 22:10:19','2026-11-27 21:45:54',1),(9,'AHORRO5','monto_fijo',5.00,15.00,300,40,'2026-06-29 21:05:02','2026-09-17 14:51:28',1),(10,'VERANO20','porcentaje',20.00,40.00,100,12,'2026-06-30 00:10:54','2026-11-27 15:04:20',1),(11,'MENSAJERO2','monto_fijo',2.00,10.00,500,63,'2026-06-29 17:38:22','2026-10-11 14:43:25',1),(12,'VIP25','porcentaje',25.00,50.00,50,6,'2026-06-29 19:16:38','2026-12-09 17:59:24',1);
/*!40000 ALTER TABLE `cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_envios`
--

DROP TABLE IF EXISTS `delivery_envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `repartidor_id` int(11) DEFAULT NULL,
  `direccion_entrega` text NOT NULL,
  `notas_entrega` text DEFAULT NULL,
  `estado` enum('Pendiente','En camino','Entregado','Fallido') DEFAULT 'Pendiente',
  `hora_salida` datetime DEFAULT NULL,
  `hora_entrega` datetime DEFAULT NULL,
  `intentos` int(11) DEFAULT 0,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `repartidor_id` (`repartidor_id`),
  CONSTRAINT `delivery_envios_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `delivery_envios_ibfk_2` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidores` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_envios`
--

LOCK TABLES `delivery_envios` WRITE;
/*!40000 ALTER TABLE `delivery_envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS (`cantidad` * `precio_unitario`) STORED,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `idx_detalle_pedido` (`pedido_id`),
  CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_pedidos` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES (2,2,13,1,4.00),(3,2,9,2,0.25),(4,3,2,2,7.00),(5,4,9,2,0.25),(6,5,6,2,3.00),(7,6,2,3,7.00),(8,6,10,1,2.00),(9,7,9,2,0.25),(10,8,8,1,8.00),(11,8,5,3,11.25),(12,8,9,3,0.25),(13,8,4,2,1.00),(14,9,12,2,5.00),(15,9,4,1,1.00),(16,9,2,3,7.00),(17,10,7,1,5.20),(18,10,10,3,2.00),(19,10,12,3,5.00),(20,10,3,3,1.00),(21,11,4,2,1.00),(22,11,11,1,1.00),(23,11,8,3,8.00),(24,12,12,3,5.00),(25,12,10,3,2.00),(26,12,3,3,1.00),(27,12,6,3,3.00),(28,13,13,1,4.00),(29,13,9,2,0.25),(30,14,11,2,1.00),(31,15,9,1,0.25),(32,15,6,1,3.00),(33,15,5,2,11.25),(34,16,10,2,2.00),(35,16,8,1,8.00),(36,17,9,1,0.25),(37,17,10,2,2.00),(38,17,8,2,8.00),(39,18,11,2,1.00),(40,19,8,2,8.00),(41,20,10,1,2.00),(42,20,5,2,11.25),(43,21,3,1,1.00),(44,22,3,1,1.00);
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion_detalle`
--

DROP TABLE IF EXISTS `devolucion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devolucion_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `idx_devdet` (`devolucion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion_detalle`
--

LOCK TABLES `devolucion_detalle` WRITE;
/*!40000 ALTER TABLE `devolucion_detalle` DISABLE KEYS */;
INSERT INTO `devolucion_detalle` VALUES (1,1,2,1,7.00),(2,2,4,1,1.00);
/*!40000 ALTER TABLE `devolucion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `total_devuelto` decimal(10,2) DEFAULT 0.00,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_dev_pedido` (`pedido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
INSERT INTO `devoluciones` VALUES (1,3,1,1,'Producto equivocado',7.00,'2026-08-08 21:34:47'),(2,11,2,1,'Cliente cambio de opinion',1.00,'2026-08-09 21:25:34');
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones_cliente`
--

DROP TABLE IF EXISTS `devoluciones_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `motivo` text NOT NULL,
  `estado` enum('Pendiente','Aprobada','Rechazada','Completada') DEFAULT 'Pendiente',
  `respuesta_admin` text DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  `fecha_resolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `devoluciones_cliente_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `devoluciones_cliente_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `devoluciones_cliente_ibfk_3` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones_cliente`
--

LOCK TABLES `devoluciones_cliente` WRITE;
/*!40000 ALTER TABLE `devoluciones_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `etiqueta` varchar(50) DEFAULT 'Casa',
  `calle` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `predeterminada` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (9,11,'Casa','Av. Amazonas N55-120','Quito','Pichincha','170470','Edificio blanco',1),(10,12,'Casa','Calle Luis Cordero 234','Quito','Pichincha','170458','Casa verde',1),(11,13,'Trabajo','Av. Eloy Alfaro 890','Quito','Pichincha','170393','Edificio blanco',1),(12,14,'Casa','Vía a Conocoto km 4','Quito','Pichincha','170287','Junto a la farmacia',1),(13,15,'Casa','Av. Interoceánica 1500','Quito','Pichincha','170524','Junto a la farmacia',1),(14,16,'Trabajo','Av. 10 de Agosto 456','Quito','Pichincha','170210','Junto a la farmacia',1),(15,17,'Casa','Calle Los Nogales 78','Quito','Pichincha','170722','Frente al parque',1),(16,18,'Casa','Av. Mariscal Sucre 321','Quito','Pichincha','170467','Junto a la farmacia',1);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_preguntas`
--

DROP TABLE IF EXISTS `encuesta_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encuesta_id` int(11) NOT NULL,
  `pregunta` varchar(500) NOT NULL,
  `tipo` enum('Estrellas','Si_No','Texto','OpcionMultiple') DEFAULT 'Estrellas',
  `opciones` text DEFAULT NULL,
  `orden` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `encuesta_id` (`encuesta_id`),
  CONSTRAINT `encuesta_preguntas_ibfk_1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_preguntas`
--

LOCK TABLES `encuesta_preguntas` WRITE;
/*!40000 ALTER TABLE `encuesta_preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_respuestas`
--

DROP TABLE IF EXISTS `encuesta_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encuesta_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `encuesta_id` (`encuesta_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `encuesta_respuestas_ibfk_1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `encuesta_respuestas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_respuestas`
--

LOCK TABLES `encuesta_respuestas` WRITE;
/*!40000 ALTER TABLE `encuesta_respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activa` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuestas`
--

LOCK TABLES `encuestas` WRITE;
/*!40000 ALTER TABLE `encuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(50) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('Borrador','Emitida','Anulada') DEFAULT 'Borrador',
  `notas` text DEFAULT NULL,
  `fecha_emision` datetime DEFAULT current_timestamp(),
  `fecha_anulacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE SET NULL,
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unico_favorito` (`usuario_id`,`producto_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (1,2,2,'2026-07-04 23:38:20'),(2,2,3,'2026-05-29 15:31:09'),(3,2,8,'2026-08-02 16:06:31'),(4,11,3,'2026-07-11 16:54:17'),(5,11,10,'2026-07-10 22:02:13'),(6,12,2,'2026-07-02 21:19:21'),(7,12,9,'2026-07-12 15:42:06'),(8,12,5,'2026-08-10 17:35:07'),(9,12,7,'2026-07-30 15:16:01'),(10,13,8,'2026-06-26 15:23:58'),(11,13,7,'2026-06-04 22:49:39'),(12,13,6,'2026-07-06 21:45:20'),(13,13,3,'2026-08-10 15:40:32'),(14,14,4,'2026-06-15 14:50:03'),(15,14,13,'2026-07-18 18:11:48'),(16,14,10,'2026-07-26 22:07:06'),(17,14,5,'2026-07-20 17:58:05'),(18,14,6,'2026-07-20 15:47:11'),(19,15,12,'2026-07-07 23:04:51'),(20,15,7,'2026-07-03 19:23:01'),(21,16,2,'2026-05-31 00:30:21'),(22,16,13,'2026-07-14 22:26:06'),(23,17,9,'2026-07-10 00:14:11'),(24,17,3,'2026-07-08 00:58:14'),(25,17,5,'2026-05-27 14:29:36'),(26,17,12,'2026-07-20 18:20:10');
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integraciones`
--

DROP TABLE IF EXISTS `integraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `tipo` enum('Pasarela de pago','Facturación electrónica','Courier','SMS','Email','Otro') NOT NULL,
  `api_key` varchar(500) DEFAULT NULL,
  `api_secret` varchar(500) DEFAULT NULL,
  `webhook_url` varchar(500) DEFAULT NULL,
  `config_adicional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config_adicional`)),
  `activa` tinyint(1) DEFAULT 0,
  `ultima_sincronizacion` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integraciones`
--

LOCK TABLES `integraciones` WRITE;
/*!40000 ALTER TABLE `integraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `integraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_detalle`
--

DROP TABLE IF EXISTS `kit_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kit_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kit_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `kit_id` (`kit_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `kit_detalle_ibfk_1` FOREIGN KEY (`kit_id`) REFERENCES `productos_kits` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kit_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_detalle`
--

LOCK TABLES `kit_detalle` WRITE;
/*!40000 ALTER TABLE `kit_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `kit_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_deseos`
--

DROP TABLE IF EXISTS `lista_deseos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_deseos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha_agregado` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wishlist` (`usuario_id`,`producto_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `lista_deseos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lista_deseos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_deseos`
--

LOCK TABLES `lista_deseos` WRITE;
/*!40000 ALTER TABLE `lista_deseos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_deseos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `accion` varchar(255) NOT NULL,
  `entidad` varchar(50) DEFAULT NULL,
  `entidad_id` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,'logout','usuarios',1,'Cierre de sesion','192.168.1.64','2026-08-01 00:48:00'),(2,1,'crear','pedidos',9,'Pedido creado','192.168.1.59','2026-07-30 21:49:30'),(3,1,'login','usuarios',1,'Inicio de sesion','192.168.1.242','2026-08-11 23:09:46'),(4,1,'actualizar','productos',9,'Stock actualizado','192.168.1.166','2026-07-28 21:09:45'),(5,1,'crear','pedidos',4,'Pedido creado','192.168.1.222','2026-08-04 14:07:22'),(6,1,'logout','usuarios',1,'Cierre de sesion','192.168.1.136','2026-08-10 21:18:18'),(7,1,'venta_pos','pedidos',17,'Venta POS registrada','192.168.1.97','2026-08-11 18:41:28'),(8,1,'crear','pedidos',8,'Pedido creado','192.168.1.171','2026-08-09 23:40:23'),(9,1,'login','usuarios',1,'Inicio de sesion','192.168.1.219','2026-08-11 16:55:52'),(10,1,'venta_pos','pedidos',16,'Venta POS registrada','192.168.1.12','2026-08-01 22:57:11'),(11,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-07 17:31:28'),(12,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-07 17:31:28'),(13,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:00:16'),(14,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:00:16'),(15,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:01:20'),(16,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:01:20'),(17,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:01:22'),(18,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:01:22'),(19,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:02:54'),(20,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:02:54'),(21,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:02:54'),(22,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:02:54'),(23,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 12:11:06'),(24,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 12:11:16'),(25,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 12:11:27'),(26,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 12:11:40'),(27,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 12:11:45'),(28,11,'Inicio de sesión — Usuario: maria.andrade1@demo.com',NULL,NULL,NULL,'::1','2026-09-08 12:11:57'),(29,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:11:57'),(30,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:11:57'),(31,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:15:17'),(32,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:15:17'),(33,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:16:11'),(34,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:16:11'),(35,11,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-08 12:16:12'),(36,11,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-08 12:16:12'),(37,11,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-08 12:16:13'),(38,11,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-08 12:16:13'),(39,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:16:15'),(40,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 12:16:15'),(41,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 14:30:46'),(42,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 14:30:46'),(43,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 14:30:46'),(44,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 14:30:46'),(45,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 14:53:07'),(46,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 14:53:14'),(47,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 14:53:16'),(48,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 14:53:17'),(49,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 14:53:19'),(50,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:02:25'),(51,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:02:47'),(52,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:02:56'),(53,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:03:11'),(54,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 16:08:29'),(55,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-08 16:08:29'),(56,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:09:14'),(57,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:09:21'),(58,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:22:03'),(59,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:22:11'),(60,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-08 16:22:18'),(61,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:46:01'),(62,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:46:01'),(63,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 08:47:36'),(64,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 08:47:40'),(65,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 08:47:41'),(66,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 08:47:42'),(67,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 08:47:44'),(68,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:52:15'),(69,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:52:15'),(70,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:52:16'),(71,11,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:52:16'),(72,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 08:53:30'),(73,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:53:30'),(74,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:53:30'),(75,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:53:35'),(76,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 08:53:35'),(77,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 09:07:58'),(78,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 09:07:58'),(79,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 09:07:58'),(80,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 09:07:58'),(81,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 09:08:27'),(82,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 09:10:26'),(83,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 09:10:26'),(84,2,'Intento fallido login — Usuario: ',NULL,NULL,NULL,'::1','2026-09-09 09:30:21'),(85,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:14:06'),(86,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:14:25'),(87,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:14:42'),(88,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:14:56'),(89,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:15:01'),(90,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 22:15:08'),(91,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:15:09'),(92,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:15:09'),(93,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:15:19'),(94,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:15:19'),(95,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:16:21'),(96,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:16:21'),(97,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:16:55'),(98,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:17:15'),(99,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:17:26'),(100,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:17:49'),(101,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:17:58'),(102,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-09 22:19:34'),(103,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-09 22:19:34'),(104,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:19:44'),(105,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:19:44'),(106,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:19:45'),(107,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:19:45'),(108,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:19:47'),(109,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:19:47'),(110,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:19:51'),(111,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:19:51'),(112,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:19:52'),(113,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:19:52'),(114,2,'Agregó al carrito — Totuma de Jengibre - $4.00',NULL,NULL,NULL,'::1','2026-09-09 22:21:19'),(115,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:24:53'),(116,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:24:53'),(117,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:24:54'),(118,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:24:54'),(119,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:50'),(120,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:50'),(121,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:52'),(122,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:52'),(123,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:54'),(124,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:54'),(125,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:56'),(126,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:56'),(127,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:59'),(128,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:25:59'),(129,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:40'),(130,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:41'),(131,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:41'),(132,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:42'),(133,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:42'),(134,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:42'),(135,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:43'),(136,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:43'),(137,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:43'),(138,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:43'),(139,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:43'),(140,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:44'),(141,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:44'),(142,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:44'),(143,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:44'),(144,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:45'),(145,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:45'),(146,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:45'),(147,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:48'),(148,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:49'),(149,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:49'),(150,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:49'),(151,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:49'),(152,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:49'),(153,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:49'),(154,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(155,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(156,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(157,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(158,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(159,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(160,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:50'),(161,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(162,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(163,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(164,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(165,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(166,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(167,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:51'),(168,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:52'),(169,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-09 22:26:52'),(170,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:27:13'),(171,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:27:13'),(172,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:27:14'),(173,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:27:14'),(174,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:28:29'),(175,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:28:29'),(176,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:28:31'),(177,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:28:31'),(178,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:16'),(179,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:16'),(180,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:17'),(181,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:17'),(182,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:19'),(183,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:19'),(184,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:19'),(185,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:19'),(186,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:20'),(187,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:30:20'),(188,19,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-09 22:30:47'),(189,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 22:32:10'),(190,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:32:10'),(191,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:32:10'),(192,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:32:14'),(193,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:32:14'),(194,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:32:15'),(195,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:32:15'),(196,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:32:15'),(197,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:32:15'),(198,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:32:51'),(199,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:32:51'),(200,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:32:56'),(201,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:32:56'),(202,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:24'),(203,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:24'),(204,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:43'),(205,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:43'),(206,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:46'),(207,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:46'),(208,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:48'),(209,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:48'),(210,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:54'),(211,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:33:54'),(212,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:35:30'),(213,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:35:30'),(214,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:35:31'),(215,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:35:31'),(216,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:35:32'),(217,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:35:32'),(218,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:36:06'),(219,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:36:06'),(220,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:36:20'),(221,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:36:20'),(222,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:36:21'),(223,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:36:21'),(224,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:37:52'),(225,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:39:35'),(226,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:39:35'),(227,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:39:39'),(228,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:39:39'),(229,1,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:39:44'),(230,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:39:44'),(231,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:39:49'),(232,1,'Agregó al carrito — Aceite de Argán - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:39:50'),(233,1,'Agregó al carrito — Aceite de Argán - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:39:50'),(234,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:39:51'),(235,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:00'),(236,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:00'),(237,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:00'),(238,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:00'),(239,1,'Agregó al carrito — Aceite de Argán - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:01'),(240,1,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:07'),(241,1,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:07'),(242,1,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:40:07'),(243,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:07'),(244,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:07'),(245,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:09'),(246,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:09'),(247,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:16'),(248,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:16'),(249,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:20'),(250,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:20'),(251,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:28'),(252,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:28'),(253,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:41'),(254,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:41'),(255,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 22:41:52'),(256,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:52'),(257,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:41:52'),(258,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:02'),(259,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:02'),(260,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:23'),(261,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:23'),(262,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:26'),(263,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:26'),(264,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:42:28'),(265,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:42:28'),(266,2,'Vió detalle + agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:42:31'),(267,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:51'),(268,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:42:51'),(269,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:42:56'),(270,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:42:56'),(271,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:42:57'),(272,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:42:57'),(273,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:43:43'),(274,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:43:43'),(275,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:43:45'),(276,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:43:45'),(277,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 22:46:04'),(278,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:46:04'),(279,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:46:04'),(280,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:47:57'),(281,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:47:57'),(282,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:23'),(283,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:23'),(284,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:26'),(285,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:26'),(286,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:48:47'),(287,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:48'),(288,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:48'),(289,2,'Vió detalle + agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:48:52'),(290,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 22:48:55'),(291,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:57'),(292,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:48:57'),(293,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:03'),(294,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:03'),(295,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:06'),(296,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:06'),(297,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:16'),(298,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:16'),(299,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:22'),(300,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:22'),(301,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:27'),(302,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:27'),(303,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:30'),(304,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:49:30'),(305,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:18'),(306,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:18'),(307,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:22'),(308,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:22'),(309,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:31'),(310,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:31'),(311,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:33'),(312,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:33'),(313,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:50:34'),(314,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:50:34'),(315,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:35'),(316,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:50:35'),(317,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:50:47'),(318,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-09 22:50:47'),(319,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:50:48'),(320,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-09 22:50:48'),(321,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 22:51:59'),(322,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:53:42'),(323,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:53:42'),(324,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:57:59'),(325,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:57:59'),(326,1,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-09 22:58:12'),(327,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 22:59:25'),(328,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:59:25'),(329,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 22:59:25'),(330,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:03:21'),(331,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:03:21'),(332,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:03:21'),(333,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:03:21'),(334,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:09'),(335,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:09'),(336,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:12'),(337,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:12'),(338,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:15'),(339,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:15'),(340,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:17'),(341,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:04:17'),(342,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:05:16'),(343,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:05:16'),(344,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:33'),(345,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:33'),(346,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:36'),(347,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:36'),(348,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:37'),(349,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:37'),(350,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:39'),(351,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:39'),(352,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:41'),(353,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:41'),(354,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:42'),(355,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:07:42'),(356,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:00'),(357,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:00'),(358,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:03'),(359,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:03'),(360,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:05'),(361,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:05'),(362,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:07'),(363,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:07'),(364,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:10'),(365,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:13:10'),(366,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:14:59'),(367,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:14:59'),(368,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:17:24'),(369,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:17:24'),(370,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:17:24'),(371,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:17:24'),(372,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:18:47'),(373,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:18:47'),(374,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:28:20'),(375,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:28:20'),(376,1,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-09 23:29:24'),(377,1,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-09 23:29:24'),(378,1,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-09 23:29:28'),(379,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:36:17'),(380,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:36:17'),(381,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:40:13'),(382,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:40:13'),(383,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:40:14'),(384,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:40:14'),(385,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:49:35'),(386,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:49:35'),(387,1,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-09 23:51:34'),(388,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-09 23:54:21'),(389,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:54:21'),(390,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:54:21'),(391,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:57:24'),(392,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-09 23:57:24'),(393,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-09 23:58:22'),(394,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:13:49'),(395,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:13:49'),(396,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:13:54'),(397,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:13:54'),(398,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:14:00'),(399,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:14:00'),(400,1,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 00:14:55'),(401,1,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 00:14:55'),(402,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:28:06'),(403,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:28:06'),(404,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:28:33'),(405,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:28:33'),(406,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:28:40'),(407,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:28:40'),(408,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:29:43'),(409,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:29:43'),(410,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:34:35'),(411,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:34:35'),(412,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:34:37'),(413,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:34:37'),(414,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:36:39'),(415,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:36:39'),(416,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:39:11'),(417,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 00:39:11'),(418,1,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 00:41:43'),(419,1,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 00:41:43'),(420,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:41:44'),(421,1,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 00:41:44'),(422,1,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 00:41:57'),(423,1,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 00:41:57'),(424,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:12:42'),(425,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:12:42'),(426,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:13:16'),(427,1,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:13:16'),(428,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-10 08:13:25'),(429,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:13:25'),(430,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:13:25'),(431,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 08:14:10'),(432,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 08:14:23'),(433,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 08:14:31'),(434,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 08:14:40'),(435,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 08:14:47'),(436,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:21:46'),(437,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:21:46'),(438,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:21:58'),(439,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:21:58'),(440,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 08:22:12'),(441,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 08:22:12'),(442,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:32:35'),(443,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:32:35'),(444,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:33:04'),(445,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:33:04'),(446,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:33:27'),(447,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:33:27'),(448,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:01'),(449,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:02'),(450,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:22'),(451,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:23'),(452,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:30'),(453,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:31'),(454,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:34'),(455,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:34'),(456,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:37'),(457,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:38:37'),(458,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:41:18'),(459,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:41:18'),(460,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:41:29'),(461,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:41:29'),(462,22,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:42:48'),(463,22,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:42:48'),(464,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:54:31'),(465,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:54:31'),(466,22,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:54:32'),(467,22,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:54:32'),(468,22,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 08:54:33'),(469,22,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 08:54:33'),(470,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:55:04'),(471,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:55:04'),(472,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:55:12'),(473,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:55:12'),(474,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:55:21'),(475,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:55:21'),(476,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:08'),(477,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:08'),(478,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:11'),(479,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:11'),(480,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:14'),(481,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:14'),(482,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:51'),(483,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:56:51'),(484,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:11'),(485,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:11'),(486,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:14'),(487,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:14'),(488,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:18'),(489,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:18'),(490,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:28'),(491,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:28'),(492,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:31'),(493,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:31'),(494,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:45'),(495,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:45'),(496,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:48'),(497,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:48'),(498,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:52'),(499,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:52'),(500,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:56'),(501,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:57:56'),(502,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:58:20'),(503,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:58:20'),(504,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:58:37'),(505,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:58:37'),(506,22,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:58:39'),(507,22,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 08:58:39'),(508,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:59:14'),(509,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:59:14'),(510,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:59:25'),(511,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 08:59:25'),(512,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:00:36'),(513,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:00:36'),(514,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:01:28'),(515,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:01:28'),(516,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:02:46'),(517,22,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:02:46'),(518,22,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-10 09:02:52'),(519,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:03:03'),(520,22,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-10 09:03:07'),(521,22,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-10 09:03:11'),(522,22,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-10 09:03:16'),(523,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:03:43'),(524,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:03:52'),(525,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:04:04'),(526,22,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:05:49'),(527,22,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:05:49'),(528,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-10 09:06:01'),(529,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:06:01'),(530,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:06:01'),(531,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 09:06:11'),(532,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-10 09:06:11'),(533,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 09:06:12'),(534,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-10 09:06:12'),(535,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:06:55'),(536,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:07:04'),(537,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:07:16'),(538,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:07:24'),(539,21,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:10:36'),(540,21,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:10:36'),(541,21,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:10:39'),(542,21,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:10:39'),(543,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-10 09:10:50'),(544,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:10:50'),(545,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-10 09:10:50'),(546,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:11:34'),(547,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:11:46'),(548,20,'Login vendedor — vendedor@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:11:55'),(549,21,'Login inventario — inventario@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:12:03'),(550,22,'Login gerente — gerente@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:12:11'),(551,22,'Admin cerró sesión — Admin salió del panel',NULL,NULL,NULL,'::1','2026-09-10 09:20:34'),(552,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 09:20:43'),(553,22,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-10 09:35:06'),(554,2,'Pedido enviado — Total: 1.00 - 1 productos',NULL,NULL,NULL,'::1','2026-09-10 09:35:09'),(555,22,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:35:16'),(556,22,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:35:16'),(557,22,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:35:19'),(558,22,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-10 09:35:19'),(559,22,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-10 09:36:02'),(560,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-10 19:49:49'),(561,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 08:40:31'),(562,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 08:40:33'),(563,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 08:40:33'),(564,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 08:40:38'),(565,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 08:40:38'),(566,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 08:48:43'),(567,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 08:48:43'),(568,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 08:48:44'),(569,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 08:48:44'),(570,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:03:14'),(571,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:03:14'),(572,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 09:04:32'),(573,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 09:04:32'),(574,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:04:35'),(575,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:04:35'),(576,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:06:39'),(577,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:06:39'),(578,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 09:07:50'),(579,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 09:07:50'),(580,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:07:58'),(581,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:07:58'),(582,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:08:13'),(583,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 09:08:13'),(584,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 12:51:32'),(585,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:51:33'),(586,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:51:33'),(587,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-11 12:52:14'),(588,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:53:21'),(589,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:53:21'),(590,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:20'),(591,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:20'),(592,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:23'),(593,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:23'),(594,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:26'),(595,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:26'),(596,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 12:55:30'),(597,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 12:55:30'),(598,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:33'),(599,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 12:55:33'),(600,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:00:53'),(601,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:00:53'),(602,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:01:11'),(603,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:01:11'),(604,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 13:01:21'),(605,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:01:21'),(606,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:01:21'),(607,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:05:15'),(608,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:05:15'),(609,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:05:23'),(610,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:05:23'),(611,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:07:51'),(612,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:07:51'),(613,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-11 13:08:31'),(614,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:08:53'),(615,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:08:53'),(616,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:23'),(617,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:23'),(618,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:26'),(619,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:26'),(620,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 13:14:27'),(621,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 13:14:27'),(622,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:14:29'),(623,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:14:29'),(624,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:35'),(625,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:35'),(626,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:46'),(627,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:46'),(628,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:48'),(629,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:48'),(630,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:50'),(631,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:14:50'),(632,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:17:29'),(633,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:17:29'),(634,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:17:30'),(635,2,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-11 13:17:31'),(636,2,'Agregó al carrito — Aceite de Argán - $1.00',NULL,NULL,NULL,'::1','2026-09-11 13:17:33'),(637,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:18:59'),(638,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:18:59'),(639,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 13:19:14'),(640,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 13:19:14'),(641,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:19:18'),(642,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:19:18'),(643,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:20:13'),(644,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:31'),(645,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:31'),(646,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:31'),(647,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:32'),(648,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:32'),(649,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:32'),(650,2,'Agregó al carrito — Ácido fólico - $7.00',NULL,NULL,NULL,'::1','2026-09-11 13:22:32'),(651,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:27:53'),(652,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:27:53'),(653,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 13:28:03'),(654,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:28:03'),(655,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:28:03'),(656,2,'Vió detalle + agregó al carrito — Ácido fólico x1500 - $10500.00',NULL,NULL,NULL,'::1','2026-09-11 13:28:23'),(657,2,'Agregó al carrito — A-Úrico - $10.00',NULL,NULL,NULL,'::1','2026-09-11 13:31:08'),(658,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:32:20'),(659,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:32:20'),(660,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:32:52'),(661,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:32:52'),(662,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:35:05'),(663,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:35:05'),(664,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:35:35'),(665,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:35:35'),(666,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 13:37:32'),(667,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 13:37:32'),(668,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-11 13:38:05'),(669,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 13:41:27'),(670,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 13:41:27'),(671,25,'Registro — Usuario: dwwddw (wkdjkwjdkw@jdkdjkdwjkd)',NULL,NULL,NULL,'::1','2026-09-11 13:42:45'),(672,25,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:42:45'),(673,25,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:42:45'),(674,25,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 13:42:47'),(675,25,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 13:42:47'),(676,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 13:44:37'),(677,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:44:37'),(678,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:44:37'),(679,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:45:09'),(680,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:45:09'),(681,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:45:17'),(682,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-11 13:45:17'),(683,26,'Registro — Usuario: karina (arielavioleta2020@gmail.com)',NULL,NULL,NULL,'::1','2026-09-11 13:48:26'),(684,26,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:48:26'),(685,26,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:48:26'),(686,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 13:56:24'),(687,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:56:24'),(688,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:56:24'),(689,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-11 13:56:42'),(690,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:59:37'),(691,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:59:37'),(692,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:59:48'),(693,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 13:59:48'),(694,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 14:04:21'),(695,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:04:21'),(696,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:04:21'),(697,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-11 14:07:21'),(698,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:07:52'),(699,19,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:07:52'),(700,NULL,'Registro - paso 1 — Código enviado a Vocesanonimas20225@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 14:08:45'),(701,NULL,'Registro - paso 1 — Código enviado a Vocesanonimas20225@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 14:08:47'),(702,28,'Registro verificado — Usuario: toge',NULL,NULL,NULL,'::1','2026-09-11 14:09:28'),(703,28,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:09:28'),(704,28,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:09:28'),(705,28,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 14:09:34'),(706,28,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-11 14:09:34'),(707,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-11 14:10:54'),(708,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:10:54'),(709,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-11 14:10:54'),(710,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 14:11:00'),(711,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-11 14:11:00'),(712,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-12 19:34:27'),(713,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:34:27'),(714,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:34:27'),(715,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-12 19:34:27'),(716,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-12 19:34:48'),(717,2,'Visitó página — Perfil',NULL,NULL,NULL,'::1','2026-09-12 19:34:48'),(718,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 19:34:52'),(719,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 19:34:52'),(720,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-12 19:34:53'),(721,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-12 19:34:53'),(722,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:35:33'),(723,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:35:33'),(724,NULL,'Intento fallido login — Usuario: ',NULL,NULL,NULL,'::1','2026-09-12 19:37:48'),(725,1,'Login admin — admin@admin.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-12 19:38:04'),(726,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-12 19:39:39'),(727,2,'Inicio de sesión — Usuario: dilantarquino2004@gmail.com',NULL,NULL,NULL,'::1','2026-09-12 19:41:21'),(728,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:41:21'),(729,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:41:21'),(730,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:41:37'),(731,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:41:37'),(732,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:45:37'),(733,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 19:45:37'),(734,19,'Login super_admin — superadmin@centro.com ingresó al panel',NULL,NULL,NULL,'::1','2026-09-12 20:02:31'),(735,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:03:43'),(736,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:03:43'),(737,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 20:05:24'),(738,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 20:05:24'),(739,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:05:28'),(740,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:05:28'),(741,2,'Agregó al carrito — Aceite Anice Plus - $1.00',NULL,NULL,NULL,'::1','2026-09-12 20:06:09'),(742,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:07:06'),(743,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:07:06'),(744,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:14:05'),(745,2,'Visitó página — Inicio',NULL,NULL,NULL,'::1','2026-09-12 20:14:05'),(746,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 20:14:16'),(747,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 20:14:16'),(748,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-12 20:14:20'),(749,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-12 20:14:20'),(750,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 20:14:36'),(751,2,'Visitó página — Nosotros',NULL,NULL,NULL,'::1','2026-09-12 20:14:36'),(752,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-12 20:14:48'),(753,2,'Visitó página — Contacto',NULL,NULL,NULL,'::1','2026-09-12 20:14:48');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `cantidad_inicial` int(11) DEFAULT 0,
  `cantidad_restante` int(11) DEFAULT 0,
  `fecha_caducidad` date DEFAULT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_lotes_producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` VALUES (1,1,'L-UR-001',50,38,'2026-08-28',0,'2026-08-13 15:44:42'),(2,1,'L-UR-002',250,250,'2026-12-15',1,'2026-08-13 15:44:42'),(3,5,'L-OR-001',50,31,'2026-09-30',1,'2026-08-13 15:44:42'),(4,5,'L-OR-002',250,250,'2027-01-20',1,'2026-08-13 15:44:42');
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes_contacto`
--

DROP TABLE IF EXISTS `mensajes_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `asunto` varchar(150) DEFAULT NULL,
  `mensaje` text NOT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes_contacto`
--

LOCK TABLES `mensajes_contacto` WRITE;
/*!40000 ALTER TABLE `mensajes_contacto` DISABLE KEYS */;
INSERT INTO `mensajes_contacto` VALUES (1,'Carlos Jimenez','carlos.j@gmail.com','0939483169','Consulta de producto','Tienen colageno en presentacion de 500g?',0,'2026-08-09 23:55:38'),(2,'Ana Torres','ana.t@gmail.com','0916285084','Horarios','A que hora abren los sabados?',1,'2026-08-03 16:15:01'),(3,'Pedro Mena','pedro.m@gmail.com','0915749554','Cotizacion','Necesito cotizar 20 unidades de vitamina C para mi farmacia.',1,'2026-08-05 22:46:48');
/*!40000 ALTER TABLE `mensajes_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `tipo` varchar(30) NOT NULL DEFAULT 'otro',
  `detalles` text DEFAULT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `orden` int(11) DEFAULT 0,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'WhatsApp','whatsapp','Consulta y confirmación del pedido por WhatsApp',1,1,'2026-09-09 23:10:29'),(2,'Tarjeta de crédito/débito','tarjeta','Aceptamos Visa y Mastercard.',1,2,'2026-09-09 23:10:29'),(3,'Transferencia bancaria','transferencia','Banco Pichincha, Cta. Cte. 2100456789',1,3,'2026-09-09 23:10:29'),(4,'Efectivo','efectivo','Pago al recibir en cualquiera de nuestras sucursales',1,4,'2026-09-09 23:10:29');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfa_pendientes`
--

DROP TABLE IF EXISTS `mfa_pendientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfa_pendientes` (
  `token` varchar(64) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expira_en` datetime NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfa_pendientes`
--

LOCK TABLES `mfa_pendientes` WRITE;
/*!40000 ALTER TABLE `mfa_pendientes` DISABLE KEYS */;
INSERT INTO `mfa_pendientes` VALUES ('8006ce08488075f9d15a14d17c428a93bdc62f2f23411327',23,'mfatest@test.com','2026-09-09 18:56:27');
/*!40000 ALTER TABLE `mfa_pendientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `tipo` enum('Entrada','Salida','Ajuste','Merma') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `traslado_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `idx_movimientos_producto` (`producto_id`),
  CONSTRAINT `movimientos_inventario_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movimientos_inventario_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE SET NULL,
  CONSTRAINT `movimientos_inventario_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,2,'Salida',2,'Pedido #3 (web)',NULL,1,'2026-03-27 00:48:13',NULL,NULL),(2,9,'Salida',2,'Pedido #4 (web)',NULL,1,'2026-04-19 14:50:40',NULL,NULL),(3,6,'Salida',2,'Pedido #5 (web)',NULL,1,'2026-04-28 18:09:20',NULL,NULL),(4,2,'Salida',3,'Pedido #6 (web)',NULL,1,'2026-04-05 16:11:18',NULL,NULL),(5,10,'Salida',1,'Pedido #6 (web)',NULL,1,'2026-04-05 16:11:18',NULL,NULL),(6,9,'Salida',2,'Pedido #7 (web)',NULL,1,'2026-07-27 20:45:13',NULL,NULL),(7,8,'Salida',1,'Pedido #8 (web)',NULL,1,'2026-06-16 15:27:13',NULL,NULL),(8,5,'Salida',3,'Pedido #8 (web)',NULL,1,'2026-06-16 15:27:13',NULL,NULL),(9,9,'Salida',3,'Pedido #8 (web)',NULL,1,'2026-06-16 15:27:13',NULL,NULL),(10,4,'Salida',2,'Pedido #8 (web)',NULL,1,'2026-06-16 15:27:13',NULL,NULL),(11,7,'Salida',1,'Pedido #10 (web)',NULL,1,'2026-05-05 15:11:14',NULL,NULL),(12,10,'Salida',3,'Pedido #10 (web)',NULL,1,'2026-05-05 15:11:14',NULL,NULL),(13,12,'Salida',3,'Pedido #10 (web)',NULL,1,'2026-05-05 15:11:14',NULL,NULL),(14,3,'Salida',3,'Pedido #10 (web)',NULL,1,'2026-05-05 15:11:14',NULL,NULL),(15,4,'Salida',2,'Pedido #11 (web)',NULL,1,'2026-04-11 18:56:48',NULL,NULL),(16,11,'Salida',1,'Pedido #11 (web)',NULL,1,'2026-04-11 18:56:48',NULL,NULL),(17,8,'Salida',3,'Pedido #11 (web)',NULL,1,'2026-04-11 18:56:48',NULL,NULL),(18,12,'Salida',3,'Pedido #12 (web)',NULL,1,'2026-04-04 21:53:34',NULL,NULL),(19,10,'Salida',3,'Pedido #12 (web)',NULL,1,'2026-04-04 21:53:34',NULL,NULL),(20,3,'Salida',3,'Pedido #12 (web)',NULL,1,'2026-04-04 21:53:34',NULL,NULL),(21,6,'Salida',3,'Pedido #12 (web)',NULL,1,'2026-04-04 21:53:34',NULL,NULL),(22,13,'Salida',1,'Pedido #13 (web)',NULL,1,'2026-08-10 22:04:47',NULL,NULL),(23,9,'Salida',2,'Pedido #13 (web)',NULL,1,'2026-08-10 22:04:47',NULL,NULL),(24,11,'Salida',2,'Venta POS #14',14,1,'2026-06-24 14:37:55',NULL,NULL),(25,9,'Salida',1,'Venta POS #15',15,1,'2026-06-24 16:28:30',NULL,NULL),(26,6,'Salida',1,'Venta POS #15',15,1,'2026-06-24 16:28:30',NULL,NULL),(27,5,'Salida',2,'Venta POS #15',15,1,'2026-06-24 16:28:30',NULL,NULL),(28,10,'Salida',2,'Venta POS #16',16,1,'2026-06-24 22:49:57',NULL,NULL),(29,8,'Salida',1,'Venta POS #16',16,1,'2026-06-24 22:49:57',NULL,NULL),(30,9,'Salida',1,'Venta POS #17',17,1,'2026-07-17 18:47:18',NULL,NULL),(31,10,'Salida',2,'Venta POS #17',17,1,'2026-07-17 18:47:18',NULL,NULL),(32,8,'Salida',2,'Venta POS #17',17,1,'2026-07-17 18:47:18',NULL,NULL),(33,11,'Salida',2,'Venta POS #18',18,1,'2026-07-17 22:22:40',NULL,NULL),(34,8,'Salida',2,'Venta POS #19',19,1,'2026-08-06 22:38:52',NULL,NULL),(35,10,'Salida',1,'Venta POS #20',20,1,'2026-08-06 16:53:35',NULL,NULL),(36,5,'Salida',2,'Venta POS #20',20,1,'2026-08-06 16:53:35',NULL,NULL),(37,3,'Salida',1,'Venta POS #21',21,1,'2026-08-13 14:01:19',NULL,NULL),(38,1,'Entrada',58,'Recepcion orden #1',NULL,1,'2026-06-26 22:34:19',NULL,NULL),(39,1,'Merma',2,'Merma recepcion orden #1 (2 daniadas)',NULL,1,'2026-06-26 16:54:55',NULL,NULL),(40,10,'Entrada',30,'Recepcion orden #1',NULL,1,'2026-06-27 00:12:29',NULL,NULL),(41,5,'Salida',12,'Traslado #1',NULL,1,'2026-07-30 15:04:00',1,1),(42,5,'Entrada',12,'Recepcion traslado #1',NULL,1,'2026-08-01 18:59:53',1,2),(43,30,'Salida',8,'Traslado #1',NULL,1,'2026-07-30 15:04:00',1,1),(44,30,'Entrada',8,'Recepcion traslado #1',NULL,1,'2026-08-01 15:00:03',1,2),(45,1,'Salida',10,'Traslado #2',NULL,1,'2026-08-10 18:17:59',2,1),(46,2,'Entrada',1,'Devolucion #1 (pedido #3)',NULL,1,'2026-08-09 15:31:56',NULL,NULL),(47,4,'Entrada',1,'Devolucion #2 (pedido #11)',NULL,1,'2026-08-09 23:38:52',NULL,NULL),(48,10,'Entrada',1,'Anulacion venta POS #20',20,1,'2026-08-13 15:45:46',NULL,NULL),(49,5,'Entrada',2,'Anulacion venta POS #20',20,1,'2026-08-13 15:45:46',NULL,NULL);
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_suscriptores`
--

DROP TABLE IF EXISTS `newsletter_suscriptores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_suscriptores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_suscriptores`
--

LOCK TABLES `newsletter_suscriptores` WRITE;
/*!40000 ALTER TABLE `newsletter_suscriptores` DISABLE KEYS */;
INSERT INTO `newsletter_suscriptores` VALUES (1,'andrea750@gmail.com',0,'2026-06-17 18:11:35'),(2,'marcos770@gmail.com',1,'2026-08-09 17:12:57'),(3,'sofia707@gmail.com',1,'2026-05-30 00:28:49'),(4,'diego790@gmail.com',1,'2026-07-13 19:56:16'),(5,'paulina373@gmail.com',1,'2026-02-08 16:14:35'),(6,'gabriel766@gmail.com',1,'2026-06-05 00:05:36'),(7,'fernanda462@gmail.com',1,'2026-04-30 19:11:05'),(8,'luis346@gmail.com',1,'2026-07-02 21:32:19'),(9,'carolina75@gmail.com',1,'2026-03-08 22:00:05'),(10,'roberto960@gmail.com',1,'2026-04-28 17:14:43'),(11,'marta403@gmail.com',1,'2026-04-24 21:16:03'),(12,'hugo845@gmail.com',1,'2026-03-15 14:16:44'),(13,'elena283@gmail.com',0,'2026-06-01 20:53:29'),(14,'ivan575@gmail.com',1,'2026-02-24 23:31:09'),(15,'paula199@gmail.com',1,'2026-07-10 15:26:46'),(16,'cristian194@gmail.com',0,'2026-08-03 20:13:32'),(17,'rosa929@gmail.com',1,'2026-02-26 16:52:06'),(18,'david628@gmail.com',1,'2026-04-05 23:34:38'),(19,'laura63@gmail.com',0,'2026-07-03 14:55:07'),(20,'jorge932@gmail.com',1,'2026-04-07 16:09:52');
/*!40000 ALTER TABLE `newsletter_suscriptores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `referencia_id` int(11) DEFAULT NULL,
  `leida` tinyint(1) DEFAULT 0,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,1,'caja','Caja abierta','Se abrio una nueva sesion de caja.',NULL,1,'2026-07-16 22:14:28'),(2,1,'stock','Stock bajo','Hay productos por debajo del stock minimo.',NULL,0,'2026-07-20 18:58:42'),(3,1,'stock','Stock bajo','Hay productos por debajo del stock minimo.',NULL,0,'2026-07-20 23:28:16'),(4,1,'pedido','Nuevo pedido recibido','Un cliente realizo un pedido por la web.',NULL,1,'2026-08-03 16:41:04'),(5,1,'pedido','Pedido enviado','El pedido ya esta en camino.',NULL,1,'2026-08-07 15:11:49'),(6,1,'stock','Stock bajo','Hay productos por debajo del stock minimo.',NULL,0,'2026-07-17 00:47:06'),(7,1,'stock','Stock bajo','Hay productos por debajo del stock minimo.',NULL,0,'2026-07-26 18:58:54'),(8,1,'pedido','Pedido enviado','El pedido ya esta en camino.',NULL,1,'2026-07-16 00:20:26'),(9,1,'stock','Stock bajo','Hay productos por debajo del stock minimo.',NULL,0,'2026-08-07 17:33:30'),(10,1,'pedido','Nuevo pedido recibido','Un cliente realizo un pedido por la web.',NULL,1,'2026-07-18 20:22:31'),(11,1,'cupon','Cupon por vencer','El cupon BIENVENIDA10 vence pronto.',NULL,0,'2026-07-14 14:39:20'),(12,1,'stock','Stock bajo','Hay productos por debajo del stock minimo.',NULL,0,'2026-07-18 21:12:11');
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivos_sucursal`
--

DROP TABLE IF EXISTS `objetivos_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetivos_sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal_id` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `meta_venta` decimal(10,2) DEFAULT 0.00,
  `meta_clientes` int(11) DEFAULT 0,
  `meta_ticket_promedio` decimal(10,2) DEFAULT 0.00,
  `ventas_reales` decimal(10,2) DEFAULT 0.00,
  `clientes_reales` int(11) DEFAULT 0,
  `ticket_promedio_real` decimal(10,2) DEFAULT 0.00,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_objetivos` (`sucursal_id`,`mes`,`anio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivos_sucursal`
--

LOCK TABLES `objetivos_sucursal` WRITE;
/*!40000 ALTER TABLE `objetivos_sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `objetivos_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_proveedor_detalle`
--

DROP TABLE IF EXISTS `orden_proveedor_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_proveedor_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad_solicitada` int(11) DEFAULT 0,
  `cantidad_recibida` int(11) DEFAULT 0,
  `cantidad_daniada` int(11) DEFAULT 0,
  `precio_unitario` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `idx_ord_detalle` (`orden_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_proveedor_detalle`
--

LOCK TABLES `orden_proveedor_detalle` WRITE;
/*!40000 ALTER TABLE `orden_proveedor_detalle` DISABLE KEYS */;
INSERT INTO `orden_proveedor_detalle` VALUES (1,1,1,60,58,2,3.00),(2,1,10,30,30,0,1.80),(3,2,25,40,0,0,2.50),(4,3,60,24,0,0,4.20),(5,3,5,36,0,0,9.50);
/*!40000 ALTER TABLE `orden_proveedor_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes_proveedor`
--

DROP TABLE IF EXISTS `ordenes_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` enum('Solicitado','Enviado','Recibido','Cancelado') DEFAULT 'Solicitado',
  `total_estimado` decimal(10,2) DEFAULT 0.00,
  `total_real` decimal(10,2) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ordenes_prov` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes_proveedor`
--

LOCK TABLES `ordenes_proveedor` WRITE;
/*!40000 ALTER TABLE `ordenes_proveedor` DISABLE KEYS */;
INSERT INTO `ordenes_proveedor` VALUES (1,1,1,'Recibido',234.00,234.00,'Pedido programado','2026-06-06 16:12:35','2026-06-18 19:08:56','2026-06-26 18:51:17'),(2,2,1,'Enviado',100.00,NULL,'Reabastecimiento mensual','2026-07-19 23:48:12','2026-07-29 00:09:36',NULL),(3,3,1,'Solicitado',442.80,NULL,'Pedido programado','2026-08-04 14:34:53',NULL,NULL);
/*!40000 ALTER TABLE `ordenes_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  `referencia` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `nota` text DEFAULT NULL,
  `comprobante` varchar(255) DEFAULT NULL,
  `tarjeta` text DEFAULT NULL,
  `direccion_entrega` text DEFAULT NULL,
  `monto_pagado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,3,'Transferencia',14.00,'Aprobado','PAG-DEMO3','2026-03-27 00:48:13',NULL,NULL,NULL,NULL,NULL),(2,4,'Tarjeta',0.50,'Aprobado','PAG-DEMO4','2026-04-19 14:50:40',NULL,NULL,NULL,NULL,NULL),(3,5,'Transferencia',6.00,'Aprobado','PAG-DEMO5','2026-04-28 18:09:20',NULL,NULL,NULL,NULL,NULL),(4,7,'Transferencia',0.50,'Aprobado','PAG-DEMO7','2026-07-27 20:45:13',NULL,NULL,NULL,NULL,NULL),(5,8,'Tarjeta',44.50,'Aprobado','PAG-DEMO8','2026-06-16 15:27:13',NULL,NULL,NULL,NULL,NULL),(6,10,'Transferencia',29.20,'Aprobado','PAG-DEMO10','2026-05-05 15:11:14',NULL,NULL,NULL,NULL,NULL),(7,11,'Transferencia',27.00,'Aprobado','PAG-DEMO11','2026-04-11 18:56:48',NULL,NULL,NULL,NULL,NULL),(8,12,'Tarjeta',29.70,'Aprobado','PAG-DEMO12','2026-04-04 21:53:34',NULL,NULL,NULL,NULL,NULL),(9,13,'Transferencia',4.50,'Aprobado','PAG-DEMO13','2026-08-10 22:04:47',NULL,NULL,NULL,NULL,NULL),(10,14,'Efectivo',2.00,'Aprobado','PAG-DEMO14','2026-06-24 14:37:55',NULL,NULL,NULL,NULL,NULL),(11,15,'Tarjeta',25.75,'Aprobado','PAG-DEMO15','2026-06-24 16:28:30',NULL,NULL,NULL,NULL,NULL),(12,16,'Efectivo',12.00,'Aprobado','PAG-DEMO16','2026-06-24 22:49:57',NULL,NULL,NULL,NULL,NULL),(13,17,'Tarjeta',20.25,'Aprobado','PAG-DEMO17','2026-07-17 18:47:18',NULL,NULL,NULL,NULL,NULL),(14,18,'Efectivo',2.00,'Aprobado','PAG-DEMO18','2026-07-17 22:22:40',NULL,NULL,NULL,NULL,NULL),(15,19,'Tarjeta',16.00,'Aprobado','PAG-DEMO19','2026-08-06 22:38:52',NULL,NULL,NULL,NULL,NULL),(16,21,'Efectivo',1.00,'Aprobado','PAG-DEMO21','2026-08-13 14:01:19',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `expira` bigint(20) NOT NULL,
  `usado` tinyint(1) NOT NULL DEFAULT 0,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES (1,'dilantarquino2004@gmail.com','762547',1789149206226,1,'2026-09-11 17:39:11'),(5,'dilantarquino2004@gmail.com','216826',1789149658417,1,'2026-09-11 17:50:58'),(6,'arielavioleta2020@gmail.com','165327',1789153118840,0,'2026-09-11 18:48:38');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_seguimientos`
--

DROP TABLE IF EXISTS `pedido_seguimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_seguimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `pedido_seguimientos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_seguimientos`
--

LOCK TABLES `pedido_seguimientos` WRITE;
/*!40000 ALTER TABLE `pedido_seguimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_seguimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `direccion_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('Pendiente','Confirmado','Enviado','Completado','Cancelado','Anulado') NOT NULL DEFAULT 'Pendiente',
  `metodo_pago` varchar(50) DEFAULT 'WhatsApp',
  `origen` enum('Web','POS') DEFAULT 'Web',
  `cupon_id` int(11) DEFAULT NULL,
  `caja_sesion_id` int(11) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `pagos` text DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `direccion_id` (`direccion_id`),
  KEY `cupon_id` (`cupon_id`),
  KEY `fk_pedido_caja` (`caja_sesion_id`),
  KEY `idx_pedidos_estado` (`estado`),
  KEY `idx_pedidos_fecha` (`fecha`),
  KEY `idx_pedidos_origen` (`origen`),
  CONSTRAINT `fk_pedido_caja` FOREIGN KEY (`caja_sesion_id`) REFERENCES `caja_sesiones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`direccion_id`) REFERENCES `direcciones` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`cupon_id`) REFERENCES `cupones` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,17,15,'2026-03-08 17:42:34',4.50,0.00,4.50,'Cancelado','Tarjeta','Web',NULL,NULL,'Entrega rápida por favor',NULL,NULL),(3,13,11,'2026-03-27 00:48:13',14.00,0.00,14.00,'Completado','WhatsApp','Web',NULL,NULL,'Llamar al llegar',NULL,NULL),(4,16,14,'2026-04-19 14:50:40',0.50,0.00,0.50,'Confirmado','Tarjeta','Web',NULL,NULL,'Entrega rápida por favor',NULL,NULL),(5,14,12,'2026-04-28 18:09:20',6.00,0.00,6.00,'Confirmado','WhatsApp','Web',NULL,NULL,'Regalo: envolver por favor',NULL,NULL),(6,17,15,'2026-04-05 16:11:18',23.00,0.00,23.00,'Pendiente','Tarjeta','Web',NULL,NULL,'',NULL,NULL),(7,11,9,'2026-07-27 20:45:13',0.50,0.00,0.50,'Enviado','WhatsApp','Web',NULL,NULL,'Regalo: envolver por favor',NULL,NULL),(8,16,14,'2026-06-16 15:27:13',44.50,0.00,44.50,'Confirmado','Tarjeta','Web',NULL,NULL,'',NULL,NULL),(9,13,11,'2026-04-23 20:44:11',32.00,3.20,28.80,'Cancelado','WhatsApp','Web',7,NULL,'Llamar al llegar',NULL,NULL),(10,12,10,'2026-05-05 15:11:14',29.20,0.00,29.20,'Enviado','Transferencia','Web',NULL,NULL,'Entrega rápida por favor',NULL,NULL),(11,14,12,'2026-04-11 18:56:48',27.00,0.00,27.00,'Completado','WhatsApp','Web',NULL,NULL,'Entrega rápida por favor',NULL,NULL),(12,15,13,'2026-04-04 21:53:34',33.00,3.30,29.70,'Enviado','Tarjeta','Web',7,NULL,'',NULL,NULL),(13,14,12,'2026-08-10 22:04:47',4.50,0.00,4.50,'Enviado','WhatsApp','Web',NULL,NULL,'Llamar al llegar',NULL,NULL),(14,2,NULL,'2026-06-24 14:37:55',2.00,0.00,2.00,'Completado','Efectivo','POS',NULL,5,'Venta en mostrador',NULL,NULL),(15,2,NULL,'2026-06-24 16:28:30',25.75,0.00,25.75,'Completado','Tarjeta','POS',NULL,5,'Venta en mostrador',NULL,NULL),(16,2,NULL,'2026-06-24 22:49:57',12.00,0.00,12.00,'Completado','Efectivo','POS',NULL,5,'Venta en mostrador',NULL,NULL),(17,2,NULL,'2026-07-17 18:47:18',20.25,0.00,20.25,'Completado','Tarjeta','POS',NULL,6,'Venta en mostrador',NULL,NULL),(18,2,NULL,'2026-07-17 22:22:40',2.00,0.00,2.00,'Completado','Efectivo','POS',NULL,6,'Venta en mostrador',NULL,NULL),(19,2,NULL,'2026-08-06 22:38:52',16.00,0.00,16.00,'Completado','Tarjeta','POS',NULL,7,'Venta en mostrador',NULL,NULL),(20,2,NULL,'2026-08-06 16:53:35',24.50,0.00,24.50,'Cancelado','Tarjeta','POS',NULL,7,'Venta en mostrador',NULL,NULL),(21,2,NULL,'2026-08-13 14:01:19',1.00,0.00,1.00,'Completado','Efectivo','POS',NULL,8,'Venta en mostrador',NULL,NULL),(22,2,NULL,'2026-09-10 09:35:09',1.00,0.00,1.00,'Pendiente','WhatsApp','Web',NULL,NULL,'',NULL,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) DEFAULT 5,
  `activo` tinyint(1) DEFAULT 1,
  `destacado` tinyint(1) DEFAULT 0,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio_costo` varchar(255) DEFAULT NULL,
  `precio_oferta` varchar(255) DEFAULT NULL,
  `en_oferta` tinyint(4) DEFAULT 0,
  `inicio_oferta` varchar(255) DEFAULT NULL,
  `fin_oferta` varchar(255) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `unidad_venta` varchar(20) DEFAULT 'Unidad',
  `unidades_por_caja` int(11) DEFAULT 1,
  `estado_inventario` varchar(30) DEFAULT 'Disponible',
  `codigo_barras` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `categoria_id` (`categoria_id`),
  KEY `idx_productos_categoria` (`categoria`),
  KEY `idx_productos_activo` (`activo`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,NULL,'A-Úrico',10.00,'/imagenes/a-urico-40tab.jpeg','Ayuda a regular los niveles de ácido úrico en el organismo y aliviar molestias articulares.','Suplementos',1,346,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20','3','7.50',1,'2026-08-03 15:44:42','2026-09-12 15:44:42',NULL,NULL,'Unidad',1,'Disponible',NULL),(2,NULL,'Ácido fólico',7.00,'/imagenes/folic-acid-400mcg.jpeg','Suplemento esencial para el desarrollo celular, recomendado para la etapa prenatal y salud general.','Vitaminas',2,296,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(3,NULL,'Aceite Anice Plus',1.00,'/imagenes/aceite-de-uso-topico-anice-plus.jpeg','Aceite de uso tópico ideal para masajes relajantes y alivio local.','Aceites',3,292,5,1,0,'2026-08-13 15:28:29','2026-09-10 09:35:09',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(4,NULL,'Aceite de Argán',1.00,'/imagenes/aceite-de-argan-10g.jpeg','Hidratación profunda para el cabello y la piel, aportando brillo y suavidad natural.','Cabello',4,297,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(5,NULL,'Aceite de Orégano',15.00,'/imagenes/aceite-oregano-comestible-30ml.jpeg','Extracto natural comestible con propiedades antioxidantes y apoyo al sistema inmune.','Suplementos',1,283,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:46',NULL,'11.25',1,'2026-08-03 15:44:42','2026-09-12 15:44:42',NULL,NULL,'Unidad',1,'Disponible',NULL),(6,NULL,'Agua de Florida',3.00,'/imagenes/agua-de-florida.jpeg','Loción aromática tradicional utilizada para refrescar el cuerpo y en prácticas esotéricas.','Esotéricos',5,294,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(7,NULL,'Agua de Florida Premium',6.50,'/imagenes/agua-de-florida2.jpeg','Versión de alta concentración aromática para frescura prolongada.','Esotéricos',5,299,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,'5.20',1,'2026-08-08 15:44:42','2026-09-02 15:44:42',NULL,NULL,'Unidad',1,'Disponible',NULL),(8,NULL,'Alcachofa',8.00,'/imagenes/alcachofa.jpeg','Coadyuvante natural para mejorar la digestión y apoyar la función hepática.','Hepáticos',6,291,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(9,NULL,'Aloe Vera + Vit E',0.25,'/imagenes/aloe-vera+vitamina-e.jpeg','Cápsula blanda para hidratación de la piel y regeneración celular.','Cuidado de la Piel',7,289,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(10,NULL,'Alumbre Barra',2.00,'/imagenes/alumbre-en-barra-30g.jpeg','Mineral natural ideal como desodorante hipoalergénico o astringente cutáneo.','Cuidado de la Piel',7,319,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:46','1.8',NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(11,NULL,'Ampollas cabello',1.00,'/imagenes/ampolla-para-el-cabello.jpeg','Tratamiento intensivo para la reparación de puntas y fortalecimiento folicular.','Cabello',4,295,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(12,NULL,'Anticolesterol',5.00,'/imagenes/anticolesterol.jpeg','Mezcla herbolaria orientada a equilibrar los lípidos en el torrente sanguíneo.','Cardiovascular',8,294,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(13,NULL,'Arniflex Gel',4.00,'/imagenes/arniflex-gel-masage-muscular.jpeg','Gel de masaje muscular con árnica para alivio rápido de tensiones y golpes.','Analgésicos',9,299,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(14,NULL,'Ashwagandha 600mg',16.00,'/imagenes/ashwagandha-extract-600mg.jpeg','Adaptógeno natural que ayuda a reducir el estrés y aumentar la vitalidad física.','Relajantes',10,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(15,NULL,'Ashwagandha Premium',12.00,'/imagenes/ashwagangha-linea-premium-60caps.jpeg','Fórmula de alta pureza para el control de la ansiedad y mejora del descanso nocturno.','Relajantes',10,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(16,NULL,'Azufre Alumbre',2.00,'/imagenes/azufre-alumbre.jpeg','Barra mineral indicada para el tratamiento local de imperfecciones en pieles grasas.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(17,NULL,'B12 100tab',7.00,'/imagenes/b-12-100tab.jpeg','Vitamina esencial para el sistema nervioso y la producción de glóbulos rojos.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(18,NULL,'Benzo Garden',7.00,'/imagenes/benzo-garden-crema-facial-60g.jpeg','Crema facial protectora y suavizante para el cuidado diario del cutis.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(19,NULL,'Bio Eco Sweet (Propóleo)',6.00,'/imagenes/bio-eco-sweet-25ml.jpeg','Gotas de propóleo para aliviar molestias en la garganta y desinfectar la boca.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(20,NULL,'Biolica',6.00,'/imagenes/biolica.jpeg','Suplemento dietético en polvo para apoyar los procesos de pérdida de peso.','Suplementos',1,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(21,NULL,'Biotina 600mg',6.00,'/imagenes/biotina-30cap-600mg.jpeg','Vitamina clave para estimular el crecimiento saludable del cabello, uñas y piel.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(22,NULL,'Calcio + Vitamina D',6.00,'/imagenes/calcio+d-30cap.jpeg','Combinación óptima para el mantenimiento de la densidad ósea y dientes sanos.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(23,NULL,'Calcium + D',16.00,'/imagenes/calcio+d-30cap.jpeg','Suplemento de alta absorción para la prevención de la debilidad ósea.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(24,NULL,'Calostro Bovino',10.00,'/imagenes/calostro-calostro-bobina.jpeg','Rico en inmunoglobulinas para potenciar activamente las defensas del cuerpo.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(25,NULL,'Cannabis',7.50,'/imagenes/crema-cannabis-129g.jpeg','Crema tópica corporal ideal para dar masajes en zonas con fatiga muscular.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(26,NULL,'Caramelos Ginseng',0.15,'/imagenes/Caramelo-ginseng.jpeg','Pastillas dulces estimulantes para un aporte rápido de energía mental.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(27,NULL,'Caramelos Jengibre',0.15,'/imagenes/Caramelos-jengibre.jpeg','Caramelos reconfortantes para mitigar la tos y refrescar las vías respiratorias.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(28,NULL,'Caramelos Própolis',0.15,'/imagenes/Caramelos-de-propoleo.jpeg','Pastillas con propóleo natural que suavizan y protegen la garganta irritada.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(29,NULL,'Carbon Activado',5.00,'/imagenes/carbon-activado+sabila-100cap.jpeg','Ayuda a absorber toxinas en el sistema digestivo y mitigar los gases.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(30,NULL,'Centella Asiática',7.00,'/imagenes/centella-asiatica-y-spirulina.jpeg','Favorece la circulación periférica y el cuidado elástico de los tejidos.','Circulación',15,292,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:45:20',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(31,NULL,'Chanca Piedra',10.00,'/imagenes/chanca-piedra-60cap.jpeg','Tradicional coadyuvante en la disolución y eliminación de cálculos renales.','Renales',16,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(32,NULL,'Chupetes Pectina',0.30,'/imagenes/chupete-vitamina-C.jpeg','Golosina funcional suave adicionada con vitaminas para los más pequeños.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(33,NULL,'Chupetes Vit C',0.30,'/imagenes/Chupete-de-Pectina.jpeg','Paletas con agradable sabor y dosis ligera de Vitamina C para las defensas.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(34,NULL,'Citrato Magnesio 900g',16.00,'/imagenes/citrato-de-magnesio-900g.jpeg','Polvo concentrado para balance muscular, relajación nerviosa y vitalidad metabólica.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(35,NULL,'Citrato Magnesio Cap',7.00,'/imagenes/citrato-de-magnesio-100cap-600mg.jpeg','Cápsulas de fácil ingesta para cubrir el requerimiento diario de magnesio.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(36,NULL,'Citrato Potasio 500ml',10.00,'/imagenes/citrato-de-potasio-500ml.jpeg','Solución líquida que asiste en el equilibrio electrolítico y función renal.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(37,NULL,'Citrato Potasio Cap',7.00,'/imagenes/citrato-de-potasio-100cap-600mg.jpeg','Mineral en cápsulas para dar soporte a la función del sistema muscular.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(38,NULL,'Climater',16.00,'/imagenes/climater-40cap.jpeg','Alivio natural de las molestias ocasionadas por el climaterio y la menopausia.','Salud Femenina',17,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(39,NULL,'Clorofila Detox',12.00,'/imagenes/clorofila-detox-600ml.jpeg','Bebida verde concentrada diseñada para la desintoxicación del organismo.','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(40,NULL,'Cloruro Magnesio Sol',7.00,'/imagenes/cloruro-de-magnesio-1000ml.jpeg','Suplemento mineral líquido para articulaciones y vitalidad sistémica.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(41,NULL,'CocoSol',7.50,'/imagenes/cocosol-275ml.jpeg','Aceite cosmético o alimenticio a base de coco puro multiusos.','Aceites',3,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(42,NULL,'Colagen-Hidro 1000g',15.00,'/imagenes/colagen-hidrolizado-10000g.jpeg','Formato familiar de colágeno hidrolizado para la firmeza de piel y tendones.','Colágenos',19,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(43,NULL,'Colageina + C',10.00,'/imagenes/colageina-colageno-hidrolizado+c.jpeg','Colágeno optimizado con Vitamina C para asegurar su fijación en los tejidos.','Colágenos',19,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(44,NULL,'Colageina Crema',10.00,'/imagenes/colageina-crema-cosmetica-120g.jpeg','Tratamiento en crema para combatir las líneas de expresión faciales.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(45,NULL,'Colageno Hidrolizado',10.00,'/imagenes/colageno-hidrolizado-tipo1.jpeg','Suplemento Tipo 1 especializado en la salud de articulaciones y cartílagos.','Colágenos',19,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(46,NULL,'Colestermac',7.00,'/imagenes/colestermac-100tab-500mg.jpeg','Ayuda a mantener estables las lecturas de grasas en la sangre de forma natural.','Cardiovascular',8,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(47,NULL,'Colon Live',12.00,'/imagenes/colon-live-500g.jpeg','Suplemento de fibra natural enfocado en regularizar el tránsito del colon.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(48,NULL,'Coloriss',3.00,'/imagenes/coloriss.jpeg','Tinte o producto capilar de cuidado de color de origen controlado.','Cabello',4,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(49,NULL,'Complejo B 400mg',8.00,'/imagenes/complejo-b-400mg-30cap.jpeg','Grupo completo de vitaminas B para optimizar la energía del sistema nervioso.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(50,NULL,'Complejo Green B',2.75,'/imagenes/complejo-green-b-120ml.jpeg','Solución bebible herbolaria enriquecida con vitaminas del grupo B.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(51,NULL,'Concha de Nacar',6.50,'/imagenes/concha-de-nacar-50g.jpeg','Crema aclarante tradicional que atenúa manchas superficiales de la piel.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(52,NULL,'Crecitol Jarabe',6.50,'/imagenes/crecitol-multivitaminico-120ml.jpeg','Sirope multivitamínico formulado para estimular el apetito y desarrollo infantil.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(53,NULL,'Crema Anti-Hongos',6.00,'/imagenes/crema-anti-hongos.jpeg','Ungüento de aplicación local efectivo contra afecciones dérmicas micóticas.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(54,NULL,'Crema Azufre Tubo',2.00,'/imagenes/crema-azufre-alumbre.jpeg','Fórmula secante ideal para brotes localizados y cuidado cutáneo purificante.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(55,NULL,'Crema Rosa Mosqueta',6.50,'/imagenes/crema-rosa-mosqueta.jpeg','Especializada en la regeneración de tejidos dañados, estrías y cicatrices.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(56,NULL,'Cúrcuma Caps',8.50,'/imagenes/curcuma-100cap-600mg.jpeg','Poderoso antiinflamatorio y antioxidante natural encapsulado para protección digestiva.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(57,NULL,'Detox Fibra',7.00,'/imagenes/detox.jpeg','Compuesto fibroso diseñado para una limpieza profunda del tracto digestivo.','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(58,NULL,'Dexe Black Hair',1.00,'/imagenes/dexe-black-hair-shampoo.jpeg','Shampoo corrector que cubre canas de forma inmediata devolviendo el tono oscuro.','Cabello',4,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(59,NULL,'Dexe Brown Black',1.00,'/imagenes/dexe-brown-black-25ml.jpeg','Sachet de tinte express tono castaño oscuro de fácil aplicación en casa.','Cabello',4,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(60,NULL,'Dexe Dark Brown',1.00,'/imagenes/dexe-shampoo-dark-brown.jpeg','Shampoo tonalizador para matices castaños en cabellos apagados.','Cabello',4,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(61,NULL,'Diabemac Plus',7.00,'/imagenes/diabemac-Plus-100tab.jpeg','Suplemento en tabletas auxiliar en el control saludable de la glucosa.','Naturales',20,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(62,NULL,'Diabemac Plus Liq',15.00,'/imagenes/diabemac+plus-500ml.jpeg','Extracto soluble concentrado para el equilibrio metabólico del azúcar.','Naturales',20,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(63,NULL,'Dulcamara',6.00,'/imagenes/dulcamara.jpeg','Extracto puro de la planta reconocido por sus bondades regenerativas generales.','Naturales',20,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(64,NULL,'El Caballito',4.50,'/imagenes/el-caballito.jpeg','Tónico tradicional herbolario vigorizante para el cuerpo.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(65,NULL,'Eligarden',8.50,'/imagenes/eligarden-baba-de-caracol.jpeg','Gel fluido de baba de caracol que favorece la elasticidad facial.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(66,NULL,'Energiton',14.00,'/imagenes/energiton.jpeg','Suplemento reconstituyente completo para combatir estados intensos de fatiga.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(67,NULL,'Enfermedades de la Mujer',12.00,'/imagenes/enfermedad-de-la-mujer-100cap.jpeg','Compuesto botánico orientado a mitigar dolores menstruales e inflamación interna.','Salud Femenina',17,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(68,NULL,'Equinácea Propóleo',7.00,'/imagenes/equinacea+propoleo-500ml.jpeg','Elixir invernal protector que robustece la respuesta inmune respiratoria.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(69,NULL,'Eua Cologne Jocker',8.00,'/imagenes/eua-de-cologne-club-jocker.jpeg','Colonia refrescante masculina de uso diario.','Hogar',21,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(70,NULL,'Eucamiel Sobre',0.70,'/imagenes/Eucamiel.jpeg','Dosis individual de jarabe de miel con eucalipto para el alivia de la tos.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(71,NULL,'Eucamiel Tabletas',0.50,'/imagenes/Ecumiel-Tabletas.jpeg','Pastillas masticables para despejar la garganta y la congestión.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(72,NULL,'Fenogreco Semillas',5.00,'/imagenes/wayra-mikuna-fenogreco.jpeg','Semillas naturales ideales para infusiones reconstructoras y ganancia nutricional.','Suplementos',1,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(73,NULL,'Fibra Pitahaya',6.00,'/imagenes/fibra-pitahaya.jpeg','Aprovecha las propiedades laxantes naturales de la pitahaya para el estreñimiento.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(74,NULL,'Flor de Jamaica',1.00,'/imagenes/Flor-de-jamaica.jpeg','Flores deshidratadas ideales para preparar infusiones diuréticas refrescantes.','Tés',22,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(75,NULL,'Formula 15 D',15.00,'/imagenes/formula-15d.jpeg','Complejo concentrado depurativo para regímenes estrictos de limpieza orgánica.','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(76,NULL,'Ganoderma + C',10.00,'/imagenes/ganoderma+c-zinc.jpeg','Hongo reishi potenciado con zinc y vitamina C para la protección celular inmune.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(77,NULL,'Garlic Oil',5.00,'/imagenes/garlic-oil-100cap-500mg.jpeg','Cápsulas de aceite de ajo que asisten la presión y la desinfección interna.','Cardiovascular',8,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(78,NULL,'Gascol Colon',6.50,'/imagenes/gascol-new-colon-500ml.jpeg','Jarabe protector de la mucosa gástrica e intestinal para estómagos sensibles.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(79,NULL,'Gastrizan natu',5.00,'/imagenes/gastrizan-natu-100cap.jpeg','Cápsulas herbolarias indicadas para calmar la acidez y ardor estomacal.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(80,NULL,'Gel Garden Analgésico',7.00,'/imagenes/gel-analgesico-garden-120g.jpeg','Fricción fría desinflamatoria para torceduras y espaldas adoloridas.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(81,NULL,'Gel Garden Forte',8.00,'/imagenes/gel-garden-forte-140g.jpeg','Fórmula reforzada mentolada para dolores crónicos de articulaciones.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(82,NULL,'Gel Quitadol Forte',8.00,'/imagenes/gel-quitadol-forte.jpeg','Acción analgésica penetrante en gel para aliviar tensiones musculares del cuello.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(83,NULL,'Geriatril Jarabe',11.00,'/imagenes/geriatril-jarabe-500ml.jpeg','Multivitamínico tónico diseñado para la vitalidad y energía del adulto mayor.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(84,NULL,'Ginkgo 100tab',7.00,'/imagenes/ginkgo-biloba-100tab-600mg.jpeg','Asistente de la oxigenación cerebral que mejora la lucidez y memoria.','Cerebral',23,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(85,NULL,'Ginseng Ginkgo',6.50,'/imagenes/ginseng+ginkgo-biloba-500ml.jpeg','Combinación dinámica para potenciar el rendimiento físico y la concentración.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(86,NULL,'HGH 3',19.00,'/imagenes/hgh-3.jpeg','Fórmula orientada al estímulo del antienvejecimiento celular y energía.','Antioxidantes',24,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(87,NULL,'Higa Life Blandas',12.00,'/imagenes/higa_life-60cap-blandas.jpeg','Cápsulas de gelatina blanda para una rápida asimilación y protección del hígado.','Hepáticos',6,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(88,NULL,'Higa Riñomac Liq',6.50,'/imagenes/higa-riñomac-500ml.jpeg','Depurativo dual líquido que asiste los filtros hepáticos y renales.','Renales',16,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(89,NULL,'Higa-Life Duras',14.00,'/imagenes/higa-life-100capsulas-duras.jpeg','Tratamiento herbolario extenso para desintoxicar el hígado graso.','Hepáticos',6,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(90,NULL,'Higamac Plus Liq',6.50,'/imagenes/higamac-plus-500ml.jpeg','Tónico fluido amargo que estimula la producción biliar y digestión correcta.','Hepáticos',6,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(91,NULL,'Higariño Factors',16.00,'/imagenes/higariño-factors.jpeg','Suplemento avanzado para el cuidado integral de los riñones y vías urinarias.','Renales',16,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(92,NULL,'Incienso Lavanda',1.00,'/imagenes/inciensos.jpeg','Varitas aromáticas de lavanda idóneas para relajar ambientes estresantes.','Hogar',21,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(93,NULL,'Inmunolive Caps',14.00,'/imagenes/inmunolive-40cap-500mg.jpeg','Cápsulas inmunomoduladoras de origen vegetal.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(94,NULL,'Inmunolive Oral',13.00,'/imagenes/inmunolive-solucion-oral-120ml.jpeg','Solución líquida de rápida acción para fortalecer defensas post-resfriados.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(95,NULL,'Issue Prod',4.50,'/imagenes/issue.jpeg','Tratamiento acondicionador capilar nutritivo.','Cabello',4,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(96,NULL,'Jabon Exfoliante',3.00,'/imagenes/jabon-exfoliante.jpeg','Remueve células muertas superficiales de la piel devolviendo tersura.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(97,NULL,'Jabones Dr. Peña',2.00,'/imagenes/jabon-sulfuroso-del-dr-peña.jpeg','Jabón medicinal sulfuroso recomendado para el control del acné y grasa cutánea.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(98,NULL,'Jabones Esotéricos',1.50,'/imagenes/jabones-esotericos.jpeg','Línea de jabones con esencias herbales específicas para limpias y energías.','Esotéricos',5,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(99,NULL,'Jabones medicinales',2.00,'/imagenes/jabones-medicinales.jpeg','Variedad de barras de limpieza con extractos antisépticos naturales.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(100,NULL,'Jabones RCH Aromma',2.00,'/imagenes/jabones-aroma.jpeg','Jabones artesanales con ricas fragancias relajantes para el baño diario.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(101,NULL,'Jengibre Liq',4.50,'/imagenes/jengibre-400ml.jpeg','Extracto bebible para estimular la digestión y desinflamar el organismo.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(102,NULL,'Jengibre Prop C',9.00,'/imagenes/jengibre-propoleo-vitamina-c-500ml.jpeg','Poderoso tónico protector de las vías respiratorias ante cambios de clima.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(103,NULL,'Jugo detox',8.00,'/imagenes/jugo-detox.jpeg','Zumo concentrado herbolario limpiador del sistema digestivo.','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(104,NULL,'K2 + D3 90c',18.00,'/imagenes/vitaminas-k2+d3-90caps.jpeg','Sinergia de vitaminas encargada de fijar adecuadamente el calcio en los huesos.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(105,NULL,'Kolom',12.00,'/imagenes/kolom.jpeg','Suplemento especializado en la desinflamación del intestino irritable.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(106,NULL,'Komilon Jalea',8.00,'/imagenes/komilon-kids-jalea-240ml.jpeg','Emulsión dulce fortificada para incentivar el apetito infantil.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(107,NULL,'L-Arginina',18.00,'/imagenes/l-arginina-60cap-750mg.jpeg','Aminoácido precursor del óxido nítrico, mejora el flujo sanguíneo y muscular.','Suplementos',1,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(108,NULL,'L-Arginina Kids',13.50,'/imagenes/l-arginina-kids+hierro.jpeg','Suplemento infantil adicionado con hierro para apoyar el desarrollo físico.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:44:42',NULL,'10.80',1,'2026-08-08 15:44:42','2026-09-02 15:44:42',NULL,NULL,'Unidad',1,'Disponible',NULL),(109,NULL,'Limpieza intestinal',2.00,'/imagenes/limpieza-intestinal.jpeg','Tratamiento natural de corta duración para desahuciar toxinas intestinales.','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(110,NULL,'Manteca Cacao Pura',0.25,'/imagenes/manteca-de-cacao.jpeg','Humedad sólida natural ideal para la prevención de labios agrietados.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(111,NULL,'Maximum Power Células Madre',20.00,'/imagenes/power-celulas-madres.jpeg','Estimulador natural de regeneración tisular y energía física avanzada.','Antioxidantes',24,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(112,NULL,'Melatonina 600 Caps',11.00,'/imagenes/melatonina-600mg.jpeg','Regulador biológico natural que facilita un sueño profundo y reparador.','Relajantes',10,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(113,NULL,'Mentol Sikura',1.00,'/imagenes/mentol-sikura.jpeg','Ungüento mentolado clásico para frotaciones descongestionantes locales.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(114,NULL,'Moringa Super',7.00,'/imagenes/moringa.jpeg','Superalimento cargado de aminoácidos y hierro para combatir la anemia.','Suplementos',1,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(115,NULL,'Multi Cbrina Niños',8.50,'/imagenes/multi-cbrina-kids-240ml.jpeg','Emulsión vitamínica cerebral enfocada en el rendimiento escolar de infantes.','Cerebral',23,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(116,NULL,'Multicbrina Caps',9.50,'/imagenes/multicbrina-40cap-500mg.jpeg','Cápsulas reconstituyentes del sistema nervioso y cansancio mental.','Cerebral',23,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(117,NULL,'Multivit Minerales',7.00,'/imagenes/Multivitaminas-y-minerales.jpeg','Cubre las deficiencias nutricionales de las dietas diarias modernas.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(118,NULL,'Noni Linaza Spirulina',8.00,'/imagenes/megafiber.jpeg','Súper fibra laxante que regula de forma integral la digestión pesada.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(119,NULL,'Nutrifort',11.00,'/imagenes/nutrifort.jpeg','Suplemento alimenticio fortificado para ganar peso de manera balanceada.','Suplementos',1,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(120,NULL,'Omega 3 1000mg',11.00,'/imagenes/omega-3-1.000mg.jpeg','Ácidos grasos esenciales protectores del sistema circulatorio y cardíaco.','Cardiovascular',8,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(121,NULL,'Omega 3 1400mg',13.00,'/imagenes/omega-3-1400mg.jpeg','Alta concentración de EPA/DHA para el control de los triglicéridos elevados.','Cardiovascular',8,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(122,NULL,'Omega 3 6 9',7.00,'/imagenes/omega-3-6-9-1400mg.jpeg','Perfil completo de ácidos grasos saludables para piel, cerebro y corazón.','Cardiovascular',8,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(123,NULL,'Oregano Oil + Garlic + Zinc',10.00,'/imagenes/oregano-oil.jpeg','Tratamiento natural con fuerte acción antiséptica y antiviral interna.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(124,NULL,'Ortiga Negra 500',6.50,'/imagenes/ortiga-negra-500ml.jpeg','Extracto tradicional depurador de la sangre y desinflamante de articulaciones.','Renales',16,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(125,NULL,'Osteo live',14.00,'/imagenes/osteo-live-60cap.jpeg','Nutrición articular directa para frenar el desgaste de rodillas y cadera.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(126,NULL,'Ovarimac Liq',6.50,'/imagenes/ovarimac-500ml.jpeg','Sirope botánico que promueve el balance de las hormonas femeninas.','Salud Femenina',17,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(127,NULL,'Ovarina 40c',12.00,'/imagenes/ovarina-40cap.jpeg','Ayuda a regular los periodos menstruales irregulares y calmar cólicos.','Salud Femenina',17,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(128,NULL,'PankreoLive',6.00,'/imagenes/pankreoLive-40cap.jpeg','Protección vegetal enzimática que auxilia al páncreas en sus funciones.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(129,NULL,'Parásitosis Jarabe',6.50,'/imagenes/Parásitosis.jpeg','Expulsor natural herbolario apto para el saneamiento intestinal cíclico.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(130,NULL,'Piperazina Garden',7.00,'/imagenes/piperazina-garden.jpeg','Solución clásica antiparasitaria herbolaria purificadora.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(131,NULL,'Polen Abeja',5.00,'/imagenes/polen-frasco.jpeg','Granulado energético puro directo de la colmena con proteínas naturales.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(133,NULL,'Pomada Coca Marih',4.00,'/imagenes/pomada-coca+marihuana.jpeg','Pomada de coca y marihuana sirve para dolores musculares, calambres, resfriados','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(134,NULL,'Preson Mac Liq',6.50,'/imagenes/preson-mac-500ml.jpeg','Presonmac sirve para regular la presión arterial alta, ayudar a controlar los niveles de colesterol y triglicéridos, y mejorar la salud del sistema cardiovascular.','Cardiovascular',8,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(135,NULL,'Propóleo 6 en 1',6.00,'/imagenes/propoleo-6-en-1-500ml.jpeg','Propóleo 6 en 1 sirve para fortalecer el sistema inmunológico y aliviar afecciones respiratorias.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(136,NULL,'Prosta Eros 60',20.00,'/imagenes/prosta-eros-60cap.jpeg','Prosta Eros sirve para síntomas de la inflamación de la próstata y la uretra.','Salud Masculina',25,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(137,NULL,'Prosta Zeus Duo',20.00,'/imagenes/prosta-zeus-duo-500mg.jpeg','Prosta Zeus sirve para síntomas de la inflamación de la próstata y la uretra.','Salud Masculina',25,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(138,NULL,'Prostalex Caps',12.00,'/imagenes/prostalex-40cap.jpeg','Prostalex sirve para síntomas de la inflamación de la próstata y la uretra.','Salud Masculina',25,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(139,NULL,'Prostazan Prozul',5.00,'/imagenes/prostazan-prozul-health-100cap.jpeg','Prostazan ayuda a la salud prostática y del tracto urinario, ayudando a reducir la inflamación, aliviar el dolor y mejorar el flujo urinario.','Salud Masculina',25,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(140,NULL,'QuitaDol',8.00,'/imagenes/quitadol.jpeg','Quitadol sirve para aliviar dolor de cabeza y articulaciones , malestar corporal y de gripe','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(141,NULL,'Quitadol Flex',6.00,'/imagenes/quitadol-flex.jpeg','Quitadol Flex sirve para aliviar de forma prolongada el dolor articular, muscular, de cabeza, rodilla y espalda.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(142,NULL,'RCalcumac',6.50,'/imagenes/rcalcumac-500ml.jpeg','Rcalcumac ayuda a eliminar cálculos renales y biliares. Es coadyuvante en el tratamiento inflamatorio de las vías urinarias.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(143,NULL,'Resveratrol 30cap',10.00,'/imagenes/resveratrol-30cap.jpeg','Resveratrol + jugo de uva sirve para Reducir el envejecimiento celular.Mejorar la salud cardiovascular.Apoya la función cerebral.Fortalece el sistema inmunológico.','Antioxidantes',24,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(144,NULL,'Resveratrol NAD',20.00,'/imagenes/resveratrol-nad+nac-60capsulas.jpeg','Resveratrol Nad+Nac sirve para combatir el envejecimiento celular, potenciar la energía y proteger el organismo.','Antioxidantes',24,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(145,NULL,'Reum Stop',12.00,'/imagenes/reum-stop.jpeg','Reun Stop sirve para dolor de articulaciones','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(146,NULL,'Rompe Calculos',5.00,'/imagenes/rompe-calculos-100cap-300mg.jpeg','Elimina cálculos renales y biliares','Renales',16,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(147,NULL,'Rosa Mosqueta Aceite',6.00,'/imagenes/aceite-topico-rosa-mosqueta.jpeg','Aceite rosa mosqueta sirve para atenuar cicatrices, estrías, manchas y arrugas, estimular el colágeno, mejorar la elasticidad y tratar pieles secas o dañadas.','Aceites',3,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(148,NULL,'Sal Inglesa',0.90,'/imagenes/sal-inglesa.jpeg','Sal inglesa sirve como laxante para el estreñimiento','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(149,NULL,'Salud Mujer Caps',5.00,'/imagenes/enfermedad-de-la-mujer-100cap.jpeg','Fórmula femenina','Salud Femenina',17,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(150,NULL,'Sangre de Drago Nat',2.00,'/imagenes/sangre-de-drago.jpeg','Sangre de drago sirve como Cicatrizante natural Antiinflamatorio natural Antibacteriano natural.','Cuidado de la Piel',7,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(151,NULL,'Saw Palmetto 250',5.00,'/imagenes/saw-palmetto-100cap-250mg.jpeg','Saw Palmetto sirve para síntomas de la inflamación de la próstata y la uretra.','Salud Masculina',25,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(152,NULL,'Seven lax',5.00,'/imagenes/seven-lax.jpeg','Seven -Lax es un laxante natural para aliviar el estreñimiento ocasional, estimular el tránsito intestinal y promover la eliminación de toxinas.','Digestivos',14,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(153,NULL,'Shot ginseng',1.00,'/imagenes/shot-de-ginseng.jpeg','Shots de ginseng sirve para aumentar la energía física y mental, combatir la fatiga y mejorar la concentración.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(154,NULL,'Shot potenciador',1.00,'/imagenes/shot-potenciadores.jpeg','Shots/potenciadores sirven para mejorar el rendimiento, aumentar la libido y fortalecer la erección, brindando energía.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(155,NULL,'Stevia Drops',6.00,'/imagenes/stevia-drop.jpeg','Stevia en gotas es un edulcorante natural y saludable sin calorías, ideal para endulzar bebidas y repostería sin cambiar el sabor.','Endulzantes',26,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(156,NULL,'Strongermac',6.50,'/imagenes/strongmac-plus.jpeg','Strongermac sirve para la menopausia; ayuda a reducir síntomas como sofocos (bochornos), depresión, irritabilidad, insomnio, ansiedad y migraña.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(157,NULL,'Super Calcium 600',16.00,'/imagenes/super-calcium-600mg.jpeg','Calcium + D sirve para fortalecer los huesos y dientes, prevenir la osteoporosis y asegurar una correcta absorción del calcio en el organismo.','Minerales',12,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(158,NULL,'Sylimarin',10.00,'/imagenes/sylimarin-q10-60cap.jpeg','Sirve para mejorar la función hepática y la salud general.','Hepáticos',6,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(159,NULL,'Té Verde Liq',7.00,'/imagenes/te-verde-500ml.jpeg','Té verde sirve para evaluar el metabolismo para la pérdida de peso, mejorar la función cerebral y promover la salud cardiovascular.','Tés',22,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(160,NULL,'Te 22 Plantas',1.20,'/imagenes/te-medicinal-22-plantas.jpeg','Sirve para desintoxicar el organismo, mejorar la digestión, calmar el sistema nervioso, aliviar malestares respiratorios y reforzar el sistema inmunológico.','Tés',22,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(161,NULL,'Toro Negro Caps',12.00,'/imagenes/toro-negro-60cap.jpeg','Sirve para mejorar el rendimiento físico y mental, y reducir la fatiga.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(162,NULL,'Totuma de Jengibre',4.00,'/imagenes/totuma-de-jengibre-400ml.jpeg','Totuma de jengibre y propóleo sirve para aliviar afecciones respiratorias como la tos, el dolor de garganta, la congestión nasal y los síntomas de gripe.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(163,NULL,'Tratamiento repolarizador',3.00,'/imagenes/repolarizador.jpeg','Repolarizador para el cabello','Cabello',4,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(164,NULL,'Triple C Advance',1.00,'/imagenes/triple-c-advance-bebida.jpeg','Triple C Advance sirve para fortalecer el sistema inmunológico, gracias a su combinación de Vitamina C, Complejo B, Vitamina D3, Magnesio y Zinc.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(165,NULL,'Triple C Total',1.25,'/imagenes/triple-c-total-vitaminac-200mg.jpeg','Triple C Total sirve para fortalecer el sistema inmunológico y estimular la producción de colágeno, con Vitamina C 2000mg, B12, D3, Zinc y Biotina.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(166,NULL,'Triple Maca Polvo',10.00,'/imagenes/triple-maca-459gr.jpeg','Triple maca en polvo sirve para Aumentar la energía, mejorar el rendimiento físico y mental, y equilibrar el sistema hormonal.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(167,NULL,'Uña de Gato Liq',6.50,'/imagenes/uña-de-gato=sangre-de-drago-500ml.jpeg','Uña de gato + sangre de drago sirve para fortalecer el sistema inmunológico, combatir inflamaciones, aliviar problemas gástricos como úlceras y acelerar la cicatrización interna y externa.','Sistema Inmune',11,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(168,NULL,'Uro Collagen Probiotic',14.00,'/imagenes/uro-collagen-polvo.jpeg','Uro Collagen en polvo es un suplemento dietético que combina colágeno con probióticos para apoyar la salud de las articulaciones, la piel y el equilibrio digestivo.','Colágenos',19,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(169,NULL,'Uro Probiotic Vaginal',8.00,'/imagenes/uro-jarabe.jpeg','Uro Probiotic es un suplemento dietético diseñado para el equilibrio de la flora vaginal y el apoyo a la salud urinaria.','Naturales',20,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(170,NULL,'Uro Vaginal Probiotic (Cápsulas)',18.00,'/imagenes/uro-pastillas.jpeg','Uro en cápsulas es un suplemento dietético que apoya la salud vaginal, ayudando a conocer el olor, mantener el pH equilibrado y favorecer la flora vaginal.','Naturales',20,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(171,NULL,'VagiCrem',6.00,'/imagenes/vagicream-uso-topico-vaginal.jpeg','Vagicrem sirve para tratar infecciones por hongos, principalmente la candidiasis vulvovaginal. Sirve para eliminar hongos, aliviando síntomas como picazón, ardor,','Salud Femenina',17,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(172,NULL,'Valeriana gotas',4.00,'/imagenes/valeriana-gotas.jpeg','Valeriana es un sedante natural y relajante para el sistema nervioso que ayuda a combatir el insomnio.','Relajantes',10,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(173,NULL,'Vapo Garden Ana',5.70,'/imagenes/vapo-garden-analgesico-20ml.jpeg','Sirve para aliviar dolores musculares, articulares y contracturas, además de descongestionar vías respiratorias.','Analgésicos',9,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(174,NULL,'Velas de Colores Grandes',0.50,'/imagenes/velas-de-colores-grandes.jpeg','Velas grandes para decoración','Hogar',21,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(175,NULL,'Velas Pequeñas',0.20,'/imagenes/velas-de-colores-y-blancas-pequeñas.jpeg','Velas pequeñas disponibles en color blanco y variedad de colores; ideales para peticiones, decoración o uso ritual según el color elegido.','Esotéricos',5,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(176,NULL,'VenoFlash',16.00,'/imagenes/venoflash-40cap.jpeg','Venoflash sirve para prevenir y tratar las varices, estimular la micro-circulación. Aliviar los calambres y las piernas cansadas.','Circulación',15,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(177,NULL,'Vinatu',6.00,'/imagenes/vinatu.jpeg','Vinagre de manzana con madre sirve para bajar de peso y regular los niveles de azúcar en la sangre','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(178,NULL,'Vino Cerebral 500',13.00,'/imagenes/vino-cerebral-500ml.jpeg','Vino cerebral sirve para la memoria y la concentración, contribuye al rendimiento mental y favorece la claridad y el enfoque.','Cerebral',23,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(179,NULL,'Vitacerebrina',9.00,'/imagenes/vitacerebrina.jpeg','Vitacerebrina sirve para mejorar el rendimiento cognitivo, aumentar la concentración y la memoria, y combatir el cansancio físico y mental.','Cerebral',23,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(180,NULL,'Vitamina A Caps',7.50,'/imagenes/vitamina-a-100cap-400mg.jpeg','Vitamina A sirve para la visión, el crecimiento, la división celular y la reproducción.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(181,NULL,'Vitamina C 240ml',8.50,'/imagenes/vitamina-c-240ml.jpeg','Vitamina C sirve para reforzar el sistema inmunológico.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(182,NULL,'Vitamina D3',12.00,'/imagenes/vitamin-d3-4000iu.jpeg','Vitamina D3 sirve para fortalecer el sistema inmunológico, mejorar la absorción de calcio y fósforo, y mantener la salud ósea y muscular.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(183,NULL,'Vitamina E 400 UI 30c',7.50,'/imagenes/e-400-u.i.vitamina-30cap.jpeg','Vitamina E sirve para fortalecer el sistema inmunológico, mejorar la salud cardiovascular y proteger la piel (hidratación y cicatrización).','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(184,NULL,'Vitamina K Caps',7.00,'/imagenes/vitamina-k.jpeg','Vitamina K sirve para una coagulación sanguínea correcta, previniendo hemorragias, y para la salud ósea, ayudando a fijar el calcio en los huesos.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(185,NULL,'Vitamina K2 + D3',20.00,'/imagenes/vitaminas-k2+d3-90caps.jpeg','Vitamina K2 + D3 sirve para fortalecer los huesos y mejorar la salud cardiovascular, asegurando que el calcio se dirija correctamente al sistema óseo.','Vitaminas',2,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(186,NULL,'Vitatoro Tónico',9.00,'/imagenes/vitatoro-tonico-nutricional-500ml.jpeg','Vitatoro sirve para combatir la fatiga física y mental, prevenir la anemia y aumentar la vitalidad diaria.','Energéticos',13,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(187,NULL,'Zarzaparrilla Liq',7.00,'/imagenes/zarzaparrilla-500ml.jpeg','Zarzaparilla sirve para desinflamar el hígado y las vías urinarias, tratar la retención de líquidos y la depuración de la sangre.','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL),(188,NULL,'Zarzaparilla Tab',7.00,'/imagenes/zarzaparilla-100tab-500mg.jpeg','Zarzaparilla sirve ayudan a desintoxicar el organismo, eliminar líquidos. Inflamacion de vías urinarias.Depuración de la sangre','Desintoxicantes',18,300,5,1,0,'2026-08-13 15:28:29','2026-08-13 15:28:29',NULL,NULL,0,NULL,NULL,NULL,NULL,'Unidad',1,'Disponible',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_kits`
--

DROP TABLE IF EXISTS `productos_kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_kits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `producto_base_id` int(11) DEFAULT NULL,
  `precio_kit` decimal(10,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `producto_base_id` (`producto_base_id`),
  CONSTRAINT `productos_kits_ibfk_1` FOREIGN KEY (`producto_base_id`) REFERENCES `productos` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_kits`
--

LOCK TABLES `productos_kits` WRITE;
/*!40000 ALTER TABLE `productos_kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `productos_que_surte` text DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `lead_time_dias` int(11) DEFAULT 7,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Natural Life','Carlos Espinoza','0991112222','ventas@naturallife.ec','Av. Amazonas 1000, Quito','Vitaminas, suplementos, te',NULL,1,5,'2026-08-13 15:41:04'),(2,'Herbolario El Germen','Lucia Ramos','0993334444','contacto@elgermen.ec','Calle Cordero 250, Quito','Hierbas medicinales, tes',NULL,1,7,'2026-08-13 15:41:04'),(3,'Importadora SaludMax','Jorge Andrade','0995556666','pedidos@saludmax.ec','Av. Interoceánica 150, Cumbaya','Aceites esenciales, cremas',NULL,1,10,'2026-08-13 15:41:04'),(4,'Cosmeticos Naturales ECO','Martha Paredes','0997778888','info@ecoeco.ec','Av. Mariscal Sucre 300, Quito','Cosmetica natural, jabones',NULL,1,6,'2026-08-13 15:41:04');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntos_cliente`
--

DROP TABLE IF EXISTS `puntos_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `puntos_actuales` int(11) DEFAULT 0,
  `puntos_total_historial` int(11) DEFAULT 0,
  `nivel` varchar(30) DEFAULT 'Bronce',
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_usuario` (`usuario_id`),
  CONSTRAINT `puntos_cliente_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos_cliente`
--

LOCK TABLES `puntos_cliente` WRITE;
/*!40000 ALTER TABLE `puntos_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntos_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntos_historial`
--

DROP TABLE IF EXISTS `puntos_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos_historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `puntos` int(11) NOT NULL,
  `tipo` enum('ganado','canjeado','expirado','ajuste') NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `puntos_historial_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos_historial`
--

LOCK TABLES `puntos_historial` WRITE;
/*!40000 ALTER TABLE `puntos_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntos_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartidores`
--

DROP TABLE IF EXISTS `repartidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartidores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `vehiculo` varchar(100) DEFAULT NULL,
  `zona` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartidores`
--

LOCK TABLES `repartidores` WRITE;
/*!40000 ALTER TABLE `repartidores` DISABLE KEYS */;
/*!40000 ALTER TABLE `repartidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resenas`
--

DROP TABLE IF EXISTS `resenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL CHECK (`calificacion` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `aprobada` tinyint(1) DEFAULT 0,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `idx_resenas_producto` (`producto_id`),
  CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resenas`
--

LOCK TABLES `resenas` WRITE;
/*!40000 ALTER TABLE `resenas` DISABLE KEYS */;
INSERT INTO `resenas` VALUES (1,8,17,4,'Buena relacion calidad-precio.',0,'2026-06-11 23:52:32'),(2,7,12,5,'Cumple con lo prometido.',0,'2026-08-08 17:46:28'),(3,10,12,4,'El producto es bueno, entrega puntual.',1,'2026-07-23 22:00:21'),(4,7,15,4,'El producto es bueno, entrega puntual.',1,'2026-06-08 17:56:50'),(5,12,13,4,'El producto es bueno, entrega puntual.',0,'2026-06-27 16:25:30'),(6,13,16,5,'Excelente producto, muy buenos resultados.',1,'2026-07-25 00:21:10'),(7,2,18,3,'No me funciono del todo, pero es buena marca.',1,'2026-07-31 16:14:57'),(8,3,13,4,'Me llego rapido y en buen estado.',1,'2026-07-30 16:38:05'),(9,3,2,5,'Buen precio y buena calidad.',1,'2026-06-20 14:03:54'),(10,8,16,5,'Mi familia lo usa y funciona muy bien.',1,'2026-07-28 18:51:58'),(11,2,15,3,'No me funciono del todo, pero es buena marca.',1,'2026-07-17 00:49:00'),(12,3,18,4,'Buena relacion calidad-precio.',1,'2026-05-24 19:38:58'),(13,9,18,5,'Lo compre de nuevo, definitivamente funciona.',1,'2026-06-10 16:11:15'),(14,6,15,5,'Muy buen servicio, me asesoraron bien.',1,'2026-08-04 15:21:46'),(15,8,18,5,'Buen precio y buena calidad.',1,'2026-07-28 22:47:30'),(16,8,2,5,'Muy buen servicio, me asesoraron bien.',0,'2026-07-29 15:59:38'),(17,9,14,4,'El producto es bueno, entrega puntual.',1,'2026-06-07 22:04:46'),(18,13,14,3,'Esta bien, pero podria mejorar el empaque.',1,'2026-06-10 21:42:23'),(19,11,14,3,'No me funciono del todo, pero es buena marca.',0,'2026-06-28 00:43:53'),(20,10,2,5,'Buen precio y buena calidad.',1,'2026-05-30 18:22:41'),(21,2,11,4,'Me llego rapido y en buen estado.',1,'2026-07-12 18:09:04'),(22,2,12,4,'El producto es bueno, entrega puntual.',1,'2026-05-18 15:03:30'),(23,3,15,4,'Lo recomiendo, aunque tarda en hacer efecto.',1,'2026-06-13 16:01:57'),(24,3,13,5,'Excelente producto, muy buenos resultados.',1,'2026-07-08 21:13:01'),(25,10,2,3,'No me funciono del todo, pero es buena marca.',1,'2026-06-26 18:38:13'),(26,13,2,5,'Mejoro mi digestion notablemente.',1,'2026-08-02 17:50:23');
/*!40000 ALTER TABLE `resenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_sessions`
--

DROP TABLE IF EXISTS `sso_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `expira_en` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_sessions`
--

LOCK TABLES `sso_sessions` WRITE;
/*!40000 ALTER TABLE `sso_sessions` DISABLE KEYS */;
INSERT INTO `sso_sessions` VALUES (3,'f19f469c904942e27389a1d816108a2b7ba0a86c7e985afbed5cd63223554cff','mfatest@test.com','2026-09-09 18:53:27','2026-09-10 06:53:27'),(4,'f0fa3df394348af5717a20abb1299456840cfaf1b50ece69a185c553abfa1474','mfatest@test.com','2026-09-09 18:53:27','2026-09-10 06:53:27'),(5,'61047947d6bc7c71fbbce633f908d46d661fadd36a4657707039627e2fdee95a','admin@admin.com','2026-09-09 22:14:06','2026-09-10 10:14:06'),(6,'90e7e57f1e73f1bfbe08eed14a3f6c3a84325bf4fe29ca9a4532144e255b68df','superadmin@centro.com','2026-09-09 22:14:25','2026-09-10 10:14:25'),(7,'3ac041af0716d7cb81e64245ac979c06be0ce749f0fd8a966e727fb35dc3dbb8','vendedor@centro.com','2026-09-09 22:14:42','2026-09-10 10:14:42'),(8,'7efa3b256f4ac711990351766fd08346f2170235c2ee5309fb77f81cf4dc5732','inventario@centro.com','2026-09-09 22:14:56','2026-09-10 10:14:56'),(9,'1905ce4bb1f46015ea4cb47537c3dfeced533938ca7d050fac82deb4acfd026c','gerente@centro.com','2026-09-09 22:15:01','2026-09-10 10:15:01'),(10,'c1f00303dfdd39cfce117009d07e07616983b2b6896a9404492250fa3f9e5877','dilantarquino2004@gmail.com','2026-09-09 22:15:08','2026-09-10 10:15:08'),(11,'d143e8a98bd2f9cb40b1cc4a25a6597a98cfd3b2192998ca85149ef35c8d9ea6','admin@admin.com','2026-09-09 22:16:55','2026-09-10 10:16:55'),(12,'3c53c1aae0031b9b93c0ac94294a4675ebd1e92a2c50dd0e235bc49cef3f96d6','superadmin@centro.com','2026-09-09 22:17:15','2026-09-10 10:17:15'),(13,'7c6a875f88ffca238fbaab807aa64f5d36a8ba41caa2b21b9e01d4391e364c71','vendedor@centro.com','2026-09-09 22:17:25','2026-09-10 10:17:25'),(14,'c4a89f60a3be87c1513fff09106dad6534f974d0494ce016722fef67e1cc6b4d','inventario@centro.com','2026-09-09 22:17:49','2026-09-10 10:17:49'),(16,'6df3312b615c588027cd2e21bcf53bc16beb9fd13bfefb4d33628947c83cc865','dilantarquino2004@gmail.com','2026-09-09 22:32:10','2026-09-10 10:32:10'),(19,'7f046e78412980d965c360c6d2b3cb4b5b3fd9dd6e3bc6b630279cf6a24a9e06','dilantarquino2004@gmail.com','2026-09-09 22:46:04','2026-09-10 10:46:04'),(21,'062d31abd931b5b7a88e58b9862994f4b51470ed0578e62f50c7355f24d307ce','dilantarquino2004@gmail.com','2026-09-09 22:59:25','2026-09-10 10:59:25'),(22,'8dc87c105a135d33050dfd66c90eacbeabc35a06b02fc380f1253be0fb4b86e7','dilantarquino2004@gmail.com','2026-09-09 23:54:21','2026-09-10 11:54:21'),(24,'89adf000b8f0af80797861666b0903355981827e8bd00ca564c1d085931a6ad2','dilantarquino2004@gmail.com','2026-09-10 08:13:25','2026-09-10 20:13:25'),(25,'51419b441bf47ce634e789a903a9013dab98293a542e914364237ef4bd8a409e','admin@admin.com','2026-09-10 08:14:10','2026-09-10 20:14:10'),(26,'dee3715683f6efc13243c7e5a9094168365c3b0bbe283463df7c9a0de90ad14b','superadmin@centro.com','2026-09-10 08:14:23','2026-09-10 20:14:23'),(27,'4ae7c7100392fcd23f02d4e27f0607f17d83c8ea734b3508d8cc8f8e4e30b6c8','vendedor@centro.com','2026-09-10 08:14:31','2026-09-10 20:14:31'),(28,'fce38d0cb46c0eb4bc8106b5b47056ea281aeb97924d11592cc28fe45d98904d','inventario@centro.com','2026-09-10 08:14:39','2026-09-10 20:14:39'),(31,'371c1532b6b643e089cbd784732fdc80820e990d886bb8d95881e05d1d7c761f','inventario@centro.com','2026-09-10 09:03:43','2026-09-10 21:03:43'),(32,'30a6db836268c5ccc7f17474d6a3019ca55efe39bbad61d0847c40c4cd660768','superadmin@centro.com','2026-09-10 09:03:52','2026-09-10 21:03:52'),(34,'6f078e5a68d55872eb6011c758e479f3f3152be8cfe2365a11fb4f4e4ecf4625','dilantarquino2004@gmail.com','2026-09-10 09:06:01','2026-09-10 21:06:01'),(35,'203b3ea2985fb76d9af3f5da181f29459c03f0ffa98a9851387d62620eb1b8f6','admin@admin.com','2026-09-10 09:06:55','2026-09-10 21:06:55'),(36,'b661c0fb348e0e2c7def7e1a141dee483515ac6b9b7152350aa9507f63376958','superadmin@centro.com','2026-09-10 09:07:04','2026-09-10 21:07:04'),(37,'0c845f79a93b0508d6bf6a4c2c1a84a206344c511a1a69720015b470f706ab80','vendedor@centro.com','2026-09-10 09:07:16','2026-09-10 21:07:16'),(39,'e38fa68eb4eaa5f83c50063862c6ae9092b86c6cfc3dcf02d08864c1a17f49fd','dilantarquino2004@gmail.com','2026-09-10 09:10:50','2026-09-10 21:10:50'),(40,'84c2ea687ba07d3cc4f2585841edc3b20e92f9062e91e80e17768ac260799ccd','admin@admin.com','2026-09-10 09:11:34','2026-09-10 21:11:34'),(41,'2cf391e8421785ff1313c6adbe4226febb90b666c595ee199ac8fcef3a7c279c','superadmin@centro.com','2026-09-10 09:11:46','2026-09-10 21:11:46'),(42,'7d1e291ffd6e1f920ee42ca20c516757e47748a776844dcd2e438c3a6cae4798','vendedor@centro.com','2026-09-10 09:11:55','2026-09-10 21:11:55'),(43,'5cbef44dc4cb5a613fad4517890dcce20a869515d28da7a82951261e564b457e','inventario@centro.com','2026-09-10 09:12:03','2026-09-10 21:12:03'),(45,'7b85f69bf43a33c6b034098e3e68e20bdf0064ac33a186f965343266d5034b0b','superadmin@centro.com','2026-09-10 09:20:43','2026-09-10 21:20:43'),(46,'af4062cb617c18668939fe67457300b1739a9b435452e696385d73d9cb884733','superadmin@centro.com','2026-09-10 19:49:49','2026-09-11 07:49:49'),(48,'07f4fda846f94dc42a694b005e5bf36de5c610c26e7a5ee46477b8cd0cbc95aa','dilantarquino2004@gmail.com','2026-09-11 12:51:32','2026-09-12 00:51:32'),(50,'7086b09fd0c333fdc099e9de69f146e871e4906858cbe211d176fefbe76738a9','dilantarquino2004@gmail.com','2026-09-11 13:01:21','2026-09-12 01:01:21'),(52,'182c0fdab88fb1d5d7f9f820c68decd6af6efb692e533b83dec6c7a3338057c5','dilantarquino2004@gmail.com','2026-09-11 13:28:02','2026-09-12 01:28:02'),(57,'3cf97b095eb8170179e19aa3b1981135a52971a6c91cbd76d876a94adb6ea8b2','dilantarquino2004@gmail.com','2026-09-11 13:56:24','2026-09-12 01:56:24'),(62,'b6112b3c04277766ebd978eaa36d76bf990a934229591d924ee077f84f0986ab','dilantarquino2004@gmail.com','2026-09-11 14:10:54','2026-09-12 02:10:54'),(63,'cc03ee9ad998c03359a474a054fe9ffe5d770c869ccc3d9a3b40461ce140fc69','dilantarquino2004@gmail.com','2026-09-12 19:34:26','2026-09-13 07:34:26'),(65,'5b8b30ed2148effa42b341d7aee803d665a0d4b49b774487d1d27979ba369bf8','admin@admin.com','2026-09-12 19:38:04','2026-09-13 07:38:04'),(67,'360675d5fdea7155cc830e484a43af77b0a5c03f2b3b4444413bea04a95333f2','dilantarquino2004@gmail.com','2026-09-12 19:41:21','2026-09-13 07:41:21'),(68,'ce63d367e95ec2f9a25fbe09661fd200eb0d1b9a3dd9da2f1d7f76d494f9b588','superadmin@centro.com','2026-09-12 20:02:30','2026-09-13 08:02:30');
/*!40000 ALTER TABLE `sso_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_alertas`
--

DROP TABLE IF EXISTS `stock_alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_alertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `umbral_minimo` int(11) DEFAULT 5,
  `umbral_maximo` int(11) DEFAULT 500,
  `activa` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `stock_alertas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_alertas`
--

LOCK TABLES `stock_alertas` WRITE;
/*!40000 ALTER TABLE `stock_alertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Matriz','Av. Principal 123, Quito','02-2222222',1),(2,'Sucursal Norte','Av. de la Prensa 456, Quito','02-3333333',1),(3,'Sucursal Sur','Av. Quitumbe 789, Quito','02-4444444',1);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripciones`
--

DROP TABLE IF EXISTS `suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  `frecuencia` enum('Quincenal','Mensual','Bimestral','Trimestral') DEFAULT 'Mensual',
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `estado` enum('Activa','Pausada','Cancelada') DEFAULT 'Activa',
  `proxima_entrega` date DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_cancelacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `suscripciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `suscripciones_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripciones`
--

LOCK TABLES `suscripciones` WRITE;
/*!40000 ALTER TABLE `suscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traslado_detalle`
--

DROP TABLE IF EXISTS `traslado_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traslado_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traslado_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tras_detalle` (`traslado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traslado_detalle`
--

LOCK TABLES `traslado_detalle` WRITE;
/*!40000 ALTER TABLE `traslado_detalle` DISABLE KEYS */;
INSERT INTO `traslado_detalle` VALUES (1,1,5,12),(2,1,30,8),(3,2,1,10);
/*!40000 ALTER TABLE `traslado_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traslados`
--

DROP TABLE IF EXISTS `traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traslados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal_origen_id` int(11) NOT NULL,
  `sucursal_destino_id` int(11) NOT NULL,
  `estado` enum('En transito','Recibido','Cancelado') DEFAULT 'En transito',
  `usuario_id` int(11) DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `fecha_envio` datetime DEFAULT current_timestamp(),
  `fecha_recepcion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traslados`
--

LOCK TABLES `traslados` WRITE;
/*!40000 ALTER TABLE `traslados` DISABLE KEYS */;
INSERT INTO `traslados` VALUES (1,1,2,'Recibido',1,'Reposicion Sucursal Norte','2026-07-30 15:04:00','2026-08-01 20:11:11'),(2,1,3,'En transito',1,'Traslado hacia Sucursal Sur','2026-08-10 18:17:59',NULL);
/*!40000 ALTER TABLE `traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('user','admin','super_admin','vendedor','inventario','gerente_sucursal') DEFAULT 'user',
  `sucursal_id` int(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `email_verificado` tinyint(1) DEFAULT 0,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `fecha_eliminacion` datetime DEFAULT NULL,
  `mfa_secreto` varchar(64) DEFAULT NULL,
  `mfa_activo` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','admin@admin.com','$2b$10$5uP.QDaV0FHXQveiUwdNFO5gjs/XAHmXS71nzKFDjfhfilVfU0XCG','admin',NULL,NULL,NULL,NULL,1,1,NULL,'2026-08-13 15:41:04',NULL,NULL,0),(2,'Usuario Demo','dilantarquino2004@gmail.com','$2b$10$m.QfAYqx0i/AwZ85QCoasuqQhH4n/b/xsMkMIet7LJleGVLugn9Ae','user',NULL,NULL,NULL,NULL,1,1,NULL,'2026-08-13 15:41:04',NULL,'Y2AMBDMDUZDNGP2NDHEI2MUMXG6IMAYF',0),(11,'María Andrade','maria.andrade1@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0941550893',NULL,NULL,1,1,NULL,'2026-02-09 16:48:25',NULL,NULL,0),(12,'Juan Pérez','juan.perez2@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0972247691',NULL,NULL,1,1,NULL,'2026-06-09 00:35:18',NULL,NULL,0),(13,'Sofía Castro','sofia.castro3@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0974070741',NULL,NULL,1,1,NULL,'2026-03-22 19:53:12',NULL,NULL,0),(14,'Diego Morales','diego.morales4@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0972719150',NULL,NULL,1,1,NULL,'2026-03-05 00:39:04',NULL,NULL,0),(15,'Paulina Vega','paulina.vega5@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0932483354',NULL,NULL,1,1,NULL,'2026-05-29 14:43:00',NULL,NULL,0),(16,'Gabriel Ruiz','gabriel.ruiz6@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0931079859',NULL,NULL,1,1,NULL,'2026-06-09 19:24:51',NULL,NULL,0),(17,'Fernanda Salazar','fernanda.salazar7@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0931210541',NULL,NULL,1,1,NULL,'2026-06-30 15:24:31',NULL,NULL,0),(18,'Luis Tapia','luis.tapia8@demo.com','$2b$10$4LUDyjQRtHsW8CA6BRqZUedsmINPWRFkfocTW9sSpCjkSVJZpBu.K','user',NULL,'0937189055',NULL,NULL,1,1,NULL,'2026-06-04 18:59:49',NULL,NULL,0),(19,'Super Administrador','superadmin@centro.com','$2b$10$1WIpvUVGjx4/ZlISyQ/pZ.MCU07pDf.A9N9hoGtISQgrIFq6xnKvq','super_admin',NULL,NULL,NULL,NULL,1,0,NULL,'2026-09-07 17:24:45',NULL,NULL,0),(20,'Vendedor Ejemplo','vendedor@centro.com','$2b$10$BpnTwU/mXtjz0zoa5PDIbObcqrcXrAvBytyf5dRrVFxK3hIIvsSCm','vendedor',NULL,NULL,NULL,NULL,1,0,NULL,'2026-09-07 17:24:45',NULL,NULL,0),(21,'Inventario Ejemplo','inventario@centro.com','$2b$10$PUS2TbzZyem2vl4/KxLhU.JUddhARic9yXMk49ZVum4CGluesIZoe','inventario',NULL,NULL,NULL,NULL,1,0,NULL,'2026-09-07 17:24:45',NULL,NULL,0),(22,'Gerente Sucursal 1','gerente@centro.com','$2b$10$pKg5YZS39Iqw8gMYe1Hdx.Wf9zFVtPnkE3Bd/qJj3rLD6DT5Rzu7K','gerente_sucursal',1,NULL,NULL,NULL,1,0,NULL,'2026-09-07 17:24:45',NULL,NULL,0),(23,'MFA Test','mfatest@test.com','$2b$10$z5sU1ZobUhdvL9ttaccDU.oNyQptuXhxR/ERfw0nn953a9hGRB7ea','user',NULL,NULL,NULL,NULL,1,0,NULL,'2026-09-09 18:53:26',NULL,NULL,0),(25,'dwwddw','wkdjkwjdkw@jdkdjkdwjkd','$2b$10$0atvbCaJxbd85KO4IYaFherCQl8BA7XLy3YLE.ayA5Sx1UsXevZVq','user',NULL,NULL,NULL,NULL,1,0,NULL,'2026-09-11 13:42:45',NULL,NULL,0),(26,'karina','arielavioleta2020@gmail.com','$2b$10$DKL2.hCF4kUyQW.Thqsoc.yUY1wMz.B.aM2LgcgL6/bKV0bjOJsnC','user',NULL,NULL,NULL,NULL,0,0,NULL,'2026-09-11 13:48:26','2026-10-11 14:07:42',NULL,0),(28,'toge','Vocesanonimas20225@gmail.com','$2b$10$8U/yVQUkpNGvkqhx7v/1AOFa8Fg/Va9J8jmZzREPFWfUy1LfCHREO','user',NULL,NULL,NULL,NULL,1,0,NULL,'2026-09-11 14:09:28',NULL,NULL,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_alertas`
--

DROP TABLE IF EXISTS `vendedor_alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_alertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tipo` enum('pedido_nuevo','caja_pendiente','stock_bajo','meta') NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `mensaje` text DEFAULT NULL,
  `leida` tinyint(1) DEFAULT 0,
  `enlace` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `vendedor_alertas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_alertas`
--

LOCK TABLES `vendedor_alertas` WRITE;
/*!40000 ALTER TABLE `vendedor_alertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_metas`
--

DROP TABLE IF EXISTS `vendedor_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_metas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `meta_venta` decimal(10,2) DEFAULT 0.00,
  `ventas_realizadas` decimal(10,2) DEFAULT 0.00,
  `comision_porcentaje` decimal(5,2) DEFAULT 0.00,
  `comision_monto` decimal(10,2) DEFAULT 0.00,
  `estado` enum('Pendiente','Alcanzada','Superada') DEFAULT 'Pendiente',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_metas` (`usuario_id`,`mes`,`anio`),
  CONSTRAINT `vendedor_metas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_metas`
--

LOCK TABLES `vendedor_metas` WRITE;
/*!40000 ALTER TABLE `vendedor_metas` DISABLE KEYS */;
INSERT INTO `vendedor_metas` VALUES (1,20,9,2026,2500.00,0.00,5.00,0.00,'Pendiente','2026-09-09 22:18:56');
/*!40000 ALTER TABLE `vendedor_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_anuladas`
--

DROP TABLE IF EXISTS `ventas_anuladas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_anuladas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `motivo` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_anuladas`
--

LOCK TABLES `ventas_anuladas` WRITE;
/*!40000 ALTER TABLE `ventas_anuladas` DISABLE KEYS */;
INSERT INTO `ventas_anuladas` VALUES (1,20,1,'Cliente devolvio el producto','2026-08-06 16:53:35');
/*!40000 ALTER TABLE `ventas_anuladas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_offline`
--

DROP TABLE IF EXISTS `ventas_offline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_offline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `pagos` varchar(100) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `fecha_local` datetime DEFAULT NULL,
  `fecha_sincronizada` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_offline`
--

LOCK TABLES `ventas_offline` WRITE;
/*!40000 ALTER TABLE `ventas_offline` DISABLE KEYS */;
INSERT INTO `ventas_offline` VALUES (1,2,7.50,'Efectivo','[{\"producto_id\":1,\"cantidad\":1}]','2026-08-11 20:10:59','2026-08-11 22:28:43');
/*!40000 ALTER TABLE `ventas_offline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificaciones_registro`
--

DROP TABLE IF EXISTS `verificaciones_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificaciones_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `expira` bigint(20) NOT NULL,
  `usado` tinyint(1) NOT NULL DEFAULT 0,
  `creado` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_verificaciones_registro_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificaciones_registro`
--

LOCK TABLES `verificaciones_registro` WRITE;
/*!40000 ALTER TABLE `verificaciones_registro` DISABLE KEYS */;
INSERT INTO `verificaciones_registro` VALUES (2,'toge','Vocesanonimas20225@gmail.com','$2b$10$8U/yVQUkpNGvkqhx7v/1AOFa8Fg/Va9J8jmZzREPFWfUy1LfCHREO','909856',1789154323142,1,'2026-09-11 19:08:43'),(3,'toge','Vocesanonimas20225@gmail.com','$2b$10$P1bUvqyOux.QVlYN4nkrQeBB6NGCGvT66o4NIoFwbFc/lO07DC/3m','118883',1789154324980,1,'2026-09-11 19:08:44');
/*!40000 ALTER TABLE `verificaciones_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_ventas_por_producto`
--

DROP TABLE IF EXISTS `vista_ventas_por_producto`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_por_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_por_producto` AS SELECT 
 1 AS `producto_id`,
 1 AS `nombre`,
 1 AS `categoria`,
 1 AS `unidades_vendidas`,
 1 AS `total_vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `centro_naturista`
--

USE `centro_naturista`;

--
-- Final view structure for view `vista_ventas_por_producto`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_por_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_por_producto` AS select `p`.`id` AS `producto_id`,`p`.`nombre` AS `nombre`,`p`.`categoria` AS `categoria`,ifnull(sum(`dp`.`cantidad`),0) AS `unidades_vendidas`,ifnull(sum(`dp`.`subtotal`),0) AS `total_vendido` from ((`detalle_pedidos` `dp` join `productos` `p` on(`p`.`id` = `dp`.`producto_id`)) join `pedidos` `pe` on(`pe`.`id` = `dp`.`pedido_id`)) where `pe`.`estado` <> 'Cancelado' group by `p`.`id`,`p`.`nombre`,`p`.`categoria` */;
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

-- Dump completed on 2026-09-12 20:46:59
