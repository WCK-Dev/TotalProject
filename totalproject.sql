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
INSERT INTO `answer` VALUES ('N','2020-09-24 02:04:09','user1','2020-09-24 02:40:31','user1',77),('Y','2020-09-24 02:04:09','user1','2020-09-24 02:40:31','user1',79),('N','2020-09-24 02:40:38',NULL,NULL,'user1',82),('N','2020-09-24 02:40:38',NULL,NULL,'user1',83),('Y','2020-09-24 02:40:38',NULL,NULL,'user1',84),('N','2020-09-24 02:40:38',NULL,NULL,'user1',85),('Y','2020-09-24 02:40:38',NULL,NULL,'user1',86),('N','2020-09-24 02:40:38',NULL,NULL,'user1',118),('Y','2020-09-24 02:04:09','user1','2020-09-24 02:40:32','user1',119),('N','2020-09-24 02:04:09','user1','2020-09-24 02:40:32','user1',120),('Y','2020-09-24 07:16:03',NULL,NULL,'user1',164),('Y','2020-09-24 07:16:03',NULL,NULL,'user1',165),('N','2020-09-24 07:16:03',NULL,'2020-09-28 01:06:48','user1',166),('N','2020-09-24 07:16:03',NULL,NULL,'user1',167),('N','2020-09-24 07:16:03',NULL,NULL,'user1',168),('N','2020-09-24 02:59:23',NULL,NULL,'user2',77),('N','2020-09-24 02:59:23',NULL,NULL,'user2',79),('Y','2020-09-24 02:59:23',NULL,NULL,'user2',119),('N','2020-09-24 02:59:23',NULL,NULL,'user2',120),('N','2020-09-24 02:59:20',NULL,NULL,'user2',129),('Y','2020-09-24 02:59:20',NULL,NULL,'user2',130),('Y','2020-09-24 02:59:20',NULL,NULL,'user2',131),('N','2020-09-24 02:59:20',NULL,NULL,'user2',132),('N','2020-09-24 02:59:20',NULL,NULL,'user2',133),('N','2020-09-24 02:59:31',NULL,NULL,'user4',100),('Y','2020-09-24 02:59:31',NULL,NULL,'user4',101),('N','2020-09-24 02:59:47',NULL,NULL,'user5',77),('N','2020-09-24 02:59:47',NULL,NULL,'user5',79),('Y','2020-09-24 02:59:47',NULL,NULL,'user5',119),('N','2020-09-24 02:59:47',NULL,NULL,'user5',120),('N','2020-10-28 08:39:17',NULL,NULL,'wck',129),('N','2020-10-28 08:39:17',NULL,NULL,'wck',130),('Y','2020-10-28 08:39:17',NULL,NULL,'wck',131),('Y','2020-10-28 08:39:18',NULL,NULL,'wck',132),('N','2020-10-28 08:39:18',NULL,NULL,'wck',133),('N','2020-09-23 05:38:26','wck','2020-09-25 09:20:52','wck1234',19),('Y','2020-09-23 05:38:26','wck','2020-09-25 09:20:52','wck1234',20),('N','2020-09-23 05:38:26','wck','2020-09-25 09:20:53','wck1234',21),('Y','2020-09-23 05:38:26','wck','2020-09-25 09:20:53','wck1234',22),('N','2020-09-23 05:38:26','wck','2020-09-25 09:20:53','wck1234',23),('Y','2020-09-23 05:38:26','wck','2020-09-25 09:20:53','wck1234',24),('N','2020-09-23 05:38:26','wck','2020-09-25 09:20:53','wck1234',25),('N','2020-09-23 05:38:26','wck','2020-09-25 09:20:53','wck1234',26),('Y','2020-09-24 02:00:39','wck','2020-10-19 02:17:01','wck1234',77),('N','2020-09-24 02:00:39','wck','2020-10-19 02:17:01','wck1234',79),('N','2020-09-24 02:40:59',NULL,NULL,'wck1234',82),('Y','2020-09-24 02:40:59',NULL,NULL,'wck1234',83),('N','2020-09-24 02:40:59',NULL,NULL,'wck1234',84),('Y','2020-09-24 02:40:59',NULL,NULL,'wck1234',85),('N','2020-09-24 02:40:59',NULL,NULL,'wck1234',86),('N','2020-09-24 02:58:57',NULL,NULL,'wck1234',92),('N','2020-09-24 02:58:57',NULL,NULL,'wck1234',93),('Y','2020-09-24 02:58:57',NULL,NULL,'wck1234',94),('N','2020-09-24 02:58:57',NULL,NULL,'wck1234',95),('N','2020-09-24 06:50:39','wck','2020-10-19 02:18:14','wck1234',100),('Y','2020-09-24 06:50:39','wck','2020-10-19 02:18:14','wck1234',101),('N','2020-09-24 02:33:10','wck','2020-09-25 00:42:57','wck1234',102),('Y','2020-09-24 02:33:10','wck','2020-09-25 00:42:57','wck1234',103),('N','2020-09-24 02:33:10','wck','2020-09-25 00:42:57','wck1234',104),('N','2020-10-19 02:18:24',NULL,NULL,'wck1234',105),('Y','2020-10-19 02:18:24',NULL,NULL,'wck1234',106),('N','2020-10-19 02:18:24',NULL,NULL,'wck1234',107),('N','2020-09-24 02:40:59',NULL,NULL,'wck1234',118),('N','2020-09-24 02:03:04','wck','2020-10-19 02:17:01','wck1234',119),('Y','2020-09-24 02:03:04','wck','2020-10-19 02:17:01','wck1234',120),('Y','2020-09-25 00:49:04','wck','2020-09-28 00:59:15','wck1234',129),('N','2020-09-25 00:49:04','wck','2020-09-28 00:59:15','wck1234',130),('Y','2020-09-25 00:49:04','wck','2020-09-28 00:59:15','wck1234',131),('Y','2020-09-25 00:49:04','wck','2020-09-28 00:59:15','wck1234',132),('N','2020-09-25 00:49:04','wck','2020-09-28 00:59:15','wck1234',133),('Y','2020-09-24 02:45:34','wck','2020-09-24 02:46:09','wck1234',134),('Y','2020-09-24 02:45:34','wck','2020-09-24 02:46:09','wck1234',135),('Y','2020-09-24 02:45:34','wck','2020-09-24 02:46:09','wck1234',136),('N','2020-09-24 02:45:34','wck','2020-09-24 02:46:09','wck1234',137),('Y','2020-09-24 02:45:34','wck','2020-09-24 02:46:09','wck1234',140),('Y','2020-09-24 02:45:34','wck','2020-09-24 02:46:09','wck1234',141),('Y','2020-09-24 02:46:09',NULL,NULL,'wck1234',142),('Y','2020-09-24 07:15:40','wck','2020-09-28 01:47:07','wck1234',164),('Y','2020-09-24 07:15:40','wck','2020-09-28 01:47:07','wck1234',165),('Y','2020-09-24 07:15:40','wck','2020-09-28 01:47:07','wck1234',166),('Y','2020-09-24 07:15:40','wck','2020-09-28 01:47:07','wck1234',167),('Y','2020-09-24 07:15:40','wck','2020-09-28 01:47:07','wck1234',168),('Y','2020-09-24 07:17:21','wck','2020-09-28 01:47:07','wck1234',169);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
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
INSERT INTO `board` VALUES (8,0,0,1,'두번째 원글 작성 테스트','1234','2020-08-31 04:56:36','wck',8,8,0,'',1),(9,0,8,2,'두번째 원글의 첫번째 답글','1313','2020-08-31 05:36:54','wck',7,8,0,'',1),(11,0,0,1,'수정용 글을 작성합니다.(관리자수정)','관리자가 게시글 내용을 수정하였습니다.','2020-08-31 08:03:31','user',21,11,0,'',1),(19,0,0,1,'1234','1234','2020-09-02 08:02:39','master',10,19,0,'',1),(21,0,0,1,'마스터계정 비밀글 등록','마스터계정으로 비밀글을 등록합니다','2020-09-02 08:06:42','master',7,21,1,'master1234',1),(22,1,0,1,'마스터계정 공지글등록','마스터계정으로 공지글을 등록합니다.','2020-09-02 08:07:01','master',0,22,0,'',1),(23,1,0,1,'공지글등록 테스트 2','공지글등록 테스트 2','2020-09-02 08:09:33','master',0,23,0,'',1),(24,0,0,1,'13','13','2020-09-03 08:05:08','admin',1,24,0,'',1),(25,0,0,1,'관리자 비밀글 수정','관리자 비밀글 !\r\n\r\n수정합니다.','2020-09-03 08:06:22','admin',4,25,1,'admin1234',1),(26,0,0,1,'유저 게시글 작성','유저 게시글 작성입니다.','2020-09-03 08:06:50','user',3,26,0,'',1),(27,0,0,1,'유저 비밀글 작성!','유저 비밀글 작성입니다.','2020-09-03 08:07:11','user',3,27,1,'12341234',1),(28,1,0,1,'관리자 공지글 작성 테스트','공지글 내용입니다.','2020-09-03 08:08:15','admin',0,28,0,'',1),(38,0,0,1,'더미게시글 3','더미게시글3','2020-09-03 10:04:20','wck',2,38,1,'wck1234',1),(39,0,0,1,'더미게시글 4','더미게시글 4','2020-09-03 10:04:28','wck',1,39,1,'1313',1),(40,0,0,1,'더미게시글 5','더미게시글 5','2020-09-03 10:04:55','wck',3,40,0,'',1),(41,0,0,1,'더미게시글 6','더미게시글 6','2020-09-03 10:05:09','user',1,41,0,'',1),(42,0,0,1,'더미게시글 7','더미게시글 7','2020-09-03 10:05:20','user',1,42,1,'1234',1),(43,0,0,1,'더미게시글 8','더미게시글 8','2020-09-03 10:05:33','user',3,43,0,'',1),(44,0,0,1,'더미게시글 9','더미게시글 9','2020-09-03 10:05:33','user',1,44,0,'',1),(45,0,0,1,'더미게시글 10','더미게시글 10','2020-09-03 10:05:33','user',2,45,0,'',1),(46,0,0,1,'더미게시글 11','더미게시글 11','2020-09-03 10:05:33','user',3,46,0,'',1),(47,0,0,1,'더미게시글 12','더미게시글 12','2020-09-03 10:05:33','user',4,47,0,'',1),(48,0,0,1,'더미게시글 13','더미게시글 13','2020-09-03 10:05:33','user',20,48,0,NULL,1),(49,0,0,1,'더미게시글 14','더미게시글 14','2020-09-03 10:05:33','user',13,49,0,NULL,1),(50,0,0,1,'더미게시글 15','더미게시글 15','2020-09-03 10:05:33','user',211,50,0,NULL,1),(53,0,52,3,'계층3','1234','2020-09-04 00:50:52','wck',1,50,0,NULL,1),(54,0,50,2,'더미게시글 15 의 답글2','2','2020-09-04 00:51:03','wck',8,50,0,NULL,1),(55,0,0,1,'비밀글','123','2020-09-04 00:52:36','wck',167,55,1,'1234',1),(64,0,0,1,'문의게시판 글 작성','문의게시판에 글을 작성','2020-09-07 02:52:03','user',20,64,0,'',4),(65,0,50,2,'더미게시글 15 의 답글3','3','2020-09-07 04:51:25','admin',0,50,0,NULL,1),(67,1,0,1,'공지글등록','공지등록 테스트','2020-10-28 00:26:21','admin',0,67,0,NULL,4),(68,0,0,1,'읽지않은 게시글','알림형 게시판 테스트','2020-10-28 00:27:03','admin',2,68,0,'',4),(70,0,0,1,'관리자 비밀글 수정','관리자가 작성한 비밀글을 직접 수정함','2020-10-28 05:06:12','admin',26,70,1,'1234',5),(71,0,0,1,'yhs 게시글작성','비밀글로작성함 ㅎㅎ','2020-10-28 05:32:34','yhs1234',4,71,1,'1234',5),(72,1,0,1,'공지글 수정','공지글 수정테스트','2020-10-28 05:34:34','admin',1,72,0,NULL,5),(73,0,64,2,'문의게시판 글 작성 의 답글','yhs가 답글을 작성함','2020-10-28 05:52:35','yhs1234',2,64,0,NULL,4);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boardkinds`
--

LOCK TABLES `boardkinds` WRITE;
/*!40000 ALTER TABLE `boardkinds` DISABLE KEYS */;
INSERT INTO `boardkinds` VALUES (1,0,1,'자유게시판','Y','Y','Y'),(4,1,2,'문의 게시판','Y','Y','Y'),(5,0,3,'예시용 게시판','Y','Y','Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='각 체크리스트 글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkboard`
--

