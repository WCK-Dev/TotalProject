-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: totalproject
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `a_checked` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N',
  `a_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `a_modifydate` timestamp NULL DEFAULT NULL,
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_seq` int NOT NULL,
  PRIMARY KEY (`user_id`,`c_seq`) USING BTREE,
  KEY `FK_cseq` (`c_seq`),
  CONSTRAINT `FK_cseq` FOREIGN KEY (`c_seq`) REFERENCES `checklist` (`c_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자 체크리스트 답변 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES ('Y','2020-11-05 05:45:19','fusion','2020-11-05 05:45:30','fusion',217),('Y','2020-11-05 05:45:19','fusion','2020-11-05 05:45:30','fusion',218),('N','2020-11-05 05:45:19','fusion','2020-11-05 05:45:30','fusion',219),('N','2020-11-03 08:06:49','outside16','2020-11-03 08:07:44','outside16',204),('Y','2020-11-03 08:06:49','outside16','2020-11-03 08:07:44','outside16',205),('N','2020-11-03 08:06:49','outside16','2020-11-03 08:07:44','outside16',207),('N','2020-11-03 08:07:44',NULL,NULL,'outside16',208),('Y','2020-11-03 08:07:44',NULL,NULL,'outside16',209),('N','2020-09-24 02:04:09','user1','2020-09-24 02:40:31','user1',77),('Y','2020-09-24 02:04:09','user1','2020-09-24 02:40:31','user1',79),('N','2020-09-24 02:40:38',NULL,NULL,'user1',82),('N','2020-09-24 02:40:38',NULL,NULL,'user1',83),('Y','2020-09-24 02:40:38',NULL,NULL,'user1',84),('N','2020-09-24 02:40:38',NULL,NULL,'user1',85),('Y','2020-09-24 02:40:38',NULL,NULL,'user1',86),('N','2020-09-24 02:40:38',NULL,NULL,'user1',118),('Y','2020-09-24 02:04:09','user1','2020-09-24 02:40:32','user1',119),('N','2020-09-24 02:04:09','user1','2020-09-24 02:40:32','user1',120),('Y','2020-09-24 07:16:03',NULL,NULL,'user1',164),('Y','2020-09-24 07:16:03',NULL,NULL,'user1',165),('N','2020-09-24 07:16:03',NULL,'2020-09-28 01:06:48','user1',166),('N','2020-09-24 07:16:03',NULL,NULL,'user1',167),('N','2020-09-24 07:16:03',NULL,NULL,'user1',168),('N','2020-09-24 02:59:23',NULL,NULL,'user2',77),('N','2020-09-24 02:59:23',NULL,NULL,'user2',79),('Y','2020-09-24 02:59:23',NULL,NULL,'user2',119),('N','2020-09-24 02:59:23',NULL,NULL,'user2',120),('N','2020-09-24 02:59:20',NULL,NULL,'user2',129),('Y','2020-09-24 02:59:20',NULL,NULL,'user2',130),('Y','2020-09-24 02:59:20',NULL,NULL,'user2',131),('N','2020-09-24 02:59:20',NULL,NULL,'user2',132),('N','2020-09-24 02:59:20',NULL,NULL,'user2',133),('N','2020-09-24 02:59:31',NULL,NULL,'user4',100),('Y','2020-09-24 02:59:31',NULL,NULL,'user4',101),('N','2020-09-24 02:59:47',NULL,NULL,'user5',77),('N','2020-09-24 02:59:47',NULL,NULL,'user5',79),('Y','2020-09-24 02:59:47',NULL,NULL,'user5',119),('N','2020-09-24 02:59:47',NULL,NULL,'user5',120),('N','2020-10-28 23:56:12',NULL,NULL,'wck',19),('N','2020-10-28 23:56:12',NULL,NULL,'wck',20),('Y','2020-10-28 23:56:12',NULL,NULL,'wck',21),('N','2020-10-28 23:56:12',NULL,NULL,'wck',22),('N','2020-10-28 23:56:12',NULL,NULL,'wck',23),('Y','2020-10-28 23:56:12',NULL,NULL,'wck',24),('N','2020-10-28 23:56:12',NULL,NULL,'wck',25),('N','2020-10-28 23:56:12',NULL,NULL,'wck',26),('N','2020-10-28 08:39:17',NULL,NULL,'wck',129),('N','2020-10-28 08:39:17',NULL,NULL,'wck',130),('Y','2020-10-28 08:39:17',NULL,NULL,'wck',131),('Y','2020-10-28 08:39:18',NULL,NULL,'wck',132),('N','2020-10-28 08:39:18',NULL,NULL,'wck',133),('N','2020-10-29 00:18:33',NULL,NULL,'wck',193),('Y','2020-10-29 00:18:33',NULL,NULL,'wck',194),('Y','2020-10-29 00:18:33',NULL,NULL,'wck',195),('N','2020-10-29 00:18:33',NULL,NULL,'wck',196),('N','2020-10-29 00:18:33',NULL,NULL,'wck',197),('N','2020-10-29 01:13:43',NULL,NULL,'wck',198),('Y','2020-10-29 01:13:43',NULL,NULL,'wck',199),('N','2020-10-29 01:13:43',NULL,NULL,'wck',200),('Y','2020-10-29 01:13:43',NULL,NULL,'wck',201),('N','2020-10-29 01:13:43',NULL,NULL,'wck',202),('N','2020-11-05 01:54:47',NULL,NULL,'wck',204),('Y','2020-11-05 01:54:47',NULL,NULL,'wck',205),('N','2020-11-05 01:54:47',NULL,NULL,'wck',207),('Y','2020-11-05 01:54:47',NULL,NULL,'wck',208),('N','2020-11-05 01:54:47',NULL,NULL,'wck',209),('Y','2020-11-05 01:57:38','wck','2020-11-05 01:57:48','wck',211),('Y','2020-11-05 01:57:38','wck','2020-11-05 01:57:48','wck',213),('N','2020-11-05 01:57:38','wck','2020-11-05 01:57:48','wck',214),('N','2020-11-03 02:07:42',NULL,NULL,'wck1234',164),('N','2020-11-03 02:07:42',NULL,NULL,'wck1234',165),('Y','2020-11-03 02:07:42',NULL,NULL,'wck1234',166),('Y','2020-11-03 02:07:42',NULL,NULL,'wck1234',167),('Y','2020-11-03 02:07:42',NULL,NULL,'wck1234',168),('N','2020-11-03 02:07:42',NULL,NULL,'wck1234',169);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseball`
--

DROP TABLE IF EXISTS `baseball`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baseball` (
  `baseball_seq` int NOT NULL AUTO_INCREMENT,
  `baseball_regdate` timestamp NOT NULL,
  `baseball_num` int NOT NULL,
  `baseball_done` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`baseball_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='숫자야구 게시글 레코드 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseball`
--

LOCK TABLES `baseball` WRITE;
/*!40000 ALTER TABLE `baseball` DISABLE KEYS */;
INSERT INTO `baseball` VALUES (12,'2020-11-02 02:10:00',314,'N','user'),(13,'2020-11-02 02:10:11',653,'N','user'),(14,'2020-11-02 02:10:18',916,'Y','user'),(15,'2020-11-02 02:10:23',672,'Y','user'),(17,'2020-11-02 06:58:48',467,'Y','wck'),(18,'2020-11-02 07:16:03',267,'Y','wck'),(19,'2020-11-02 07:40:10',826,'Y','wck'),(20,'2020-11-02 08:00:32',386,'Y','admin'),(21,'2020-11-03 05:44:52',971,'Y','wck'),(22,'2020-11-03 07:23:01',291,'Y','wck1234'),(23,'2020-11-03 07:48:07',375,'Y','outside16'),(24,'2020-11-03 08:43:16',327,'Y','outside16'),(25,'2020-11-05 01:59:36',728,'Y','wck'),(26,'2020-11-05 02:00:57',348,'Y','wck'),(27,'2020-11-05 02:18:40',817,'Y','wck'),(28,'2020-11-05 05:45:42',385,'Y','fusion'),(29,'2020-11-05 06:29:51',952,'N','wck');
/*!40000 ALTER TABLE `baseball` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseballtry`
--

DROP TABLE IF EXISTS `baseballtry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baseballtry` (
  `bt_seq` int NOT NULL AUTO_INCREMENT,
  `bt_num` int NOT NULL,
  `bt_strike` int NOT NULL,
  `bt_ball` int NOT NULL,
  `baseball_seq` int DEFAULT NULL,
  PRIMARY KEY (`bt_seq`),
  KEY `FK_baseball_seq` (`baseball_seq`),
  CONSTRAINT `FK_baseball_seq` FOREIGN KEY (`baseball_seq`) REFERENCES `baseball` (`baseball_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='야구게임 댓글 테이블 (정답확인)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseballtry`
--

LOCK TABLES `baseballtry` WRITE;
/*!40000 ALTER TABLE `baseballtry` DISABLE KEYS */;
INSERT INTO `baseballtry` VALUES (1,132,1,0,15),(2,321,0,1,15),(3,426,0,2,15),(4,612,2,0,15),(5,651,1,0,15),(6,672,3,0,15),(11,314,1,0,14),(12,354,0,0,14),(13,617,1,1,14),(14,719,1,1,14),(15,619,1,2,14),(16,916,3,0,14),(17,314,0,1,13),(18,213,0,0,17),(19,456,1,1,17),(20,468,2,0,17),(21,469,2,0,17),(22,467,3,0,17),(23,165,1,0,18),(24,234,1,0,18),(25,789,0,1,18),(26,549,0,0,18),(27,138,0,0,18),(28,267,3,0,18),(29,314,1,0,20),(30,318,1,1,20),(31,386,3,0,20),(32,142,0,1,19),(33,548,0,1,19),(34,493,0,0,19),(35,283,0,2,19),(36,826,3,0,19),(37,124,0,1,21),(38,356,0,0,21),(39,789,0,2,21),(40,489,0,1,21),(41,297,0,2,21),(42,971,3,0,21),(43,514,0,1,22),(44,236,1,0,22),(45,789,0,1,22),(46,219,1,2,22),(47,291,3,0,22),(48,123,0,1,23),(49,456,0,1,23),(50,789,0,1,23),(51,359,1,1,23),(52,376,2,0,23),(53,375,3,0,23),(54,159,0,0,24),(55,784,0,1,24),(56,236,0,2,24),(57,732,0,3,24),(58,327,3,0,24),(59,123,1,0,25),(60,456,0,0,25),(61,789,1,1,25),(62,728,3,0,25),(63,135,0,1,26),(64,154,0,1,26),(65,796,0,0,26),(66,582,0,1,26),(67,814,0,2,26),(68,518,1,0,26),(69,546,1,0,26),(70,348,3,0,26),(71,321,0,1,27),(72,567,1,0,27),(73,489,0,1,27),(74,514,1,0,27),(75,538,0,1,27),(76,468,0,1,27),(77,964,0,0,27),(78,817,3,0,27),(79,156,0,1,28),(80,489,1,0,28),(81,723,0,1,28),(82,453,0,2,28),(83,385,3,0,28),(84,123,0,1,29),(85,456,1,0,29),(86,789,0,1,29);
/*!40000 ALTER TABLE `baseballtry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `b_no` int NOT NULL COMMENT '글번호(PK)',
  `b_notice` int NOT NULL COMMENT '게시글 / 공지글 여부',
  `b_refno` int DEFAULT NULL,
  `b_depth` int NOT NULL,
  `b_title` varchar(300) NOT NULL,
  `b_content` varchar(6000) NOT NULL,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_writer` varchar(20) NOT NULL,
  `b_readcnt` int DEFAULT NULL,
  `b_origin` int NOT NULL,
  `b_secret` int NOT NULL DEFAULT '0',
  `b_pwd` varchar(30) DEFAULT NULL,
  `b_bseq` int NOT NULL DEFAULT '0' COMMENT '게시판 번호(boardKinds 테이블 참조)',
  PRIMARY KEY (`b_no`),
  KEY `FK_bseq` (`b_bseq`),
  CONSTRAINT `FK_bseq` FOREIGN KEY (`b_bseq`) REFERENCES `boardkinds` (`bk_bseq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (8,0,0,1,'두번째 원글 작성 테스트','1234','2020-08-31 04:56:36','wck',19,8,0,'',1),(9,0,8,2,'두번째 원글의 첫번째 답글','1313','2020-08-31 05:36:54','wck',8,8,0,'',1),(11,0,0,1,'수정용 글을 작성합니다.(관리자수정)','관리자가 게시글 내용을 수정하였습니다.','2020-08-31 08:03:31','user',24,11,0,'',1),(19,0,0,1,'1234','1234','2020-09-02 08:02:39','master',12,19,0,'',1),(21,0,0,1,'마스터계정 비밀글 등록','마스터계정으로 비밀글을 등록합니다','2020-09-02 08:06:42','master',8,21,1,'master1234',1),(22,1,0,1,'마스터계정 공지글등록','마스터계정으로 공지글을 등록합니다.','2020-09-02 08:07:01','master',0,22,0,'',1),(23,1,0,1,'공지글등록 테스트 2','공지글등록 테스트 2','2020-09-02 08:09:33','master',0,23,0,'',1),(24,0,0,1,'13','13','2020-09-03 08:05:08','admin',2,24,0,'',1),(25,0,0,1,'관리자 비밀글 수정','관리자 비밀글 !\r\n\r\n수정합니다.','2020-09-03 08:06:22','admin',9,25,1,'admin1234',1),(26,0,0,1,'유저 게시글 작성','유저 게시글 작성입니다.','2020-09-03 08:06:50','user',4,26,0,'',1),(27,0,0,1,'유저 비밀글 작성!','유저 비밀글 작성입니다.','2020-09-03 08:07:11','user',10,27,1,'12341234',1),(28,1,0,1,'관리자 공지글 작성 테스트','공지글 내용입니다.','2020-09-03 08:08:15','admin',0,28,0,'',1),(38,0,0,1,'더미게시글 3','더미게시글3','2020-09-03 10:04:20','wck',4,38,1,'wck1234',1),(39,0,0,1,'더미게시글 4','더미게시글 4','2020-09-03 10:04:28','wck',3,39,1,'1313',1),(40,0,0,1,'더미게시글 5','더미게시글 5','2020-09-03 10:04:55','wck',3,40,0,'',1),(41,0,0,1,'더미게시글 6','더미게시글 6','2020-09-03 10:05:09','user',1,41,0,'',1),(42,0,0,1,'더미게시글 7','더미게시글 7','2020-09-03 10:05:20','user',5,42,1,'1234',1),(43,0,0,1,'더미게시글 8','더미게시글 8','2020-09-03 10:05:33','user',4,43,0,'',1),(44,0,0,1,'더미게시글 9','더미게시글 9','2020-09-03 10:05:33','user',1,44,0,'',1),(45,0,0,1,'더미게시글 10','더미게시글 10','2020-09-03 10:05:33','user',2,45,0,'',1),(46,0,0,1,'더미게시글 11','더미게시글 11','2020-09-03 10:05:33','user',3,46,0,'',1),(49,0,0,1,'더미게시글 14','더미게시글 14','2020-09-03 10:05:33','user',15,49,0,NULL,1),(50,0,0,1,'더미게시글 15','더미게시글 15','2020-09-03 10:05:33','user',217,50,0,NULL,1),(53,0,52,3,'계층3','1234','2020-09-04 00:50:52','wck',1,50,0,NULL,1),(54,0,50,2,'더미게시글 15 의 답글2','2','2020-09-04 00:51:03','wck',13,50,0,NULL,1),(55,0,0,1,'비밀글','123','2020-09-04 00:52:36','wck',180,55,1,'1234',1),(64,0,0,1,'문의게시판 글 작성','문의게시판에 글을 작성','2020-09-07 02:52:03','user',36,64,0,'',4),(65,0,50,2,'더미게시글 15 의 답글3','3','2020-09-07 04:51:25','admin',2,50,0,NULL,1),(67,1,0,1,'공지글등록','공지등록 테스트','2020-10-28 00:26:21','admin',0,67,0,NULL,4),(68,0,0,1,'읽지않은 게시글','알림형 게시판 테스트','2020-10-28 00:27:03','admin',27,68,0,'',4),(70,0,0,1,'관리자 비밀글 수정','관리자가 작성한 비밀글을 직접 수정함','2020-10-28 05:06:12','admin',37,70,1,'1234',5),(71,0,0,1,'yhs 게시글작성','비밀글로작성함 ㅎㅎ','2020-10-28 05:32:34','yhs1234',20,71,1,'1234',5),(72,1,0,1,'공지글 수정','공지글 수정테스트','2020-10-28 05:34:34','admin',1,72,0,NULL,5),(73,0,64,2,'문의게시판 글 작성 의 답글','yhs가 답글을 작성함','2020-10-28 05:52:35','yhs1234',8,64,0,NULL,4),(77,0,27,2,'유저 비밀글 작성! 의 답글','2323','2020-11-03 05:55:41','wck',2,27,0,NULL,1),(79,0,68,2,'읽지않은 게시글 의 답글','신규유저 권한 변경후 답글작성테스트','2020-11-03 07:55:38','outside16',13,68,0,NULL,4),(80,0,0,1,'신규유저 신규 게시판','일반글 작성','2020-11-03 07:58:26','outside16',11,80,0,'',7),(82,0,64,2,'문의게시판 글 작성 의 답글(신규유저)','신규유저의 답글작성란','2020-11-04 00:42:36','outside16',2,64,0,NULL,4),(83,0,79,3,'읽지않은 게시글 의 답글 의 답글','ㅇㅇ','2020-11-04 00:46:29','outside16',2,68,0,NULL,4),(84,0,0,1,'신규유저','비밀글작성\n\n비밀글작성을 시험해봅니다.','2020-11-04 00:49:40','outside16',3,84,1,'1234',1),(85,0,0,1,'추가게시판 게시글 수정','작성테스트\r\n\r\n게시글을 작성합니다.\r\n\r\n(수정합니다.)','2020-11-05 00:30:03','wck',16,85,0,NULL,7),(88,0,0,1,'비밀글수정','추가게시판에서\r\n\r\n비밀글 수정 테스트','2020-11-05 00:33:07','outside16',7,88,1,'1234',7),(89,1,0,1,'추가게시판 공지글 수정','공지글 수정함','2020-11-05 01:15:24','admin',1,89,0,NULL,7),(90,0,0,1,'관리자계정 게시글 등록','추가게시판 관리자계정 게시글 등록','2020-11-05 01:16:34','admin',7,90,0,'',7),(91,0,0,1,'ㅁㄴㅇ','ㅁㄴㅇ','2020-11-05 01:19:12','wck',1,91,0,'',7),(92,0,0,1,'ww','ww','2020-11-05 02:42:26','wck',3,92,0,'',4),(93,0,0,1,'1234','1234','2020-11-05 04:53:10','wck',4,93,0,'',4),(94,1,0,1,'asdsad','asdasd','2020-11-05 04:54:36','admin',0,94,0,NULL,5),(95,0,71,2,'yhs 게시글작성 의 답글','1313','2020-11-05 05:11:07','wck',1,71,0,NULL,5),(100,0,0,1,'추가게시판s ㅁㄴㅇㅇㅇ','ㄴㅁㅇ ㅁㄴㅇㅁㅂㅈㄷ\r\n\r\nㅂㅂㅇㅇ','2020-11-05 05:26:11','wck',11,100,0,'',7),(101,0,100,2,'추가게시판s ㅁㄴㅇㅇㅇ 의 답글','ㅈ1231ㄴㅇ','2020-11-05 05:26:59','wck',1,100,0,NULL,7),(102,1,0,1,'공지글 작성테스트','공지;글123125412313','2020-11-05 05:31:49','admin',0,102,0,NULL,7),(103,0,0,1,'fusion 계정으로 글수정','글쓰기 권한 테스트\r\n\r\n+\r\n\r\n수정권한 테스트','2020-11-05 05:37:42','fusion',6,103,0,'',5),(104,0,103,2,'fusion 계정으로 글수정 의 답글','답글권한 테스트','2020-11-05 05:38:24','fusion',0,103,0,NULL,5);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boardkinds`
--

DROP TABLE IF EXISTS `boardkinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boardkinds` (
  `bk_bseq` int NOT NULL DEFAULT '0' COMMENT '게시판번호',
  `bk_type` int NOT NULL DEFAULT '0' COMMENT '게시판유형',
  `bk_order` int NOT NULL DEFAULT '0' COMMENT '게시판 노출순서',
  `bk_bname` varchar(100) NOT NULL DEFAULT '기본게시판' COMMENT '게시판이름',
  `bk_breply_YN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y' COMMENT '게시판 답글 사용여부',
  `bk_bcomment_YN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y' COMMENT '게시판 댓글 사용여부',
  `bk_bsecret_YN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Y' COMMENT '게시판 비밀글 사용여부',
  PRIMARY KEY (`bk_bseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판 메뉴 정보 저장테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardkinds`
--

LOCK TABLES `boardkinds` WRITE;
/*!40000 ALTER TABLE `boardkinds` DISABLE KEYS */;
INSERT INTO `boardkinds` VALUES (1,0,1,'자유게시판','Y','Y','Y'),(4,1,2,'알림 게시판','Y','Y','Y'),(5,0,3,'예시용 게시판','Y','Y','Y'),(7,0,4,'추가게시판','Y','Y','Y');
/*!40000 ALTER TABLE `boardkinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkboard`
--

DROP TABLE IF EXISTS `checkboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkboard` (
  `b_seq` int NOT NULL AUTO_INCREMENT,
  `b_title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `b_comment` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_writer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `b_topYN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N',
  `b_modifier` varchar(100) DEFAULT NULL,
  `b_modifydate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`b_seq`),
  KEY `FK_b_writer` (`b_writer`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='체크리스트 게시판 게시글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkboard`
--

LOCK TABLES `checkboard` WRITE;
/*!40000 ALTER TABLE `checkboard` DISABLE KEYS */;
INSERT INTO `checkboard` VALUES (19,'##사업부 위생관리 체크리스트( 2020_09_23 )','특이사항 : \r\n\r\n1. 청소담당자는 매일 청소후 check리스트를 작성한다\r\n\r\n2. 점검자는 양호한 상태에만 체크박스에 체크를 기입한다.\r\n\r\n3. 수정해본다.','2020-09-23 03:25:58','admin','Y','admin','2020-10-28 08:38:26'),(41,'안전사고 예방 체크리스트(체크리스트 항목 수정)','행사 관련 안전사고 예방 및 발생시 대처방안을 위한 체크리스트입니다.\r\n\r\n필히 확인하신 후 답변 부탁드립니다.','2020-09-24 00:41:03','adm','Y','adm','2020-09-24 02:04:00'),(43,'창업시 평가사항 체크리스트(수정)','창업 계획시에 고려해야 할 사전 준비 여건 체크리스트입니다.\r\n\r\n창업을 계획하고 있거나 고민하시는 분들은 사전에 체크를 통해 점검해보시기 바랍니다.\r\n\r\n\r\n(adm계정이 수정합니다)','2020-09-24 01:15:42','admin','N','adm','2020-09-24 01:40:45'),(44,'집중력 자체진단 체크리스트','집중력 자체진단 체크리스트입니다.','2020-09-24 01:18:24','admin','N',NULL,NULL),(45,'위험성 평가 체크리스트','건설현장 위험성 평가 체크리스트입니다.','2020-09-24 01:20:05','admin','N',NULL,NULL),(47,'사내 직원 업무전 체크리스트','사내 직원 업무전 체크리스트입니다.\r\n\r\n매일 출근시 업무시작전에 체크하여 답변해주시기 바랍니다.','2020-09-24 01:24:13','admin','N',NULL,NULL),(48,'업무 수행시 방해요인 제거 체크리스트','방해요인 체크리스트입니다\r\n\r\n꼭 확인하고 정상적인 업무수행에 임해주시기 바랍니다.','2020-09-24 01:37:29','admin','N',NULL,NULL),(55,'오늘의 집 하자보수 체크리스트','오늘의 집에서 작성한\r\n\r\n체크리스트 목록을 등록합니다.','2020-09-24 02:44:13','admin','N','admin','2020-10-28 08:39:10'),(56,'생필품 구매 체크리스트','생필품 구매 체크리스트입니다.\r\n\r\n구매시에 참고해보세요','2020-09-24 02:45:16','admin','N','admin','2020-09-24 02:45:57'),(59,'퓨전소프트 신입사원 교육테스트(수정)','퓨전소프트 신입사원 교육테스트 체크리스트를 작성합니다.\r\n\r\n6주차의 화면구현 테스트가 체크항목에 추가되었습니다.\r\n\r\n현재 완료된 테스트를 체크하여 제출하시면 됩니다.\r\n\r\n조회허용 유저는 전체입니다. (user4를 제외)','2020-09-24 07:15:10','adm','N','admin','2020-09-24 07:17:09'),(63,'체크리스트 작성하기(고정x)','ㅇㅇㅇ','2020-10-29 00:18:21','admin','N',NULL,NULL),(64,'상단고정 체크리스트 테스트22','1234131234222\r\n\r\n222','2020-10-29 00:54:45','admin','Y','adm','2020-10-29 04:28:29'),(65,'체크리스트 작성','테스트용 체크리스트를 작성합니다.\r\n\r\n신규유저에게도 조회허용하며, 체크된 답변을 확인하겠습니다.','2020-11-03 08:06:23','admin','Y','admin','2020-11-03 08:07:30'),(66,'테스트 전 체크리스트','테스트 전 체크리스트\r\n\r\n프로젝트 테스트 전 하나씩 체크해가며 복기해주시기 바랍니다.','2020-11-05 01:57:15','admin','N','admin','2020-11-05 01:58:40'),(67,'fusion유저에 체크리스트 공개','체크리스트 공개 여부를 선택합니다\r\n\r\n새로운 유저에게 체크리스트 공개목록을 열도록합니다.','2020-11-05 05:45:03','admin','N',NULL,NULL);
/*!40000 ALTER TABLE `checkboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist` (
  `c_seq` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) NOT NULL,
  `b_seq` int NOT NULL,
  PRIMARY KEY (`c_seq`),
  KEY `FK_b_seq` (`b_seq`),
  CONSTRAINT `FK_b_seq` FOREIGN KEY (`b_seq`) REFERENCES `checkboard` (`b_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='각 작성글별 체크리스트 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (19,'좌변기 / 소변기 청결상태 체크',19),(20,'휴지걸이의 휴지 충분여부',19),(21,'세면대의 청결상태 여부',19),(22,'세면대에 세정제 비치 여부',19),(23,'바닥 청결상태 양호도',19),(24,'환풍기의 정상작동',19),(25,'용기의 파손부위 여부',19),(26,'변기 / 하수구 등의 막힘 여부',19),(77,'사전 안전교육',41),(79,'안전관리 요원 편성',41),(82,'창업분야 시장 이해도',43),(83,'충분한 사전조사와 포지셔닝 계획',43),(84,'사업진행중 어려움 발생시 대비책',43),(85,'안정적인 자금관리와 지속적인 기술개발',43),(86,'변동되는 시장 상황에 대한 대처능력',43),(87,'특정 업무수행시 오랜시간 집중할 수 있다',44),(88,'생각을 다방면으로 충분히 한 후 계획을 실행한다',44),(89,'최근 1년간 안전사고 발생 이력이 있다',45),(90,'엘리베이터 입구부 자재 낙하위험이 있다',45),(91,'차폐판 설치 작업중 추락위험이 있다',45),(96,'당일 업무 계획 확인',47),(97,'전일 업무보고 작성 확인',47),(98,'투입 프로젝트 확인',47),(99,'업무환경 주변정리',47),(100,'불필요한 소음의 발생여부',48),(101,'휴대폰이나 전자기기의 매너모드 확인',48),(118,'adm체크리스트',43),(119,'개인 안전보호용품 착용',41),(120,'주변 위험물품 제거',41),(129,'노후된 수도와 난방배관',55),(130,'베란다 혹은 벽의 균열',55),(131,'벽면사이 석회질이 생긴 새시',55),(132,'손상이 심한 벽면과 문틀',55),(133,'벽지 들뜸과 곰팡이 자국이 있는 벽 단열',55),(134,'계량컵',56),(135,'칫솔',56),(136,'변기커버',56),(137,'조미료',56),(140,'호일',56),(141,'빨래망',56),(142,'싱크대 거름망',56),(164,'1주 계층형 게시판 구현',59),(165,'2주 게시판 추가 / 유저권한 추가',59),(166,'3주 설문조사 구현',59),(167,'4주 태그갤러리 게시판 구현',59),(168,'5주 체크리스트 구현',59),(169,'6주차 화면구현 테스트',59),(193,'체크',63),(194,'리스트',63),(195,'작성',63),(196,'확인',63),(197,'상단고정 안함',63),(198,'상단',64),(199,'고정',64),(200,'체크리스트',64),(201,'작성',64),(202,'해보기',64),(203,'d',64),(204,'체크리스트1',65),(205,'체크2',65),(207,'체크4',65),(208,'체크6',65),(209,'만',65),(211,'DB구조 확인',66),(213,'기능 로직 점검',66),(214,'코드에 대한 이해도',66),(215,'동작확인',66),(216,'예외발생 여부 체크',66),(217,'1313',67),(218,'12312',67),(219,'111',67);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `c_no` int NOT NULL,
  `c_writer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unknown',
  `c_content` varchar(300) NOT NULL,
  `c_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_parent` int DEFAULT '0',
  `c_origin` int NOT NULL,
  `b_no` int NOT NULL,
  `c_depth` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_no`),
  KEY `FK1_bno` (`b_no`),
  CONSTRAINT `FK1_bno` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='통합게시판 - 댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'user','1313','2020-09-03 08:07:16',0,1,27,1),(4,'wck','13','2020-09-07 00:55:48',0,4,50,1),(11,'user','1234','2020-09-07 02:44:14',0,11,50,1),(12,'wck','1313','2020-09-07 03:09:00',0,12,64,1),(13,'wck','131234123','2020-09-07 04:35:49',0,13,49,1),(14,'admin','1234','2020-09-07 05:33:47',0,14,55,1),(18,'admin','새댓글 작성','2020-09-07 06:37:05',0,18,50,0),(20,'admin','1234123','2020-09-07 06:42:30',19,4,50,3),(21,'fusionsoft','1313','2020-10-28 05:06:36',0,21,70,1),(22,'admin','3434','2020-10-28 05:38:30',21,21,70,2),(24,'yhs1234','댓글의 댓글 작성','2020-10-28 05:52:15',12,12,64,2),(25,'wck','123','2020-11-03 05:55:35',0,25,27,1),(26,'wck','33','2020-11-03 05:56:43',0,26,25,1),(27,'outside16','1234','2020-11-03 07:55:44',0,27,79,1),(28,'outside16','1313','2020-11-03 07:55:50',0,28,64,1),(29,'outside16','1313','2020-11-03 07:55:55',0,29,73,1),(36,'wck','비밀글에 댓글 테스트','2020-11-05 00:33:21',0,36,88,1),(38,'wck','12313452123','2020-11-05 05:26:16',0,38,100,1),(39,'wck','55','2020-11-05 05:26:19',38,38,100,2),(40,'wck','12312313','2020-11-05 05:26:23',0,40,100,1),(41,'wck','123213','2020-11-05 05:26:28',38,38,100,2),(42,'wck','123214123','2020-11-05 05:26:32',39,38,100,3),(43,'fusion','댓글테스트입니다/','2020-11-05 05:38:36',0,43,71,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `f_seq` int NOT NULL AUTO_INCREMENT,
  `f_originname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `f_uploadname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `f_thumbname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `f_fsize` int NOT NULL DEFAULT '0',
  `f_downcnt` int NOT NULL DEFAULT '0',
  `g_seq` int NOT NULL,
  PRIMARY KEY (`f_seq`),
  KEY `FK_g_seq` (`g_seq`),
  CONSTRAINT `FK_g_seq` FOREIGN KEY (`g_seq`) REFERENCES `gallery` (`g_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='갤러리 - 업로드 파일 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (38,'1화_바다.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg',110192,1,1),(41,'cat.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg',81951,1,1),(42,'tree.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg',60856,1,1),(43,'car.png','d8de465f-9881-4087-a2df-da3a05478c4e.png','d8de465f-9881-4087-a2df-da3a05478c4e.png',101270,2,2),(44,'egov.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg',16765,1,2),(45,'180829-8-2000-din-busan-hotel.jpg.thumb.768.768.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg',65225,0,3),(46,'house.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg',116509,0,3),(47,'pets.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg',120915,3,4),(50,'student.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png',97360,1,7),(53,'catPray.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg',190369,1,8),(54,'plz.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg',25716,1,9),(59,'cat_Thunder.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg',91101,14,12),(61,'Lion.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg',314509,7,13),(62,'deer.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg',25776,2,13),(63,'dumpling.jpg','5de821c2-c72a-4675-89da-eb996ff9dd66.jpg','THUMB_5de821c2-c72a-4675-89da-eb996ff9dd66.jpg',111629,2,14),(64,'dumpling2.jpg','8caf31b1-0faa-4207-9392-6711353b0572.jpg','THUMB_8caf31b1-0faa-4207-9392-6711353b0572.jpg',222208,0,14),(65,'cake.jpg','cfeeb74b-1b15-48a9-980e-d21d5796d91b.jpg','THUMB_cfeeb74b-1b15-48a9-980e-d21d5796d91b.jpg',511597,2,15),(66,'house.jpg','f3836e99-68d6-4b3d-b9e0-2da1cd54d88e.jpg','THUMB_f3836e99-68d6-4b3d-b9e0-2da1cd54d88e.jpg',116509,1,16),(67,'tree.jpg','700a2dcd-ab8d-43a2-a830-d3c321e7ec3c.jpg','THUMB_700a2dcd-ab8d-43a2-a830-d3c321e7ec3c.jpg',60856,1,16),(68,'baby.jpg','24678a23-c7a9-4cfa-ba4e-db4972d80333.jpg','THUMB_24678a23-c7a9-4cfa-ba4e-db4972d80333.jpg',75333,1,6),(69,'bee2.jpg','0d3be433-b760-44e5-82e5-97ddd9634ca2.jpg','THUMB_0d3be433-b760-44e5-82e5-97ddd9634ca2.jpg',87692,0,17),(70,'bee.jpg','b7812b44-67f5-475b-931a-59f3f74aeaad.jpg','THUMB_b7812b44-67f5-475b-931a-59f3f74aeaad.jpg',73469,0,17),(72,'Check.png','de5f1aa2-3408-4d37-a16b-79d4c5fe6f71.png','THUMB_de5f1aa2-3408-4d37-a16b-79d4c5fe6f71.png',37105,1,19),(74,'stock_Photo.jpg','6a7313aa-0e85-4881-be19-b6d683c46bcf.jpg','THUMB_6a7313aa-0e85-4881-be19-b6d683c46bcf.jpg',120001,1,20),(79,'kakao_characters.jpg','452f5be9-7fee-4131-9e97-759d3519c4bd.jpg','THUMB_452f5be9-7fee-4131-9e97-759d3519c4bd.jpg',69121,2,22),(80,'kakao2.jpg','5376e77a-d489-4822-a1e7-ce73fb517945.jpg','THUMB_5376e77a-d489-4822-a1e7-ce73fb517945.jpg',27738,2,22),(81,'friends.jpg','41210149-b64e-4b78-853d-2693d240f802.jpg','THUMB_41210149-b64e-4b78-853d-2693d240f802.jpg',114759,3,22),(82,'Kakao.png','7b4a7552-4d5a-4623-a887-cfb1c193b1d4.png','THUMB_7b4a7552-4d5a-4623-a887-cfb1c193b1d4.png',123760,2,22),(83,'people.jpg','1acc2e1b-66bb-4f72-ad24-5a675ddb2cc8.jpg','THUMB_1acc2e1b-66bb-4f72-ad24-5a675ddb2cc8.jpg',65870,1,23),(84,'human.jpg','db8c6f55-4100-4692-8d87-1bdea859e79c.jpg','THUMB_db8c6f55-4100-4692-8d87-1bdea859e79c.jpg',42960,1,23),(85,'kangwon.jpg','a13cde97-f182-4053-a6da-707844e7fda0.jpg','THUMB_a13cde97-f182-4053-a6da-707844e7fda0.jpg',23174,4,24),(86,'dodream.png','79e9d82a-2a7f-4600-825d-d0e1173b7782.png','THUMB_79e9d82a-2a7f-4600-825d-d0e1173b7782.png',138337,5,25),(87,'neo.jpg','97392cc1-c477-42ce-a3e6-f451138d8868.jpg','THUMB_97392cc1-c477-42ce-a3e6-f451138d8868.jpg',248568,3,26),(88,'ryan_3d.png','586b99a7-cf8c-431f-a59f-c4becf7ab90d.png','THUMB_586b99a7-cf8c-431f-a59f-c4becf7ab90d.png',13667,1,27),(90,'color.png','3f4b5d55-824e-42a3-af09-d7bcae594ee4.png','THUMB_3f4b5d55-824e-42a3-af09-d7bcae594ee4.png',173529,0,20),(92,'cat.png','1167db48-f6b9-467f-a187-404f192d3be8.png','THUMB_1167db48-f6b9-467f-a187-404f192d3be8.png',82807,3,30),(94,'dog.jpg','dcfda80d-f385-401d-be18-3cbc16c5a919.jpg','THUMB_dcfda80d-f385-401d-be18-3cbc16c5a919.jpg',381579,2,30),(101,'베니고마.jpg','79e5049c-1ca2-4c59-8dc0-d46d9ab7cc18.jpg','THUMB_79e5049c-1ca2-4c59-8dc0-d46d9ab7cc18.jpg',23445,1,32),(102,'cute.jpg','8d1313e8-60b7-4a8f-9f16-951aa28eebe2.jpg','THUMB_8d1313e8-60b7-4a8f-9f16-951aa28eebe2.jpg',17243,0,32),(106,'코닉세그.jpg','20441a03-b4ce-4ac3-8cbd-54a9f4ae2812.jpg','THUMB_20441a03-b4ce-4ac3-8cbd-54a9f4ae2812.jpg',78572,7,33),(132,'F816_imageupload.png','c5d9de44-97f5-4712-9a98-f83f542d5b68.png','THUMB_c5d9de44-97f5-4712-9a98-f83f542d5b68.png',15687,1,35),(133,'kakao2.jpg','5ffcbb0f-5da2-4969-9614-62e14cce27b0.jpg','THUMB_5ffcbb0f-5da2-4969-9614-62e14cce27b0.jpg',27738,1,35),(136,'IxTUhFLS.jpg','52c42720-e581-430c-9e6f-555b3a21a785.jpg','THUMB_52c42720-e581-430c-9e6f-555b3a21a785.jpg',32796,3,36),(137,'qwe.png','c3380f12-b565-4415-9e8f-2904874ce452.png','THUMB_c3380f12-b565-4415-9e8f-2904874ce452.png',50766,2,36),(140,'down.png','9b250e4c-59b6-4030-9902-a8f3cd519f19.png','THUMB_9b250e4c-59b6-4030-9902-a8f3cd519f19.png',278669,0,36),(141,'dog.jpg','ed0b1253-d2be-44a5-b00d-b499ff793272.jpg','THUMB_ed0b1253-d2be-44a5-b00d-b499ff793272.jpg',381579,0,36),(143,'down.png','1cb1c2bb-7fb6-42b3-931e-abd5eb8d7a54.png','THUMB_1cb1c2bb-7fb6-42b3-931e-abd5eb8d7a54.png',278669,0,37),(144,'IxTUhFLS.jpg','a36b89b2-0fc4-47cd-b354-3056edd42f9f.jpg','THUMB_a36b89b2-0fc4-47cd-b354-3056edd42f9f.jpg',32796,0,37);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `g_seq` int NOT NULL,
  `g_title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_content` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_regdate` date NOT NULL,
  `g_readcnt` int NOT NULL DEFAULT '0',
  `g_tag` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_writer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`g_seq`),
  KEY `FK_g_writer_u_id` (`g_writer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='갤러리 게시글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'태그 전부 수정','태그 전부를 수정합니다\r\n로 수정합니다.','2020-09-15',85,'가을,바다,사람','wck'),(2,'테스트 작성글','갤러리 테스트 글을 작성합니다 ^0^','2020-09-15',26,'테스트,이미지','wck'),(3,'건물사진','건물사진입니다\r\n\r\n레스토랑이랑 집입니다.','2020-09-15',12,'건물,음식,레스토랑','wck'),(4,'애완동물','pets','2020-09-15',20,'동물,고양이,강아지, 펫','wck'),(6,'아기','아기사진입니다\r\n\r\n귀엽죠?','2020-09-15',39,'아기,사람,귀여움,웃음','wck'),(7,'학생이미지','학생아이콘을 추가해봤어요\r\n\r\n잘 사용하시길 바랍니다 ^^','2020-09-15',13,'학생,아이콘,야나,두','wck'),(8,'제발!!!','ㅈㅂㅈㅂ!!!','2020-09-16',24,'동물,웃긴사진,고양이','wck'),(9,'제발!!','하느님 제발!!','2020-09-16',25,'웃긴사진,카툰,웃음','wck'),(12,'고양이썬더','고양이썬더','2020-09-16',8,'웃긴사진,동물,고양이','wck'),(13,'동물사진','사자\r\n\r\n사슴','2020-09-16',53,'동물,사자,사슴,맹수','wck'),(14,'만두','만두사진이에요\r\n\r\n맛있어보여요','2020-09-17',9,'음식,만두,저녁','wck'),(15,'케이크','케이크사진입니다.','2020-09-17',10,'음식,생일,케이크','wck'),(16,'나무','나무사진','2020-09-17',17,'식물,숲,테스트','wck'),(17,'꿀벌','귀여운 꿀벌 \r\n\r\n:D','2020-09-17',12,'동물,곤충,벌','wck'),(19,'체크 이미지','업로드해봅니다\r\n\r\n하하하\r\n\r\n길게 글을 늘여써서 검색이 정상적인지 확인합시다.','2020-09-17',16,'이미지,체크,초록,컬러','wck'),(20,'컬러테스트','여러가지 색상을 담은 이미지입니다.\r\n\r\n화려한 느낌을 줍니다','2020-09-17',78,'컬러,추가,테스트','wck'),(22,'카카오','캐릭터 이미지\r\n\r\n\r\n라이언과 카카오 프렌즈','2020-09-18',29,'카카오,캐릭터,라이언','user'),(23,'사람의 행동','사람 이미지\r\n\r\n2장입니다.','2020-09-18',6,'사람,실사,캐릭터','user'),(24,'강원도 캐릭터입니다.','호랑이랑 곰?\r\n\r\n인거같아요 \r\n\r\n귀엽습니다.','2020-09-18',34,'호랑이,곰,동물,캐릭터','user'),(25,'두드림','두드림 대표캐릭터\r\n\r\n\'두두\' 입니다.','2020-09-18',26,'두두,캐릭터,두드림','user'),(26,'동물','동물','2020-09-18',47,'동물,테스트','user'),(27,'동물','라이언도 동물이지않을까','2020-09-18',8,'동물,카카오,라이언','user'),(30,'귀여운 동물 캐릭터(수정)','그리기쉽고 귀여운 캐릭터 이미지에요\r\n\r\n따라 그려봅시다 :D\r\n\r\n(돼지 이미지는 삭제되었습니다 ㅜㅜ)','2020-09-18',22,'동물,캐릭터,고양이,개','wck'),(32,'베니고마','베니고마라는 캐릭터에요','2020-09-18',24,'베니고마,캐릭터,물개','wck'),(33,'슈퍼카','자동차 이미지입니다.','2020-09-18',61,'슈퍼카,람보르기니,코닉세그','user'),(35,'갤러리 통합 업로드 테스트','업로드 해보기','2020-10-28',28,'갤러리,통합,업로드','wck'),(36,'갤러리 게시글 제목 수정','갤러리에다가 글 업로드\r\n\r\n이미지 하나 쳐내고, 이미지 하나 추가함\r\n\r\n태그는 힝힝 삭제하고, TOT추가함\r\n\r\n내용수정','2020-10-29',50,'통합,테스트,TOT,업로드','wck'),(37,'fusion 유저 갤러리 게시글 작성','갤러리에 글쓰기\r\n\r\n파일 전부 삭제하고 다른파일로 변경\r\n\r\n및 태그 추가','2020-11-05',5,'태그1,태그추가','fusion');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `b_no` int NOT NULL,
  KEY `FK_user_id` (`user_id`),
  KEY `FK_b_no` (`b_no`),
  CONSTRAINT `FK_b_no` FOREIGN KEY (`b_no`) REFERENCES `board` (`b_no`) ON DELETE CASCADE,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판 기능 - 읽은 유저 / 읽은 게시글 기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('wck',11),('wck',8),('wck',9),('user',11),('user',8),('user',9),('fusion1',11),('fusion1',9),('master',21),('master',19),('wck',21),('wck',19),('user',21),('user',19),('fusion1',19),('admin',21),('admin',19),('admin',11),('admin',9),('admin',25),('admin',24),('user',26),('user',27),('user',25),('username',19),('username',50),('username',49),('wck',43),('wck',49),('wck',50),('wck',55),('user',55),('wck',54),('wck',46),('wck',45),('admin',50),('admin',27),('admin',38),('admin',39),('admin',40),('admin',55),('sjh1991',50),('sjh1991',55),('sjh1991',21),('wck',44),('wck',42),('user',50),('user',53),('user',54),('user',49),('wck',64),('admin',64),('admin',70),('yhs1234',70),('yhs1234',71),('admin',71),('admin',68),('yhs1234',64),('admin',72),('yhs1234',55),('yhs1234',50),('yhs1234',73),('user',64),('user',45),('wck',38),('wck',40),('wck',41),('user',70),('wck',68),('fusionsoft',50),('fusionsoft',26),('fusionsoft',8),('fusionsoft',54),('fusionsoft',49),('fusionsoft',64),('fusionsoft',68),('fusionsoft',73),('fusionsoft',71),('fusionsoft',55),('fusionsoft',21),('fusionsoft',65),('fusionsoft',24),('wck',70),('wck',73),('wck',71),('wck',39),('wck',27),('wck',25),('wck',77),('outside16',68),('outside16',64),('outside16',73),('outside16',27),('outside16',25),('outside16',11),('outside16',79),('outside16',70),('outside16',82),('outside16',83),('outside16',84),('outside16',8),('wck',79),('wck',80),('wck',84),('wck',85),('wck',88),('outside16',88),('admin',89),('admin',90),('wck',90),('wck',91),('outside16',77),('outside16',71),('outside16',80),('outside16',85),('wck',82),('wck',92),('wck',93),('wck',65),('wck',95),('wck',100),('wck',101),('admin',84),('fusion',50),('fusion',103),('fusion',71),('fusion',100),('fusion',83);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `l_seq` int NOT NULL AUTO_INCREMENT,
  `l_readdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `b_seq` int NOT NULL,
  PRIMARY KEY (`l_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='체크리스트 기능 - 사용자별 조회 / 답변 로그 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2020-09-23 06:06:08','wck',14),(2,'2020-09-23 03:02:03','wck',17),(3,'2020-09-23 03:02:36','user2',14),(4,'2020-09-23 01:07:23','user3',14),(5,'2020-09-23 01:07:20','user3',18),(6,'2020-09-23 01:09:09','user1',18),(7,'2020-11-05 00:10:11','wck',19),(8,'2020-10-21 04:29:28','wck',41),(9,'2020-09-24 01:10:46','wck',32),(10,'2020-09-24 01:10:48','wck',31),(11,'2020-09-24 01:58:57','wck',53),(12,'2020-09-24 02:00:00','user1',52),(13,'2020-09-24 01:59:31','user2',52),(14,'2020-09-24 02:59:11','user1',41),(15,'2020-09-24 02:39:25','wck',51),(16,'2020-10-21 04:23:18','wck',50),(17,'2020-10-19 02:20:13','wck',48),(18,'2020-10-19 02:17:51','wck',43),(19,'2020-09-24 02:39:33','wck',44),(20,'2020-09-24 02:58:51','wck',45),(21,'2020-10-19 02:18:37','wck',46),(22,'2020-09-24 06:50:34','wck',47),(23,'2020-11-03 04:17:58','wck',49),(24,'2020-09-24 02:59:10','user1',43),(25,'2020-10-21 04:23:14','wck',56),(26,'2020-09-24 06:52:03','user2',55),(27,'2020-09-24 02:59:21','user2',41),(28,'2020-09-24 02:59:29','user4',48),(29,'2020-09-24 02:59:44','user5',41),(30,'2020-09-24 06:52:16','user3',49),(31,'2020-09-24 06:52:14','user3',56),(32,'2020-09-24 06:52:17','user3',44),(33,'2020-09-24 06:52:23','user3',43),(34,'2020-09-24 06:52:20','user3',19),(35,'2020-09-24 06:52:21','user3',41),(36,'2020-09-24 06:53:47','wck',57),(37,'2020-09-24 06:52:51','user2',57),(38,'2020-09-24 06:53:39','user3',57),(39,'2020-09-24 07:09:40','wck',58),(40,'2020-09-24 07:07:38','user3',58),(41,'2020-09-24 07:09:32','user1',58),(42,'2020-09-28 01:47:15','wck',59),(43,'2020-09-24 07:16:00','user1',59),(44,'2020-09-24 07:16:09','user2',59),(45,'2020-11-03 04:17:59','wck',55),(46,'2020-09-25 02:43:46','wck',60),(47,'2020-09-25 02:42:33','user1',60),(48,'2020-09-25 02:44:54','wck',61),(49,'2020-09-25 05:59:43','wck',62),(50,'2020-11-05 02:24:22','wck',63),(51,'2020-10-29 00:33:41','wck1234',55),(52,'2020-10-29 00:33:42','wck1234',56),(53,'2020-11-04 00:12:51','wck1234',59),(54,'2020-11-03 02:07:36','wck1234',49),(55,'2020-11-03 02:19:10','wck1234',43),(56,'2020-11-03 02:19:01','wck1234',64),(57,'2020-11-05 01:54:21','wck',64),(58,'2020-10-29 01:36:39','fusionsoft',64),(59,'2020-10-29 01:36:42','fusionsoft',19),(60,'2020-10-29 01:36:44','fusionsoft',55),(61,'2020-11-03 02:19:06','wck1234',41),(62,'2020-11-03 02:17:54','wck1234',63),(63,'2020-11-03 02:19:00','wck1234',48),(64,'2020-11-03 02:19:04','wck1234',46),(65,'2020-11-03 02:19:30','wck1234',44),(66,'2020-11-03 07:35:59','user',19),(67,'2020-11-03 07:36:02','user',55),(68,'2020-11-04 01:40:25','outside16',65),(69,'2020-11-05 01:54:44','wck',65),(70,'2020-11-05 01:59:04','wck',66),(71,'2020-11-05 01:58:50','wck1234',66),(72,'2020-11-05 05:45:28','fusion',67);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servey`
--

DROP TABLE IF EXISTS `servey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servey` (
  `s_seq` int NOT NULL AUTO_INCREMENT COMMENT '설문조사 번호',
  `s_name` varchar(3000) NOT NULL COMMENT '설문조사명',
  `s_startdate` date NOT NULL,
  `s_enddate` date NOT NULL,
  `s_company` varchar(1000) NOT NULL,
  PRIMARY KEY (`s_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='설문조사 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servey`
--

LOCK TABLES `servey` WRITE;
/*!40000 ALTER TABLE `servey` DISABLE KEYS */;
INSERT INTO `servey` VALUES (1,'퓨전소프트 만족도 조사','2020-09-07','2020-11-30','퓨전소프트');
/*!40000 ALTER TABLE `servey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serveyanswer`
--

DROP TABLE IF EXISTS `serveyanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serveyanswer` (
  `q_no` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `a_answer` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `s_seq` int DEFAULT NULL,
  KEY `FK_tbl_answer_s_seq` (`s_seq`),
  KEY `FK_u_id` (`user_id`) USING BTREE,
  CONSTRAINT `FK_tbl_answer_s_seq` FOREIGN KEY (`s_seq`) REFERENCES `servey` (`s_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='설문조사 답변정보 저장테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveyanswer`
--

LOCK TABLES `serveyanswer` WRITE;
/*!40000 ALTER TABLE `serveyanswer` DISABLE KEYS */;
INSERT INTO `serveyanswer` VALUES ('6','wck','1',1),('5','wck','1',1),('2','wck','2',1),('4','wck','2',1),('1','wck','3',1),('3','wck','3',1),('7','wck','2',1),('8','wck','1',1),('10','wck','2',1),('9','wck','4',1),('11','wck','3',1),('12','wck','2',1),('13','wck','2',1),('14','wck','1',1),('16-1','wck','4,6,12',1),('15','wck','2',1),('16','wck','',1),('16-2','wck','1,2',1),('16-3','wck','2,4',1),('17','wck','ad',1),('18','wck','2',1),('19','wck','ㅇㄷㅂㄷ',1),('6','adm','3',1),('4','adm','2',1),('3','adm','3',1),('5','adm','1',1),('2','adm','2',1),('1','adm','1',1),('7','adm','3',1),('11','adm','2',1),('8','adm','4',1),('10','adm','2',1),('9','adm','2',1),('12','adm','3',1),('13','adm','4',1),('14','adm','1',1),('15','adm','2',1),('16','adm','',1),('16-2','adm','4,5',1),('16-1','adm','11,13,17',1),('16-3','adm','10',1),('17','adm','11213',1),('18','adm','',1),('19','adm','',1),('5','wck1234','2',1),('1','wck1234','4',1),('4','wck1234','3',1),('6','wck1234','3',1),('3','wck1234','4',1),('2','wck1234','5',1),('11','wck1234','3',1),('12','wck1234','3',1),('10','wck1234','2',1),('7','wck1234','2',1),('13','wck1234','5',1),('8','wck1234','1',1),('9','wck1234','3',1),('14','wck1234','4',1),('15','wck1234','2',1),('16-1','wck1234','4,7,8',1),('16','wck1234','',1),('16-2','wck1234','1,3',1),('16-3','wck1234','3,5',1),('17','wck1234','ㄴㅇ',1),('18','wck1234','',1),('19','wck1234','',1),('1','user','4',1),('2','user','4',1),('3','user','3',1),('4','user','4',1),('6','user','4',1),('5','user','2',1),('7','user','6',1),('8','user','5',1),('9','user','4',1),('10','user','2',1),('12','user','4',1),('13','user','2',1),('11','user','4',1),('14','user','4',1),('15','user','1',1),('16','user','',1),('16-1','user','3,5,11',1),('16-2','user','2,5',1),('16-3','user','3,6',1),('17','user','sss',1),('18','user','',1),('19','user','',1),('1','fusion','3',1),('3','fusion','2',1),('2','fusion','2',1),('4','fusion','1',1),('7','fusion','2',1),('5','fusion','7',1),('8','fusion','1',1),('6','fusion','4',1),('9','fusion','1',1),('10','fusion','7',1),('11','fusion','4',1),('14','fusion','1',1),('12','fusion','2',1),('13','fusion','1',1),('15','fusion','7',1),('16','fusion','',1),('16-1','fusion','4,7,11',1),('16-2','fusion','5,8',1),('16-3','fusion','4,7',1),('17','fusion','asdsad',1),('18','fusion','',1),('19','fusion','',1);
/*!40000 ALTER TABLE `serveyanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serveychoice`
--

DROP TABLE IF EXISTS `serveychoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serveychoice` (
  `c_type` int NOT NULL,
  `c_text` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `c_value` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='설문조사 문항 선택지 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveychoice`
--

LOCK TABLES `serveychoice` WRITE;
/*!40000 ALTER TABLE `serveychoice` DISABLE KEYS */;
INSERT INTO `serveychoice` VALUES (1,'대체로 만족',2),(1,'약간 만족',3),(1,'보통',4),(1,'약간 불만족',5),(1,'대체로 불만족',6),(1,'매우 불만족',7),(1,'매우 만족',1),(2,'단원학습자료',2),(2,'수업설계자료',1),(2,'인성 진로 다문화',3),(2,'연구자료',4),(2,'교육과정자료',5),(2,'주제별 사진영상 자료',6),(2,'교과주제별 학습자료',7),(2,'위두랑',9),(2,'우수수업동영상',10),(2,'디지털교과서',11),(2,'소프트웨어교육',12),(2,'연구대회',13),(2,'연구학교',14),(2,'교원연수',16),(2,'외부자료',8),(2,'영어 e-교과서',17),(2,'스마트교육 이해',18),(2,'문제은행',19),(2,'사서추천도서',15),(2,'없음',20),(3,'학생평가',2),(3,'자유학기제',3),(3,'고교교육력 제고',4),(3,'고교학점제',6),(3,'2015 개정 교육과정',1),(3,'사이버폭력예방. 정보윤리교육',7),(3,'도란도란 학교폭력예방',8),(3,'NCS기반 교육과정',5),(4,'공지사항',1),(4,'마이페이지',2),(4,'독서교육. 인문소양교육',3),(4,'선생님들의 나눔공간',4),(4,'시. 도교육정보서비스',6),(3,'없음',9),(4,'최신동향',7),(4,'고객센터(이용문의)',8),(4,'기타(   )',9),(4,'없음',10),(4,'나에게 Dream',5),(5,'콘텐츠 검색',2),(5,'회원가입',3),(5,'인지도 강화(홍보)',4),(5,'기타(   )',5),(5,'콘텐츠 보강',1);
/*!40000 ALTER TABLE `serveychoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serveylog`
--

DROP TABLE IF EXISTS `serveylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serveylog` (
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `inputdate` date NOT NULL,
  `s_seq` int NOT NULL DEFAULT '0',
  KEY `FK_log_sseq` (`s_seq`),
  KEY `FK_log_uid` (`user_id`) USING BTREE,
  CONSTRAINT `FK_log_sseq` FOREIGN KEY (`s_seq`) REFERENCES `servey` (`s_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='설문조사 답변여부 기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveylog`
--

LOCK TABLES `serveylog` WRITE;
/*!40000 ALTER TABLE `serveylog` DISABLE KEYS */;
INSERT INTO `serveylog` VALUES ('wck','2020-11-03',1),('adm','2020-10-26',1),('wck1234','2020-11-03',1),('user','2020-11-03',1),('fusion','2020-11-05',1);
/*!40000 ALTER TABLE `serveylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serveyquestion`
--

DROP TABLE IF EXISTS `serveyquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serveyquestion` (
  `s_seq` int NOT NULL,
  `q_no` varchar(50) NOT NULL DEFAULT '',
  `q_text` varchar(3000) NOT NULL DEFAULT '',
  `q_category` varchar(300) NOT NULL DEFAULT '',
  `c_type` int NOT NULL DEFAULT '0',
  `q_required` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'true',
  `q_multiple` int NOT NULL DEFAULT '1',
  KEY `FK_s_seq` (`s_seq`),
  CONSTRAINT `FK_s_seq` FOREIGN KEY (`s_seq`) REFERENCES `servey` (`s_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='설문조사 질문지 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveyquestion`
--

LOCK TABLES `serveyquestion` WRITE;
/*!40000 ALTER TABLE `serveyquestion` DISABLE KEYS */;
INSERT INTO `serveyquestion` VALUES (1,'1','퓨전소프트 서비스에 대해 전반적으로 얼마나 만족하십니까?','전반적 만족도',1,'true',1),(1,'2','퓨전소프트에서 원하는 정보(자료)를 손쉽게 찾을 수 있습니까?','검색성',1,'true',1),(1,'3','검색창이 눈에 잘 띄는 위치에 적절한 크기로 배치되어 있습니까?','검색성',1,'true',1),(1,'4','게시물의 제목만으로도 게시물 내용을 알 수 있습니까?','사용성',1,'true',1),(1,'5','장문의 정보나 첨부문서가 포함된 경우 미리보기 또는 요약문을 충분히 제공한다고 생각하십니까?','사용성',1,'true',1),(1,'6','퓨전소프트에서 제공하는 자료의 글자 크기, 문단이 잘 정렬되어 보거나 읽기 쉽습니까?','사용성',1,'true',1),(1,'7','퓨전소프트의 서비스 디자인이 일관성 있게 정돈되어 홈페이지 통일성이 느껴지십니까?','사용성',1,'true',1),(1,'8','퓨전소프트에서 사용되는 용어가 쉽고 명확하게 이해되십니까?','사용성',1,'true',1),(1,'9','서비스 페이지마다 동일한 아이콘과 버튼을 사용하고 있어 편리하십니까?','사용성',1,'true',1),(1,'10','서비스를 이용하는데 필요한 최소한의 개인정보만을 요구하고 있다고 생각하십니까?','정보보호',1,'true',1),(1,'11','포털을 방문하신 목적을 달성하시는데 포털에서 제고하는 서비스(통합검색, 마이메뉴 등)는 도움이 되셨습니까?','유용성',1,'true',1),(1,'12','서비스 이용을 통해 수업, 학습, 연구 준비에 도움이 되셨습니까?','유용성',1,'true',1),(1,'13','인쇄, 공유, 스크랩 등 유용한 부가기능을 충분히 제공하고 있다고 생각하십니까?','유용성',1,'true',1),(1,'14','서비스 문의사항에 대해 신속하고 충분한 답변을 받으셨습니까?','소통',1,'true',1),(1,'15','퓨전소프트에서 서비스하는 교육과정 관련 자료가 유익하십니까?','',1,'true',1),(1,'16','퓨전소프트에서 제공하는 서비스 중 가장 도움이 되는 서비스를 영역별로 선택해 주십시오.','',-1,'false',1),(1,'16-1','수업 ˙ 연구 (2개 선택)','',2,'true',2),(1,'16-2','교육정책 (2개 선택)','',3,'true',2),(1,'16-3','기타 (2개 선택)','',4,'true',2),(1,'17','위의 서비스를 선택한 이유는 무엇입니까? (필수)','',0,'true',0),(1,'18','퓨전소프트가 가장 시급하게 개성해야 할 부분은 무엇이라고 생각하십니까? (자율)','',5,'false',1),(1,'19','기타 퓨전소프트에 대한 의견을 자유롭게 자성하여 주십시오 (자율)','',0,'false',0);
/*!40000 ALTER TABLE `serveyquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showlist`
--

DROP TABLE IF EXISTS `showlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showlist` (
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `b_seq` int NOT NULL,
  PRIMARY KEY (`user_id`,`b_seq`) USING BTREE,
  KEY `FK_show_bseq` (`b_seq`),
  CONSTRAINT `FK_show_bseq` FOREIGN KEY (`b_seq`) REFERENCES `checkboard` (`b_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='체크리스트 게시글을 보여줄 사용자 리스트 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showlist`
--

LOCK TABLES `showlist` WRITE;
/*!40000 ALTER TABLE `showlist` DISABLE KEYS */;
INSERT INTO `showlist` VALUES ('fusion11',19),('fusion1234',19),('fusionsoft',19),('ktw1989',19),('sjh1991',19),('user',19),('username',19),('wck',19),('wck1111',19),('wck1991',19),('yhs1234',19),('yhsyhs1',19),('user1',41),('user2',41),('user3',41),('user5',41),('wck1234',41),('user1',43),('user3',43),('user4',43),('wck1234',43),('user3',44),('wck1234',44),('wck1234',45),('wck1234',47),('user4',48),('wck1234',48),('fusion11',55),('fusion1234',55),('fusionsoft',55),('user',55),('wck',55),('wck1234',55),('yhs1234',55),('yhsyhs1',55),('user3',56),('wck1234',56),('user1',59),('user2',59),('user3',59),('user5',59),('wck1234',59),('fusion11',63),('wck',63),('wck1111',63),('wck1234',63),('fusion11',64),('fusionsoft',64),('user',64),('username',64),('wck',64),('wck1234',64),('fusionsoft',65),('outside16',65),('user',65),('wck',65),('wck1234',65),('fusion1234',66),('fusionsoft',66),('outside16',66),('wck',66),('wck1234',66),('fusion',67),('user',67),('wck',67),('yhs1234',67);
/*!40000 ALTER TABLE `showlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `t_seq` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) NOT NULL DEFAULT '',
  `t_readcnt` int NOT NULL DEFAULT '0',
  `t_regdate` date NOT NULL,
  `g_seq` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_seq`),
  KEY `FK_tag_gseq` (`g_seq`),
  CONSTRAINT `FK_tag_gseq` FOREIGN KEY (`g_seq`) REFERENCES `gallery` (`g_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='갤러리 게시판 태그관련 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (21,'바다',7,'2020-09-15',1),(28,'가을',7,'2020-09-15',1),(29,'사람',7,'2020-09-15',1),(30,'테스트',19,'2020-09-15',2),(31,'이미지',19,'2020-09-15',2),(32,'건물',8,'2020-09-15',3),(34,'음식',8,'2020-09-15',3),(35,'레스토랑',8,'2020-09-15',3),(36,'동물',16,'2020-09-15',4),(37,'고양이',16,'2020-09-15',4),(38,'강아지',16,'2020-09-15',4),(39,'펫',16,'2020-09-15',4),(42,'아기',18,'2020-09-15',6),(43,'사람',18,'2020-09-15',6),(44,'귀여움',18,'2020-09-15',6),(45,'학생',6,'2020-09-15',7),(46,'아이콘',6,'2020-09-15',7),(48,'동물',19,'2020-09-16',8),(49,'웃긴사진',19,'2020-09-16',8),(50,'웃긴사진',23,'2020-09-16',9),(51,'카툰',23,'2020-09-16',9),(59,'웃긴사진',7,'2020-09-16',12),(60,'동물',7,'2020-09-16',12),(61,'고양이',7,'2020-09-16',12),(62,'동물',48,'2020-09-16',13),(64,'사자',48,'2020-09-16',13),(65,'사슴',48,'2020-09-16',13),(66,'야',6,'2020-09-16',7),(68,'야나',6,'2020-09-16',7),(69,'두',6,'2020-09-16',7),(70,'맹수',45,'2020-09-17',13),(71,'고양이',14,'2020-09-17',8),(72,'웃음',4,'2020-09-17',9),(73,'웃음',15,'2020-09-17',6),(75,'음식',9,'2020-09-17',14),(76,'만두',9,'2020-09-17',14),(77,'저녁',9,'2020-09-17',14),(78,'음식',10,'2020-09-17',15),(79,'생일',10,'2020-09-17',15),(80,'케이크',10,'2020-09-17',15),(81,'식물',17,'2020-09-17',16),(82,'숲',17,'2020-09-17',16),(83,'동물',12,'2020-09-17',17),(84,'곤충',12,'2020-09-17',17),(85,'벌',12,'2020-09-17',17),(89,'이미지',16,'2020-09-17',19),(90,'체크',16,'2020-09-17',19),(91,'초록',16,'2020-09-17',19),(92,'컬러',78,'2020-09-17',20),(95,'컬러',12,'2020-09-17',19),(99,'카카오',29,'2020-09-18',22),(100,'캐릭터',29,'2020-09-18',22),(101,'라이언',29,'2020-09-18',22),(103,'사람',6,'2020-09-18',23),(104,'실사',6,'2020-09-18',23),(105,'캐릭터',6,'2020-09-18',23),(106,'호랑이',34,'2020-09-18',24),(107,'곰',34,'2020-09-18',24),(108,'동물',34,'2020-09-18',24),(109,'캐릭터',34,'2020-09-18',24),(110,'두두',26,'2020-09-18',25),(111,'캐릭터',26,'2020-09-18',25),(112,'두드림',26,'2020-09-18',25),(113,'동물',47,'2020-09-18',26),(114,'동물',8,'2020-09-18',27),(115,'카카오',8,'2020-09-18',27),(116,'라이언',8,'2020-09-18',27),(121,'추가',56,'2020-09-18',20),(125,'동물',22,'2020-09-18',30),(126,'캐릭터',22,'2020-09-18',30),(127,'고양이',22,'2020-09-18',30),(129,'개',22,'2020-09-18',30),(139,'베니고마',24,'2020-09-18',32),(140,'캐릭터',24,'2020-09-18',32),(142,'물개',24,'2020-09-18',32),(143,'슈퍼카',61,'2020-09-18',33),(144,'람보르기니',61,'2020-09-18',33),(146,'코닉세그',58,'2020-09-18',33),(155,'갤러리',28,'2020-10-28',35),(156,'통합',28,'2020-10-28',35),(157,'업로드',28,'2020-10-28',35),(159,'통합',50,'2020-10-29',36),(160,'테스트',50,'2020-10-29',36),(161,'TOT',45,'2020-10-29',36),(162,'테스트',38,'2020-10-29',26),(163,'테스트',10,'2020-10-29',16),(164,'테스트',7,'2020-10-29',20),(168,'업로드',6,'2020-11-05',36),(169,'태그1',5,'2020-11-05',37),(170,'태그추가',2,'2020-11-05',37);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '유저 아이디',
  `user_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '비밀번호',
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '유저명',
  `write_YN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N' COMMENT '글쓰기 권한 여부',
  `update_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '글 수정 권한 여부',
  `delete_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '글삭제 권한 여부',
  `reply_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '답글 권한 여부',
  `comment_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '댓글 권한 여부',
  `read_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '게시판 진입 여부',
  `admin_YN` varchar(50) NOT NULL DEFAULT 'N' COMMENT '관리자 권한 여부',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='유저테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('adm','1234','관리자계정','Y','Y','Y','Y','Y','Y','Y'),('admin','1234','관리자','Y','Y','Y','Y','Y','Y','Y'),('fusion','1234','퓨전소프트','Y','Y','Y','Y','Y','Y','N'),('fusion1','fusion1234','우치경','N','Y','Y','Y','N','Y','Y'),('fusion11','fusion1234','우치경','Y','Y','Y','Y','Y','Y','N'),('fusion1234','fusion1234','우치경','Y','N','N','N','N','N','N'),('fusionsoft','fusion1234','퓨전소프트','Y','Y','Y','Y','Y','Y','N'),('ktw1989','xodn1989','김태우','Y','Y','N','N','N','N','N'),('master','master1234','마스터계정','Y','Y','Y','Y','Y','Y','N'),('outside16','1234','퓨전','Y','Y','Y','Y','Y','Y','N'),('sjh1991','sjh1991','신지훈','Y','Y','Y','Y','Y','Y','N'),('syj1991','syj1991','송영주','N','N','N','N','N','N','N'),('user','1234','이용자','Y','Y','Y','Y','Y','Y','N'),('username','user1234','테스트사용자','Y','Y','Y','Y','Y','Y','N'),('wck','1234','우치경','Y','Y','Y','Y','Y','Y','N'),('wck1111','wck1111','우치경','N','N','N','N','N','N','N'),('wck1234','1234','우치경','Y','Y','Y','Y','Y','Y','N'),('wck1991','wck1991','김철수','N','N','N','N','N','N','N'),('yhs1234','1234','현수임','Y','Y','Y','Y','Y','Y','N'),('yhsyhs1','asd123','현수임','N','N','N','N','N','N','N');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-05 17:34:06
