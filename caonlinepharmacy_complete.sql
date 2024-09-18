/*
SQLyog Trial v13.1.9 (64 bit)
MySQL - 10.4.32-MariaDB : Database - caonlinepharmacy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`caonlinepharmacy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `caonlinepharmacy`;

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `per_price` float DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id`,`product_id`,`quantity`,`cart_count`,`created_at`,`updated_at`,`total_price`,`per_price`,`image_url`,`product_name`) values 
(16,3,60,3,'2024-06-11 13:59:24','2024-06-11 13:59:24',1056,5.33,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/modalert200.png','Modafinil (Modavigil)');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'A.D.H.D.',NULL,NULL),
(2,'Anti Anxiety',NULL,NULL),
(3,'Men\'s Health',NULL,NULL),
(4,'Muscle Relaxant',NULL,NULL),
(5,'Pain Relief',NULL,NULL),
(6,'Sleeping Aids',NULL,NULL),
(7,'Weight Loss',NULL,NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(27,'2024_06_05_104838_create_sessions_table',1),
(28,'2024_06_08_101916_create_users_table',1),
(29,'2024_06_08_102019_create_password_reset_tokens_table',1),
(30,'2024_06_08_102048_create_failed_jobs_table',1),
(31,'2024_06_08_102112_create_personal_access_tokens_table',1),
(32,'2024_06_09_155400_create_price_table',1),
(33,'2024_06_10_212309_create_categories_table',1),
(34,'2024_06_11_084603_create_carts_table',1);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `price` */

DROP TABLE IF EXISTS `price`;

