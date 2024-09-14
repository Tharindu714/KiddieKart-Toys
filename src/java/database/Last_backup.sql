-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kiddiekart
CREATE DATABASE IF NOT EXISTS `kiddiekart` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kiddiekart`;

-- Dumping structure for table kiddiekart.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(10) NOT NULL,
  `line_1` text NOT NULL,
  `line_2` text NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  `district_id` int NOT NULL,
  `city_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_user_idx` (`user_id`),
  KEY `fk_address_district1_idx` (`district_id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_address_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_address_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.address: ~0 rows (approximately)
REPLACE INTO `address` (`id`, `mobile`, `line_1`, `line_2`, `postal_code`, `user_id`, `district_id`, `city_id`, `first_name`, `last_name`) VALUES
	(1, '0776543489', '83/1,', 'Haliela', '90010', 2, 1, 2, 'Tharindu', 'Chanaka');

-- Dumping structure for table kiddiekart.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.cart: ~0 rows (approximately)
REPLACE INTO `cart` (`id`, `qty`, `product_id`, `user_id`) VALUES
	(6, 1, 25, 2),
	(7, 1, 23, 2),
	(8, 1, 26, 2),
	(9, 1, 12, 2),
	(10, 1, 15, 2),
	(11, 1, 24, 2);

-- Dumping structure for table kiddiekart.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.category: ~4 rows (approximately)
REPLACE INTO `category` (`id`, `name`) VALUES
	(1, 'Toys'),
	(2, 'School Stash'),
	(3, 'Back Packs'),
	(4, 'Clothes');

-- Dumping structure for table kiddiekart.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.city: ~6 rows (approximately)
REPLACE INTO `city` (`id`, `name`) VALUES
	(1, 'Bandarawela'),
	(2, 'Badulla'),
	(3, 'Nugegoda'),
	(4, 'Haliela'),
	(5, 'Peradeniya'),
	(6, 'Dambulla');

-- Dumping structure for table kiddiekart.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.district: ~6 rows (approximately)
REPLACE INTO `district` (`id`, `name`) VALUES
	(1, 'Badulla'),
	(2, 'Kandy'),
	(3, 'Monaragala'),
	(4, 'Colombo'),
	(5, 'Galle'),
	(6, 'Anuradhapura');

