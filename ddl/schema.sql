-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: headsup
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `pk` varchar(128) NOT NULL,
  `uid1` varchar(128) NOT NULL,
  `uid2` varchar(128) NOT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `uid1_uid2_UNIQUE` (`uid1`,`uid2`),
  KEY `fk_rid2` (`uid2`),
  CONSTRAINT `fk_rid2` FOREIGN KEY (`uid2`) REFERENCES `user` (`pk`),
  CONSTRAINT `fk_uid1` FOREIGN KEY (`uid1`) REFERENCES `user` (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `pk` varchar(128) NOT NULL,
  `date_ms` bigint DEFAULT NULL,
  `creatorId` varchar(128) NOT NULL,
  `deleted_ms` bigint DEFAULT NULL,
  `guestId` varchar(128) NOT NULL,
  `invitationId` varchar(128) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `creator_guest_invitationId_UNIQUE` (`creatorId`,`guestId`,`invitationId`),
  KEY `fk_guestId` (`guestId`),
  KEY `idx_invitationId` (`invitationId`),
  CONSTRAINT `fk_creatorId` FOREIGN KEY (`creatorId`) REFERENCES `user` (`pk`),
  CONSTRAINT `fk_guestId` FOREIGN KEY (`guestId`) REFERENCES `user` (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keys`
--

DROP TABLE IF EXISTS `keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keys` (
  `pk` varchar(128) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `key_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `key_name_UNIQUE` (`key_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `pk` varchar(128) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `pk` varchar(128) NOT NULL,
  `RoomSid` varchar(64) NOT NULL,
  `created_ms` bigint DEFAULT NULL,
  `hostId` varchar(128) NOT NULL,
  `host_joined_ms` bigint DEFAULT NULL,
  `invitationId` varchar(128) NOT NULL,
  `recording_state` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `fk_hostId` (`hostId`),
  CONSTRAINT `fk_hostId` FOREIGN KEY (`hostId`) REFERENCES `user` (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `pk` varchar(128) NOT NULL,
  `setting_name` varchar(255) DEFAULT NULL,
  `setting_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `setting_name_UNIQUE` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `pk` varchar(128) NOT NULL,
  `date_ms` bigint DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `isDisabled` tinyint DEFAULT '0',
  `online` tinyint DEFAULT '0',
  `phoneNumber` varchar(255) DEFAULT NULL,
  `photoFileName` varchar(255) DEFAULT NULL,
  `photoUrl` varchar(255) DEFAULT NULL,
  `privacyPolicyRead` tinyint DEFAULT '0',
  `promo_code` varchar(255) DEFAULT NULL,
  `tosAccepted` tinyint DEFAULT '0',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `pk` varchar(128) NOT NULL,
  `rid` varchar(128) NOT NULL,
  `uid` varchar(128) NOT NULL,
  PRIMARY KEY (`pk`),
  UNIQUE KEY `user_role_UNIQUE` (`rid`,`uid`),
  KEY `fk_uid_idx` (`uid`),
  CONSTRAINT `fk_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`pk`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-19 23:31:18