CREATE TABLE `price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `per10` double NOT NULL,
  `per20` double NOT NULL,
  `per30` double NOT NULL,
  `per60` double NOT NULL,
  `per90` double NOT NULL,
  `per180` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `price` */

insert  into `price`(`id`,`product_id`,`per10`,`per20`,`per30`,`per60`,`per90`,`per180`,`created_at`,`updated_at`) values 
(1,1,0,0,12.33,7.8,6.33,0,NULL,NULL),
(2,2,0,0,12.33,7.8,6.33,0,NULL,NULL),
(3,3,0,0,9,5.33,4.11,0,NULL,NULL),
(4,4,0,0,12.33,7.83,6.33,0,NULL,NULL),
(5,5,0,0,9,6.17,5.22,0,NULL,NULL),
(6,6,0,0,9,6.17,5.22,0,NULL,NULL),
(7,7,0,0,10.67,7,5.78,0,NULL,NULL),
(8,8,0,0,5.67,3.67,3,0,NULL,NULL),
(9,9,0,0,9,5.33,4.11,2.61,NULL,NULL),
(10,10,0,0,11,6.33,4.78,2.94,NULL,NULL),
(11,11,0,0,5.56,3.67,3,0,NULL,NULL),
(12,12,0,0,6.33,4,3.22,0,NULL,NULL),
(13,13,0,0,5.56,3.67,3,0,NULL,NULL),
(14,14,0,0,5.56,3.67,3,0,NULL,NULL),
(15,15,0,0,9,6.17,5.22,0,NULL,NULL),
(16,16,0,0,12.33,7.83,6.33,0,NULL,NULL),
(17,17,0,0,9,6.17,5.22,0,NULL,NULL),
(18,18,0,0,9,6.17,5.22,0,NULL,NULL),
(19,19,0,0,10.33,6.83,5.67,0,NULL,NULL),
(20,20,0,0,10.33,6.83,5.67,0,NULL,NULL),
(21,21,0,0,9,6.17,5.22,0,NULL,NULL),
(22,22,0,0,9,6.17,5.22,0,NULL,NULL),
(23,23,0,0,9,6.17,5.22,0,NULL,NULL),
(24,24,0,0,9,6.17,5.22,0,NULL,NULL),
(25,25,0,0,9,6.17,5.22,0,NULL,NULL),
(26,26,0,0,9,6.17,5.22,0,NULL,NULL),
(27,27,0,0,7.67,4.67,3.67,2.06,NULL,NULL),
(28,28,0,0,9,5.33,4.11,2.61,NULL,NULL),
(29,29,0,0,5.67,3.67,3,0,NULL,NULL),
(30,30,0,0,6.33,4,3.22,0,NULL,NULL),
(31,31,27,18.5,15.67,11.17,9.67,0,NULL,NULL),
(32,32,27,18.5,15.67,11.17,9.67,0,NULL,NULL),
(33,33,0,0,12.33,7.83,6.33,0,NULL,NULL),
(34,34,0,0,9,6.17,5.22,0,NULL,NULL),
(35,35,0,0,5.67,4.5,4.11,0,NULL,NULL),
(36,36,0,0,9,6.17,5.22,0,NULL,NULL),
(37,37,0,0,9,6.17,5.22,0,NULL,NULL),
(38,38,0,0,9,6.17,5.22,0,NULL,NULL),
(39,39,0,0,9,6.17,5.22,0,NULL,NULL),
(40,40,0,0,10.67,7,5.78,0,NULL,NULL),
(41,41,0,0,12.33,7.83,6.33,0,NULL,NULL),
(42,42,0,0,15.67,9.5,7.44,0,NULL,NULL),
(43,43,0,0,12.33,7.83,6.33,0,NULL,NULL),
(44,44,0,0,9,6.17,5.22,0,NULL,NULL),
(45,45,0,0,9,6.17,5.22,3.72,NULL,NULL),
(46,46,0,0,13.67,8.5,6.78,4.5,NULL,NULL),
(47,47,27,18.5,15.56,11.17,9.67,0,NULL,NULL),
(48,48,27,18.5,15.56,11.17,9.67,0,NULL,NULL),
(49,49,0,0,12.33,7.83,6.33,0,NULL,NULL);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_price` float NOT NULL,
  `max_price` float NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int(5) NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_url` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`product_name`,`category_name`,`min_price`,`max_price`,`description`,`delivery_data`,`amount`,`id`,`image_url`,`category_id`,`created_at`,`updated_at`) values 
('Adderall (AD30)(UStoUS) 30mg','A.D.H.D.',407,627,'Adderall is used to treat attention deficit hyperactivity disorder (ADHD) and narcolepsy.\r\nAdderall contains a combination of amphetamine and dextroamphetamine. \r\nAmphetamine and dextroamphetamine are central nervous system stimulants that affect chemicals i.','Adderall (AD30)(UStoUS) 30mg \r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',100,1,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/addrea30mg.jpg',1,NULL,NULL),
('Adderall (Teva) 30mg','A.D.H.D.',407,627,'Adderall is used to treat attention deficit hyperactivity disorder (ADHD) and narcolepsy.\r\nAdderall contains a combination of amphetamine and dextroamphetamine. \r\nAmphetamine and dextroamphetamine are central nervous system stimulants that affect chemicals i.','Adderall (Teva) 30mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',2000,2,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/AdderallXR30mg.jpg',1,NULL,NULL),
('Modafinil (Modavigil)','A.D.H.D.',297,407,'Modafinil is a medication that promotes wakefulness. \r\nModafinil is used to treat excessive sleepiness caused by sleep apnea, narcolepsy, or shift work sleep disorder.\r\nModafinil may also be used for purposes not listed in this medication guide.','Modafinil(Modavigil) 200mg \r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',150,3,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/modalert200.png',1,NULL,NULL),
('Ritalin (CIBA/3)','A.D.H.D.',407,627,'Ritalin is a central nervous system stimulant. \r\nMethylphenidate affects chemicals in the brain and nerves that contribute to hyperactivity and impulse control.\r\nRitalin is used to treat attention deficit disorder (ADD), attention deficit hyperactivity disord.','Ritalin (CIBA/3) 10mg \r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',150,4,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Ritalin.jpg',1,NULL,NULL),
('Alprazolam (Alko) 1mg','Anti Anxiety',297,517,'Alprazolam is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that it works by enhancing the activity of certain neurotransmitters in the brain. \r\nAlprazolam is used to treat anxiety disorders, panic disorders, and anxiety caused by depression.','Alprazolam (Alko) 1mg \r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',250,5,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/ALPRAZOLAM2MG.jpg',2,NULL,NULL),
('Alprazolam (Ksalol) 1mg','Anti Anxiety',297,517,'Alprazolam is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that it works by enhancing the activity of certain neurotransmitters in the brain. \r\nAlprazolam is used to treat anxiety disorders, panic disorders, and anxiety caused by depression.','Alprazolam (Ksalol) 1mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',200,6,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/ALPRAZOLAM2MG.jpg',2,NULL,NULL),
('Alprazolam (Pfizer) 2mg','Anti Anxiety',407,627,'Alprazolam is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that it works by enhancing the activity of certain neurotransmitters in the brain. \r\nAlprazolam is used to treat anxiety disorders, panic disorders, and anxiety caused by depression.','Alprazolam (Pfizer) 2mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',550,7,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/ALPRAZOLAM2MG.jpg',2,NULL,NULL),
('Cialis (Vidalista) 20mg','Men\'s Health',187,297,'Cialis relaxes muscles of the blood vessels and increases blood flow to particular areas of the body. \r\nCialis is used to treat erectile dysfunction (impotence) and symptoms of benign prostatic hypertrophy (enlarged prostate).Another brand of tadalafil is A.','Cialis (Vidalista) 20mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',100,8,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CIALIS20MG.jpg',3,NULL,NULL),
('Cialis (Vidalista) 40mg','Men\'s Health',297,517,'Cialis relaxes the muscles of the blood vessels and increases blood flow to specific parts of the body.\r\nCialis is used to treat symptoms of erectile dysfunction (impotence) and benign prostatic hypertrophy (enlargement of the prostate).\r\nAnother brand of tadalafil is Adcirca, which is used to treat pulmonary arterial hypertension and improve exercise capacity in men and women. \r\nDo not take Cialis with Adcirca unless your doctor tells you to.','Cialis (Vidalista) 40 mg.\r\n(US shipping) (blister pack)\r\nUS to US shipping, 2 to 9 business days',2000,9,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CIALIS20MG.jpg',3,NULL,NULL),
('Cialis (Vidalista) 60mg','Men\'s Health',363,583,'Cialis loosens vascularization and increases blood flow to specific body parts.\r\nCialis is used to treat the symptoms of youngster’s erectile dysfunction (impotence) and benign vendor hypertrophy (hypertrophy).\r\nAnother brand of tadalafil is Adcirca, which is used to treat pulmonary arterial hypertension and improve exercise capacity in men and women. \r\nDo not take Cialis with Adcirca unless your doctor tells you to.','Cialis (Vidalista) 60 mg.\r\n(U.S. to U.S. Shipping) (Blister Pack)\r\nU.S. to U.S. shipping, 2 to 9 per day',1500,10,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CIALIS20MG.jpg',3,NULL,NULL),
('Carisoprodol (HAB) 350mg','Muscle Relaxant',187,297,'Carisoprodol is a muscle relaxer that blocks pain sensations between the nerves and the brain.','Carisoprodol (HAB) 350mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',100,11,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CARISOPRODOL350MG.jpg',4,NULL,NULL),
('Carisoprodol (HAB) 500mg','Muscle Relaxant',209,319,'Carisoprodol is a muscle relaxer that blocks pain sensations between the nerves and the brain.','Carisoprodol (HAB) 500mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',150,12,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CARISOPRODOL350MG.jpg\r\n',4,NULL,NULL),
('Soma (HAB) 350mg','Muscle Relaxant',187,297,'Soma is a muscle relaxer that blocks pain sensations between the nerves and the brain.','Soma (HAB) 350mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',200,13,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CARISOPRODOL350MG.jpg',4,NULL,NULL),
('Aspadol (HAB)100mg','Pain Relief',319,517,'Tapentadol is an opioid pain medication. \r\nAn opioid is sometimes called a narcotic. \r\nTapentadol is a prescription medicine that is used to treat moderate to severe pain. \r\nTapentadol extended-release form (Nucynta ER) is for around-the-clock treatment of pain.','Tapentadol (HAB) 100mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',100,14,'https://caonlinepharmacy.com/wp-content/uploads/2024/03/photo_2024-03-17_16-43-32-1.jpg',5,NULL,NULL),
('Dilaudid (M8)','Pain Relief',407,627,'Dilaudid is an opioid pain medication. \r\nAn opioid is sometimes called a narcotic. \r\nDilaudid is used to treat moderate to severe pain.','Dilaudid (M8) 8mg \r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',200,15,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/images-2-1.jpg',5,NULL,NULL),
('Fioricet (BAC/123)','Pain Relief',297,517,'Fioricet capsules contain a combination of acetaminophen, butalbital, and caffeine. \r\nAcetaminophen is a pain reliever and fever reducer. \r\nButalbital is in a group of drugs called barbiturates. \r\nIt relaxes muscle contractions involved in a tension headache. \r\nCaffeine is a central nervous system stimulant. \r\nIt relaxes muscle contractions in blood vessels to improve blood flow. \r\nFioricet is used to treat tension headaches that are caused by muscle contractions.','Fioricet (BAC/123) 40mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',1500,16,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/floricet-40mg.jpg',5,NULL,NULL),
('Ambien (Zoltrate) 10mg','Sleeping Aids',297,517,'Ambien is a sedative, also called a hypnotic. \r\nAmbien (zolpidem) affects chemicals in the brain that may be unbalanced in people with sleep problems (insomnia). \r\nAmbien is used to treat insomnia. \r\nThe immediate-release tablet is used to help you fall asleep.','Ambien (Zoltrate) 10mg \r\n(USA Shipping) (Blister Pack)  \r\nUS to US shipping, 2 to 9 business days',100,17,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Ambien10mg.jpg',6,NULL,NULL),
('Ambien (Zoltrate) 10mg','Sleeping Aids',341,561,'Ambien is a sedative, also called a hypnotic. \r\nAmbien (zolpidem) affects chemicals in the brain that may be unbalanced in people with sleep problems (insomnia). \r\nAmbien is used to treat insomnia. \r\nThe immediate-release tablet is used to help you fall asleep when you first go to bed. \r\nThe extended-release form, Ambien CR, which has a first layer that dissolves quickly to help you fall asleep, and a second layer that dissolves slowly to help you stay asleep.','Ambien (Belbien) 10mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',2000,18,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Ambien10mg.jpg',6,NULL,NULL),
('Ambien (Zoltrate) 10mg','Sleeping Aids',341,561,'Ambien is a sedative, also called a hypnotic. \r\nAmbien (zolpidem) affects chemicals in the brain that may be unbalanced in people with sleep problems (insomnia). \r\nAmbien is used to treat insomnia. \r\nThe immediate-release tablet is used to help you fall asleep when you first go to bed. \r\nThe extended-release form, Ambien CR, which has a first layer that dissolves quickly to help you fall asleep, and a second layer that dissolves slowly to help you stay asleep.','Ambien (Belbien) 10mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',2000,19,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Zolpidem-Belbien-10mg.jpg',6,NULL,NULL),
('Adipex-P (K25)','Weight Loss',297,517,'Adipex-P is a prescription medicine similar to amphetamine. \r\nPhentermine stimulates the central nervous system (nerves and brain), which increases your heart rate and blood pressure and decreases your appetite.\r\nAdipex-P is used together with diet and exercise to treat obesity, especially in people with risk factors such as high blood pressure, high cholesterol, or diabetes.','Adipex(K25) 37.5mg \r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',400,20,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Adipex-P-K25.jpg',7,NULL,NULL),
('Phentermine (K25)','Weight Loss',297,517,'Phentermine is used to speed weight loss in overweight people. \r\nIt is used together with diet and exercise to treat obesity, especially in people with risk factors such as high blood pressure, high cholesterol, or diabetes.\r\nPhentermine is similar to an amphetamine. \r\nIt stimulates the central nervous system (nerves and brain), which increases your heart rate and blood pressure and decreases your appetite.','Phentermine (K25) 37.5mg \r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',250,21,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/PHENTERMINE375MG.jpg',7,NULL,NULL),
('Ativan (Pfizer)','Anti Anxiety',297,517,'Ativan is used in adults and children at least 12 years old to treat anxiety disorders.\r\nAtivan is also used to treat insomnia caused by anxiety or temporary situational stress.\r\nAtivan is sometimes used to treat nausea and vomiting from cancer treatment and to control agitation caused by alcohol withdrawal.','Ativan (Pfizer) 2mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',1000,22,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/ativan-2mg.jpg',2,NULL,NULL),
('Clonazepam (Galenika) 2mg','Anti Anxiety',297,517,'Clonazepam is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that benzodiazepines work by enhancing the activity of certain neurotransmitters in the brain.\r\nClonazepam is used to treat certain seizure disorders (including absence seizures or Lennox-Gastaut syndrome) in adults and children.','Clonazepam (Galenika) 2mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',250,23,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/CLONAZEPAM2MG.jpg',2,NULL,NULL),
('Diazepam (Bensedin) 10mg','Anti Anxiety',297,517,'Diazepam is a benzodiazepine (ben-zoe-dye-AZE-eh-peen)). \r\nIt is thought that benzodiazepines work by enhancing the activity of certain neurotransmitters in the brain.\r\nDiazepam is used to treat anxiety disorders, or alcohol withdrawal symptoms.\r\nDiazepam is sometimes used with other medications to treat muscle spasms and stiffness, or seizures.','Diazepam (Bensedin) 10mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',500,24,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Diazepam10MG.jpg',2,NULL,NULL),
('Klonopin (Galenika) 2mg','Anti Anxiety',297,517,'Klonopin is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that benzodiazepines work by enhancing the activity of certain neurotransmitters in the brain.\r\nKlonopin is used to treat certain seizure disorders (including absence seizures or Lennox-Gastaut syndrome) in adults and children.\r\nKlonopin is also used to treat panic disorder (including agoraphobia) in adults.','Klonopin (Galenika) 2mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',100,25,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/images-8.jpg',2,NULL,NULL),
('Lorazepam (Pfizer) 2mg','Anti Anxiety',297,517,'Lorazepam belongs to a class of medications called benzodiazepines. \r\nIt is thought that benzodiazepines work by enhancing the activity of certain neurotransmitters in the brain.\r\nLorazepam is used in adults and children at least 12 years old to treat anxiety disorders.\r\nLorazepam is also used to treat insomnia caused by anxiety or temporary situational stress.\r\nLorazepam is sometimes used to treat nausea and vomiting from cancer treatment and to control agitation caused by alcohol withdrawal.','Lorazepam (Pfizer) 2mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',200,26,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Lorazepam2MG.jpg',2,NULL,NULL),
('Viagra (Cenforce Pharma) 150mg','Men\'s Health',253,473,'Viagra relaxes the muscles in the walls of blood vessels and increases the flow of blood to specific areas of the body.\r\nViagra is used to treat erectile dysfunction (impotence) in men. \r\nAnother brand of sildenafil is Revatio, which is used to treat pulmonary arterial hypertension and to improve exercise capacity in men and women. \r\nThis page contains information specific to Viagra (not Revatio).','Viagra (Cenforce) 150mg.\r\n(US shipping) (blister pack)\r\nUS to US shipping, 2 to 9 business days',300,27,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/viagra100mg.jpg',3,NULL,NULL),
('Viagra (Cenforce Pharma) 200mg','Men\'s Health',297,517,'Viagra relaxes the muscles in the walls of blood vessels and increases the flow of blood to specific areas of the body.\r\nViagra is used to treat erectile dysfunction (impotence) in men. \r\nAnother brand of sildenafil is Revatio, which is used to treat pulmonary arterial hypertension and to improve exercise capacity in men and women. \r\nThis page contains information specific to Viagra (not Revatio).','Viagra (Cenforce) 200mg.\r\n(US shipping) (blister pack)\r\nUS to US shipping, 2 to 9 business days',450,28,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/viagra100mg.jpg',3,NULL,NULL),
('Viagra (Cenforce Pharma)100mg','Men\'s Health',187,297,'Viagra relaxes the muscles in the walls of blood vessels and increases the flow of blood to specific areas of the body.\r\nViagra is used to treat erectile dysfunction (impotence) in men. \r\nAnother brand of sildenafil is Revatio, which is used to treat pulmonary arterial hypertension and to improve exercise capacity in men and women. \r\nThis page contains information specific to Viagra (not Revatio).','Viagra (Cenforce) 100mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',200,29,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/viagra100mg.jpg',3,NULL,NULL),
('Soma (HAB) 500mg','Muscle Relaxant',209,319,'Soma is a muscle relaxer that blocks pain sensations between the nerves and the brain.','Soma (HAB) 500mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',250,30,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Soma-HAB-500mg.jpeg',4,NULL,NULL),
('Hydrocodone(Amneal)','Pain Relief',297,957,'Hydrocodone is an opioid pain medication.\r\nZohydro ER and Hysingla ER are extended-release forms of hydrocodone that are used for around-the-clock treatment of severe pain.\r\nExtended-release hydrocodone is not for use on an as-needed basis for pain.','Hydrocodone(Amneal) 10/325mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',300,31,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Hydrocodone-.jpg',5,NULL,NULL),
('Hydrocodone(IP110)','Pain Relief',297,957,'Hydrocodone is an opioid pain medication.\r\nZohydro ER and Hysingla ER are extended-release forms of hydrocodone that are used for around-the-clock treatment of severe pain.\r\nExtended-release hydrocodone is not for use on an as-needed basis for pain.','Hydrocodone(IP110) 10/325mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',200,32,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Hydrocodone10.750-MG.jpg',5,NULL,NULL),
('Hydrocodone(Watson 853) 10/325mg','Pain Relief',407,847,'Hydrocodone is an opioid pain medication.\r\nZohydro ER and Hysingla ER are extended-release forms of hydrocodone that are used for around-the-clock treatment of severe pain.\r\nExtended-release hydrocodone is not for use on an as-needed basis for pain.','Hydrocodone (Watson 853) 10/325mg\r\n(U.S. Shipping) (Bulk Pills)\r\nUS to US shipping, 2 to 9 business days',1000,33,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Hydrocodone-.jpg',5,NULL,NULL),
('Zolpidem (Zoltrate) 10mg','Sleeping Aids',297,517,'Zolpidem belongs to a class of medications called sedative-hypnotics. \r\nIt works by slowing activity in the brain to allow sleep.','Zolpidem (Zoltrate) 10mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',2500,34,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/zolpidem-tartrate.webp',6,NULL,NULL),
('Zopiclone (Zopisign)10mg','Sleeping Aids',187,297,'Zopiclone helps to reduce the amount of time it takes you to fall asleep (sleep latency), increase the amount of time you sleep for (sleep duration), and decrease the number of times you wake up at night (nocturnal awakenings). \r\nZopiclone starts to work quickly, taking about an hour to work.','Zopiclone(Zopisign) 10mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',400,35,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/zopisign-zopiclone-tablets-500x500-3.jpg',6,NULL,NULL),
('Rivotril (Galenika)','Anti Anxiety',297,517,'Rivotril is used alone or along with other medications to treat convulsive disorders such as epilepsy. \r\nIt is also prescribed for panic disorder–unexpected attacks of overwhelming panic accompanied by fear of recurrence. \r\nRivotril belongs to a class of drugs known as benzodiazepines.','Rivotril (Galenika) 2mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',7135,36,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Rivotril.jpg',2,NULL,NULL),
('Valium (Bensedin) 10mg','Anti Anxiety',297,517,'Valium is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that diazepam works by enhancing the activity of certain neurotransmitters in the brain.\r\nValium is used to treat anxiety disorders, or alcohol withdrawal symptoms.\r\nValium is sometimes used with other medications to treat muscle spasms and stiffness, or seizures.','Valium (Bensedin) 10mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',515,37,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Valium-10mg-1.png',2,NULL,NULL),
('Xanax (Alko) 1mg','Anti Anxiety',297,517,'Xanax is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that alprazolam works by enhancing the activity of certain neurotransmitters in the brain.\r\nXanax is used to treat anxiety disorders and anxiety caused by depression.\r\nXanax is also used to treat panic disorders with or without a fear of places and situations that might cause panic, helplessness, or embarrassment (agoraphobia).','Xanax (Alko) 1mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',500,38,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/alko-1-mg-alprazolam-tablets-1.png',2,NULL,NULL),
('Xanax (Ksalol) 1mg','Anti Anxiety',297,517,'Xanax is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that alprazolam works by enhancing the activity of certain neurotransmitters in the brain.\r\nXanax is used to treat anxiety disorders and anxiety caused by depression.\r\nXanax is also used to treat panic disorders with or without a fear of places and situations that might cause panic, helplessness, or embarrassment (agoraphobia).','Xanax (Ksalol) 1mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',2000,39,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Xanax1mg.jpg',2,NULL,NULL),
('Xanax (Pfizer) 2mg','Anti Anxiety',352,572,'Xanax is a benzodiazepine (ben-zoe-dye-AZE-eh-peen). \r\nIt is thought that alprazolam works by enhancing the activity of certain neurotransmitters in the brain.\r\nXanax is used to treat anxiety disorders and anxiety caused by depression.\r\nXanax is also used to treat panic disorders with or without a fear of places and situations that might cause panic, helplessness, or embarrassment (agoraphobia).','Xanax (Pfizer) 2mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',5000,40,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Xanax2mg-1.jpg',2,NULL,NULL),
('Oxycodone (K9 KVK)','Pain Relief',407,627,'Oxycodone is an opioid pain medication sometimes called a narcotic.\r\nOxycodone is used to treat moderate to severe pain.\r\nThe extended-release form of oxycodone is for around-the-clock treatment of pain and should not be used on an as-needed basis for pain.','Oxycodone (K9 KVK) 30mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',200,41,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/photo_2024-05-25_09-38-48.jpg',5,NULL,NULL),
('OxyContin (Purdue)','Pain Relief',517,737,'OxyContin is an opioid pain medication sometimes called a narcotic.\r\nOxyContin is a strong prescription medicine used when an opioid medicine is needed to manage severe pain enough to require daily around-the-clock, long-term treatment with an opioid, when other pain treatments such as non-opioid pain medicines or immediate-release opioid medicines do not treat your pain well enough or you cannot tolerate them.','OxyContin (Purdue Green) 80mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',500,42,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/oxycontin80oc.jpg',5,NULL,NULL),
('Percocet (Endo/E712)','Pain Relief',407,627,'Percocet contains a combination of acetaminophen and oxycodone. \r\nOxycodone is an opioid pain medication. An opioid is sometimes called a narcotic. \r\nAcetaminophen is a less potent pain reliever that increases the effects of oxycodone.\r\nPercocet is used to relieve moderate to severe pain.','Percocet (Endo/E712) 10/325mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',200,43,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/Percocet10_325mg.jpg',5,NULL,NULL),
('Tapentadol (HAB)','Pain Relief',297,517,'Tapentadol is an opioid pain medication. An opioid is sometimes called a narcotic.\r\nTapentadol is a prescription medicine that is used to treat moderate to severe pain.\r\nTapentadol extended-release form (Nucynta ER) is for around-the-clock treatment of pain that is not controlled by other medicines. \r\nThe extended-release form of tapentadol is not for use on an as-needed basis for pain.','Tapentadol (HAB) 100mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',10000,44,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/images-6-1.jpg',5,NULL,NULL),
('Ultram (Jpdol) 100mg','Pain Relief',297,737,'Ultram is a pain medicine similar to an opioid. It acts in the central nervous system (CNS) to relieve pain.\r\nUltram is used to treat moderate to severe pain in adults.\r\nThe extended-release form of tramadol (Ultram ER) is for around-the-clock treatment of pain. \r\nUltram ER is not for use on an as-needed basis for pain.','Ultram (Jpdol) 100mg\r\n(USA Shipping) (Blister Pack) \r\nUS to US shipping, 2 to 9 business days',2003,45,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/ULTRAM50MG.jpg',5,NULL,NULL),
('Ultram (Royal) 225mg','Pain Relief',451,891,'Ultram is an opioid-like pain reliever. It acts on the central nervous system (CNS) to relieve pain.\r\nUltram is used to treat moderate to severe pain in adults.\r\nThe extended-release form of tramadol (Ultram ER) is available around the clock to treat pain.\r\nUltram ER is not available on an as-needed basis for pain relief.','Ultram (Royal) 225 mg.\r\n(U.S. Shipping) (Blister Pack)\r\nU.S. to U.S. shipping, 2 to 9 business days',152,46,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/ULTRAM50MG.jpg',5,NULL,NULL),
('Vicodin (Amneal) 10/325mg','Pain Relief',326.7,1052.7,'Vicodin contains a combination of acetaminophen and hydrocodone. \r\nHydrocodone is an opioid pain medication.\r\nAn opioid is sometimes called a narcotic. \r\nAcetaminophen is a less potent pain reliever that increases the effects of hydrocodone.\r\nVicodin tablets are used for the relief of moderate to moderately severe pain.','Vicodin (Amneal) 10/325mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',100,47,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/VICODIN5_500MG.jpg',5,NULL,NULL),
('Vicodin (IP110) 10/325mg','Pain Relief',326.7,1052.7,'Vicodin contains a combination of acetaminophen and hydrocodone. \r\nHydrocodone is an opioid pain medication. \r\nAn opioid is sometimes called a narcotic. \r\nAcetaminophen is a less potent pain reliever that increases the effects of hydrocodone.\r\nVicodin tablets are used for the relief of moderate to moderately severe pain.','Vicodin (IP110) 10/325mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',626,48,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/VICODIN5_500MG.jpg',5,NULL,NULL),
('Vicodin (Watson 853)','Pain Relief',447.7,689.7,'Vicodin contains a combination of acetaminophen and hydrocodone. \r\nHydrocodone is an opioid pain medication. \r\nAn opioid is sometimes called a narcotic. \r\nAcetaminophen is a less potent pain reliever that increases the effects of hydrocodone.\r\nVicodin tablets are used for the relief of moderate to moderately severe pain.','Vicodin (Watson 853) 10/325mg\r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',782,49,'https://caonlinepharmacy.com/wp-content/uploads/2023/12/images-7.jpg',5,NULL,NULL),
('sdf-P (K25adsadsfadfsadfs)11234123411','Weight Loss111',297,517,'Adipex-P is a prescription medicine similar to amphetamine. \r\nPhentermine stimulates the central nervous system (nerves and brain), which increases your heart rate and blood pressure and decreases your appetite.\r\nAdipex-P is used together with diet and exercise to treat obesity, especially in people with risk factors such as high blood pressure, high cholesterol, or diabetes.','Adipex(K25) 37.5mg \r\n(USA Shipping) (Loose Pills) \r\nUS to US shipping, 2 to 9 business days',400,50,'adsfasasdfasdfasdffsdadf',7,'2024-08-10 11:48:39','2024-08-10 11:51:49'),
('\"Modafinil (Modavigil)\"','\"A.D.H.D\"',517,627,'\"Masdfasdf\",','\"asdfasdf\"',100,52,'\"asdfasdfasdf\"',NULL,'2024-08-10 12:23:24','2024-08-10 12:23:24');

/*Table structure for table `rate` */

DROP TABLE IF EXISTS `rate`;

CREATE TABLE `rate` (
  `product_id` int(11) DEFAULT NULL,
  `average_ratingmark` float DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rate` */