-- Dumping structure for table kiddiekart.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_order1_idx` (`order_id`),
  KEY `fk_order_item_product1_idx` (`product_id`),
  CONSTRAINT `fk_order_item_order1` FOREIGN KEY (`order_id`) REFERENCES `product_order` (`id`),
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.order_item: ~0 rows (approximately)
REPLACE INTO `order_item` (`id`, `qty`, `order_id`, `product_id`) VALUES
	(1, 1, 1, 23),
	(2, 1, 1, 26),
	(3, 2, 1, 4),
	(4, 2, 1, 5),
	(5, 1, 1, 6);

-- Dumping structure for table kiddiekart.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `date_time_added` datetime NOT NULL,
  `qty` int NOT NULL,
  `delivery_fee` double NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_status_id` int NOT NULL,
  `product_condition_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category1_idx` (`category_id`),
  KEY `fk_product_user1_idx` (`user_id`),
  KEY `fk_product_product_status1_idx` (`product_status_id`),
  KEY `fk_product_product_condition1_idx` (`product_condition_id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_product_condition1` FOREIGN KEY (`product_condition_id`) REFERENCES `product_condition` (`id`),
  CONSTRAINT `fk_product_product_status1` FOREIGN KEY (`product_status_id`) REFERENCES `product_status` (`id`),
  CONSTRAINT `fk_product_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product: ~20 rows (approximately)
REPLACE INTO `product` (`id`, `title`, `description`, `price`, `date_time_added`, `qty`, `delivery_fee`, `category_id`, `user_id`, `product_status_id`, `product_condition_id`) VALUES
	(4, 'Giant Blue Teddy Bear Plush ', 'Our teddy bear has a lovely appearance, of course, as your long-term playmate, we are also special in the production of the heart, to ensure his safety and comfort, to bring you a pleasant feeling. I hope that our happiness and love in making teddy bears can be passed to you through it. It makes life more colorful.', 10000, '2024-09-12 04:08:39', 28, 350, 1, 1, 1, 1),
	(5, 'Giant Pink Teddy Bear Plush ', 'Our teddy bear has a lovely appearance, of course, as your long-term playmate, we are also special in the production of the heart, to ensure his safety and comfort, to bring you a pleasant feeling. I hope that our happiness and love in making teddy bears can be passed to you through it. It makes life more colorful.', 12000, '2024-09-12 04:09:38', 28, 400, 1, 1, 1, 1),
	(6, 'Fluffy Teddy bear', 'This is a cute fluffy teddy bear made up with high quality materials', 2500, '2024-09-12 10:20:42', 9, 350, 1, 2, 1, 1),
	(7, 'Cute Back Pack', 'This is a cute back pack made for cute kiddos', 2500, '2024-09-13 17:46:06', 12, 350, 3, 2, 1, 1),
	(8, 'Animal Back Pack', 'This is a cute animal back pack made up with high quality materials', 3200, '2024-09-13 17:47:57', 8, 400, 3, 2, 1, 1),
	(9, 'Printed Back Pack', 'This is cute printed back pack for kids', 2700, '2024-09-13 17:49:27', 10, 350, 3, 2, 1, 1),
	(10, 'Doll Back Pack', 'This is a cute doll Back Pack fir girls', 4000, '2024-09-13 17:52:04', 8, 350, 3, 2, 1, 1),
	(11, 'Kiddie Full Kit', 'This is a Full Kit made up with high quality materials', 4000, '2024-09-13 17:53:53', 12, 450, 4, 2, 1, 1),
	(12, 'Frock', 'This is a kiddie frock made up with high quality materials', 3000, '2024-09-13 17:56:58', 10, 450, 4, 2, 1, 1),
	(13, 'Kids Short', 'This is a kiddie short made up with high quality materials', 1500, '2024-09-13 17:58:45', 8, 350, 4, 2, 1, 1),
	(14, 'Kids Hoodie', 'This is a kiddie Hoodie made up with high quality materials', 2500, '2024-09-13 18:00:16', 14, 400, 4, 2, 1, 1),
	(15, 'Kids Water Bottle', 'This is a kiddie Water Bottle made up with high quality materials', 1500, '2024-09-13 18:01:53', 20, 450, 2, 2, 1, 1),
	(16, 'Printed Water Bottle', 'This is a kiddie Printed Water Bottle made up with high quality materials', 1700, '2024-09-13 18:03:04', 15, 350, 2, 2, 1, 1),
	(17, 'Cute Water Bottle', 'This is a kiddie Water Bottle made up with high quality materials', 1000, '2024-09-13 18:04:01', 25, 300, 2, 2, 1, 1),
	(18, 'Cute Teddy Bear', 'This is a  cute teddy bear made up with high quality materials', 2700, '2024-09-13 18:06:14', 30, 300, 1, 2, 1, 1),
	(19, 'Cute Coffee Machine', 'This is a  cute toy Coffee machine made up with high quality materials', 3500, '2024-09-13 18:08:13', 20, 450, 1, 2, 1, 1),
	(23, 'Little Frock', 'This is a cute little frock for girls', 2500, '2024-09-13 18:12:37', 9, 350, 4, 1, 1, 2),
	(24, 'Kids Pencil Box', 'This is a kids pencil box', 1200, '2024-09-13 18:14:47', 15, 350, 2, 1, 1, 1),
	(25, 'Kids Lunch Box', 'This is a kids Lunch box', 1000, '2024-09-13 18:15:53', 12, 400, 2, 1, 1, 1),
	(26, 'Kids toy car', 'This is a kids toy car', 1200, '2024-09-13 18:16:56', 9, 350, 1, 1, 1, 2);

-- Dumping structure for table kiddiekart.product_condition
CREATE TABLE IF NOT EXISTS `product_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product_condition: ~2 rows (approximately)
REPLACE INTO `product_condition` (`id`, `name`) VALUES
	(1, 'New'),
	(2, 'Old');

-- Dumping structure for table kiddiekart.product_order
CREATE TABLE IF NOT EXISTS `product_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_address1_idx` (`address_id`),
  CONSTRAINT `fk_order_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product_order: ~0 rows (approximately)
REPLACE INTO `product_order` (`id`, `date_time`, `user_id`, `address_id`) VALUES
	(1, '2024-09-14 01:04:48', 2, 1);

-- Dumping structure for table kiddiekart.product_status
CREATE TABLE IF NOT EXISTS `product_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product_status: ~2 rows (approximately)
REPLACE INTO `product_status` (`id`, `name`) VALUES
	(1, 'Active'),
	(2, 'Inactive');

-- Dumping structure for table kiddiekart.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `verification` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.user: ~0 rows (approximately)
REPLACE INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`) VALUES
	(1, 'Tharindu', 'Chanaka', 'tharinduchanaka6@gmail.com', 'tharinduCHA@8754', 'Verified'),
	(2, 'Nilakshi', 'Sadeesha', 'samadhinew2@gmail.com', 'SaMadhi123#', 'Verified'),
	(3, 'Chanaka', 'Sanjeewa', 'chanakaelectro@gmail.com', 'chanaka@ElecTR68', 'Verified');

-- Dumping structure for table kiddiekart.wishlist
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wishlist_product1_idx` (`product_id`),
  KEY `fk_wishlist_user1_idx` (`user_id`),
  CONSTRAINT `fk_wishlist_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_wishlist_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.wishlist: ~0 rows (approximately)
REPLACE INTO `wishlist` (`id`, `product_id`, `user_id`) VALUES
	(1, 7, 2),
	(2, 5, 2),
	(3, 12, 2),
	(4, 14, 2),
	(5, 15, 2),
	(6, 25, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
