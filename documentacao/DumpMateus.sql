-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_mateus
-- ------------------------------------------------------
-- Server version	5.5.43

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) DEFAULT NULL,
  `nomeCompleto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'786.297.643-68','Renato de Araujo Oliveira'),(2,'999.999.999-99','José Maria Cantanhede');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filialid` int(11) DEFAULT NULL,
  `produtoid` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_filiad_idx` (`filialid`),
  KEY `pk_produto_idx` (`produtoid`),
  CONSTRAINT `pk_filiad` FOREIGN KEY (`filialid`) REFERENCES `filiais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_produto` FOREIGN KEY (`produtoid`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,1,40),(2,2,1,50),(3,1,2,55),(4,2,2,99),(5,1,3,100),(6,1,3,100),(7,1,4,100),(8,1,5,100),(9,1,6,100),(10,1,7,100),(11,1,8,100),(12,1,9,100),(13,1,10,100),(14,1,11,100),(15,1,12,100),(16,1,13,100),(17,1,14,100),(18,1,15,100),(19,1,16,100),(20,1,17,100),(21,1,18,20),(22,1,19,100),(23,1,20,40);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiais`
--

DROP TABLE IF EXISTS `filiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filiais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiais`
--

LOCK TABLES `filiais` WRITE;
/*!40000 ALTER TABLE `filiais` DISABLE KEYS */;
INSERT INTO `filiais` VALUES (1,'Mateus COHAMA'),(2,'Mateus TURU'),(3,'Mateus João Paulo'),(4,'Mateus Atacarejo Vinhais'),(5,'Mateus Renacensa');
/*!40000 ALTER TABLE `filiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'À VISTA'),(2,'BOLETO'),(3,'CARTÃO');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedidoestoqueid` int(11) DEFAULT NULL,
  `produtoid` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `valor_unitario` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pedidoestoque_idx` (`pedidoestoqueid`),
  KEY `pk_produtos_itens_idx` (`produtoid`),
  CONSTRAINT `pk_pedidoestoque` FOREIGN KEY (`pedidoestoqueid`) REFERENCES `pedido_estoque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_produtos_itens` FOREIGN KEY (`produtoid`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,2,5,2,9.99,49.95),(23,14,1,4,2,8.59,34.36),(24,15,1,2,2,8.59,17.18);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_estoque`
--

DROP TABLE IF EXISTS `pedido_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `filialid` int(11) DEFAULT NULL,
  `usuarioid` int(11) DEFAULT NULL,
  `clienteid` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_filial_pedido_idx` (`filialid`),
  KEY `pk_usuarios_pedido_idx` (`usuarioid`),
  KEY `pk_clientes_pedido_idx` (`clienteid`),
  CONSTRAINT `pk_filial_pedido` FOREIGN KEY (`filialid`) REFERENCES `filiais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_usuarios_pedido` FOREIGN KEY (`usuarioid`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_clientes_pedido` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_estoque`
--

LOCK TABLES `pedido_estoque` WRITE;
/*!40000 ALTER TABLE `pedido_estoque` DISABLE KEYS */;
INSERT INTO `pedido_estoque` VALUES (1,1,1,2,1,'nota'),(11,1,1,1,2,'pedido retirar no depósito'),(12,1,1,1,2,'retirar pedido no deposito'),(13,1,2,2,1,'teste'),(14,1,1,1,1,'teste'),(15,1,1,1,1,'wwwerwe');
/*!40000 ALTER TABLE `pedido_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codbarras` varchar(256) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'000648880008849938883900088','Desodorante Aerosol Men Xtra Cool Rexona 150ml','8.59'),(2,'6644573899377739999937345355','Pincel Hidrocor Princesas Tris 12 cores','9.99'),(3,'000000001','Café','10.00'),(4,'000000002','Cereais','10.00'),(5,'000000003','Achocolatado','10.00'),(6,'000000004','Açúcar','10.00'),(7,'000000005','Pão de forma','10.00'),(8,'000000006','Suco','10.00'),(9,'000000007','Adoçante','10.00'),(10,'000000008','Torradas','10.00'),(11,'000000009','Geleia','10.00'),(12,'000000010','Atum','10.00'),(13,'000000011','Creme de leite','10.00'),(14,'000000012','Leite condensado','10.00'),(15,'000000013','Molho de tomate','10.00'),(16,'000000014','Azeitonas','10.00'),(17,'000000015','Carnes e derivados','10.00'),(18,'000000016','Carne','10.00'),(19,'000000017','Frango','10.00'),(20,'000000018','Iogurte','10.00'),(21,'000000019','Peixe','10.00'),(22,'000000020','Pratos congelados','10.00'),(23,'000000021','Leite','10.00'),(24,'000000022','Queijos','10.00'),(25,'000000023','Requeijão','10.00'),(26,'000000024','Manteiga','10.00'),(27,'000000025','Margarina','10.00'),(28,'000000026','Presunto','10.00');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Antônio José da Silva',NULL),(2,'Maria Antonieta',NULL),(3,'Carlos Maia',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pedidoestoqueid` int(11) DEFAULT NULL,
  `formapagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_pedidoestoque_vendas_idx` (`pedidoestoqueid`),
  KEY `pk_formapagamento_idx` (`formapagamento`),
  CONSTRAINT `pk_formapagamento` FOREIGN KEY (`formapagamento`) REFERENCES `forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pk_pedidoestoque_vendas` FOREIGN KEY (`pedidoestoqueid`) REFERENCES `pedido_estoque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (12,1,1),(26,14,1),(27,15,2);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_mateus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-28 10:40:50
