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
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table accounts.accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`account_id`, `name`, `created`) VALUES
	(1, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(2, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(3, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(4, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(5, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(6, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(7, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(8, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(9, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(10, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(11, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(12, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(13, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(14, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(15, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(16, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(17, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(18, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(19, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(20, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(21, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(22, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(23, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(24, 'Sajid Iqbal', '2022-04-17 12:59:50'),
	(25, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(26, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(27, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(28, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(29, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(30, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(31, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(32, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(33, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(34, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(35, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(36, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(37, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(38, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(39, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(40, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(41, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(42, 'Bank Al Habib', '2022-04-17 12:57:53'),
	(43, 'Habib Metro', '2022-04-17 15:41:52'),
	(44, 'Pedro Bhai 2', '2022-04-17 15:54:38');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
