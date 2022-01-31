-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: todoapidb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add todo',7,'add_todo'),(26,'Can change todo',7,'change_todo'),(27,'Can delete todo',7,'delete_todo'),(28,'Can view todo',7,'view_todo'),(29,'Can add application',8,'add_application'),(30,'Can change application',8,'change_application'),(31,'Can delete application',8,'delete_application'),(32,'Can view application',8,'view_application'),(33,'Can add access token',9,'add_accesstoken'),(34,'Can change access token',9,'change_accesstoken'),(35,'Can delete access token',9,'delete_accesstoken'),(36,'Can view access token',9,'view_accesstoken'),(37,'Can add grant',10,'add_grant'),(38,'Can change grant',10,'change_grant'),(39,'Can delete grant',10,'delete_grant'),(40,'Can view grant',10,'view_grant'),(41,'Can add refresh token',11,'add_refreshtoken'),(42,'Can change refresh token',11,'change_refreshtoken'),(43,'Can delete refresh token',11,'delete_refreshtoken'),(44,'Can view refresh token',11,'view_refreshtoken'),(45,'Can add id token',12,'add_idtoken'),(46,'Can change id token',12,'change_idtoken'),(47,'Can delete id token',12,'delete_idtoken'),(48,'Can view id token',12,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_todoapiapps_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_todoapiapps_user_id` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-01-26 12:01:56.558751','1','Học tiếng anh',1,'[{\"added\": {}}]',7,2),(2,'2022-01-26 12:02:11.060637','2','chăm sóc da',1,'[{\"added\": {}}]',7,2),(3,'2022-01-26 12:02:43.953824','3','tập thể dục',1,'[{\"added\": {}}]',7,2),(4,'2022-01-30 03:31:36.213151','19','Học tiếng anh',2,'[{\"changed\": {\"fields\": [\"T\\u00ean\", \"M\\u00f4 t\\u1ea3\"]}}]',7,2),(5,'2022-01-30 03:33:13.948452','10','User1',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(6,'2022-01-30 03:33:29.575679','9','TrungDung',2,'[{\"changed\": {\"fields\": [\"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(7,'2022-01-30 03:34:40.612745','8','TrungThanh',2,'[{\"changed\": {\"fields\": [\"Username\", \"Last name\", \"Email address\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(8,'2022-01-30 03:35:04.722156','7','TrungTien',2,'[{\"changed\": {\"fields\": [\"Username\", \"Last name\", \"Email address\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(9,'2022-01-30 03:35:49.675150','6','Xgund',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(10,'2022-01-30 03:36:15.225244','5','Meivacho',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(11,'2022-01-30 03:36:48.436748','4','Staff',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"Email address\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(12,'2022-01-30 03:37:21.480258','3','Staff1',2,'[{\"changed\": {\"fields\": [\"Username\", \"First name\", \"Last name\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(13,'2022-01-30 03:37:49.973004','2','admin1',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(14,'2022-01-30 03:38:08.630894','1','admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"\\u0110i\\u1ec7n tho\\u1ea1i\"]}}]',6,2),(15,'2022-01-30 03:38:41.742051','19','Học tiếng anh',2,'[]',7,2),(16,'2022-01-30 03:39:23.341340','18','Tập thể dục',2,'[{\"changed\": {\"fields\": [\"T\\u00ean\", \"M\\u00f4 t\\u1ea3\"]}}]',7,2),(17,'2022-01-30 03:40:24.369424','17','Đi tất niên',2,'[{\"changed\": {\"fields\": [\"T\\u00ean\", \"M\\u00f4 t\\u1ea3\"]}}]',7,2),(18,'2022-01-30 03:40:56.179233','16','Uống nước',2,'[{\"changed\": {\"fields\": [\"T\\u00ean\", \"M\\u00f4 t\\u1ea3\", \"Ng\\u01b0\\u1eddi d\\u00f9ng\"]}}]',7,2),(19,'2022-01-30 03:41:50.161762','21','Mua quần áo',1,'[{\"added\": {}}]',7,2),(20,'2022-01-30 03:42:33.863540','22','Dọn dẹp',1,'[{\"added\": {}}]',7,2),(21,'2022-01-30 03:43:47.113282','23','Chăm sóc cây',1,'[{\"added\": {}}]',7,2),(22,'2022-01-30 03:44:12.576137','24','Skincare',1,'[{\"added\": {}}]',7,2),(23,'2022-01-30 03:44:44.349795','25','Rửa xe',1,'[{\"added\": {}}]',7,2),(24,'2022-01-30 03:45:46.149061','26','Hoàn thành bài test',1,'[{\"added\": {}}]',7,2);
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
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'oauth2_provider','accesstoken'),(8,'oauth2_provider','application'),(10,'oauth2_provider','grant'),(12,'oauth2_provider','idtoken'),(11,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(7,'todoapiapps','todo'),(6,'todoapiapps','user');
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-01-26 10:37:45.521121'),(2,'contenttypes','0002_remove_content_type_name','2022-01-26 10:37:45.895363'),(3,'auth','0001_initial','2022-01-26 10:37:46.538892'),(4,'auth','0002_alter_permission_name_max_length','2022-01-26 10:37:46.750238'),(5,'auth','0003_alter_user_email_max_length','2022-01-26 10:37:46.761205'),(6,'auth','0004_alter_user_username_opts','2022-01-26 10:37:46.772175'),(7,'auth','0005_alter_user_last_login_null','2022-01-26 10:37:46.781155'),(8,'auth','0006_require_contenttypes_0002','2022-01-26 10:37:46.788130'),(9,'auth','0007_alter_validators_add_error_messages','2022-01-26 10:37:46.799099'),(10,'auth','0008_alter_user_username_max_length','2022-01-26 10:37:46.809076'),(11,'auth','0009_alter_user_last_name_max_length','2022-01-26 10:37:46.821018'),(12,'auth','0010_alter_group_name_max_length','2022-01-26 10:37:46.925261'),(13,'auth','0011_update_proxy_permissions','2022-01-26 10:37:46.938652'),(14,'auth','0012_alter_user_first_name_max_length','2022-01-26 10:37:46.949625'),(15,'todoapiapps','0001_initial','2022-01-26 10:37:47.496722'),(16,'admin','0001_initial','2022-01-26 10:37:47.973493'),(17,'admin','0002_logentry_remove_auto_add','2022-01-26 10:37:47.990447'),(18,'admin','0003_logentry_add_action_flag_choices','2022-01-26 10:37:48.003412'),(19,'sessions','0001_initial','2022-01-26 10:37:48.066458'),(20,'todoapiapps','0002_todo','2022-01-26 11:04:42.544310'),(21,'oauth2_provider','0001_initial','2022-01-26 15:05:50.991982'),(22,'oauth2_provider','0002_auto_20190406_1805','2022-01-26 15:05:51.624266'),(23,'oauth2_provider','0003_auto_20201211_1314','2022-01-26 15:05:51.812148'),(24,'oauth2_provider','0004_auto_20200902_2022','2022-01-26 15:05:53.527418'),(25,'todoapiapps','0003_auto_20220129_1528','2022-01-29 08:28:12.791654');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c11lkhnc378o8aritvn7zxyopznps41g','.eJxVjDsOwjAUBO_iGlnCz79Q0nMGa-1n4wBypDipIu4OkVJAuzOzmwhYlxrWnucwsrgIJU6_W0R65rYDfqDdJ5mmtsxjlLsiD9rlbeL8uh7u30FFr9_6rNgVeCTrtbE-siOQs7CGYAoUFa9VYeOpREtDMtmBOCVSWkMPEO8P5h44DA:1nE1Ci:prZJPFDJDGvLJN7ethZnHN-lm1wo5gRNOMsExU-G7Co','2022-02-13 03:48:40.679826');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_todoapiap` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_todoapiap` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'XZ344u9Ss8PgcF7aMV30sdb3YfhC1s','2022-01-28 14:59:22.433230','read write',1,2,'2022-01-28 04:59:22.439044','2022-01-28 04:59:22.439044',NULL,NULL),(2,'AH0AS4Dxc6VjaYtlxbY1AM1fhmjYqm','2022-01-29 13:13:48.695343','read write',1,2,'2022-01-29 03:13:48.699318','2022-01-29 03:13:48.699318',NULL,NULL),(3,'EpnyznxUmlhoq5M4uC6eg3vNAOt0vj','2022-01-29 13:22:21.530585','read write',1,2,'2022-01-29 03:22:21.532575','2022-01-29 03:22:21.532575',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_todoapiap` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_todoapiap` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'jFUQJbutwKZOSlOJn0YeZOi2IYrBNonhjz5qJOEU','','confidential','password','fLCBV2Z5u1lqBEBniSRrBNRe6CFs6G8erA1b7COqVNG2MDeqIyGJ9DyaCaAO4Uem50XzdQjqxfpABdGifz6ZyYDcn66MoQKdkJGGlCpDcBpFVl0LTfcoevWCVLVeNZiA','ToDoApp',2,0,'2022-01-26 15:08:35.777408','2022-01-26 15:08:35.777408','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_todoapiapps_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_todoapiapps_user_id` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_todoapiapps_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_todoapiapps_user_id` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_todoapiap` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_todoapiap` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'SPAguAvMc6abojgHDfnOzqMwTEQ8dH',1,1,2,'2022-01-28 04:59:22.576692','2022-01-28 04:59:22.576692',NULL),(2,'KdAPnGBNltLc4ccRnHAbsxGx7ylwZv',2,1,2,'2022-01-29 03:13:48.791057','2022-01-29 03:13:48.791057',NULL),(3,'Pkx72sjY8XH4Xb3d7fkcPVeneK8RHZ',3,1,2,'2022-01-29 03:22:21.544546','2022-01-29 03:22:21.545545',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todoapiapps_todo`
--

DROP TABLE IF EXISTS `todoapiapps_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todoapiapps_todo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `completed_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `todoapiapps_todo_user_id_d1f81b74_fk_todoapiapps_user_id` (`user_id`),
  CONSTRAINT `todoapiapps_todo_user_id_d1f81b74_fk_todoapiapps_user_id` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todoapiapps_todo`
--

LOCK TABLES `todoapiapps_todo` WRITE;
/*!40000 ALTER TABLE `todoapiapps_todo` DISABLE KEYS */;
INSERT INTO `todoapiapps_todo` VALUES (16,'Uống nước','Mỗi ngày uống đủ 2 lít nước','Complete','2022-01-29 03:04:20.267465','2022-01-30 03:40:56.175268',2,'2022-01-29 08:28:12.000000'),(17,'Đi tất niên','Đi tất niên cho công ty của bố','New','2022-01-29 03:04:26.837555','2022-01-30 03:40:24.367456',2,'2022-01-29 08:28:12.000000'),(18,'Tập thể dục','Mỗi ngày chạy bộ ít nhất 20 phút. Buổi chiều tập cadio 10 phút','New','2022-01-29 03:08:48.235033','2022-01-30 03:39:23.339351',2,'2022-01-29 08:28:12.000000'),(19,'Học tiếng anh','Mỗi ngày, học 10 phút cho từ vựng, 20 phút cho ngữ pháp và luyện nghe tiếng anh ít nhất 15 phút','New','2022-01-29 03:35:01.666720','2022-01-30 03:38:41.740119',1,'2022-01-29 08:28:12.000000'),(21,'Mua quần áo','Mua quần áo','Complete','2022-01-30 03:41:50.158033','2022-01-30 03:41:50.158033',3,'2022-01-30 03:41:45.000000'),(22,'Dọn dẹp','Dọn dẹp nhà cửa, trang trí nhà cửa','Complete','2022-01-30 03:42:33.857938','2022-01-30 03:42:33.857938',3,'2022-01-30 03:42:30.000000'),(23,'Chăm sóc cây','Tỉa, tưới, bón phân cho cây','Complete','2022-01-30 03:43:47.111315','2022-01-30 03:43:47.111315',5,'2022-01-30 03:43:43.000000'),(24,'Skincare','Chăm da mỗi sáng và tối','New','2022-01-30 03:44:12.575030','2022-01-30 03:44:12.575030',2,'2022-01-30 03:44:09.000000'),(25,'Rửa xe','Rửa xe','Complete','2022-01-30 03:44:44.348608','2022-01-30 03:44:44.348608',3,'2022-01-30 03:44:41.000000'),(26,'Hoàn thành bài test','Hoàn thành bài test','New','2022-01-30 03:45:46.147064','2022-01-30 03:45:46.147064',2,'2022-01-30 03:45:43.000000'),(27,'Tham gia Xuân tình nguyện','Tham gia Xuân tình nguyện do Khoa tổ chức','New','2022-01-30 04:16:33.216832','2022-01-30 04:16:33.216832',2,'2022-01-30 04:14:42.194000');
/*!40000 ALTER TABLE `todoapiapps_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todoapiapps_user`
--

DROP TABLE IF EXISTS `todoapiapps_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todoapiapps_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todoapiapps_user`
--

LOCK TABLES `todoapiapps_user` WRITE;
/*!40000 ALTER TABLE `todoapiapps_user` DISABLE KEYS */;
INSERT INTO `todoapiapps_user` VALUES (1,'pbkdf2_sha256$260000$8ygnr8G2mjCtD0dzPh0oeD$wYT+GrznzcHvZW4e5LByaoM6iumsDYC3IfKBjZxEK5E=',NULL,1,'admin','Nguyễn','Tốt','admin@gmail.com',1,1,'2022-01-26 11:43:41.000000','0987654321'),(2,'pbkdf2_sha256$260000$taSkcfDXziCxaodC3fCc8j$2sQaZZlFiPDC5t8zXCk0UGZVLRU9ReQTnN8i6xjFNIM=','2022-01-30 03:48:40.670032',1,'admin1','Nguyễn','Dũng','admin1@gmail.com',1,1,'2022-01-26 11:58:02.000000','0123456799'),(3,'pbkdf2_sha256$260000$twOht5fuwjtQksN0KTLZwC$UOvJl6OtWPugtnzn55Y0p+4NB7TYCCI4dk6aR1vc+eM=',NULL,0,'Staff1','Staff','Office','admintest@example.com',0,1,'2022-01-26 14:57:32.000000','0456987521'),(4,'pbkdf2_sha256$260000$3z8wDzxOSu9IBpDSdpExYc$yk3/GuqX+g4Qthpzkh18l/Wgp9G11ZhAgShmix/9j7w=',NULL,0,'Staff','Staff1','Office','stafff1@gmail.com.vv',0,1,'2022-01-28 12:21:00.000000','0123985463'),(5,'pbkdf2_sha256$260000$6kSjky2TuKJX6EKrlYFuG8$dsOGPRnYcMaNOYhkNVjZh39GlTXoQlUAYOXM14/KjpE=',NULL,0,'Meivacho','Mei','Vachoe','user4@example.com',0,1,'2022-01-28 05:23:01.000000','0586932156'),(6,'pbkdf2_sha256$260000$i9crY3ljw8Fh4dN7vMp3Fd$qEdkZmkeVKPprHKAI3NJdt2j2y/trYknPuxFdXjoQ6o=',NULL,0,'Xgund','Xgund','Gunrt','user2@example.com',0,1,'2022-01-28 05:23:01.000000','0337045655'),(7,'pbkdf2_sha256$260000$z33CXeQ0ymRvWi44voWvVu$F2PnLUAt1T53BfEPlBaze1Nww5PjUpht+3OvG6mRkpw=',NULL,0,'TrungTien','Trung','Tiến','user3@example.com',0,1,'2022-01-28 08:04:52.000000','0258931785'),(8,'pbkdf2_sha256$260000$LvHzz8hhT2d2aQNgxDj78O$Jw4T1Q3Z0IFL9zSDuMWqLXcZQkinhLKg8SYWPVxO88g=',NULL,0,'TrungThanh','Trung','Thành','usern@example.com',0,1,'2022-01-28 08:04:52.000000','0335214875'),(9,'pbkdf2_sha256$260000$M7dk5n74MmESXcXtJJV7Vg$WCCKyKLUXXDmxbntHW+y5W5v5x8DXtBhn4yus1ljrI8=',NULL,0,'TrungDung','Dũng','Nguyễn Trung','test1@example.com',0,1,'2022-01-29 09:17:58.000000','0331254877'),(10,'pbkdf2_sha256$260000$iU2KGnNjiDBnWGCMps7kMn$sVldgeBIABm4yR7msCYBpHyDASxHaoQkPsLgJdcqxwk=',NULL,0,'User1','User','Staff','ntdentidi0612@gmail.com',0,1,'2022-01-29 09:27:18.000000','0915894396'),(11,'pbkdf2_sha256$260000$wSqtujDp81rxxq6lbzy1Ad$wjI6t6hOrwxqSwe8oizIa+bkc4cix32i6F2VAgv6rL0=',NULL,0,'support','Trung','Dũng','support@example.com',0,1,'2022-01-30 12:58:48.612000',NULL);
/*!40000 ALTER TABLE `todoapiapps_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todoapiapps_user_groups`
--

DROP TABLE IF EXISTS `todoapiapps_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todoapiapps_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `todoapiapps_user_groups_user_id_group_id_59c3e9b7_uniq` (`user_id`,`group_id`),
  KEY `todoapiapps_user_groups_group_id_6ae9c331_fk_auth_group_id` (`group_id`),
  CONSTRAINT `todoapiapps_user_groups_group_id_6ae9c331_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `todoapiapps_user_groups_user_id_f76b8f27_fk_todoapiapps_user_id` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todoapiapps_user_groups`
--

LOCK TABLES `todoapiapps_user_groups` WRITE;
/*!40000 ALTER TABLE `todoapiapps_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `todoapiapps_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todoapiapps_user_user_permissions`
--

DROP TABLE IF EXISTS `todoapiapps_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todoapiapps_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `todoapiapps_user_user_pe_user_id_permission_id_093e4866_uniq` (`user_id`,`permission_id`),
  KEY `todoapiapps_user_use_permission_id_9ddd4694_fk_auth_perm` (`permission_id`),
  CONSTRAINT `todoapiapps_user_use_permission_id_9ddd4694_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `todoapiapps_user_use_user_id_d4790c78_fk_todoapiap` FOREIGN KEY (`user_id`) REFERENCES `todoapiapps_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todoapiapps_user_user_permissions`
--

LOCK TABLES `todoapiapps_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `todoapiapps_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `todoapiapps_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-31  0:31:55
