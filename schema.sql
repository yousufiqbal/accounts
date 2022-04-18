-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.26 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for accounts
CREATE DATABASE IF NOT EXISTS `accounts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `accounts`;

-- Dumping structure for table accounts.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `category` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.accounts: ~42 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`account_id`, `name`, `category`, `created`) VALUES
	(1, 'Bank Al Habib', 'banks', '2022-04-17 12:57:53'),
	(43, 'Habib Metro', 'banks', '2022-04-17 15:41:52'),
	(44, 'Saleem Ahmed', 'parties', '2022-04-17 15:54:38'),
	(45, 'Yousuf Capital', 'capitals', '2022-04-18 23:32:51'),
	(46, 'Cash in Hand', 'banks', '2022-04-18 23:33:00'),
	(47, 'Electricity Expense', 'bills', '2022-04-18 23:33:21'),
	(48, 'Telephones Expenses', 'bills', '2022-04-18 23:33:33'),
	(49, 'Naseem Alam', 'parties', '2022-04-18 23:34:25'),
	(50, 'Shoiab Wali', 'parties', '2022-04-18 23:34:32'),
	(51, 'UBL Bank', 'banks', '2022-04-19 00:01:14'),
	(52, 'Water Expenses', 'bills', '2022-04-19 00:30:53'),
	(53, 'Salaries', 'expenses', '2022-04-19 00:42:09');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table accounts.coa
CREATE TABLE IF NOT EXISTS `coa` (
  `coa_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`coa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.coa: ~0 rows (approximately)
/*!40000 ALTER TABLE `coa` DISABLE KEYS */;
/*!40000 ALTER TABLE `coa` ENABLE KEYS */;

-- Dumping structure for table accounts.lines
CREATE TABLE IF NOT EXISTS `lines` (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `account_id` int NOT NULL,
  `debit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`line_id`),
  KEY `FK_lines_transactions` (`transaction_id`),
  KEY `FK_lines_accounts` (`account_id`),
  CONSTRAINT `FK_lines_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FK_lines_transactions` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.lines: ~0 rows (approximately)
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
INSERT INTO `lines` (`line_id`, `transaction_id`, `account_id`, `debit`, `credit`) VALUES
	(1, 1, 44, 250.00, 0.00),
	(2, 1, 43, 0.00, 250.00);
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;

-- Dumping structure for table accounts.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `narration` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`transaction_id`, `narration`, `datetime`, `created`) VALUES
	(1, 'asdf', '2022-04-18 23:06:00', '2022-04-18 23:07:11');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
