-- MySQL dump 10.13  Distrib 8.3.0, for macos13.6 (arm64)
--
-- Host: localhost    Database: izakaya_review_db
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
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add izakaya',7,'add_izakaya'),(26,'Can change izakaya',7,'change_izakaya'),(27,'Can delete izakaya',7,'delete_izakaya'),(28,'Can view izakaya',7,'view_izakaya'),(29,'Can add review',8,'add_review'),(30,'Can change review',8,'change_review'),(31,'Can delete review',8,'delete_review'),(32,'Can view review',8,'view_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$tJ9g7mpnesvAB10eNIvqCJ$NlJH3rLMBCH2GRqlH8E93ha2jOWvL9z2be9k/3EsE7k=','2024-05-21 11:42:28.079961',1,'shintaro','','','shintaro0725ss@gmail.com',1,1,'2024-05-21 08:41:01.403000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'reviews','izakaya'),(8,'reviews','review'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-05-21 08:24:03.231034'),(2,'auth','0001_initial','2024-05-21 08:24:03.360702'),(3,'admin','0001_initial','2024-05-21 08:24:03.386339'),(4,'admin','0002_logentry_remove_auto_add','2024-05-21 08:24:03.390631'),(5,'admin','0003_logentry_add_action_flag_choices','2024-05-21 08:24:03.393665'),(6,'contenttypes','0002_remove_content_type_name','2024-05-21 08:24:03.410384'),(7,'auth','0002_alter_permission_name_max_length','2024-05-21 08:24:03.423490'),(8,'auth','0003_alter_user_email_max_length','2024-05-21 08:24:03.439535'),(9,'auth','0004_alter_user_username_opts','2024-05-21 08:24:03.442538'),(10,'auth','0005_alter_user_last_login_null','2024-05-21 08:24:03.452742'),(11,'auth','0006_require_contenttypes_0002','2024-05-21 08:24:03.453367'),(12,'auth','0007_alter_validators_add_error_messages','2024-05-21 08:24:03.456394'),(13,'auth','0008_alter_user_username_max_length','2024-05-21 08:24:03.468097'),(14,'auth','0009_alter_user_last_name_max_length','2024-05-21 08:24:03.479863'),(15,'auth','0010_alter_group_name_max_length','2024-05-21 08:24:03.485326'),(16,'auth','0011_update_proxy_permissions','2024-05-21 08:24:03.488232'),(17,'auth','0012_alter_user_first_name_max_length','2024-05-21 08:24:03.501920'),(18,'reviews','0001_initial','2024-05-21 08:24:03.506727'),(19,'sessions','0001_initial','2024-05-21 08:24:03.511814'),(20,'reviews','0002_review','2024-05-21 09:16:02.220134'),(21,'reviews','0003_rename_latitude_izakaya_lat_and_more','2024-05-21 10:03:08.840056');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('qcbe17nrjcu3gvf6cxe49is039t47oj8','.eJxVjDsOAiEUAO9CbQg_4WFp7xnIAx6yaiBZdivj3Q3JFtrOTObNAu5bDfugNSyZXZhkp18WMT2pTZEf2O6dp962dYl8Jvywg996ptf1aP8GFUed2wxZgAGlFUkk71A4r88miWJB-eKd1kC6WCetEpjAkiigYyJTnFSefb68hzb7:1s9Nsy:Z3yNyLAHXNZbTgttYGBs47t0npeE07cnz3hbOkd2Ay4','2024-06-04 11:42:28.083110'),('ydb43jp562yki8ac5x941rqt85w7awwp','.eJxVjDsOAiEUAO9CbQg_4WFp7xnIAx6yaiBZdivj3Q3JFtrOTObNAu5bDfugNSyZXZhkp18WMT2pTZEf2O6dp962dYl8Jvywg996ptf1aP8GFUed2wxZgAGlFUkk71A4r88miWJB-eKd1kC6WCetEpjAkiigYyJTnFSefb68hzb7:1s9MoD:lSCL6V9oU20ROLWHZTLe4OHk1Kbf7e-qwNm640ZEU5A','2024-06-04 10:33:29.700044');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_izakaya`
--

DROP TABLE IF EXISTS `reviews_izakaya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_izakaya` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_izakaya`
--

LOCK TABLES `reviews_izakaya` WRITE;
/*!40000 ALTER TABLE `reviews_izakaya` DISABLE KEYS */;
INSERT INTO `reviews_izakaya` VALUES (121,'Shibuya Excel Hotel Tokyu','1-chōme-12-2 Dōgenzaka, Shibuya City',35.6585773,139.6998213),(122,'Cerulean Tower Tokyu Hotel','26-1 Sakuragaokachō, Shibuya City',35.65640930000001,139.6993541),(123,'Brasserie Viron Shibuya','Tsukada Bldg., ２Ｆ, 33−８ Udagawachō, Shibuya City',35.6608958,139.6968211),(124,'Gonpachi Shibuya','E-Space Tower, １４Ｆ, フロアA, 3−６ Maruyamachō, Shibuya City',35.6574935,139.6955514),(125,'Kamiyama','10-8 Kamiyamachō, Shibuya City',35.6633703,139.6947911),(126,'Blue Note Tokyo','6-chōme-3-16 Minamiaoyama, Minato City',35.6612139,139.7162296),(127,'Shibuya Creston Hotel','B1, １０−８ Kamiyamachō, Shibuya City',35.6632078,139.694767),(128,'Rikyu Gyutan - Shibuya Hikarie Branch','渋谷ヒカリエ6F, 2-chōme-21−１ Shibuya, Shibuya City',35.65916530000001,139.7036565),(129,'Madame Toki','14-7 Hachiyamachō, Shibuya City',35.6508312,139.6970517),(130,'Las Bocas','帝都青山ビル B1F, 3-chōme-2−３ Shibuya, Shibuya City',35.6571749,139.7075016),(131,'BELON Shibuya','野々ビル １階 第２, 1-chōme-17−２ Dōgenzaka, Shibuya City',35.6570046,139.6972658),(132,'EBISU MUSHROOM','ゼネラルビル恵比寿西, 1-chōme-16−３ Ebisunishi, Shibuya City',35.6487141,139.7074721),(133,'BeerBar THE ALDGATE British Pub ビアバー 渋谷','Shin-Iwasaki Bldg., 3F, 30−４ Udagawachō, Shibuya City',35.6607614,139.6979594),(134,'Antonio\'s','南青山ＨＹビル １F, 7-chōme-3−６ Minamiaoyama, Minato City',35.6589182,139.7162119),(135,'un cafe','コスモス青山 B2F, 5-chōme-53−６７ Jingūmae, Shibuya City',35.6630822,139.7084513),(136,'Bio Cafe','パティオⅠ １F, 16−１４ Udagawachō, Shibuya City',35.66142899999999,139.698935),(137,'Bijindori','Five-Annex, 2F, 1-chōme-3−１０ Ebisunishi, Shibuya City',35.648904,139.7082596),(138,'THE LEGIAN TOKYO','１６ｃｏｃｏｔｉビル １２Ｆ, 1-chōme-２３ Shibuya, Shibuya City',35.662055,139.702655),(139,'Ramen Gyoza Daiki','Okuyama Bldg., 1-chōme-27-9 Higashi, Shibuya City',35.65409350000001,139.7074721),(140,'Sakabatorino Shibuyaten','皆川ビル Ｂ１Ｆ, 1-chōme-22−１０ Jinnan, Shibuya City',35.661447,139.7010494),(141,'Shibuya Excel Hotel Tokyu','1-chōme-12-2 Dōgenzaka, Shibuya City',35.6585773,139.6998213),(142,'Cerulean Tower Tokyu Hotel','26-1 Sakuragaokachō, Shibuya City',35.65640930000001,139.6993541),(143,'Brasserie Viron Shibuya','Tsukada Bldg., ２Ｆ, 33−８ Udagawachō, Shibuya City',35.6608958,139.6968211),(144,'Gonpachi Shibuya','E-Space Tower, １４Ｆ, フロアA, 3−６ Maruyamachō, Shibuya City',35.6574935,139.6955514),(145,'Kamiyama','10-8 Kamiyamachō, Shibuya City',35.6633703,139.6947911),(146,'Blue Note Tokyo','6-chōme-3-16 Minamiaoyama, Minato City',35.6612139,139.7162296),(147,'Shibuya Creston Hotel','B1, １０−８ Kamiyamachō, Shibuya City',35.6632078,139.694767),(148,'Rikyu Gyutan - Shibuya Hikarie Branch','渋谷ヒカリエ6F, 2-chōme-21−１ Shibuya, Shibuya City',35.65916530000001,139.7036565),(149,'Madame Toki','14-7 Hachiyamachō, Shibuya City',35.6508312,139.6970517),(150,'Las Bocas','帝都青山ビル B1F, 3-chōme-2−３ Shibuya, Shibuya City',35.6571749,139.7075016),(151,'BELON Shibuya','野々ビル １階 第２, 1-chōme-17−２ Dōgenzaka, Shibuya City',35.6570046,139.6972658),(152,'EBISU MUSHROOM','ゼネラルビル恵比寿西, 1-chōme-16−３ Ebisunishi, Shibuya City',35.6487141,139.7074721),(153,'BeerBar THE ALDGATE British Pub ビアバー 渋谷','Shin-Iwasaki Bldg., 3F, 30−４ Udagawachō, Shibuya City',35.6607614,139.6979594),(154,'Antonio\'s','南青山ＨＹビル １F, 7-chōme-3−６ Minamiaoyama, Minato City',35.6589182,139.7162119),(155,'un cafe','コスモス青山 B2F, 5-chōme-53−６７ Jingūmae, Shibuya City',35.6630822,139.7084513),(156,'Bio Cafe','パティオⅠ １F, 16−１４ Udagawachō, Shibuya City',35.66142899999999,139.698935),(157,'Bijindori','Five-Annex, 2F, 1-chōme-3−１０ Ebisunishi, Shibuya City',35.648904,139.7082596),(158,'THE LEGIAN TOKYO','１６ｃｏｃｏｔｉビル １２Ｆ, 1-chōme-２３ Shibuya, Shibuya City',35.662055,139.702655),(159,'Ramen Gyoza Daiki','Okuyama Bldg., 1-chōme-27-9 Higashi, Shibuya City',35.65409350000001,139.7074721),(160,'Sakabatorino Shibuyaten','皆川ビル Ｂ１Ｆ, 1-chōme-22−１０ Jinnan, Shibuya City',35.661447,139.7010494),(161,'Restaurant Reims Yanagitate','3-chōme-10-13 Kitaaoyama, Minato City',35.66433699999999,139.710617),(162,'アンジェパティオレストラン','12-11 Nanpeidaichō, Shibuya City',35.6544298,139.6959345),(163,'Yoshinari','S-6ビル B1, 1-chōme-7−１ Shibuya, Shibuya City',35.6609245,139.706355),(164,'Ramen Hayashi','Social Dogenzaka, 1-chōme-14-9 Dōgenzaka, Shibuya City',35.6573251,139.6979826),(165,'Aquavit','シノダビル B1F, 31−４ Udagawachō, Shibuya City',35.661286,139.697868),(166,'Zakuu','3-chōme-10-19 Shibuya, Shibuya City',35.657345,139.7053098),(167,'Tsunahachi','21-1 Udagawachō, Shibuya City',35.6603733,139.7003157),(168,'Benoit Tokyo','ラ・ポルト青山 10F, 5-chōme-51−８ Jingūmae, Shibuya City',35.6628296,139.7095061),(169,'SHOTO CAFE','シティコート松濤 １階, 1-chōme-29−２４ Shōtō, Shibuya City',35.6601578,139.6950876),(170,'Attic room Shibuya','Tanaka Bldg. III, 7F, 31−３ Udagawachō, Shibuya City',35.6613786,139.6978647),(171,'Choraku','31-5 Udagawachō, Shibuya City',35.6612015,139.6979974),(172,'Tofu Cuisine Sorano Shibuya','チェリーガーデン １階, 4−１７ Sakuragaokachō, Shibuya City',35.6547999,139.7038608),(173,'PANDA RESTAURANT','Imon Dogenzaka Bldg., B1F, 2-chōme-6−１６ Dōgenzaka, Shibuya City',35.6589697,139.6986759),(174,'PATINASTELLA','神山フォレスト 1F PATINASTELLA, 11−１５ Kamiyamachō, Shibuya City',35.663525,139.6941288),(175,'Sanuki Udon Menki Yashima Shibuya Maruyamacho','サンライズビル 1階, 10−１３ Maruyamachō, Shibuya City',35.6590329,139.6943932),(176,'Shibuya Kaomangai Thai Chicken Rice','3-chōme-15-2 Shibuya, Shibuya City',35.6558966,139.7056017),(177,'ALOHA TABLE Daikanyama','Art Village, 1F, 17−１０ Sarugakuchō, Shibuya City',35.6494083,139.6991546),(178,'Recte','サンビレッジ代官山 2F, 2-chōme-17−５ Ebisunishi, Shibuya City',35.6489302,139.7059561),(179,'FIGLI di CENTO ANNI','1-chōme-22-12 Dōgenzaka, Shibuya City',35.6565107,139.6956846),(180,'Epanoui','3-chōme-2-14 Hiroo, Shibuya City',35.6555142,139.7141945),(181,'We are the farm','Pigeon, 髙田ビル 1F, 1-chōme-28−１１ Shōtō, Shibuya City',35.6595467,139.6939877),(182,'Satei Zenkashoin','2-chōme-21-1 Shibuya, Shibuya City',35.6587825,139.7031435),(183,'maison de musee','4-chōme-2-9 Shibuya, Shibuya City',35.659296,139.712972),(184,'POTA PASTA Shibuya','2F, 2-chōme-6−７ Dōgenzaka, Shibuya City',35.6587096,139.6989499),(185,'Kitchen Hasegawa','22-16 Maruyamachō, Shibuya City',35.65678,139.6943563),(186,'Harajuku Gyozaro','6-chōme-2-4 Jingūmae, Shibuya City',35.6675016,139.7061026),(187,'Cucina Italiana Okada','太田ビル 1F, 7−１２ Kamiyamachō, Shibuya City',35.6642464,139.6935337),(188,'Uobei','Central Bldg. 6, １階, 2-chōme-29−１１ Dōgenzaka, Shibuya City',35.6594349,139.6979207),(189,'WE ARE THE FARM 恵比寿','ＯＲＩＸ恵比寿西ビル 1F, 2-chōme-8−１０ Ebisunishi, Shibuya City',35.6493039,139.707512),(190,'Anniversaire Omotesando','3-chōme-5-30 Kitaaoyama, Minato City',35.6660433,139.7112062),(191,'ARMONICO','シンフォニー代官山 102, 12−１６ Daikanyamachō, Shibuya City',35.6506747,139.7036024),(192,'Ryu No Ko','メナー神宮前 B1Ｆ, 1-chōme-8−５ Jingūmae, Shibuya City',35.6702023,139.7064737),(193,'Sushi Nakano','1-chōme-5-9 Shibuya, Shibuya City',35.6610947,139.7057965),(194,'Dining Table 10\"1','伊藤ビル 1階, 1-chōme-26−２ Shōtō, Shibuya City',35.6591567,139.6936012),(195,'Osteria Lucca','ＴＳ広尾ビル B1, 4-chōme-9−１０ Higashi, Shibuya City',35.655224,139.7131808),(196,'Watarase','ＭＴエステートビル, 3-chōme-15−２ Shibuya, Shibuya City',35.655897,139.705498),(197,'Felicelina','1-chōme-15-2 Aobadai, Meguro City',35.6479843,139.6969747),(198,'Akakarashibuya Honten','Takayama Land B.L.D, B1F, 1-chōme-20−１６ Jinnan, Shibuya City',35.66217099999999,139.7001061),(199,'Hanamaru Udon','B1F, 2−１ Udagawachō, Shibuya City',35.663663,139.6987557),(200,'Le Coq','ウィンズビル １Ｆ, 2-chōme-7−２ Ebisunishi, Shibuya City',35.6503735,139.7071986);
/*!40000 ALTER TABLE `reviews_izakaya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review`
--

DROP TABLE IF EXISTS `reviews_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `rating` int NOT NULL,
  `izakaya_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_review_izakaya_id_8c9088a3_fk_reviews_izakaya_id` (`izakaya_id`),
  CONSTRAINT `reviews_review_izakaya_id_8c9088a3_fk_reviews_izakaya_id` FOREIGN KEY (`izakaya_id`) REFERENCES `reviews_izakaya` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review`
--

LOCK TABLES `reviews_review` WRITE;
/*!40000 ALTER TABLE `reviews_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-01 18:27:21