insert  into `rate`(`product_id`,`average_ratingmark`,`id`) values 
(1,5,1),
(2,4,2),
(3,4.5,3),
(4,4.4,4),
(5,4.7,5),
(6,3.75,6),
(7,2.5,7),
(8,0,8),
(9,1,9),
(10,1.5,10);

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `email` text DEFAULT NULL,
  `rating_mark` float DEFAULT NULL,
  `review_content` text DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `review` */

insert  into `review`(`email`,`rating_mark`,`review_content`,`product_id`,`id`) values 
('aaa@gmail.com',5,'Very Good',1,1),
('aaa@gmail.com',5,'Very Good',2,2),
('aaa@gmail.com',5,'Very Good',3,3),
('aaa@gmail.com',5,'Very Good',4,4),
('aaa@gmail.com',5,'Very Good',5,5),
('aaa@gmail.com',5,'Very Good',6,6),
('aaa@gmail.com',5,'Very Good',7,7),
('aaa@gmail.com',5,'Very Good',8,8),
('aaa@gmail.com',5,'Very Good',9,9),
('aaa@gmail.com',5,'Very Good',10,10),
('bbb@gmail.com',5,'Very Good',1,11),
('bbb@gmail.com',5,'Very Good',2,12),
('bbb@gmail.com',5,'Very Good',3,13),
('bbb@gmail.com',5,'Very Good',4,14),
('bbb@gmail.com',5,'Very Good',5,15),
('bbb@gmail.com',4,'Good',5,16),
('bbb@gmail.com',4,'Good',7,18),
('bbb@gmail.com',4,'Good',8,19),
('bbb@gmail.com',4,'Good',9,20),
('bbb@gmail.com',3,'Not Bad',10,21),
('ccc@gmail.com',3,'Not Bad',1,22),
('ccc@gmail.com',3,'Not Bad',2,23),
('ccc@gmail.com',3,'Not Bad',3,24),
('ccc@gmail.com',3,'Not Bad',4,25),
('ccc@gmail.com',3,'Not Bad',5,26),
('ccc@gmail.com',2,'Bad',6,27),
('ccc@gmail.com',2,'Bad',7,28),
('ccc@gmail.com',2,'Bad',8,29),
('ccc@gmail.com',2,'Bad',9,30),
('ccc@gmail.com',2,'Bad',10,31),
('ddd@gmail.com',1,'Very Bad',10,33),
('ddd@gmail.com',1,'Very Bad',9,34),
('ddd@gmail.com',1,'Very Bad',8,35),
('ddd@gmail.com',1,'Very Bad',7,36),
('ddd@gmail.com',1,'Very Bad',6,37),
('ddd@gmail.com',2,'Bad',6,38),
('ddd@gmail.com',3,'Not Bad',5,39),
('ddd@gmail.com',3,'Not Bad',4,40),
('ddd@gmail.com',3,'Not Bad',3,41),
('ddd@gmail.com',4,'Good',2,42),
('ddd@gmail.com',5,'Very Good',1,43),
('asdf@gmail.com',5,'Very Good',1,44),
('ggg@gmail.com',4,'Between Good and Very Good',1,45),
('ggg@gmail.com',4,'Between Good and Very Good',1,46),
('ggg@gmail.com',4,'Between Good and Very Good',1,47),
('ggg@gmail.com',4,'Between Good and Very Good',1,48),
('ggg@gmail.com',4,'Between Good and Very Good',1,49);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('7qEmOSvHtmTvNV51voINDLddop8DNcJVgmqS9cg2',NULL,'127.0.0.1','PostmanRuntime/7.29.2','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjRoU1NtbUxGOWQwVHdkQUZScDNBVWp4NkZpQzg0SFB3dkNrOUk4NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9wcm9kdWN0cy8zMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1723208368),
('NvWWXcSIfZmbY6qW3SBZ698WP23Rm7AyWXZW4UuQ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3VKSGI1YmlWR2JUYjlLWnJGNkUyblc1WU84OUI4dTdGWWdTZmVENyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi91c2Vycy9lZGl0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1723204874),
('sxWLq2ontNKO7dvH7RRKHwhstAF0HVRQyfuHfMix',NULL,'127.0.0.1','PostmanRuntime/7.37.3','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ282T2pYdllBc1lWQXJscGUwNXIzVmlIZnQ4Tlc0elJHckJibjVYUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1723295203);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Ethan Chan','ilu08231@gmail.com',NULL,'$2y$12$vlRn7WwXNpuzP/vicfVprulFOs1sIqSDU.voOCeiPSTjr8.nvGFRO',NULL,'2024-08-09 11:24:39','2024-08-09 11:29:20'),
(2,'JOHN','asdf1@asdf.com',NULL,'$2y$12$ATq6NzPrGMfN4u9laViOueYbYTJ8VmhnSdcHSCSwj.bePWE4aoO2W',NULL,'2024-08-09 11:25:30','2024-08-10 10:41:25'),
(3,'Steven Lee','ilu0825@gmail.com',NULL,'$2y$12$Ir5hEoOF67hTFy0KJJIkv.POm8/CCE1Brje5Nyr/NGoJXJWWfR3Ey',NULL,'2024-08-09 11:25:43','2024-08-09 11:25:43'),
(4,'John Dae','johndae1000@gmail.com',NULL,'$2y$12$/o8f2THByUyaSXPVmfqm.u3ZABQxjBtS.LcBTVGhfPBhZbIhYEoiW',NULL,'2024-08-09 11:29:03','2024-08-09 11:29:03'),
(5,'JOHN','asdf@asdf.com',NULL,'$2y$12$tJS7h1LVUuvkVHEIC4Ol3euEvBIE/8sOfNoKAPT0nl1cBhJnIpLUm',NULL,'2024-08-10 10:38:48','2024-08-10 10:38:48');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
