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

/*Table structure for table `guild_achievement` */

DROP TABLE IF EXISTS `guild_achievement`;

CREATE TABLE `guild_achievement` (
  `guild_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`guild_id`,`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `guild_achievement` */

/*Table structure for table `guild_achievement_criteria_data` */

DROP TABLE IF EXISTS `guild_achievement_criteria_data`;

CREATE TABLE `guild_achievement_criteria_data` (
  `achievement_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value1` int(11) DEFAULT NULL,
  `value2` int(11) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `guild_achievement_criteria_data` */

insert  into `guild_achievement_criteria_data`(`achievement_id`,`type`,`value1`,`value2`) values 
(4913,9,50000,NULL),
(4948,9,200000,NULL),
(5144,1,50000,NULL),
(5196,10,7,NULL),
(5198,5,2000,NULL),
(5201,9,100000,NULL),
(5263,1,100000,NULL),
(5362,0,1,NULL),
(5420,9,100000,NULL),
(5784,6,50,NULL),
(7446,0,250,NULL);

/*Table structure for table `guild_achievement_index` */

DROP TABLE IF EXISTS `guild_achievement_index`;

CREATE TABLE `guild_achievement_index` (
  `achievement_id` int(11) NOT NULL,
  `categorie` int(11) NOT NULL,
  `locale` varchar(4) NOT NULL,
  `name` text,
  `description` text,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`,`categorie`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `guild_achievement_index` */

insert  into `guild_achievement_index`(`achievement_id`,`categorie`,`locale`,`name`,`description`,`points`) values 
(4913,0,'','Un p\'tit rien plus un p\'tit rien...',NULL,NULL),
(4948,0,'','Économies pour les jours de vache maigre','Ramasser 200 000 pièces d\'or sur des créatures.',NULL),
(5144,0,'frFR','Désinsectiseur de la mort','Tuer 50 000 bestioles.',10),
(5196,0,'','Espace de stockage étendu','Acheter le septième onglet de la banque de guilde.',NULL),
(5198,0,'frFR','Ça, c\'est du haut fait','Obtenir 2 000 points de hauts faits de guilde.',10),
(5201,0,'','Partage des bénéfices','Ramasser 100 000 pièces d\'or sur des créatures.',NULL),
(5263,0,'frFR','Bestiolageddon','Tuer 100 000 bestioles.',10),
(5362,0,'','Tout le monde a besoin d\'un emblème','Créer et acheter une bannière de guilde.',NULL),
(5420,0,'','Et encore des p\'tits riens...','Dépenser 100 000 pièces d\'or en réparations pour les membres de la guilde.',NULL),
(5783,0,'frFR','Défis de raid','Remporter 50 défis de raid en guilde.',10),
(5784,0,'frFR','Défis de champ de bataille','Remporter 50 défis de champ de bataille coté en guilde.',10),
(5785,0,'frFR','Défis de donjon','Remporter 50 défis de donjon en guilde.',10),
(7446,0,'','L’ultime défi','Remporter 250 défis en guilde.',NULL);

/*Table structure for table `guild_achievement_progress` */

DROP TABLE IF EXISTS `guild_achievement_progress`;

CREATE TABLE `guild_achievement_progress` (
  `guild_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  `criteria` int(11) NOT NULL,
  `progress` int(11) DEFAULT NULL,
  PRIMARY KEY (`guild_id`,`achievement_id`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
