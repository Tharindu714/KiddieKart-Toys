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
  PRIMARY KEY (`id`),
  KEY `fk_address_user_idx` (`user_id`),
  KEY `fk_address_district1_idx` (`district_id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_address_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `fk_address_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.address: ~0 rows (approximately)

-- Dumping structure for table kiddiekart.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL,
  `qty` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  KEY `fk_cart_user1_idx` (`user_id`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.cart: ~0 rows (approximately)

-- Dumping structure for table kiddiekart.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.category: ~0 rows (approximately)
REPLACE INTO `category` (`id`, `name`) VALUES
	(1, 'Toys'),
	(2, 'Sport');

-- Dumping structure for table kiddiekart.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.city: ~0 rows (approximately)
REPLACE INTO `city` (`id`, `name`) VALUES
	(1, 'Bandarawela'),
	(2, 'Badulla'),
	(3, 'Colombo');

-- Dumping structure for table kiddiekart.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.district: ~0 rows (approximately)
REPLACE INTO `district` (`id`, `name`) VALUES
	(1, 'Uva'),
	(2, 'Western');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.order_item: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product: ~0 rows (approximately)
REPLACE INTO `product` (`id`, `title`, `description`, `price`, `date_time_added`, `qty`, `delivery_fee`, `category_id`, `user_id`, `product_status_id`, `product_condition_id`) VALUES
	(1, 'Giant Blue Teddy Bear Plush ', 'Our teddy bear has a lovely appearance, of course, as your long-term playmate, we are also special in the production of the heart, to ensure his safety and comfort, to bring you a pleasant feeling. I hope that our happiness and love in making teddy bears can be passed to you through it. It makes life more colorful.', 10000, '2024-09-12 03:32:37', 30, 300, 1, 1, 1, 1),
	(2, 'Giant Pink Teddy Bear Plush ', 'Our teddy bears are very cute. You can either give them as gifts or collect them. If you are a boyfriend, then you can give our teddy bear as a gift to your girlfriend, let it convey love to her and accompany her. If you are a mother or a father, you can give it to your child as a gift and let it stay with your child while you are busy, so that she is no longer alone.', 12000, '2024-09-12 03:34:57', 30, 300, 1, 1, 1, 1);

-- Dumping structure for table kiddiekart.product_condition
CREATE TABLE IF NOT EXISTS `product_condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product_condition: ~0 rows (approximately)
REPLACE INTO `product_condition` (`id`, `name`) VALUES
	(1, 'Brand new'),
	(2, 'Used');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product_order: ~0 rows (approximately)

-- Dumping structure for table kiddiekart.product_status
CREATE TABLE IF NOT EXISTS `product_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.product_status: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.user: ~0 rows (approximately)
REPLACE INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `verification`) VALUES
	(1, 'Tharindu', 'Chanaka', 'tharinduchanaka6@gmail.com', 'tharinduCHA@8754', 'Verified');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kiddiekart.wishlist: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
