CREATE DATABASE  IF NOT EXISTS `quizpractice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quizpractice`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quizpractice
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `account_forgot`
--

DROP TABLE IF EXISTS `account_forgot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_forgot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `allowedReset` tinyint(1) DEFAULT NULL,
  `timeStarted` varchar(100) DEFAULT NULL,
  `timeEnded` varchar(100) DEFAULT NULL,
  `dateCreated` varchar(100) DEFAULT NULL,
  `idEncrypt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `account_forgot_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_forgot`
--

LOCK TABLES `account_forgot` WRITE;
/*!40000 ALTER TABLE `account_forgot` DISABLE KEYS */;
INSERT INTO `account_forgot` VALUES (28,3,0,'19:48:34','19:49:59','2021-11-04','1434C0F17CF8BC76387A3841E65D83B7'),(29,3,0,'10:48:02','10:49:27','2021-11-05','95DC01C0F14382CE666F9219D72F1D14'),(30,3,0,'10:51:49','10:53:14','2021-11-05','8BCFAFE59647C6D7352F4135A4C6024C'),(31,3,0,'11:00:15','11:01:40','2021-11-05','6FB526E898C6ED522B3C778DBC519D10'),(32,3,0,'11:02:27','11:03:52','2021-11-05','DAC1C57FEA5176E0E8D165D5B70FBF34');
/*!40000 ALTER TABLE `account_forgot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_history`
--

DROP TABLE IF EXISTS `answer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `history_id` int NOT NULL,
  `question_id` int NOT NULL,
  `answer` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_answer_history` (`history_id`),
  KEY `FK_answer_history_question` (`question_id`),
  CONSTRAINT `FK_answer_history` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_answer_history_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_history`
--

LOCK TABLES `answer_history` WRITE;
/*!40000 ALTER TABLE `answer_history` DISABLE KEYS */;
INSERT INTO `answer_history` VALUES (43,21,2,'10'),(44,21,3,'2');
/*!40000 ALTER TABLE `answer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(11000) DEFAULT NULL,
  `image_Url` varchar(1000) DEFAULT NULL,
  `created_Date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `timeCreated` varchar(100) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `attachFile_Url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'Making a to-do list: totally lame time-waster, or productivity super-skill?','The laws of mathematics are evident throughout the world, including in nature, and the problem-solving skills obtained from completing math homework can help us tackle problems in other areas of life.  While many may complain that math is boring or complicated, the truth is that a life devoid of math means that we go around experiencing the world on a much less interesting level than we could.\r\n                            \r\n                            ','blog/making-a-to-do-list-900x500.jpg','2021-11-02',3,'20:34:58','Study Skill',1,''),(2,'Nope Cramming ','                                We have been teaching students for a long time that cramming for a test is perhaps one of the worst ways to get prepared for an exam. Seriously. There really is not an effective exam cram in the most basic sense of the word. I know it feels effective. After a nice, all-night cram session, you really feel       \r\n                            ','blog/cramming-still-doesnt-work-900x500.jpg','2021-10-27',3,'21:22:34','Study Skill',1,''),(3,'Tutors, Study Skills, and Adding Bigtime Value ','Not only will your quick mental arithmetic skills help you become known as the smart person who everyone appreciates when the waiter brings the check to your table, your math skills can also help you shop.  Knowledge of percentages and how to calculate them quickly can help you save time when shopping at a sale at the mall â for example, to quickly calculate a discounted price, or to determine whether youâve been correctly charged when paying for a shirt at the store.               \r\n                            ','blog/summarizing-proven-benefits-900x500.jpg','2021-11-02',3,'20:34:28','Exam',1,''),(4,'How can students improve their 21st century study skills?','Before you start to disagree with me, think about how great it is to go to dinner with a friend who can quickly divide a check in their mind to determine how much each person needs to pay to split the bill.  Your knowledge of fractions can also help you divide a pizza among a few people.  While math is popularly the realm of nerds, your ability to avoid awkward confusion and silence as you and your friends try to divide a pizza or a dinner bill is a truly valuable skill.  Be known as the cool (yes, I said cool) person that knows how to do mental math quickly!        \r\n                            ','blog/improve-21st-century-study-skills-900x500.jpg','2021-11-02',3,'20:33:58','Exam',1,''),(5,'What study skills are most important for a 21st Century Student?','                                To live in a mathematically-driven world and not know math is like walking through an art museum with your eyes closed.  Learning and appreciating math can help you appreciate things that you would not otherwise notice about the world.  ','blog/what-study-skills-are-most-important-900x500.jpg','2021-11-02',3,'20:33:43','Exam',1,''),(6,'10 Signs You Might Be A Kinesthetic Learner','  Obviously, mathematicians and scientists rely on mathematical principles to do the most basic aspects of their work, such as test hypotheses.  While scientific careers famously involve math, they are not the only careers to do so.  Even operating a cash register requires that one understands basic arithmetic.         \r\n                            ','blog/kinesthetic-learner-900x500.jpg','2021-11-02',3,'20:33:02','Health',1,''),(7,'Why do we have to learn math in school?','<p style=\"text-align:center;\"><span style=\"color:hsl(0, 0%, 30%);\">Math helps us think analytically and have better reasoning abilities. Analytical thinking refers to the ability to think critically about the world around us. Reasoning is our ability to think logically </span><a href=\"hee\"><span style=\"color:hsl(0, 0%, 30%);\">about </span></a><span style=\"color:hsl(0, 0%, 30%);\">a situation. Analytical and reasoning skills are essential because they help us solve problems and look for solutions. While it may seem far-fetched to believe that solving the train problem above can help you solve a problem in your life, the skills that you use in framing the problem, identifying the knowns and unknowns, and taking steps to solve the problem can be a very important strategy that is applicable to other issues in life.</span></p>','blog/math-background_23-2148146270.jpg','2021-11-06',3,'19:23:39','Math',1,'blog/aaa.docx');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `logo` varchar(3000) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `createdDate` datetime DEFAULT NULL,
  `expiredDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_member`
--

DROP TABLE IF EXISTS `class_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_member` (
  `user_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `class_member_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_member`
--

LOCK TABLES `class_member` WRITE;
/*!40000 ALTER TABLE `class_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `taken` date DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_history_user` (`user_id`),
  KEY `FK_history_quiz` (`quiz_id`),
  CONSTRAINT `FK_history_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  CONSTRAINT `FK_history_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (21,2,7,'2021-10-30',10,'Pass');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `option1` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `option2` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `option3` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `option4` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `optionCorrect` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (2,'2*5=?','Theory','Show','Easy','13','12','10','11','10'),(3,'1+1=?','Practical','Show','Easy','2','3','4','1','2'),(4,'ngoc co ngu khong','Theory','Show','Easy','yes','absolute','sure','all of the above','all of the above'),(5,'3+7','Practical','Show','Easy','11','10','12','13','10'),(6,'8/2','Practical','Show','Easy','4','3','5','6','4');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `numberOfQuestion` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `thumnail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,'test add quiz','test',2,'Long',4,'Free Test',4,1,290,0.6,'images/thumbnail/testxin.jpg'),(3,'test ho anh tuan','nhu cc',2,'Long',3,'Free Test',4,2,200,0.7,'images/thumbnail/testxin.jpg'),(4,'test database','test',3,'Long',NULL,NULL,2,2,300,0.6,'images/thumbnail/testxin.jpg'),(5,'dddd','ddd',2,'Short',NULL,'User Practice',2,2,234,0.6,'images/thumbnail/testxin.jpg'),(6,'test ho anh tuan lan 4','test',3,'Short',NULL,'Free Test',4,2,60,0.6,'images/thumbnail/testxin.jpg'),(7,'test lan 5 ho anh tuan ','test ',2,'Long',NULL,'Free Test',4,2,60,0.6,'images/thumbnail/testxin.jpg'),(8,'test tml son','test',3,'Long',NULL,'User Practice',2,2,600,0.6,'images/thumbnail/testxin.jpg'),(9,'test lan 1 ho ngoc ','test',6,'Long',NULL,'User Practice',2,5,300,0.6,'images/thumbnail/testxin.jpg');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes_question`
--

DROP TABLE IF EXISTS `quizzes_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quizzes_question_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  CONSTRAINT `quizzes_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes_question`
--

LOCK TABLES `quizzes_question` WRITE;
/*!40000 ALTER TABLE `quizzes_question` DISABLE KEYS */;
INSERT INTO `quizzes_question` VALUES (14,1,2),(15,3,2),(16,3,3),(17,4,2),(18,4,3),(19,5,2),(20,5,3),(21,6,2),(22,6,3),(23,7,2),(24,7,3),(25,8,2),(26,8,3),(27,9,2),(28,9,3),(29,9,4),(30,9,5),(31,9,6);
/*!40000 ALTER TABLE `quizzes_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roll`
--

DROP TABLE IF EXISTS `roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roll`
--

LOCK TABLES `roll` WRITE;
/*!40000 ALTER TABLE `roll` DISABLE KEYS */;
INSERT INTO `roll` VALUES (1,'Customer'),(2,'Marketing'),(3,'Admin'),(4,'Expert'),(5,'Manager');
/*!40000 ALTER TABLE `roll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roll_feature`
--

DROP TABLE IF EXISTS `roll_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roll_feature` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL,
  `isRequired` bit(1) DEFAULT NULL,
  `roll_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roll_id` (`roll_id`),
  CONSTRAINT `roll_feature_ibfk_1` FOREIGN KEY (`roll_id`) REFERENCES `roll` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roll_feature`
--

LOCK TABLES `roll_feature` WRITE;
/*!40000 ALTER TABLE `roll_feature` DISABLE KEYS */;
INSERT INTO `roll_feature` VALUES (1,'/Home',_binary '',1),(2,'/Personal',_binary '',1),(4,'/ChangePassword',_binary '',1),(5,'/UpdateBlog',_binary '',2),(6,'/Personal',_binary '',2),(7,'/ChangePassword',_binary '',2),(8,'/BlogList',_binary '',2),(9,'/BlogDetailed',_binary '',2),(10,'/AddBlog',_binary '',2),(11,'/DeleteBlog',_binary '',2),(12,'/Home',_binary '',3),(16,'/UserList',_binary '',3),(17,'/UserDetail',_binary '',3),(18,'/AddUserAdmin',_binary '',3),(19,'/Delete',_binary '',3),(20,'/EditUser',_binary '',3),(21,'/Home',_binary '',2),(22,'/ChangeBlogStatus',_binary '',2),(23,'/Personal',_binary '',3),(24,'/Home',_binary '',4),(25,'/QuizList',_binary '',4),(26,'/DeleteQuiz',_binary '',4),(27,'/AddQuiz',_binary '',4),(28,'/AddQuestion',_binary '',4),(29,'/EditQuiz',_binary '',4),(30,'/DeleteQuestion',_binary '',4),(31,'/EditQuestion',_binary '',4),(32,'/ImportQuestion',_binary '',4),(33,'/AddQuestionInList',_binary '',4),(34,'/AddSubject',_binary '',5),(35,'/ChangeSubjectStatus',_binary '',5),(36,'/DeleteSubject',_binary '',5),(37,'/Home',_binary '',5),(38,'/SubjectDetailed',_binary '',5),(39,'/SubjectList',_binary '',5),(40,'/UpdateSubject',_binary '',5),(41,'/SlideList',_binary '',2),(42,'/ChangeSlideStatus',_binary '',2),(43,'/AddSlide',_binary '',2),(44,'/UpdateSlide',_binary '',2),(45,'/Personal',_binary '',4),(46,'/QuestionList',_binary '',4),(47,'/QuizDetail',_binary '',4),(48,'/AddQuestionToQuiz',_binary '',4),(49,'/SlideDetailed',_binary '',2),(50,'/SlideDetailed',_binary '',1),(51,'/SlideDetailed',_binary '',3),(52,'/SlideDetailed',_binary '',4),(53,'/SlideDetailed',_binary '',5),(54,'/ChangePassword',_binary '',3),(55,'/ChangePassword',_binary '',4),(56,'/ChangePassword',_binary '',5),(57,'/PracticeList',_binary '',1),(58,'/PracticeDetail',_binary '',1),(59,'/AddPractice',_binary '',1),(60,'/AddQuestionToPractice',_binary '',1),(61,'/PracticeList',_binary '',1),(62,'/PracticeDetail',_binary '',1),(63,'/AddPractice',_binary '',1),(64,'/AddQuestionToPractice',_binary '',1),(65,'/QuizHandle',_binary '',1),(66,'/SaveQuizHandle',_binary '',1),(67,'/SubmitQuiz',_binary '',1),(68,'/HomeCategory',_binary '',1),(69,'/SettingList',_binary '',3),(70,'/ChangeSettingStatus',_binary '',3),(71,'/AddSetting',_binary '',3),(72,'/UpdateSetting',_binary '',3),(73,'/ChangeUserStatus',_binary '',3),(74,'/ValidEmail',_binary '',3),(75,'/QuizResult',_binary '',1),(76,'/QuizReview',_binary '',1);
/*!40000 ALTER TABLE `roll_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,4,'Exam type','Free Test','','Active'),(2,4,'Exam type','Simulation Test','','Active'),(3,4,'Question Level','Easy','','Active'),(4,4,'Question Level','Medium','','Active'),(5,4,'Question Level','Hard','','Active'),(6,4,'Quiz Category','Short','','Active'),(7,4,'Quiz Category','Long','','Active'),(8,4,'Question Category','Practical','','Active'),(9,4,'Question Category','Theory','','Active'),(10,4,'Title User','Mr','','Active'),(11,4,'Title User','Mrs','','Active'),(12,4,'Title User','Ms','','Active'),(13,1,'Post Category','Health','No','Active'),(14,1,'Post Category','Exam','No1','Active'),(15,1,'Post Category','Math','No','Active'),(16,1,'Post Category','Study Skill','No','Active'),(17,1,'Post Category','Japanese','No','Active');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slide`
--

DROP TABLE IF EXISTS `slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `backlink` varchar(1000) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `notes` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `slide_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slide`
--

LOCK TABLES `slide` WRITE;
/*!40000 ALTER TABLE `slide` DISABLE KEYS */;
INSERT INTO `slide` VALUES (1,'Biggest Sale Of This Year!','images/slide/p2.jpg','SlideDetailed?id=','Published',3,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),(2,'Building Butter Boundaries','images/slide/p3.jpg','SlideDetailed?id=','Published',3,'<p><span style=\"color:hsl(180, 75%, 60%);\"><i><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</strong></i></span></p>'),(7,'Aniversary Sale 40% off All Courses','images/slide/hot-sale-price-offer-deal-1261494.jpg','SlideDetailed?id=','Published',3,'<p style=\"margin-left:0px;\">In addition, the ad is playful and takes full advantage of Internet parlance and imagery (namely meme-style unicorns) to make its product more relatable. The CTA is also well-positioned for the ad, as asking users to sign up based on this information alone might not be the most effective strategy.</p><p style=\"margin-left:0px;\">&nbsp;</p>'),(13,'a','images/slide/pexels-photo-1161682.jpeg','SlideDetailed?id=','Unpublished',3,'a'),(14,'cc','images/slide/pexels-photo-5946083.jpeg','SlideDetailed?id=','Unpublished',3,'<p style=\"margin-left:0px;\"><span style=\"color:hsl(0,75%,60%);\"><i>In 1933, while Einstein was visiting the United States, </i></span><a href=\"https://en.wikipedia.org/wiki/Adolf_Hitler\"><span style=\"color:hsl(0,75%,60%);\"><i>Adolf Hitler</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> came to power in Germany. Einstein objected to the policies of the newly elected </i></span><a href=\"https://en.wikipedia.org/wiki/Nazi_Germany\"><span style=\"color:hsl(0,75%,60%);\"><i>Nazi government</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i>;</i></span><a href=\"https://en.wikipedia.org/wiki/Albert_Einstein#cite_note-zE9Bz-17\"><span style=\"color:hsl(0,75%,60%);\"><i>[16]</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> he settled in the United States and became an American citizen in 1940.</i></span><a href=\"https://en.wikipedia.org/wiki/Albert_Einstein#cite_note-BoyerDubofsky2001-18\"><span style=\"color:hsl(0,75%,60%);\"><i>[17]</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> On the eve of </i></span><a href=\"https://en.wikipedia.org/wiki/World_War_II\"><span style=\"color:hsl(0,75%,60%);\"><i>World War II</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i>, he endorsed </i></span><a href=\"https://en.wikipedia.org/wiki/Einstein%E2%80%93Szil%C3%A1rd_letter\"><span style=\"color:hsl(0,75%,60%);\"><i>a letter</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> to President </i></span><a href=\"https://en.wikipedia.org/wiki/Franklin_D._Roosevelt\"><span style=\"color:hsl(0,75%,60%);\"><i>Franklin D. Roosevelt</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> alerting him to the potential </i></span><a href=\"https://en.wikipedia.org/wiki/German_nuclear_weapons_program\"><span style=\"color:hsl(0,75%,60%);\"><i>German nuclear weapons program</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> and recommending that the US begin </i></span><a href=\"https://en.wikipedia.org/wiki/Manhattan_Project\"><span style=\"color:hsl(0,75%,60%);\"><i>similar research</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i>. Einstein supported the </i></span><a href=\"https://en.wikipedia.org/wiki/Allies_of_World_War_II\"><span style=\"color:hsl(0,75%,60%);\"><i>Allies</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i> but generally denounced the idea of </i></span><a href=\"https://en.wikipedia.org/wiki/Nuclear_weapons\"><span style=\"color:hsl(0,75%,60%);\"><i>nuclear weapons</i></span></a><span style=\"color:hsl(0,75%,60%);\"><i>.</i></span></p>'),(15,'a','images/slide/quiz-time-red-and-yellow-text-effect-template-vector-33898910.jpg','SlideDetailed?id=','Unpublished',3,'<h2 style=\"margin-left:0px;\">In 1933, while Einstein was visiting the United States, <a href=\"https://en.wikipedia.org/wiki/Adolf_Hitler\">Adolf Hitler</a> came to power in Germany. Einstein objected to the policies of the newly elected <a href=\"https://en.wikipedia.org/wiki/Nazi_Germany\">Nazi government</a>;<a href=\"https://en.wikipedia.org/wiki/Albert_Einstein#cite_note-zE9Bz-17\">[16]</a> he settled in the United States and became an American citizen in 1940.<a href=\"https://en.wikipedia.org/wiki/Albert_Einstein#cite_note-BoyerDubofsky2001-18\">[17]</a> On the eve of <a href=\"https://en.wikipedia.org/wiki/World_War_II\">World War II</a>, he endorsed <a href=\"https://en.wikipedia.org/wiki/Einstein%E2%80%93Szil%C3%A1rd_letter\">a letter</a> to President <a href=\"https://en.wikipedia.org/wiki/Franklin_D._Roosevelt\">Franklin D. Roosevelt</a> alerting him to the potential <a href=\"https://en.wikipedia.org/wiki/German_nuclear_weapons_program\">German nuclear weapons program</a> and recommending that the US begin <a href=\"https://en.wikipedia.org/wiki/Manhattan_Project\">similar research</a>. Einstein supported the <a href=\"https://en.wikipedia.org/wiki/Allies_of_World_War_II\">Allies</a> but generally denounced the idea of <a href=\"https://en.wikipedia.org/wiki/Nuclear_weapons\">nuclear weapons</a>.</h2><h2 style=\"margin-left:0px;\">In 1933, while Einstein was visiting the United States, <a href=\"https://en.wikipedia.org/wiki/Adolf_Hitler\">Adolf Hitler</a> came to power in Germany. Einstein objected to the policies of the newly elected <a href=\"https://en.wikipedia.org/wiki/Nazi_Germany\">Nazi government</a>;<a href=\"https://en.wikipedia.org/wiki/Albert_Einstein#cite_note-zE9Bz-17\">[16]</a> he settled in the United States and became an American citizen in 1940.<a href=\"https://en.wikipedia.org/wiki/Albert_Einstein#cite_note-BoyerDubofsky2001-18\">[17]</a> On the eve of <a href=\"https://en.wikipedia.org/wiki/World_War_II\">World War II</a>, he endorsed <a href=\"https://en.wikipedia.org/wiki/Einstein%E2%80%93Szil%C3%A1rd_letter\">a letter</a> to President <a href=\"https://en.wikipedia.org/wiki/Franklin_D._Roosevelt\">Franklin D. Roosevelt</a> alerting him to the potential <a href=\"https://en.wikipedia.org/wiki/German_nuclear_weapons_program\">German nuclear weapons program</a> and recommending that the US begin <a href=\"https://en.wikipedia.org/wiki/Manhattan_Project\">similar research</a>. Einstein supported the <a href=\"https://en.wikipedia.org/wiki/Allies_of_World_War_II\">Allies</a> but generally denounced the idea of <a href=\"https://en.wikipedia.org/wiki/Nuclear_weapons\">nuclear weapons</a>.</h2><p style=\"margin-left:0px;\">&nbsp;</p><p style=\"margin-left:0px;\">&nbsp;</p>'),(29,'aa','images/slide/quiz-time-red-and-yellow-text-effect-template-vector-33898910.jpg','SlideDetailed?id=','Unpublished',3,'<p style=\"margin-left:0px;\"><strong>Albert Einstein</strong>&nbsp;</p>');
/*!40000 ALTER TABLE `slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `salePrice` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (2,'Math',5,'Published',23,10),(3,'Japanese',5,'Published',23,10),(4,'English',5,'Published',123,11),(5,'Germany',5,'Published',123,11),(6,'Project',5,'Published',1,1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `roll_id` int DEFAULT NULL,
  `idEncrypt` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roll_id` (`roll_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roll_id`) REFERENCES `roll` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'duc anh pham','Mr','ducanh@gmail.com','0352294112','CC18D123662375EC0AE275B50CEBCC36','images/avatar/user_circle.png','2021-09-26','Active',3,NULL),(2,'duc anh pham','Mr','ducanh1@gmail.com','0352294112','CC18D123662375EC0AE275B50CEBCC36','images/avatar/user_circle.png','2021-09-26','Active',1,NULL),(3,'khanh ngoc nguyen','Mr','khanhnnhe130816@fpt.edu.vn','0352294111','D2F3BE1A39290017FFC836B650886F39','images/avatar/h3.jpg','2021-09-26','Active',2,NULL),(4,'duc anh pham','Mr','ducanh3@gmail.com','0352294112','CC18D123662375EC0AE275B50CEBCC36','images/avatar/user_circle.png','2021-09-26','Active',4,NULL),(5,'duc anh pham','Mr','ducanh4@gmail.com','0352294112','CC18D123662375EC0AE275B50CEBCC36','images/avatar/user_circle.png','2021-09-26','Active',5,NULL),(6,'tuan dai ca','Mr','tuan@gmail.com','0352294119','80EB829FCF37D156FC2776A00260BCBC','images/avatar/user_circle.png','2021-11-04','Deactive',1,'3A9FBF61F7D7D7CACA947891BB0EA8F8');
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

-- Dump completed on 2021-11-07 21:52:12