LOCK TABLES `checkboard` WRITE;
/*!40000 ALTER TABLE `checkboard` DISABLE KEYS */;
INSERT INTO `checkboard` VALUES (19,'##사업부 위생관리 체크리스트( 2020_09_23 )','특이사항 : \r\n\r\n1. 청소담당자는 매일 청소후 check리스트를 작성한다\r\n\r\n2. 점검자는 양호한 상태에만 체크박스에 체크를 기입한다.\r\n\r\n3. 수정해본다.','2020-09-23 03:25:58','admin','Y','admin','2020-10-28 08:38:26'),(41,'안전사고 예방 체크리스트(체크리스트 항목 수정)','행사 관련 안전사고 예방 및 발생시 대처방안을 위한 체크리스트입니다.\r\n\r\n필히 확인하신 후 답변 부탁드립니다.','2020-09-24 00:41:03','adm','Y','adm','2020-09-24 02:04:00'),(43,'창업시 평가사항 체크리스트(수정)','창업 계획시에 고려해야 할 사전 준비 여건 체크리스트입니다.\r\n\r\n창업을 계획하고 있거나 고민하시는 분들은 사전에 체크를 통해 점검해보시기 바랍니다.\r\n\r\n\r\n(adm계정이 수정합니다)','2020-09-24 01:15:42','admin','N','adm','2020-09-24 01:40:45'),(44,'집중력 자체진단 체크리스트','집중력 자체진단 체크리스트입니다.','2020-09-24 01:18:24','admin','N',NULL,NULL),(45,'위험성 평가 체크리스트','건설현장 위험성 평가 체크리스트입니다.','2020-09-24 01:20:05','admin','N',NULL,NULL),(46,'건물 노후화 체크리스트','건물 노후화 체크리스트입니다.\r\n\r\n해당 항목에 대해 양호한 상태일때만 체크해주시면 됩니다.','2020-09-24 01:22:23','admin','N',NULL,NULL),(47,'사내 직원 업무전 체크리스트','사내 직원 업무전 체크리스트입니다.\r\n\r\n매일 출근시 업무시작전에 체크하여 답변해주시기 바랍니다.','2020-09-24 01:24:13','admin','N',NULL,NULL),(48,'업무 수행시 방해요인 제거 체크리스트','방해요인 체크리스트입니다\r\n\r\n꼭 확인하고 정상적인 업무수행에 임해주시기 바랍니다.','2020-09-24 01:37:29','admin','N',NULL,NULL),(49,'테스트 체크리스트','테스트 체크리스트입니다.\r\n\r\n정상적인 작동이 되는지 확인해보세요','2020-09-24 01:38:04','admin','N',NULL,NULL),(50,'관리자 계정 테스트','1234','2020-09-24 01:38:30','adm','N',NULL,NULL),(55,'오늘의 집 하자보수 체크리스트','오늘의 집에서 작성한\r\n\r\n체크리스트 목록을 등록합니다.','2020-09-24 02:44:13','admin','N','admin','2020-10-28 08:39:10'),(56,'생필품 구매 체크리스트','생필품 구매 체크리스트입니다.\r\n\r\n구매시에 참고해보세요','2020-09-24 02:45:16','admin','N','admin','2020-09-24 02:45:57'),(59,'퓨전소프트 신입사원 교육테스트(수정)','퓨전소프트 신입사원 교육테스트 체크리스트를 작성합니다.\r\n\r\n6주차의 화면구현 테스트가 체크항목에 추가되었습니다.\r\n\r\n현재 완료된 테스트를 체크하여 제출하시면 됩니다.\r\n\r\n조회허용 유저는 전체입니다. (user4를 제외)','2020-09-24 07:15:10','adm','N','admin','2020-09-24 07:17:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='각 작성글별 체크리스트 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (19,'좌변기 / 소변기 청결상태 체크',19),(20,'휴지걸이의 휴지 충분여부',19),(21,'세면대의 청결상태 여부',19),(22,'세면대에 세정제 비치 여부',19),(23,'바닥 청결상태 양호도',19),(24,'환풍기의 정상작동',19),(25,'용기의 파손부위 여부',19),(26,'변기 / 하수구 등의 막힘 여부',19),(77,'사전 안전교육',41),(79,'안전관리 요원 편성',41),(82,'창업분야 시장 이해도',43),(83,'충분한 사전조사와 포지셔닝 계획',43),(84,'사업진행중 어려움 발생시 대비책',43),(85,'안정적인 자금관리와 지속적인 기술개발',43),(86,'변동되는 시장 상황에 대한 대처능력',43),(87,'특정 업무수행시 오랜시간 집중할 수 있다',44),(88,'생각을 다방면으로 충분히 한 후 계획을 실행한다',44),(89,'최근 1년간 안전사고 발생 이력이 있다',45),(90,'엘리베이터 입구부 자재 낙하위험이 있다',45),(91,'차폐판 설치 작업중 추락위험이 있다',45),(92,'출입문 설치 및 작동상태 양호도',46),(93,'전실 바닥 마감상태 양호도',46),(94,'천정 및 구석부분 파손상태 양호도',46),(95,'벽체 및 건물 내 외부 도배마감 양호도',46),(96,'당일 업무 계획 확인',47),(97,'전일 업무보고 작성 확인',47),(98,'투입 프로젝트 확인',47),(99,'업무환경 주변정리',47),(100,'불필요한 소음의 발생여부',48),(101,'휴대폰이나 전자기기의 매너모드 확인',48),(102,'테스트 체크리스트입니다',49),(103,'확인해주세요',49),(104,'체크해보세요',49),(105,'두번쨰',50),(106,'관리',50),(107,'계정',50),(118,'adm체크리스트',43),(119,'개인 안전보호용품 착용',41),(120,'주변 위험물품 제거',41),(129,'노후된 수도와 난방배관',55),(130,'베란다 혹은 벽의 균열',55),(131,'벽면사이 석회질이 생긴 새시',55),(132,'손상이 심한 벽면과 문틀',55),(133,'벽지 들뜸과 곰팡이 자국이 있는 벽 단열',55),(134,'계량컵',56),(135,'칫솔',56),(136,'변기커버',56),(137,'조미료',56),(140,'호일',56),(141,'빨래망',56),(142,'싱크대 거름망',56),(164,'1주 계층형 게시판 구현',59),(165,'2주 게시판 추가 / 유저권한 추가',59),(166,'3주 설문조사 구현',59),(167,'4주 태그갤러리 게시판 구현',59),(168,'5주 체크리스트 구현',59),(169,'6주차 화면구현 테스트',59);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'user','1313','2020-09-03 08:07:16',0,1,27,1),(4,'wck','13','2020-09-07 00:55:48',0,4,50,1),(11,'user','1234','2020-09-07 02:44:14',0,11,50,1),(12,'wck','1313','2020-09-07 03:09:00',0,12,64,1),(13,'wck','131234123','2020-09-07 04:35:49',0,13,49,1),(14,'admin','1234','2020-09-07 05:33:47',0,14,55,1),(18,'admin','새댓글 작성','2020-09-07 06:37:05',0,18,50,0),(20,'admin','1234123','2020-09-07 06:42:30',19,4,50,3),(21,'fusionsoft','1313','2020-10-28 05:06:36',0,21,70,1),(22,'admin','3434','2020-10-28 05:38:30',21,21,70,2),(24,'yhs1234','댓글의 댓글 작성','2020-10-28 05:52:15',12,12,64,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='업로드 파일 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (38,'1화_바다.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg',110192,1,1),(41,'cat.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg',81951,1,1),(42,'tree.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg',60856,1,1),(43,'car.png','d8de465f-9881-4087-a2df-da3a05478c4e.png','d8de465f-9881-4087-a2df-da3a05478c4e.png',101270,1,2),(44,'egov.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg',16765,0,2),(45,'180829-8-2000-din-busan-hotel.jpg.thumb.768.768.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg',65225,0,3),(46,'house.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg',116509,0,3),(47,'pets.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg',120915,3,4),(50,'student.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png',97360,1,7),(53,'catPray.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg',190369,1,8),(54,'plz.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg',25716,1,9),(59,'cat_Thunder.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg',91101,14,12),(61,'Lion.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg',314509,6,13),(62,'deer.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg',25776,2,13),(63,'dumpling.jpg','5de821c2-c72a-4675-89da-eb996ff9dd66.jpg','THUMB_5de821c2-c72a-4675-89da-eb996ff9dd66.jpg',111629,1,14),(64,'dumpling2.jpg','8caf31b1-0faa-4207-9392-6711353b0572.jpg','THUMB_8caf31b1-0faa-4207-9392-6711353b0572.jpg',222208,0,14),(65,'cake.jpg','cfeeb74b-1b15-48a9-980e-d21d5796d91b.jpg','THUMB_cfeeb74b-1b15-48a9-980e-d21d5796d91b.jpg',511597,2,15),(66,'house.jpg','f3836e99-68d6-4b3d-b9e0-2da1cd54d88e.jpg','THUMB_f3836e99-68d6-4b3d-b9e0-2da1cd54d88e.jpg',116509,1,16),(67,'tree.jpg','700a2dcd-ab8d-43a2-a830-d3c321e7ec3c.jpg','THUMB_700a2dcd-ab8d-43a2-a830-d3c321e7ec3c.jpg',60856,1,16),(68,'baby.jpg','24678a23-c7a9-4cfa-ba4e-db4972d80333.jpg','THUMB_24678a23-c7a9-4cfa-ba4e-db4972d80333.jpg',75333,1,6),(69,'bee2.jpg','0d3be433-b760-44e5-82e5-97ddd9634ca2.jpg','THUMB_0d3be433-b760-44e5-82e5-97ddd9634ca2.jpg',87692,0,17),(70,'bee.jpg','b7812b44-67f5-475b-931a-59f3f74aeaad.jpg','THUMB_b7812b44-67f5-475b-931a-59f3f74aeaad.jpg',73469,0,17),(72,'Check.png','de5f1aa2-3408-4d37-a16b-79d4c5fe6f71.png','THUMB_de5f1aa2-3408-4d37-a16b-79d4c5fe6f71.png',37105,1,19),(74,'stock_Photo.jpg','6a7313aa-0e85-4881-be19-b6d683c46bcf.jpg','THUMB_6a7313aa-0e85-4881-be19-b6d683c46bcf.jpg',120001,1,20),(79,'kakao_characters.jpg','452f5be9-7fee-4131-9e97-759d3519c4bd.jpg','THUMB_452f5be9-7fee-4131-9e97-759d3519c4bd.jpg',69121,2,22),(80,'kakao2.jpg','5376e77a-d489-4822-a1e7-ce73fb517945.jpg','THUMB_5376e77a-d489-4822-a1e7-ce73fb517945.jpg',27738,2,22),(81,'friends.jpg','41210149-b64e-4b78-853d-2693d240f802.jpg','THUMB_41210149-b64e-4b78-853d-2693d240f802.jpg',114759,3,22),(82,'Kakao.png','7b4a7552-4d5a-4623-a887-cfb1c193b1d4.png','THUMB_7b4a7552-4d5a-4623-a887-cfb1c193b1d4.png',123760,2,22),(83,'people.jpg','1acc2e1b-66bb-4f72-ad24-5a675ddb2cc8.jpg','THUMB_1acc2e1b-66bb-4f72-ad24-5a675ddb2cc8.jpg',65870,1,23),(84,'human.jpg','db8c6f55-4100-4692-8d87-1bdea859e79c.jpg','THUMB_db8c6f55-4100-4692-8d87-1bdea859e79c.jpg',42960,1,23),(85,'kangwon.jpg','a13cde97-f182-4053-a6da-707844e7fda0.jpg','THUMB_a13cde97-f182-4053-a6da-707844e7fda0.jpg',23174,3,24),(86,'dodream.png','79e9d82a-2a7f-4600-825d-d0e1173b7782.png','THUMB_79e9d82a-2a7f-4600-825d-d0e1173b7782.png',138337,3,25),(87,'neo.jpg','97392cc1-c477-42ce-a3e6-f451138d8868.jpg','THUMB_97392cc1-c477-42ce-a3e6-f451138d8868.jpg',248568,1,26),(88,'ryan_3d.png','586b99a7-cf8c-431f-a59f-c4becf7ab90d.png','THUMB_586b99a7-cf8c-431f-a59f-c4becf7ab90d.png',13667,1,27),(90,'color.png','3f4b5d55-824e-42a3-af09-d7bcae594ee4.png','THUMB_3f4b5d55-824e-42a3-af09-d7bcae594ee4.png',173529,0,20),(92,'cat.png','1167db48-f6b9-467f-a187-404f192d3be8.png','THUMB_1167db48-f6b9-467f-a187-404f192d3be8.png',82807,1,30),(93,'pig.jpg','4f9607f4-ca96-4bbd-9446-ea09bf60fc73.jpg','THUMB_4f9607f4-ca96-4bbd-9446-ea09bf60fc73.jpg',6546,1,30),(94,'dog.jpg','dcfda80d-f385-401d-be18-3cbc16c5a919.jpg','THUMB_dcfda80d-f385-401d-be18-3cbc16c5a919.jpg',381579,1,30),(95,'몰랑이.png','1027d92d-4d4c-4776-a2cc-df4bf68edbaf.png','THUMB_1027d92d-4d4c-4776-a2cc-df4bf68edbaf.png',37527,1,31),(101,'베니고마.jpg','79e5049c-1ca2-4c59-8dc0-d46d9ab7cc18.jpg','THUMB_79e5049c-1ca2-4c59-8dc0-d46d9ab7cc18.jpg',23445,1,32),(102,'cute.jpg','8d1313e8-60b7-4a8f-9f16-951aa28eebe2.jpg','THUMB_8d1313e8-60b7-4a8f-9f16-951aa28eebe2.jpg',17243,0,32),(106,'코닉세그.jpg','20441a03-b4ce-4ac3-8cbd-54a9f4ae2812.jpg','THUMB_20441a03-b4ce-4ac3-8cbd-54a9f4ae2812.jpg',78572,7,33),(132,'F816_imageupload.png','c5d9de44-97f5-4712-9a98-f83f542d5b68.png','THUMB_c5d9de44-97f5-4712-9a98-f83f542d5b68.png',15687,0,35),(133,'kakao2.jpg','5ffcbb0f-5da2-4969-9614-62e14cce27b0.jpg','THUMB_5ffcbb0f-5da2-4969-9614-62e14cce27b0.jpg',27738,0,35);
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
INSERT INTO `gallery` VALUES (1,'태그 전부 수정','태그 전부를 수정합니다\r\n로 수정합니다.','2020-09-15',84,'가을,바다,사람','wck'),(2,'테스트 작성글','갤러리 테스트 글을 작성합니다 ^0^','2020-09-15',11,'테스트,이미지','wck'),(3,'건물사진','건물사진입니다\r\n\r\n레스토랑이랑 집입니다.','2020-09-15',12,'건물,음식,레스토랑','wck'),(4,'애완동물','pets','2020-09-15',16,'동물,고양이,강아지, 펫','wck'),(6,'아기','아기사진입니다\r\n\r\n귀엽죠?','2020-09-15',38,'아기,사람,귀여움,웃음','wck'),(7,'학생이미지','학생아이콘을 추가해봤어요\r\n\r\n잘 사용하시길 바랍니다 ^^','2020-09-15',13,'학생,아이콘,야나,두','wck'),(8,'제발!!!','ㅈㅂㅈㅂ!!!','2020-09-16',16,'기도,동물,웃긴사진,고양이','wck'),(9,'제발!!','하느님 제발!!','2020-09-16',25,'웃긴사진,카툰,웃음','wck'),(12,'고양이썬더','고양이썬더','2020-09-16',8,'웃긴사진,동물,고양이','wck'),(13,'동물사진','사자\r\n\r\n사슴','2020-09-16',49,'동물,사자,사슴,맹수','wck'),(14,'만두','만두사진이에요\r\n\r\n맛있어보여요','2020-09-17',6,'음식,만두,저녁','wck'),(15,'케이크','케이크사진입니다.','2020-09-17',8,'음식,생일,케이크','wck'),(16,'나무','나무사진','2020-09-17',3,'식물,숲','wck'),(17,'꿀벌','귀여운 꿀벌 \r\n\r\n:D','2020-09-17',12,'동물,곤충,벌','wck'),(18,'ONG','오엔지 로고입니다\r\n\r\n로고이미지를 업로드 해봅시다','2020-09-17',12,'로고,LOGO,썸네일,컬러','wck'),(19,'체크 이미지','업로드해봅니다\r\n\r\n하하하\r\n\r\n길게 글을 늘여써서 검색이 정상적인지 확인합시다.','2020-09-17',11,'이미지,체크,초록,컬러','wck'),(20,'컬러테스트','여러가지 색상을 담은 이미지입니다.\r\n\r\n화려한 느낌을 줍니다','2020-09-17',25,'컬러,테스트화면,추가','wck'),(22,'카카오','캐릭터 이미지\r\n\r\n\r\n라이언과 카카오 프렌즈','2020-09-18',20,'카카오,캐릭터,라이언,프렌즈','user'),(23,'사람의 행동','사람 이미지\r\n\r\n2장입니다.','2020-09-18',4,'사람,실사,캐릭터','user'),(24,'강원도 캐릭터입니다.','호랑이랑 곰?\r\n\r\n인거같아요 \r\n\r\n귀엽습니다.','2020-09-18',29,'호랑이,곰,동물,캐릭터','user'),(25,'두드림','두드림 대표캐릭터\r\n\r\n\'두두\' 입니다.','2020-09-18',17,'두두,캐릭터,두드림','user'),(26,'동물','동물','2020-09-18',4,'동물','user'),(27,'동물','라이언도 동물이지않을까','2020-09-18',2,'동물,카카오,라이언','user'),(30,'귀여운 동물 캐릭터','그리기쉽고 귀여운 캐릭터 이미지에요\r\n\r\n따라 그려봅시다 :D','2020-09-18',8,'동물,캐릭터,고양이,돼지,개','wck'),(31,'몰랑이','몰랑이 동글동글','2020-09-18',10,'몰랑이,동글동글,캐릭터','wck'),(32,'베니고마','베니고마라는 캐릭터에요','2020-09-18',17,'베니고마,캐릭터,귀여움,물개','wck'),(33,'슈퍼카','자동차 이미지입니다.','2020-09-18',53,'슈퍼카,람보르기니,코닉세그','user'),(35,'갤러리 통합 업로드 테스트','업로드 해보기','2020-10-28',13,'갤러리,통합,업로드','wck');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='읽은 유저 / 읽은 게시글 기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('wck',11),('wck',8),('wck',9),('user',11),('user',8),('user',9),('fusion1',11),('fusion1',9),('master',21),('master',19),('wck',21),('wck',19),('user',21),('user',19),('fusion1',19),('admin',21),('admin',19),('admin',11),('admin',9),('admin',25),('admin',24),('user',26),('user',27),('user',25),('username',19),('username',48),('username',50),('username',49),('wck',43),('wck',49),('wck',50),('wck',55),('user',55),('wck',54),('wck',48),('wck',46),('wck',45),('admin',50),('admin',27),('admin',38),('admin',39),('admin',40),('admin',55),('sjh1991',50),('sjh1991',55),('sjh1991',21),('wck',44),('wck',42),('user',50),('user',53),('user',54),('user',49),('wck',64),('admin',64),('admin',70),('fusionsoft',70),('yhs1234',70),('yhs1234',71),('admin',71),('admin',68),('yhs1234',64),('admin',72),('yhs1234',55),('yhs1234',50),('yhs1234',48),('yhs1234',73),('user',64),('user',47),('user',48),('user',45),('wck',38),('wck',40),('wck',41),('user',70);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자별 조회 / 답변 로그 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2020-09-23 06:06:08','wck',14),(2,'2020-09-23 03:02:03','wck',17),(3,'2020-09-23 03:02:36','user2',14),(4,'2020-09-23 01:07:23','user3',14),(5,'2020-09-23 01:07:20','user3',18),(6,'2020-09-23 01:09:09','user1',18),(7,'2020-10-28 08:38:53','wck',19),(8,'2020-10-21 04:29:28','wck',41),(9,'2020-09-24 01:10:46','wck',32),(10,'2020-09-24 01:10:48','wck',31),(11,'2020-09-24 01:58:57','wck',53),(12,'2020-09-24 02:00:00','user1',52),(13,'2020-09-24 01:59:31','user2',52),(14,'2020-09-24 02:59:11','user1',41),(15,'2020-09-24 02:39:25','wck',51),(16,'2020-10-21 04:23:18','wck',50),(17,'2020-10-19 02:20:13','wck',48),(18,'2020-10-19 02:17:51','wck',43),(19,'2020-09-24 02:39:33','wck',44),(20,'2020-09-24 02:58:51','wck',45),(21,'2020-10-19 02:18:37','wck',46),(22,'2020-09-24 06:50:34','wck',47),(23,'2020-10-19 02:18:30','wck',49),(24,'2020-09-24 02:59:10','user1',43),(25,'2020-10-21 04:23:14','wck',56),(26,'2020-09-24 06:52:03','user2',55),(27,'2020-09-24 02:59:21','user2',41),(28,'2020-09-24 02:59:29','user4',48),(29,'2020-09-24 02:59:44','user5',41),(30,'2020-09-24 06:52:16','user3',49),(31,'2020-09-24 06:52:14','user3',56),(32,'2020-09-24 06:52:17','user3',44),(33,'2020-09-24 06:52:23','user3',43),(34,'2020-09-24 06:52:20','user3',19),(35,'2020-09-24 06:52:21','user3',41),(36,'2020-09-24 06:53:47','wck',57),(37,'2020-09-24 06:52:51','user2',57),(38,'2020-09-24 06:53:39','user3',57),(39,'2020-09-24 07:09:40','wck',58),(40,'2020-09-24 07:07:38','user3',58),(41,'2020-09-24 07:09:32','user1',58),(42,'2020-09-28 01:47:15','wck',59),(43,'2020-09-24 07:16:00','user1',59),(44,'2020-09-24 07:16:09','user2',59),(45,'2020-10-28 08:39:15','wck',55),(46,'2020-09-25 02:43:46','wck',60),(47,'2020-09-25 02:42:33','user1',60),(48,'2020-09-25 02:44:54','wck',61),(49,'2020-09-25 05:59:43','wck',62);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시글을 보여줄 사용자 리스트 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showlist`
--

LOCK TABLES `showlist` WRITE;
/*!40000 ALTER TABLE `showlist` DISABLE KEYS */;
INSERT INTO `showlist` VALUES ('fusion11',19),('fusion1234',19),('fusionsoft',19),('ktw1989',19),('sjh1991',19),('user',19),('username',19),('wck',19),('wck1111',19),('wck1991',19),('yhs1234',19),('yhsyhs1',19),('user1',41),('user2',41),('user3',41),('user5',41),('wck1234',41),('user1',43),('user3',43),('user4',43),('wck1234',43),('user3',44),('wck1234',44),('wck1234',45),('wck1234',46),('wck1234',47),('user4',48),('wck1234',48),('user3',49),('wck1234',49),('wck1234',50),('fusion11',55),('fusion1234',55),('fusionsoft',55),('user',55),('wck',55),('wck1234',55),('yhs1234',55),('yhsyhs1',55),('user3',56),('wck1234',56),('user1',59),('user2',59),('user3',59),('user5',59),('wck1234',59);
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
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='태그관련 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (21,'바다',6,'2020-09-15',1),(28,'가을',6,'2020-09-15',1),(29,'사람',6,'2020-09-15',1),(30,'테스트',4,'2020-09-15',2),(31,'이미지',4,'2020-09-15',2),(32,'건물',8,'2020-09-15',3),(34,'음식',8,'2020-09-15',3),(35,'레스토랑',8,'2020-09-15',3),(36,'동물',12,'2020-09-15',4),(37,'고양이',12,'2020-09-15',4),(38,'강아지',12,'2020-09-15',4),(39,'펫',12,'2020-09-15',4),(42,'아기',17,'2020-09-15',6),(43,'사람',17,'2020-09-15',6),(44,'귀여움',17,'2020-09-15',6),(45,'학생',6,'2020-09-15',7),(46,'아이콘',6,'2020-09-15',7),(47,'기도',11,'2020-09-16',8),(48,'동물',11,'2020-09-16',8),(49,'웃긴사진',11,'2020-09-16',8),(50,'웃긴사진',23,'2020-09-16',9),(51,'카툰',23,'2020-09-16',9),(59,'웃긴사진',7,'2020-09-16',12),(60,'동물',7,'2020-09-16',12),(61,'고양이',7,'2020-09-16',12),(62,'동물',44,'2020-09-16',13),(64,'사자',44,'2020-09-16',13),(65,'사슴',44,'2020-09-16',13),(66,'야',6,'2020-09-16',7),(68,'야나',6,'2020-09-16',7),(69,'두',6,'2020-09-16',7),(70,'맹수',41,'2020-09-17',13),(71,'고양이',6,'2020-09-17',8),(72,'웃음',4,'2020-09-17',9),(73,'웃음',14,'2020-09-17',6),(75,'음식',6,'2020-09-17',14),(76,'만두',6,'2020-09-17',14),(77,'저녁',6,'2020-09-17',14),(78,'음식',8,'2020-09-17',15),(79,'생일',8,'2020-09-17',15),(80,'케이크',8,'2020-09-17',15),(81,'식물',3,'2020-09-17',16),(82,'숲',3,'2020-09-17',16),(83,'동물',12,'2020-09-17',17),(84,'곤충',12,'2020-09-17',17),(85,'벌',12,'2020-09-17',17),(86,'로고',12,'2020-09-17',18),(87,'LOGO',12,'2020-09-17',18),(88,'썸네일',12,'2020-09-17',18),(89,'이미지',11,'2020-09-17',19),(90,'체크',11,'2020-09-17',19),(91,'초록',11,'2020-09-17',19),(92,'컬러',25,'2020-09-17',20),(93,'테스트화면',25,'2020-09-17',20),(95,'컬러',7,'2020-09-17',19),(96,'컬러',8,'2020-09-17',18),(99,'카카오',20,'2020-09-18',22),(100,'캐릭터',20,'2020-09-18',22),(101,'라이언',20,'2020-09-18',22),(102,'프렌즈',16,'2020-09-18',22),(103,'사람',4,'2020-09-18',23),(104,'실사',4,'2020-09-18',23),(105,'캐릭터',4,'2020-09-18',23),(106,'호랑이',29,'2020-09-18',24),(107,'곰',29,'2020-09-18',24),(108,'동물',29,'2020-09-18',24),(109,'캐릭터',29,'2020-09-18',24),(110,'두두',17,'2020-09-18',25),(111,'캐릭터',17,'2020-09-18',25),(112,'두드림',17,'2020-09-18',25),(113,'동물',4,'2020-09-18',26),(114,'동물',2,'2020-09-18',27),(115,'카카오',2,'2020-09-18',27),(116,'라이언',2,'2020-09-18',27),(121,'추가',3,'2020-09-18',20),(125,'동물',8,'2020-09-18',30),(126,'캐릭터',8,'2020-09-18',30),(127,'고양이',8,'2020-09-18',30),(128,'돼지',8,'2020-09-18',30),(129,'개',8,'2020-09-18',30),(130,'몰랑이',10,'2020-09-18',31),(131,'동글동글',10,'2020-09-18',31),(132,'캐릭터',10,'2020-09-18',31),(139,'베니고마',17,'2020-09-18',32),(140,'캐릭터',17,'2020-09-18',32),(141,'귀여움',17,'2020-09-18',32),(142,'물개',17,'2020-09-18',32),(143,'슈퍼카',53,'2020-09-18',33),(144,'람보르기니',53,'2020-09-18',33),(146,'코닉세그',50,'2020-09-18',33),(155,'갤러리',13,'2020-10-28',35),(156,'통합',13,'2020-10-28',35),(157,'업로드',13,'2020-10-28',35);
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
INSERT INTO `user` VALUES ('admin','1234','관리자','Y','Y','Y','Y','Y','Y','Y'),('fusion1','fusion1234','우치경','N','Y','Y','Y','N','Y','Y'),('fusion11','fusion1234','우치경','Y','Y','Y','Y','Y','Y','N'),('fusion1234','fusion1234','우치경','Y','N','N','N','N','N','N'),('fusionsoft','fusion1234','퓨전소프트','Y','Y','N','Y','Y','Y','N'),('ktw1989','xodn1989','김태우','Y','Y','N','N','N','N','N'),('master','master1234','마스터계정','Y','Y','Y','Y','Y','Y','N'),('sjh1991','sjh1991','신지훈','Y','Y','Y','Y','Y','Y','N'),('syj1991','syj1991','송영주','N','N','N','N','N','N','N'),('user','1234','이용자','Y','Y','Y','Y','Y','Y','N'),('username','user1234','테스트사용자','Y','Y','Y','Y','Y','Y','N'),('wck','1234','우치경','Y','Y','Y','Y','Y','Y','N'),('wck1111','wck1111','우치경','N','N','N','N','N','N','N'),('wck1234','1234','우치경','Y','Y','Y','Y','Y','Y','N'),('wck1991','wck1991','김철수','N','N','N','N','N','N','N'),('yhs1234','1234','현수임','Y','Y','Y','Y','Y','Y','N'),('yhsyhs1','asd123','현수임','N','N','N','N','N','N','N');
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

-- Dump completed on 2020-10-28 17:41:31
