-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for siakad
CREATE DATABASE IF NOT EXISTS `siakad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `siakad`;

-- Dumping structure for table siakad.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.cache: ~4 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('siakad-3202216155-cache-tidakada@email.com|127.0.0.1', 'i:2;', 1793277072),
	('siakad-3202216155-cache-tidakada@email.com|127.0.0.1:timer', 'i:1793277072;', 1793277072),
	('siakad-3202216155-cache-tidakada99@email.com|127.0.0.1', 'i:1;', 1793277163),
	('siakad-3202216155-cache-tidakada99@email.com|127.0.0.1:timer', 'i:1793277163;', 1793277163);

-- Dumping structure for table siakad.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.cache_locks: ~0 rows (approximately)

-- Dumping structure for table siakad.dosen
CREATE TABLE IF NOT EXISTS `dosen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nidn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `jabatan_fungsional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  UNIQUE KEY `dosen_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.dosen: ~10 rows (approximately)
INSERT INTO `dosen` (`id`, `nidn`, `nama`, `email`, `telepon`, `alamat`, `jabatan_fungsional`, `created_at`, `updated_at`) VALUES
	(1, '0050740580', 'Fitria Prasetyo, S.Si., M.Cs.', 'jjanuar@example.org', '082076507625', 'Jln. Kiaracondong No. 699, Cilegon 61109, Jabar', NULL, '2026-10-25 08:38:03', '2026-11-05 04:17:14'),
	(2, '0046035013', 'Endah Budiyanto, S.T., M.T.', 'prima.prakasa@example.org', '089732067355', 'Jr. Moch. Ramdan No. 822, Probolinggo 62044, Pabar', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(3, '0003777389', 'Vinsen Hassanah, S.Kom., M.Kom.', 'fsaputra@example.com', '080644071533', 'Jln. Bakhita No. 435, Administrasi Jakarta Utara 61306, Kaltim', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(4, '0097267926', 'Nyoman Pangestu, S.Si., M.Cs.', 'uwais.halima@example.org', '088948940896', 'Ki. Ciwastra No. 247, Yogyakarta 38039, Kepri', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(5, '0067297659', 'Latika Maryadi, S.Si., M.Cs.', 'xwasita@example.net', '086700397189', 'Psr. Surapati No. 984, Banjarmasin 64832, Kalteng', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(6, '0002682656', 'Bakiadi Hasanah, S.T., M.T.', 'yulia62@example.com', '088669746287', 'Psr. Urip Sumoharjo No. 598, Sukabumi 69935, Sulut', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(7, '0080445085', 'Talia Hidayat, S.Si., M.Cs.', 'ibudiyanto@example.net', '083353506828', 'Jr. Merdeka No. 996, Dumai 61169, Jambi', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(8, '0059591921', 'Bakiono Wibisono, S.Kom., M.Kom.', 'gprakasa@example.com', '082891631965', 'Jln. Surapati No. 543, Bogor 56840, Kalteng', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(9, '0077138856', 'Lili Wijaya, S.T., M.T.', 'pranawa75@example.com', '086146847997', 'Ki. Suniaraja No. 951, Pasuruan 15268, Malut', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(10, '0072635178', 'Hamima Susanti, S.Kom., M.Eng.', 'hardiansyah.mulyono@example.net', '082439924567', 'Kpg. Wahidin Sudirohusodo No. 907, Sibolga 40944, Kepri', NULL, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(1003, '0002682651', 'Lindung Siswanto', 'admin@siakad.test', '02384092348', 'Singkawang', NULL, '2026-11-09 12:06:11', '2026-11-09 12:06:39');

-- Dumping structure for table siakad.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table siakad.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.jobs: ~0 rows (approximately)

-- Dumping structure for table siakad.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.job_batches: ~0 rows (approximately)

-- Dumping structure for table siakad.krs
CREATE TABLE IF NOT EXISTS `krs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mahasiswa_id` bigint unsigned NOT NULL,
  `tahun_akademik` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` enum('Ganjil','Genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draf','diajukan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draf',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_mahasiswa_id_tahun_akademik_semester_unique` (`mahasiswa_id`,`tahun_akademik`,`semester`),
  CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.krs: ~10 rows (approximately)
INSERT INTO `krs` (`id`, `mahasiswa_id`, `tahun_akademik`, `semester`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(2, 2, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(3, 3, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(4, 4, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(5, 5, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(6, 6, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(7, 7, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(8, 8, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(9, 9, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(10, 10, '2026/2027', 'Ganjil', 'diajukan', '2026-10-25 08:38:03', '2026-10-25 08:38:03');

-- Dumping structure for table siakad.krs_detail
CREATE TABLE IF NOT EXISTS `krs_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `krs_id` bigint unsigned NOT NULL,
  `mata_kuliah_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_detail_krs_id_mata_kuliah_id_unique` (`krs_id`,`mata_kuliah_id`),
  KEY `krs_detail_mata_kuliah_id_foreign` (`mata_kuliah_id`),
  CONSTRAINT `krs_detail_krs_id_foreign` FOREIGN KEY (`krs_id`) REFERENCES `krs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `krs_detail_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.krs_detail: ~50 rows (approximately)
INSERT INTO `krs_detail` (`id`, `krs_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 10, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(2, 1, 5, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(3, 1, 7, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(4, 1, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(5, 1, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(6, 2, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(7, 2, 1, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(8, 2, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(9, 2, 10, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(10, 2, 6, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(11, 3, 9, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(12, 3, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(13, 3, 6, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(14, 3, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(15, 3, 7, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(16, 4, 8, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(17, 4, 10, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(18, 4, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(19, 4, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(20, 4, 7, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(21, 5, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(22, 5, 7, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(23, 5, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(24, 5, 1, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(25, 5, 6, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(26, 6, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(27, 6, 1, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(29, 6, 7, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(30, 6, 6, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(31, 7, 5, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(32, 7, 1, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(33, 7, 6, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(34, 7, 10, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(35, 7, 9, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(36, 8, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(37, 8, 6, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(38, 8, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(40, 8, 8, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(41, 9, 10, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(42, 9, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(43, 9, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(44, 9, 1, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(45, 9, 8, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(46, 10, 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(47, 10, 1, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(48, 10, 9, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(49, 10, 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(50, 10, 5, '2026-10-25 08:38:03', '2026-10-25 08:38:03');

-- Dumping structure for table siakad.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` smallint unsigned NOT NULL,
  `program_studi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D3 Teknik Informatika',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  UNIQUE KEY `mahasiswa_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.mahasiswa: ~50 rows (approximately)
INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `email`, `angkatan`, `program_studi`, `created_at`, `updated_at`) VALUES
	(1, '2503038447', 'Oliva Prasetyo', 'P', '2503038447@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(2, '2203036949', 'Rafi Palastri', 'L', '2203036949@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(3, '2503032858', 'Zelaya Safitri', 'P', '2503032858@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(4, '2503034166', 'Ratih Napitupulu', 'P', '2503034166@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(5, '2303033978', 'Abyasa Ramadan', 'L', '2303033978@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(6, '2503031350', 'Keisha Handayani', 'P', '2503031350@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(7, '2403035578', 'Banawa Rahmawati', 'L', '2403035578@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(8, '2503032714', 'Yessi Halimah', 'P', '2503032714@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(9, '2203037942', 'Daryani Permata', 'L', '2203037942@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(10, '2203031876', 'Qori Uyainah', 'P', '2203031876@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(11, '2203034991', 'Paiman Rahayu', 'L', '2203034991@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(12, '2203037947', 'Wisnu Gunawan', 'L', '2203037947@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(13, '2203039435', 'Ana Marbun', 'P', '2203039435@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(14, '2303034333', 'Catur Dongoran', 'L', '2303034333@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(15, '2503035716', 'Wirda Tarihoran', 'P', '2503035716@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(16, '2303035678', 'Satya Melani', 'L', '2303035678@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(17, '2403033667', 'Slamet Waluyo', 'L', '2403033667@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(18, '2303037499', 'Clara Padmasari', 'P', '2303037499@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(19, '2203037023', 'Capa Dabukke', 'L', '2203037023@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(20, '2503031491', 'Emong Hakim', 'L', '2503031491@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(21, '2203030759', 'Devi Jailani', 'P', '2203030759@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(22, '2503032659', 'Lutfan Hartati', 'L', '2503032659@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(23, '2303038806', 'Suci Saefullah', 'P', '2303038806@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(24, '2303032339', 'Hasna Utami', 'P', '2303032339@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(25, '2403035133', 'Xanana Setiawan', 'L', '2403035133@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(26, '2403039745', 'Jelita Natsir', 'P', '2403039745@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(27, '2303032016', 'Olivia Saptono', 'P', '2303032016@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(28, '2303031546', 'Bakiadi Salahudin', 'L', '2303031546@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(29, '2203030058', 'Widya Damanik', 'P', '2203030058@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(30, '2403034459', 'Nova Rahayu', 'P', '2403034459@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(31, '2303035384', 'Umi Setiawan', 'P', '2303035384@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(32, '2403030013', 'Gina Nababan', 'P', '2403030013@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(33, '2503030346', 'Heru Riyanti', 'L', '2503030346@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(34, '2303031335', 'Mustika Waskita', 'L', '2303031335@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(35, '2403039369', 'Purwadi Handayani', 'L', '2403039369@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(36, '2203034128', 'Galang Laksita', 'L', '2203034128@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(37, '2503039968', 'Marwata Usamah', 'L', '2503039968@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(38, '2503037352', 'Iriana Sirait', 'P', '2503037352@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(39, '2503030389', 'Victoria Sinaga', 'P', '2503030389@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(40, '2203032624', 'Adiarja Prakasa', 'L', '2203032624@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(41, '2303032074', 'Latif Wulandari', 'L', '2303032074@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(42, '2403033070', 'Shakila Sirait', 'P', '2403033070@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(43, '2303035899', 'Paris Setiawan', 'P', '2303035899@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(44, '2203037175', 'Cawisadi Hutapea', 'L', '2203037175@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(45, '2403030435', 'Cinthia Najmudin', 'P', '2403030435@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(46, '2403035647', 'Daryani Lailasari', 'L', '2403035647@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(47, '2503038169', 'Melinda Jailani', 'P', '2503038169@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(48, '2203034969', 'Vanya Samosir', 'P', '2203034969@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(49, '2503036824', 'Garang Wijayanti', 'L', '2503036824@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(50, '2403032033', 'Malika Simbolon', 'P', '2403032033@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(55, '3202216155', 'Muhammad Fajar Saputra', 'L', 'fajarsaputra1833@gmail.com', 2022, 'Teknik Informatika', '2026-11-09 12:05:30', '2026-11-09 12:05:30');

-- Dumping structure for table siakad.mata_kuliah
CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.mata_kuliah: ~10 rows (approximately)
INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `created_at`, `updated_at`) VALUES
	(1, 'TI101', 'Pengantar Teknologi Informasi', 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(2, 'TI102', 'Algoritma dan Pemrograman', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(3, 'TI103', 'Matematika Diskrit', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(5, 'TI202', 'Desain Web', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(6, 'TI203', 'Pemograman Web', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(7, 'TI204', 'Jaringan Komputer', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(8, 'TI301', 'Rekaya Perangkat Lunak', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(9, 'TI302', 'Pemograman Berorientasi Objek', 3, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(10, 'TI303', 'Sistem Operasi', 2, '2026-10-25 08:38:03', '2026-10-25 08:38:03'),
	(14, 'TI105', 'Bahasa Indonesia', 3, '2026-11-09 12:07:12', '2026-11-09 12:07:24');

-- Dumping structure for table siakad.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.migrations: ~10 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_10_20_104953_add_role_to_users_table', 1),
	(5, '2026_10_20_111625_create_dosen_table', 1),
	(6, '2026_10_20_111651_create_mahasiswa_table', 1),
	(7, '2026_10_20_111702_create_mata_kuliah_table', 1),
	(8, '2026_10_22_132133_create_krs_table', 1),
	(9, '2026_10_22_132151_create_krs_detail_table', 1),
	(10, '2026_10_25_153418_add_jabatan_fungsional_to_dosen_table', 1),
	(14, '2026_10_29_215504_add_last_login_at_to_users_table', 2);

-- Dumping structure for table siakad.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table siakad.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('jVp9wY43OjhGM33DddXFUvdniel1keaEfWFr5EO4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaW9nQWdNOHY0M1Z1ekhvcUJLa2ZzdXF2TUVHNkpXOVBVOE1HbUVaViI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGVuZ2d1bmEiO3M6NToicm91dGUiO3M6MTQ6InBlbmdndW5hLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiMjk3NWE1NDI0NWIzYjg2NzFjM2UyNDYzOTg2OGMxNDBlYjk3MGY5NDg2Njg1ZmE0ODg3YjQxYWEyOTQ4ZTlmZSI7fQ==', 1794226170);

-- Dumping structure for table siakad.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','dosen','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `last_login_at`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator SIAKAD', 'admin@siakad.test', '2026-11-09 08:07:08', NULL, '$2y$12$gIwKupr50V2oxLx0DnK7B.KlwG/mlUTT.focoPCWnhIYAqCKo9Tiq', 'admin', NULL, '2026-10-25 08:38:02', '2026-11-09 08:07:08'),
	(2, 'Dosen Uji', 'dosen@siakad.test', '2026-11-08 08:28:48', NULL, '$2y$12$PVk6ezwmvVJcNH7.R7BPyuSvbhdX04pvDi4GYEXOLYP9pMKgyTGZO', 'dosen', NULL, '2026-10-25 08:38:03', '2026-11-08 08:28:48'),
	(3, 'Mahasiswa Uji', 'mahasiswa@siakad.test', '2026-11-08 08:29:36', NULL, '$2y$12$fk..9vrw8sHpQhchkTIv.OwU185FPIOnZL3rqlFkRRCtIlOCfzPHy', 'mahasiswa', NULL, '2026-10-25 08:38:03', '2026-11-08 08:29:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
