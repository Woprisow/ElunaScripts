/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.26-MariaDB-0+deb9u1 : Database - eluna
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eluna` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `eluna`;

/*Table structure for table `guild_base` */

DROP TABLE IF EXISTS `guild_base`;

CREATE TABLE `guild_base` (
  `guild_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `current_gold` int(11) NOT NULL,
  `current_exp` int(11) NOT NULL,
  `final_exp` int(11) NOT NULL,
  PRIMARY KEY (`guild_id`,`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `guild_base` */

/*Table structure for table `guild_members_stats` */

DROP TABLE IF EXISTS `guild_members_stats`;

CREATE TABLE `guild_members_stats` (
  `guild_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `totalgold` int(11) DEFAULT NULL,
  `totalexp` int(11) DEFAULT NULL,
  PRIMARY KEY (`guild_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `guild_members_stats` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
