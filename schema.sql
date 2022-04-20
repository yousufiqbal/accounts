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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.accounts: ~20 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`account_id`, `name`, `category`, `created`) VALUES
	(1, 'Bank Al Habib', 'banks', '2022-04-17 12:57:53'),
	(43, 'Habib Metro', 'banks', '2022-04-17 15:41:52'),
	(44, 'Saleem Ahmed', 'parties', '2022-04-17 15:54:38'),
	(45, 'Yousuf Capital', 'capitals', '2022-04-18 23:32:51'),
	(46, 'Cash in Hand', 'cash', '2022-04-18 23:33:00'),
	(47, 'Electricity Expense', 'bills', '2022-04-18 23:33:21'),
	(48, 'Telephones Expenses', 'bills', '2022-04-18 23:33:33'),
	(49, 'Naseem Alam', 'parties', '2022-04-18 23:34:25'),
	(50, 'Shoiab Wali', 'parties', '2022-04-18 23:34:32'),
	(51, 'UBL Bank', 'banks', '2022-04-19 00:01:14'),
	(52, 'Water Expenses', 'bills', '2022-04-19 00:30:53'),
	(53, 'Salaries', 'expenses', '2022-04-19 00:42:09'),
	(54, 'Shop', 'properties', '2022-04-19 09:25:09'),
	(55, 'Vehicles', 'properties', '2022-04-19 09:25:26'),
	(56, 'Purchase', 'purchases', '2022-04-19 09:28:51'),
	(57, 'Sale', 'sales', '2022-04-19 09:29:05'),
	(58, 'Fruniture', 'properties', '2022-04-19 10:10:49'),
	(59, 'Stationary', 'expenses', '2022-04-19 21:34:49'),
	(60, 'Lunch & Tea', 'expenses', '2022-04-19 21:35:00'),
	(61, 'Petrol', 'expenses', '2022-04-19 21:35:13'),
	(62, 'Transport', 'expenses', '2022-04-19 21:35:28');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table accounts.coa
CREATE TABLE IF NOT EXISTS `coa` (
  `coa_id` int NOT NULL AUTO_INCREMENT,
  `type` enum('balance-sheet','income-statement') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `element` enum('asset','liability','capital','expense','income') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`coa_id`),
  UNIQUE KEY `type_element_account_id` (`type`,`element`,`account_id`),
  KEY `FK_coa_accounts` (`account_id`),
  CONSTRAINT `FK_coa_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.coa: ~11 rows (approximately)
/*!40000 ALTER TABLE `coa` DISABLE KEYS */;
INSERT INTO `coa` (`coa_id`, `type`, `element`, `account_id`) VALUES
	(18, 'balance-sheet', 'asset', 1),
	(19, 'balance-sheet', 'asset', 43),
	(20, 'balance-sheet', 'asset', 46),
	(21, 'balance-sheet', 'asset', 51),
	(22, 'balance-sheet', 'asset', 54),
	(23, 'balance-sheet', 'asset', 55),
	(24, 'balance-sheet', 'asset', 56),
	(28, 'balance-sheet', 'liability', 44),
	(26, 'balance-sheet', 'liability', 49),
	(27, 'balance-sheet', 'liability', 50),
	(25, 'balance-sheet', 'capital', 45);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.lines: ~19 rows (approximately)
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
INSERT INTO `lines` (`line_id`, `transaction_id`, `account_id`, `debit`, `credit`) VALUES
	(3, 2, 1, 2500000.00, 0.00),
	(4, 2, 45, 0.00, 2500000.00),
	(5, 3, 55, 1500000.00, 0.00),
	(6, 3, 1, 0.00, 1500000.00),
	(7, 4, 54, 1000000.00, 0.00),
	(8, 4, 1, 0.00, 1000000.00),
	(9, 5, 45, 0.00, 250000.00),
	(10, 5, 46, 250000.00, 0.00),
	(11, 6, 52, 5000.00, 0.00),
	(12, 6, 46, 0.00, 5000.00),
	(13, 7, 47, 18000.00, 0.00),
	(14, 7, 46, 0.00, 18000.00),
	(15, 8, 48, 3200.00, 0.00),
	(16, 8, 46, 0.00, 3200.00),
	(17, 9, 61, 2500.00, 0.00),
	(18, 9, 46, 0.00, 2500.00),
	(19, 10, 61, 7000.00, 0.00),
	(20, 10, 46, 0.00, 7000.00),
	(21, 11, 61, 1000.00, 0.00),
	(22, 11, 46, 0.00, 1000.00);
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;

-- Dumping structure for table accounts.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `narration` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.transactions: ~9 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`transaction_id`, `narration`, `datetime`, `created`) VALUES
	(2, 'Starting Business.. Injecting Capital', '2022-04-19 09:21:00', '2022-04-19 09:22:31'),
	(3, 'Bought Cultus VXR 1000 CC', '2022-04-19 09:25:00', '2022-04-19 09:26:11'),
	(4, 'Bought Shop @ Saddar Karachi', '2022-04-19 09:25:00', '2022-04-19 09:26:59'),
	(5, 'Injecting Cash into cash', '2022-04-19 21:04:00', '2022-04-19 21:05:53'),
	(6, 'Paid water bill', '2022-04-19 21:06:00', '2022-04-19 21:06:31'),
	(7, 'Paid electricity bill', '2022-04-19 21:06:00', '2022-04-19 21:07:01'),
	(8, 'Paid telephone bill', '2022-04-19 21:06:00', '2022-04-19 21:07:21'),
	(9, 'Giving to Yousuf for petrol', '2022-04-19 21:35:00', '2022-04-19 21:36:39'),
	(10, 'Giving to Sajid for petrol', '2022-04-19 21:35:00', '2022-04-19 21:36:51'),
	(11, 'Giving to Shoaib for petrol', '2022-04-19 21:35:00', '2022-04-19 21:37:00');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
