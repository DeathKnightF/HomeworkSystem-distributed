/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.16 : Database - homeworksystemDatabase
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`homeworksystemDatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `homeworksystemDatabase`;

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(15) DEFAULT NULL,
  `course_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `courses` */

insert  into `courses`(`course_id`,`teacher_id`,`course_name`) values (1,'156678','编译原理'),(2,'198872','数据库'),(8,'10001','腾讯QQ'),(9,'10001','微信'),(12,'10001','德玛西亚'),(14,'10001','王者荣耀'),(15,'10001','刺激战场'),(17,'10002','数据库'),(18,'10002','编译原理'),(19,'10002','软件工程'),(20,'10002','网络编程'),(21,'10002','高等数学'),(22,'10002','离散数学'),(23,'10002','线性代数'),(24,'10002','大学物理'),(25,'10001','编译原理'),(27,'10001','数据库'),(28,'10001','编译原理'),(29,'10001','腾讯QQ'),(31,'10001','调试');

/*Table structure for table `homeworks` */

DROP TABLE IF EXISTS `homeworks`;

CREATE TABLE `homeworks` (
  `question_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `homework` text,
  `score` int(11) DEFAULT '0',
  `repeatability` int(11) DEFAULT '0',
  `assess` text,
  PRIMARY KEY (`student_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `homeworks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `homeworks_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `homework` CHECK ((not(NULL)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `homeworks` */

insert  into `homeworks`(`question_id`,`student_id`,`homework`,`score`,`repeatability`,`assess`) values (8,'1','2147483646',0,100,NULL),(8,'10001','1111111111',0,75,NULL),(1,'17030110014','',0,88,NULL),(8,'17030110099','		\r\n	1111111111111111111111',0,62,NULL),(1,'17030110101','Am阿加减法进位加法',0,88,NULL),(8,'17030110101','111111111',0,100,NULL),(28,'17030110101','		\r\n	啊啊',0,0,NULL),(8,'2','a',0,100,NULL),(8,'3','a',0,100,NULL),(8,'4','a',0,100,NULL),(8,'5','a',0,100,NULL),(8,'666','		\r\n	11111111111111111111111111111111111111111111111999999999999999999999999999999999999999999',0,39,NULL);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `question` text,
  `deadline` timestamp NULL DEFAULT '2038-01-01 00:00:00',
  `dup_check` int(11) DEFAULT '0',
  `answer` text,
  PRIMARY KEY (`question_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `question` CHECK ((not(NULL)))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `questions` */

insert  into `questions`(`question_id`,`course_id`,`question`,`deadline`,`dup_check`,`answer`) values (1,1,'卡机是按时读取我的钱我不出现在你把门打开前往i\r\n逮虾户\r\nIwas','2038-01-01 00:00:00',0,NULL),(2,1,'asodhua  ','2038-01-01 00:00:00',0,NULL),(8,8,'2147483647+99999=?','2038-01-01 00:00:00',1,'111111111'),(28,9,'','2020-04-18 16:00:00',0,NULL),(31,9,'333333333333333333333333333333333333333333333333333','2020-04-03 16:00:00',0,NULL),(32,9,'哈哈哈哈哈','2020-04-03 16:00:00',1,NULL),(34,8,'2147483647+99999=?','2020-04-10 08:00:00',1,'溢出\r\n		aaaaaaaaaaaaaaaaaaaaaaaaaaaa'),(40,17,'2147483647+99999=?','2020-04-26 16:00:00',0,NULL),(41,17,'1+1','2020-04-25 16:00:00',0,NULL),(42,17,'2+2','2020-04-25 16:00:00',0,NULL),(46,8,'','2020-05-30 16:00:00',0,NULL);

/*Table structure for table `s_c` */

DROP TABLE IF EXISTS `s_c`;

CREATE TABLE `s_c` (
  `student_id` varchar(15) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `s_c_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `s_c_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `s_c` */

insert  into `s_c`(`student_id`,`course_id`) values ('10001',1),('17030110014',1),('17030110014',2),('1',8),('10001',8),('17030110099',8),('17030110100',8),('17030110101',8),('17030110104',8),('2',8),('3',8),('4',8),('5',8),('666',8),('17030110101',9),('17030110101',12),('17030110101',24);

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` varchar(15) NOT NULL,
  `pass_word` varchar(20) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `gender` varchar(2) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `students` */

insert  into `students`(`student_id`,`pass_word`,`user_name`,`gender`) values ('1','123456','李四','男'),('10001','1234567','马化腾','男'),('123','123456','lk','男'),('17030110014','123456','jio','女'),('17030110099','123456','wlz','男'),('17030110100','123456','狗正','男'),('17030110101','1234567890','烽哥','男'),('17030110104','123456','吕凯','男'),('2','123456','1','1'),('3','123456','1','1'),('4','123456','1','1'),('5','123456','1','1'),('666','123456','6到飞起','男'),('aaaa','123456','指针','男');

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `teacher_id` varchar(15) NOT NULL,
  `pass_word` varchar(20) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `gender` varchar(2) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teachers` */

insert  into `teachers`(`teacher_id`,`pass_word`,`user_name`,`gender`) values ('10001','123456','Pony马化腾','男'),('10002','123456','张三','男'),('156678','456','嘻嘻','女'),('198872','123','哈哈','男');

/*Table structure for table `my_courses` */

DROP TABLE IF EXISTS `my_courses`;

/*!50001 DROP VIEW IF EXISTS `my_courses` */;
/*!50001 DROP TABLE IF EXISTS `my_courses` */;

/*!50001 CREATE TABLE  `my_courses`(
 `course_id` int(11) ,
 `course_name` varchar(20) ,
 `teacher_name` varchar(10) ,
 `student_id` varchar(15) 
)*/;

/*View structure for view my_courses */

/*!50001 DROP TABLE IF EXISTS `my_courses` */;
/*!50001 DROP VIEW IF EXISTS `my_courses` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `my_courses` AS select `s_c`.`course_id` AS `course_id`,`courses`.`course_name` AS `course_name`,`teachers`.`user_name` AS `teacher_name`,`s_c`.`student_id` AS `student_id` from ((`s_c` join `courses` on((`s_c`.`course_id` = `courses`.`course_id`))) join `teachers` on((`courses`.`teacher_id` = `teachers`.`teacher_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
