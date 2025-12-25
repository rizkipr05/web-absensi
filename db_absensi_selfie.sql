-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 21 Des 2025 pada 08.13
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi_selfie`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `foto_masuk` varchar(255) DEFAULT NULL,
  `lat_masuk` decimal(10,7) DEFAULT NULL,
  `long_masuk` decimal(10,7) DEFAULT NULL,
  `jarak_masuk_meter` int(11) DEFAULT NULL,
  `status_masuk` enum('VALID','TIDAK_VALID') DEFAULT NULL,
  `catatan_masuk` varchar(255) DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL,
  `foto_pulang` varchar(255) DEFAULT NULL,
  `lat_pulang` decimal(10,7) DEFAULT NULL,
  `long_pulang` decimal(10,7) DEFAULT NULL,
  `jarak_pulang_meter` int(11) DEFAULT NULL,
  `status_pulang` enum('VALID','TIDAK_VALID') DEFAULT NULL,
  `catatan_pulang` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `user_id`, `tanggal`, `jam_masuk`, `foto_masuk`, `lat_masuk`, `long_masuk`, `jarak_masuk_meter`, `status_masuk`, `catatan_masuk`, `jam_pulang`, `foto_pulang`, `lat_pulang`, `long_pulang`, `jarak_pulang_meter`, `status_pulang`, `catatan_pulang`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 4, '2025-12-20', '06:42:28', 'assets/upload/absensi/masuk_4_2025-12-20_1766209348.jpg', -5.3903360, 105.2573696, 1287, 'TIDAK_VALID', NULL, '06:53:19', 'assets/upload/absensi/pulang_4_20251220_1766209999.jpg', -5.3903360, 105.2573696, 1287, 'TIDAK_VALID', NULL, NULL, '2025-12-20 05:42:28', '2025-12-20 05:53:19'),
(2, 4, '2025-09-01', '07:56:12', 'assets/upload/absensi/fake_masuk_4_20250901.jpg', -5.3971206, 105.2668097, 15, 'VALID', 'Fake data', '17:25:56', 'assets/upload/absensi/fake_pulang_4_20250901.jpg', -5.3971223, 105.2667988, 15, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(3, 5, '2025-09-01', '07:59:14', 'assets/upload/absensi/fake_masuk_5_20250901.jpg', -5.3970949, 105.2667782, 30, 'VALID', 'Fake data', '16:52:56', 'assets/upload/absensi/fake_pulang_5_20250901.jpg', -5.3971067, 105.2668092, 20, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(4, 6, '2025-09-01', '07:54:06', 'assets/upload/absensi/fake_masuk_6_20250901.jpg', -5.3970886, 105.2667765, 53, 'VALID', 'Fake data', '17:15:34', 'assets/upload/absensi/fake_pulang_6_20250901.jpg', -5.3970807, 105.2667828, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(5, 7, '2025-09-01', '07:35:23', 'assets/upload/absensi/fake_masuk_7_20250901.jpg', -5.3971126, 105.2668189, 37, 'VALID', 'Fake data', '17:06:49', 'assets/upload/absensi/fake_pulang_7_20250901.jpg', -5.3971191, 105.2668127, 25, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(6, 8, '2025-09-01', '08:05:39', 'assets/upload/absensi/fake_masuk_8_20250901.jpg', -5.3970885, 105.2667889, 14, 'VALID', 'Fake data', '16:37:58', 'assets/upload/absensi/fake_pulang_8_20250901.jpg', -5.3971207, 105.2667765, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(7, 9, '2025-09-01', '07:46:43', 'assets/upload/absensi/fake_masuk_9_20250901.jpg', -5.3971159, 105.2668146, 25, 'VALID', 'Fake data', '17:11:22', 'assets/upload/absensi/fake_pulang_9_20250901.jpg', -5.3971145, 105.2668241, 18, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(8, 10, '2025-09-01', '07:50:09', 'assets/upload/absensi/fake_masuk_10_20250901.jpg', -5.3971048, 105.2668086, 12, 'VALID', 'Fake data', '17:14:21', 'assets/upload/absensi/fake_pulang_10_20250901.jpg', -5.3971128, 105.2668249, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(9, 11, '2025-09-01', '07:43:27', 'assets/upload/absensi/fake_masuk_11_20250901.jpg', -5.3970890, 105.2668103, 23, 'VALID', 'Fake data', '17:12:48', 'assets/upload/absensi/fake_pulang_11_20250901.jpg', -5.3971015, 105.2667853, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(10, 12, '2025-09-01', '07:51:24', 'assets/upload/absensi/fake_masuk_12_20250901.jpg', -5.3970988, 105.2667845, 23, 'VALID', 'Fake data', '16:49:45', 'assets/upload/absensi/fake_pulang_12_20250901.jpg', -5.3970996, 105.2668024, 15, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(11, 13, '2025-09-01', '07:49:37', 'assets/upload/absensi/fake_masuk_13_20250901.jpg', -5.3970983, 105.2667930, 14, 'VALID', 'Fake data', '17:24:31', 'assets/upload/absensi/fake_pulang_13_20250901.jpg', -5.3970774, 105.2667765, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(12, 14, '2025-09-01', '07:47:33', 'assets/upload/absensi/fake_masuk_14_20250901.jpg', -5.3971219, 105.2667822, 31, 'VALID', 'Fake data', '16:43:06', 'assets/upload/absensi/fake_pulang_14_20250901.jpg', -5.3970999, 105.2668180, 44, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(13, 15, '2025-09-01', '07:46:04', 'assets/upload/absensi/fake_masuk_15_20250901.jpg', -5.3971037, 105.2667777, 54, 'VALID', 'Fake data', '17:19:17', 'assets/upload/absensi/fake_pulang_15_20250901.jpg', -5.3971192, 105.2667809, 16, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(14, 16, '2025-09-01', '08:07:45', 'assets/upload/absensi/fake_masuk_16_20250901.jpg', -5.3971010, 105.2668192, 54, 'VALID', 'Fake data', '16:45:18', 'assets/upload/absensi/fake_pulang_16_20250901.jpg', -5.3971085, 105.2668194, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(15, 4, '2025-09-02', '07:56:27', 'assets/upload/absensi/fake_masuk_4_20250902.jpg', -5.3970956, 105.2667837, 10, 'VALID', 'Fake data', '17:29:44', 'assets/upload/absensi/fake_pulang_4_20250902.jpg', -5.3970915, 105.2667931, 45, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(16, 5, '2025-09-02', '08:11:45', 'assets/upload/absensi/fake_masuk_5_20250902.jpg', -5.3971135, 105.2667934, 12, 'VALID', 'Fake data', '17:09:11', 'assets/upload/absensi/fake_pulang_5_20250902.jpg', -5.3970845, 105.2667796, 6, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(17, 6, '2025-09-02', '08:09:39', 'assets/upload/absensi/fake_masuk_6_20250902.jpg', -5.3971095, 105.2668204, 35, 'VALID', 'Fake data', '16:49:32', 'assets/upload/absensi/fake_pulang_6_20250902.jpg', -5.3970851, 105.2667758, 39, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(18, 7, '2025-09-02', '07:46:43', 'assets/upload/absensi/fake_masuk_7_20250902.jpg', -5.3970846, 105.2668210, 13, 'VALID', 'Fake data', '16:37:47', 'assets/upload/absensi/fake_pulang_7_20250902.jpg', -5.3971192, 105.2667844, 34, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(19, 8, '2025-09-02', '07:47:43', 'assets/upload/absensi/fake_masuk_8_20250902.jpg', -5.3971152, 105.2668150, 25, 'VALID', 'Fake data', '17:08:32', 'assets/upload/absensi/fake_pulang_8_20250902.jpg', -5.3970756, 105.2667756, 9, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(20, 9, '2025-09-02', '07:50:32', 'assets/upload/absensi/fake_masuk_9_20250902.jpg', -5.3970757, 105.2668028, 46, 'VALID', 'Fake data', '16:58:27', 'assets/upload/absensi/fake_pulang_9_20250902.jpg', -5.3970808, 105.2668249, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(21, 10, '2025-09-02', '08:01:50', 'assets/upload/absensi/fake_masuk_10_20250902.jpg', -5.3970992, 105.2667978, 41, 'VALID', 'Fake data', '16:48:35', 'assets/upload/absensi/fake_pulang_10_20250902.jpg', -5.3971080, 105.2668137, 47, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(22, 11, '2025-09-02', '08:11:30', 'assets/upload/absensi/fake_masuk_11_20250902.jpg', -5.3971217, 105.2668030, 34, 'VALID', 'Fake data', '16:49:15', 'assets/upload/absensi/fake_pulang_11_20250902.jpg', -5.3970847, 105.2667782, 50, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(23, 12, '2025-09-02', '07:45:07', 'assets/upload/absensi/fake_masuk_12_20250902.jpg', -5.3970769, 105.2668153, 11, 'VALID', 'Fake data', '16:46:55', 'assets/upload/absensi/fake_pulang_12_20250902.jpg', -5.3970754, 105.2667804, 33, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(24, 13, '2025-09-02', '07:53:53', 'assets/upload/absensi/fake_masuk_13_20250902.jpg', -5.3970780, 105.2667802, 40, 'VALID', 'Fake data', '16:42:36', 'assets/upload/absensi/fake_pulang_13_20250902.jpg', -5.3970782, 105.2667776, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(25, 14, '2025-09-02', '07:34:27', 'assets/upload/absensi/fake_masuk_14_20250902.jpg', -5.3971179, 105.2667956, 36, 'VALID', 'Fake data', '17:26:47', 'assets/upload/absensi/fake_pulang_14_20250902.jpg', -5.3970839, 105.2667885, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(26, 15, '2025-09-02', '07:57:10', 'assets/upload/absensi/fake_masuk_15_20250902.jpg', -5.3971064, 105.2667775, 11, 'VALID', 'Fake data', '16:59:44', 'assets/upload/absensi/fake_pulang_15_20250902.jpg', -5.3971204, 105.2668238, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(27, 16, '2025-09-02', '07:34:29', 'assets/upload/absensi/fake_masuk_16_20250902.jpg', -5.3970909, 105.2667804, 29, 'VALID', 'Fake data', '16:38:22', 'assets/upload/absensi/fake_pulang_16_20250902.jpg', -5.3971139, 105.2668093, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(28, 4, '2025-09-03', '08:05:24', 'assets/upload/absensi/fake_masuk_4_20250903.jpg', -5.3970937, 105.2668135, 53, 'VALID', 'Fake data', '17:01:54', 'assets/upload/absensi/fake_pulang_4_20250903.jpg', -5.3970872, 105.2667842, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(29, 5, '2025-09-03', '08:02:38', 'assets/upload/absensi/fake_masuk_5_20250903.jpg', -5.3970921, 105.2667808, 35, 'VALID', 'Fake data', '17:09:58', 'assets/upload/absensi/fake_pulang_5_20250903.jpg', -5.3970988, 105.2668060, 31, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(30, 6, '2025-09-03', '08:05:14', 'assets/upload/absensi/fake_masuk_6_20250903.jpg', -5.3971085, 105.2667900, 30, 'VALID', 'Fake data', '17:10:08', 'assets/upload/absensi/fake_pulang_6_20250903.jpg', -5.3970849, 105.2667751, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(31, 7, '2025-09-03', '07:30:15', 'assets/upload/absensi/fake_masuk_7_20250903.jpg', -5.3971139, 105.2667798, 45, 'VALID', 'Fake data', '17:16:05', 'assets/upload/absensi/fake_pulang_7_20250903.jpg', -5.3971046, 105.2668117, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(32, 8, '2025-09-03', '07:31:07', 'assets/upload/absensi/fake_masuk_8_20250903.jpg', -5.3970855, 105.2668185, 54, 'VALID', 'Fake data', '16:49:13', 'assets/upload/absensi/fake_pulang_8_20250903.jpg', -5.3970929, 105.2667875, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(33, 9, '2025-09-03', '08:09:10', 'assets/upload/absensi/fake_masuk_9_20250903.jpg', -5.3971060, 105.2667896, 20, 'VALID', 'Fake data', '17:12:24', 'assets/upload/absensi/fake_pulang_9_20250903.jpg', -5.3970958, 105.2668152, 18, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(34, 10, '2025-09-03', '08:10:33', 'assets/upload/absensi/fake_masuk_10_20250903.jpg', -5.3970890, 105.2668198, 20, 'VALID', 'Fake data', '17:24:03', 'assets/upload/absensi/fake_pulang_10_20250903.jpg', -5.3970974, 105.2667781, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(35, 11, '2025-09-03', '07:32:46', 'assets/upload/absensi/fake_masuk_11_20250903.jpg', -5.3971070, 105.2668058, 5, 'VALID', 'Fake data', '16:39:35', 'assets/upload/absensi/fake_pulang_11_20250903.jpg', -5.3970853, 105.2667995, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(36, 12, '2025-09-03', '08:09:40', 'assets/upload/absensi/fake_masuk_12_20250903.jpg', -5.3971152, 105.2667917, 9, 'VALID', 'Fake data', '16:54:16', 'assets/upload/absensi/fake_pulang_12_20250903.jpg', -5.3970860, 105.2668091, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(37, 13, '2025-09-03', '07:44:38', 'assets/upload/absensi/fake_masuk_13_20250903.jpg', -5.3971048, 105.2667771, 54, 'VALID', 'Fake data', '17:21:58', 'assets/upload/absensi/fake_pulang_13_20250903.jpg', -5.3971082, 105.2667790, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(38, 14, '2025-09-03', '08:02:12', 'assets/upload/absensi/fake_masuk_14_20250903.jpg', -5.3971047, 105.2668193, 15, 'VALID', 'Fake data', '16:52:34', 'assets/upload/absensi/fake_pulang_14_20250903.jpg', -5.3971119, 105.2667841, 11, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(39, 15, '2025-09-03', '07:32:32', 'assets/upload/absensi/fake_masuk_15_20250903.jpg', -5.3970789, 105.2667971, 27, 'VALID', 'Fake data', '17:23:53', 'assets/upload/absensi/fake_pulang_15_20250903.jpg', -5.3971172, 105.2667791, 52, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(40, 16, '2025-09-03', '07:51:24', 'assets/upload/absensi/fake_masuk_16_20250903.jpg', -5.3970977, 105.2667901, 48, 'VALID', 'Fake data', '16:56:30', 'assets/upload/absensi/fake_pulang_16_20250903.jpg', -5.3970949, 105.2668092, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(41, 4, '2025-09-04', '07:30:29', 'assets/upload/absensi/fake_masuk_4_20250904.jpg', -5.3971141, 105.2667777, 36, 'VALID', 'Fake data', '17:26:33', 'assets/upload/absensi/fake_pulang_4_20250904.jpg', -5.3970825, 105.2667959, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(42, 5, '2025-09-04', '07:51:22', 'assets/upload/absensi/fake_masuk_5_20250904.jpg', -5.3970882, 105.2667876, 7, 'VALID', 'Fake data', '17:01:57', 'assets/upload/absensi/fake_pulang_5_20250904.jpg', -5.3971006, 105.2668171, 42, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(43, 6, '2025-09-04', '07:38:53', 'assets/upload/absensi/fake_masuk_6_20250904.jpg', -5.3970873, 105.2667838, 36, 'VALID', 'Fake data', '17:05:09', 'assets/upload/absensi/fake_pulang_6_20250904.jpg', -5.3971220, 105.2668019, 30, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(44, 7, '2025-09-04', '08:13:31', 'assets/upload/absensi/fake_masuk_7_20250904.jpg', -5.3971107, 105.2668014, 44, 'VALID', 'Fake data', '16:49:05', 'assets/upload/absensi/fake_pulang_7_20250904.jpg', -5.3971125, 105.2667898, 41, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(45, 8, '2025-09-04', '08:04:14', 'assets/upload/absensi/fake_masuk_8_20250904.jpg', -5.3970942, 105.2668146, 10, 'VALID', 'Fake data', '16:42:48', 'assets/upload/absensi/fake_pulang_8_20250904.jpg', -5.3970894, 105.2668212, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(46, 9, '2025-09-04', '07:57:59', 'assets/upload/absensi/fake_masuk_9_20250904.jpg', -5.3970912, 105.2668004, 30, 'VALID', 'Fake data', '16:34:10', 'assets/upload/absensi/fake_pulang_9_20250904.jpg', -5.3970855, 105.2668122, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(47, 10, '2025-09-04', '07:53:26', 'assets/upload/absensi/fake_masuk_10_20250904.jpg', -5.3970974, 105.2667848, 21, 'VALID', 'Fake data', '16:32:45', 'assets/upload/absensi/fake_pulang_10_20250904.jpg', -5.3971126, 105.2667803, 44, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(48, 11, '2025-09-04', '07:56:32', 'assets/upload/absensi/fake_masuk_11_20250904.jpg', -5.3970948, 105.2667877, 27, 'VALID', 'Fake data', '17:01:10', 'assets/upload/absensi/fake_pulang_11_20250904.jpg', -5.3971136, 105.2668043, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(49, 12, '2025-09-04', '07:50:23', 'assets/upload/absensi/fake_masuk_12_20250904.jpg', -5.3970980, 105.2667919, 8, 'VALID', 'Fake data', '16:51:35', 'assets/upload/absensi/fake_pulang_12_20250904.jpg', -5.3970963, 105.2668145, 16, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(50, 13, '2025-09-04', '08:04:08', 'assets/upload/absensi/fake_masuk_13_20250904.jpg', -5.3971191, 105.2667905, 14, 'VALID', 'Fake data', '16:33:34', 'assets/upload/absensi/fake_pulang_13_20250904.jpg', -5.3970898, 105.2667921, 34, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(51, 14, '2025-09-04', '08:13:27', 'assets/upload/absensi/fake_masuk_14_20250904.jpg', -5.3971233, 105.2667885, 17, 'VALID', 'Fake data', '16:55:41', 'assets/upload/absensi/fake_pulang_14_20250904.jpg', -5.3971051, 105.2668105, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(52, 15, '2025-09-04', '07:58:42', 'assets/upload/absensi/fake_masuk_15_20250904.jpg', -5.3971185, 105.2668116, 18, 'VALID', 'Fake data', '16:38:57', 'assets/upload/absensi/fake_pulang_15_20250904.jpg', -5.3970780, 105.2667877, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(53, 16, '2025-09-04', '07:52:26', 'assets/upload/absensi/fake_masuk_16_20250904.jpg', -5.3971182, 105.2667842, 30, 'VALID', 'Fake data', '17:29:34', 'assets/upload/absensi/fake_pulang_16_20250904.jpg', -5.3971031, 105.2667858, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(54, 4, '2025-09-05', '07:37:41', 'assets/upload/absensi/fake_masuk_4_20250905.jpg', -5.3970969, 105.2667900, 45, 'VALID', 'Fake data', '16:39:35', 'assets/upload/absensi/fake_pulang_4_20250905.jpg', -5.3971068, 105.2667920, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(55, 5, '2025-09-05', '07:31:25', 'assets/upload/absensi/fake_masuk_5_20250905.jpg', -5.3971087, 105.2668019, 40, 'VALID', 'Fake data', '17:26:54', 'assets/upload/absensi/fake_pulang_5_20250905.jpg', -5.3970948, 105.2667837, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(56, 6, '2025-09-05', '08:05:10', 'assets/upload/absensi/fake_masuk_6_20250905.jpg', -5.3970887, 105.2667890, 16, 'VALID', 'Fake data', '16:47:30', 'assets/upload/absensi/fake_pulang_6_20250905.jpg', -5.3970860, 105.2667761, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(57, 7, '2025-09-05', '08:05:25', 'assets/upload/absensi/fake_masuk_7_20250905.jpg', -5.3970938, 105.2668130, 51, 'VALID', 'Fake data', '16:51:53', 'assets/upload/absensi/fake_pulang_7_20250905.jpg', -5.3971231, 105.2667795, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(58, 8, '2025-09-05', '07:49:14', 'assets/upload/absensi/fake_masuk_8_20250905.jpg', -5.3971190, 105.2667908, 16, 'VALID', 'Fake data', '16:39:39', 'assets/upload/absensi/fake_pulang_8_20250905.jpg', -5.3971181, 105.2667855, 36, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(59, 9, '2025-09-05', '07:54:31', 'assets/upload/absensi/fake_masuk_9_20250905.jpg', -5.3970840, 105.2667982, 48, 'VALID', 'Fake data', '17:25:30', 'assets/upload/absensi/fake_pulang_9_20250905.jpg', -5.3971233, 105.2667948, 48, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(60, 10, '2025-09-05', '07:39:22', 'assets/upload/absensi/fake_masuk_10_20250905.jpg', -5.3971049, 105.2667943, 41, 'VALID', 'Fake data', '16:58:38', 'assets/upload/absensi/fake_pulang_10_20250905.jpg', -5.3971148, 105.2668043, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(61, 11, '2025-09-05', '08:08:20', 'assets/upload/absensi/fake_masuk_11_20250905.jpg', -5.3971104, 105.2668203, 37, 'VALID', 'Fake data', '17:03:04', 'assets/upload/absensi/fake_pulang_11_20250905.jpg', -5.3970853, 105.2667909, 15, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(62, 12, '2025-09-05', '07:33:07', 'assets/upload/absensi/fake_masuk_12_20250905.jpg', -5.3970883, 105.2667981, 10, 'VALID', 'Fake data', '16:39:41', 'assets/upload/absensi/fake_pulang_12_20250905.jpg', -5.3971011, 105.2668205, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(63, 13, '2025-09-05', '08:06:58', 'assets/upload/absensi/fake_masuk_13_20250905.jpg', -5.3970860, 105.2667965, 45, 'VALID', 'Fake data', '17:16:49', 'assets/upload/absensi/fake_pulang_13_20250905.jpg', -5.3971020, 105.2668229, 25, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(64, 14, '2025-09-05', '07:37:19', 'assets/upload/absensi/fake_masuk_14_20250905.jpg', -5.3970954, 105.2667988, 34, 'VALID', 'Fake data', '17:04:16', 'assets/upload/absensi/fake_pulang_14_20250905.jpg', -5.3971221, 105.2668038, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(65, 15, '2025-09-05', '08:06:21', 'assets/upload/absensi/fake_masuk_15_20250905.jpg', -5.3970791, 105.2667834, 9, 'VALID', 'Fake data', '17:24:41', 'assets/upload/absensi/fake_pulang_15_20250905.jpg', -5.3971096, 105.2668155, 11, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(66, 16, '2025-09-05', '07:37:47', 'assets/upload/absensi/fake_masuk_16_20250905.jpg', -5.3970998, 105.2667752, 30, 'VALID', 'Fake data', '17:01:46', 'assets/upload/absensi/fake_pulang_16_20250905.jpg', -5.3971189, 105.2667762, 42, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(67, 4, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(68, 5, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(69, 6, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(70, 7, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(71, 8, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(72, 9, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(73, 10, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(74, 11, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(75, 12, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(76, 13, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(77, 14, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(78, 15, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(79, 16, '2025-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(80, 4, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(81, 5, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(82, 6, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(83, 7, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(84, 8, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(85, 9, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(86, 10, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(87, 11, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(88, 12, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(89, 13, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(90, 14, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(91, 15, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(92, 16, '2025-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(93, 4, '2025-09-08', '08:00:15', 'assets/upload/absensi/fake_masuk_4_20250908.jpg', -5.3971192, 105.2668032, 28, 'VALID', 'Fake data', '17:10:44', 'assets/upload/absensi/fake_pulang_4_20250908.jpg', -5.3970764, 105.2668160, 14, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(94, 5, '2025-09-08', '07:50:57', 'assets/upload/absensi/fake_masuk_5_20250908.jpg', -5.3970864, 105.2667984, 5, 'VALID', 'Fake data', '17:11:28', 'assets/upload/absensi/fake_pulang_5_20250908.jpg', -5.3971050, 105.2668214, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(95, 6, '2025-09-08', '07:48:01', 'assets/upload/absensi/fake_masuk_6_20250908.jpg', -5.3970903, 105.2667883, 17, 'VALID', 'Fake data', '16:56:05', 'assets/upload/absensi/fake_pulang_6_20250908.jpg', -5.3971032, 105.2668187, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(96, 7, '2025-09-08', '08:01:09', 'assets/upload/absensi/fake_masuk_7_20250908.jpg', -5.3971113, 105.2667897, 37, 'VALID', 'Fake data', '16:50:13', 'assets/upload/absensi/fake_pulang_7_20250908.jpg', -5.3970872, 105.2668134, 33, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(97, 8, '2025-09-08', '07:55:29', 'assets/upload/absensi/fake_masuk_8_20250908.jpg', -5.3971196, 105.2668172, 49, 'VALID', 'Fake data', '17:26:28', 'assets/upload/absensi/fake_pulang_8_20250908.jpg', -5.3971239, 105.2667894, 23, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(98, 9, '2025-09-08', '07:30:08', 'assets/upload/absensi/fake_masuk_9_20250908.jpg', -5.3970803, 105.2667982, 36, 'VALID', 'Fake data', '17:18:09', 'assets/upload/absensi/fake_pulang_9_20250908.jpg', -5.3971203, 105.2667783, 7, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(99, 10, '2025-09-08', '07:31:46', 'assets/upload/absensi/fake_masuk_10_20250908.jpg', -5.3971223, 105.2667825, 34, 'VALID', 'Fake data', '16:59:16', 'assets/upload/absensi/fake_pulang_10_20250908.jpg', -5.3970911, 105.2668212, 34, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(100, 11, '2025-09-08', '07:38:08', 'assets/upload/absensi/fake_masuk_11_20250908.jpg', -5.3971185, 105.2667806, 13, 'VALID', 'Fake data', '16:59:19', 'assets/upload/absensi/fake_pulang_11_20250908.jpg', -5.3970775, 105.2667891, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(101, 12, '2025-09-08', '08:12:44', 'assets/upload/absensi/fake_masuk_12_20250908.jpg', -5.3971213, 105.2668008, 22, 'VALID', 'Fake data', '16:44:33', 'assets/upload/absensi/fake_pulang_12_20250908.jpg', -5.3971180, 105.2668235, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(102, 13, '2025-09-08', '07:41:17', 'assets/upload/absensi/fake_masuk_13_20250908.jpg', -5.3970771, 105.2667769, 20, 'VALID', 'Fake data', '16:56:54', 'assets/upload/absensi/fake_pulang_13_20250908.jpg', -5.3971097, 105.2667842, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(103, 14, '2025-09-08', '07:51:15', 'assets/upload/absensi/fake_masuk_14_20250908.jpg', -5.3971077, 105.2667908, 32, 'VALID', 'Fake data', '17:15:10', 'assets/upload/absensi/fake_pulang_14_20250908.jpg', -5.3971178, 105.2667979, 48, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(104, 15, '2025-09-08', '08:12:30', 'assets/upload/absensi/fake_masuk_15_20250908.jpg', -5.3971185, 105.2668158, 39, 'VALID', 'Fake data', '17:29:28', 'assets/upload/absensi/fake_pulang_15_20250908.jpg', -5.3970803, 105.2667998, 45, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(105, 16, '2025-09-08', '07:53:00', 'assets/upload/absensi/fake_masuk_16_20250908.jpg', -5.3971172, 105.2667874, 43, 'VALID', 'Fake data', '16:35:57', 'assets/upload/absensi/fake_pulang_16_20250908.jpg', -5.3971154, 105.2668080, 41, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(106, 4, '2025-09-09', '07:58:47', 'assets/upload/absensi/fake_masuk_4_20250909.jpg', -5.3971236, 105.2667859, 5, 'VALID', 'Fake data', '16:53:22', 'assets/upload/absensi/fake_pulang_4_20250909.jpg', -5.3970790, 105.2667968, 25, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(107, 5, '2025-09-09', '08:05:12', 'assets/upload/absensi/fake_masuk_5_20250909.jpg', -5.3970921, 105.2668221, 41, 'VALID', 'Fake data', '17:22:03', 'assets/upload/absensi/fake_pulang_5_20250909.jpg', -5.3971190, 105.2667750, 36, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(108, 6, '2025-09-09', '07:38:55', 'assets/upload/absensi/fake_masuk_6_20250909.jpg', -5.3971214, 105.2668133, 35, 'VALID', 'Fake data', '17:15:24', 'assets/upload/absensi/fake_pulang_6_20250909.jpg', -5.3970774, 105.2667996, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(109, 7, '2025-09-09', '07:54:29', 'assets/upload/absensi/fake_masuk_7_20250909.jpg', -5.3970796, 105.2668206, 46, 'VALID', 'Fake data', '16:55:25', 'assets/upload/absensi/fake_pulang_7_20250909.jpg', -5.3970938, 105.2668173, 23, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(110, 8, '2025-09-09', '07:41:47', 'assets/upload/absensi/fake_masuk_8_20250909.jpg', -5.3971135, 105.2667933, 11, 'VALID', 'Fake data', '17:05:21', 'assets/upload/absensi/fake_pulang_8_20250909.jpg', -5.3970982, 105.2668204, 51, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(111, 9, '2025-09-09', '08:12:20', 'assets/upload/absensi/fake_masuk_9_20250909.jpg', -5.3970797, 105.2668106, 46, 'VALID', 'Fake data', '16:32:49', 'assets/upload/absensi/fake_pulang_9_20250909.jpg', -5.3970887, 105.2667995, 18, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(112, 10, '2025-09-09', '08:09:28', 'assets/upload/absensi/fake_masuk_10_20250909.jpg', -5.3970961, 105.2667880, 33, 'VALID', 'Fake data', '16:33:00', 'assets/upload/absensi/fake_pulang_10_20250909.jpg', -5.3970974, 105.2668055, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(113, 11, '2025-09-09', '07:35:40', 'assets/upload/absensi/fake_masuk_11_20250909.jpg', -5.3971021, 105.2668208, 15, 'VALID', 'Fake data', '16:45:42', 'assets/upload/absensi/fake_pulang_11_20250909.jpg', -5.3970898, 105.2668117, 33, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(114, 12, '2025-09-09', '07:57:05', 'assets/upload/absensi/fake_masuk_12_20250909.jpg', -5.3971087, 105.2668163, 12, 'VALID', 'Fake data', '16:47:24', 'assets/upload/absensi/fake_pulang_12_20250909.jpg', -5.3970756, 105.2667786, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(115, 13, '2025-09-09', '08:03:52', 'assets/upload/absensi/fake_masuk_13_20250909.jpg', -5.3970958, 105.2668078, 31, 'VALID', 'Fake data', '17:12:24', 'assets/upload/absensi/fake_pulang_13_20250909.jpg', -5.3970786, 105.2668009, 45, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(116, 14, '2025-09-09', '07:50:48', 'assets/upload/absensi/fake_masuk_14_20250909.jpg', -5.3970798, 105.2667817, 52, 'VALID', 'Fake data', '16:52:47', 'assets/upload/absensi/fake_pulang_14_20250909.jpg', -5.3971235, 105.2667757, 53, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(117, 15, '2025-09-09', '08:07:20', 'assets/upload/absensi/fake_masuk_15_20250909.jpg', -5.3971136, 105.2668075, 33, 'VALID', 'Fake data', '17:21:46', 'assets/upload/absensi/fake_pulang_15_20250909.jpg', -5.3970936, 105.2668027, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(118, 16, '2025-09-09', '08:03:32', 'assets/upload/absensi/fake_masuk_16_20250909.jpg', -5.3971208, 105.2667841, 38, 'VALID', 'Fake data', '17:15:26', 'assets/upload/absensi/fake_pulang_16_20250909.jpg', -5.3970848, 105.2668124, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(119, 4, '2025-09-10', '07:47:35', 'assets/upload/absensi/fake_masuk_4_20250910.jpg', -5.3970763, 105.2668099, 33, 'VALID', 'Fake data', '17:14:29', 'assets/upload/absensi/fake_pulang_4_20250910.jpg', -5.3971247, 105.2668153, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(120, 5, '2025-09-10', '07:59:16', 'assets/upload/absensi/fake_masuk_5_20250910.jpg', -5.3971145, 105.2667800, 48, 'VALID', 'Fake data', '16:32:57', 'assets/upload/absensi/fake_pulang_5_20250910.jpg', -5.3970932, 105.2667767, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(121, 6, '2025-09-10', '07:38:56', 'assets/upload/absensi/fake_masuk_6_20250910.jpg', -5.3971144, 105.2667984, 40, 'VALID', 'Fake data', '16:36:17', 'assets/upload/absensi/fake_pulang_6_20250910.jpg', -5.3971040, 105.2668141, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(122, 7, '2025-09-10', '08:11:46', 'assets/upload/absensi/fake_masuk_7_20250910.jpg', -5.3970912, 105.2668047, 52, 'VALID', 'Fake data', '17:26:16', 'assets/upload/absensi/fake_pulang_7_20250910.jpg', -5.3970822, 105.2667985, 44, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(123, 8, '2025-09-10', '07:52:09', 'assets/upload/absensi/fake_masuk_8_20250910.jpg', -5.3971190, 105.2667812, 17, 'VALID', 'Fake data', '17:24:49', 'assets/upload/absensi/fake_pulang_8_20250910.jpg', -5.3970851, 105.2667874, 47, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(124, 9, '2025-09-10', '07:52:42', 'assets/upload/absensi/fake_masuk_9_20250910.jpg', -5.3970763, 105.2667926, 46, 'VALID', 'Fake data', '16:38:21', 'assets/upload/absensi/fake_pulang_9_20250910.jpg', -5.3971160, 105.2667992, 48, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(125, 10, '2025-09-10', '08:11:32', 'assets/upload/absensi/fake_masuk_10_20250910.jpg', -5.3970754, 105.2667847, 54, 'VALID', 'Fake data', '16:52:13', 'assets/upload/absensi/fake_pulang_10_20250910.jpg', -5.3970809, 105.2667897, 46, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(126, 11, '2025-09-10', '07:42:11', 'assets/upload/absensi/fake_masuk_11_20250910.jpg', -5.3970819, 105.2667998, 49, 'VALID', 'Fake data', '17:29:02', 'assets/upload/absensi/fake_pulang_11_20250910.jpg', -5.3971131, 105.2667867, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(127, 12, '2025-09-10', '07:56:39', 'assets/upload/absensi/fake_masuk_12_20250910.jpg', -5.3970957, 105.2667824, 54, 'VALID', 'Fake data', '16:58:45', 'assets/upload/absensi/fake_pulang_12_20250910.jpg', -5.3971028, 105.2668139, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(128, 13, '2025-09-10', '07:50:23', 'assets/upload/absensi/fake_masuk_13_20250910.jpg', -5.3970953, 105.2668058, 19, 'VALID', 'Fake data', '17:06:47', 'assets/upload/absensi/fake_pulang_13_20250910.jpg', -5.3971155, 105.2667807, 54, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(129, 14, '2025-09-10', '07:58:56', 'assets/upload/absensi/fake_masuk_14_20250910.jpg', -5.3971138, 105.2667846, 19, 'VALID', 'Fake data', '17:21:50', 'assets/upload/absensi/fake_pulang_14_20250910.jpg', -5.3971022, 105.2668093, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(130, 15, '2025-09-10', '07:41:49', 'assets/upload/absensi/fake_masuk_15_20250910.jpg', -5.3971190, 105.2668157, 40, 'VALID', 'Fake data', '16:35:45', 'assets/upload/absensi/fake_pulang_15_20250910.jpg', -5.3971071, 105.2668000, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(131, 16, '2025-09-10', '07:58:30', 'assets/upload/absensi/fake_masuk_16_20250910.jpg', -5.3970806, 105.2668021, 7, 'VALID', 'Fake data', '17:05:01', 'assets/upload/absensi/fake_pulang_16_20250910.jpg', -5.3970853, 105.2667859, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(132, 4, '2025-09-11', '08:10:29', 'assets/upload/absensi/fake_masuk_4_20250911.jpg', -5.3971067, 105.2667815, 32, 'VALID', 'Fake data', '16:51:28', 'assets/upload/absensi/fake_pulang_4_20250911.jpg', -5.3971179, 105.2668070, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(133, 5, '2025-09-11', '08:11:25', 'assets/upload/absensi/fake_masuk_5_20250911.jpg', -5.3971100, 105.2668121, 45, 'VALID', 'Fake data', '17:18:18', 'assets/upload/absensi/fake_pulang_5_20250911.jpg', -5.3970946, 105.2668061, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(134, 6, '2025-09-11', '07:56:33', 'assets/upload/absensi/fake_masuk_6_20250911.jpg', -5.3971212, 105.2668054, 45, 'VALID', 'Fake data', '16:45:15', 'assets/upload/absensi/fake_pulang_6_20250911.jpg', -5.3970838, 105.2667927, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(135, 7, '2025-09-11', '07:49:22', 'assets/upload/absensi/fake_masuk_7_20250911.jpg', -5.3971121, 105.2668248, 15, 'VALID', 'Fake data', '16:32:23', 'assets/upload/absensi/fake_pulang_7_20250911.jpg', -5.3970958, 105.2668149, 16, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(136, 8, '2025-09-11', '08:06:08', 'assets/upload/absensi/fake_masuk_8_20250911.jpg', -5.3971101, 105.2667791, 30, 'VALID', 'Fake data', '16:48:48', 'assets/upload/absensi/fake_pulang_8_20250911.jpg', -5.3971234, 105.2667861, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(137, 9, '2025-09-11', '07:48:29', 'assets/upload/absensi/fake_masuk_9_20250911.jpg', -5.3971246, 105.2668153, 5, 'VALID', 'Fake data', '17:07:38', 'assets/upload/absensi/fake_pulang_9_20250911.jpg', -5.3971196, 105.2668081, 53, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(138, 10, '2025-09-11', '08:11:05', 'assets/upload/absensi/fake_masuk_10_20250911.jpg', -5.3970936, 105.2667950, 10, 'VALID', 'Fake data', '16:52:56', 'assets/upload/absensi/fake_pulang_10_20250911.jpg', -5.3970969, 105.2668083, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(139, 11, '2025-09-11', '07:40:10', 'assets/upload/absensi/fake_masuk_11_20250911.jpg', -5.3971153, 105.2667896, 49, 'VALID', 'Fake data', '17:01:33', 'assets/upload/absensi/fake_pulang_11_20250911.jpg', -5.3970756, 105.2667929, 46, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(140, 12, '2025-09-11', '07:33:13', 'assets/upload/absensi/fake_masuk_12_20250911.jpg', -5.3970815, 105.2667819, 8, 'VALID', 'Fake data', '17:28:03', 'assets/upload/absensi/fake_pulang_12_20250911.jpg', -5.3970945, 105.2667825, 50, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(141, 13, '2025-09-11', '07:36:16', 'assets/upload/absensi/fake_masuk_13_20250911.jpg', -5.3970778, 105.2667900, 38, 'VALID', 'Fake data', '16:57:09', 'assets/upload/absensi/fake_pulang_13_20250911.jpg', -5.3971124, 105.2668199, 41, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(142, 14, '2025-09-11', '08:14:35', 'assets/upload/absensi/fake_masuk_14_20250911.jpg', -5.3970878, 105.2668123, 30, 'VALID', 'Fake data', '16:46:10', 'assets/upload/absensi/fake_pulang_14_20250911.jpg', -5.3970829, 105.2667951, 29, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(143, 15, '2025-09-11', '07:38:53', 'assets/upload/absensi/fake_masuk_15_20250911.jpg', -5.3970976, 105.2667822, 8, 'VALID', 'Fake data', '17:27:11', 'assets/upload/absensi/fake_pulang_15_20250911.jpg', -5.3970982, 105.2668159, 29, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(144, 16, '2025-09-11', '08:12:57', 'assets/upload/absensi/fake_masuk_16_20250911.jpg', -5.3971085, 105.2668141, 51, 'VALID', 'Fake data', '16:46:43', 'assets/upload/absensi/fake_pulang_16_20250911.jpg', -5.3970941, 105.2667876, 25, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(145, 4, '2025-09-12', '07:42:09', 'assets/upload/absensi/fake_masuk_4_20250912.jpg', -5.3971182, 105.2668186, 52, 'VALID', 'Fake data', '16:38:23', 'assets/upload/absensi/fake_pulang_4_20250912.jpg', -5.3970827, 105.2668154, 30, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(146, 5, '2025-09-12', '07:34:53', 'assets/upload/absensi/fake_masuk_5_20250912.jpg', -5.3971239, 105.2668144, 48, 'VALID', 'Fake data', '17:29:18', 'assets/upload/absensi/fake_pulang_5_20250912.jpg', -5.3971084, 105.2668095, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(147, 6, '2025-09-12', '07:39:52', 'assets/upload/absensi/fake_masuk_6_20250912.jpg', -5.3970888, 105.2668230, 36, 'VALID', 'Fake data', '16:45:26', 'assets/upload/absensi/fake_pulang_6_20250912.jpg', -5.3971047, 105.2667878, 7, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(148, 7, '2025-09-12', '07:53:53', 'assets/upload/absensi/fake_masuk_7_20250912.jpg', -5.3971012, 105.2668145, 30, 'VALID', 'Fake data', '16:43:31', 'assets/upload/absensi/fake_pulang_7_20250912.jpg', -5.3970965, 105.2667839, 13, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(149, 8, '2025-09-12', '07:45:47', 'assets/upload/absensi/fake_masuk_8_20250912.jpg', -5.3971138, 105.2667783, 38, 'VALID', 'Fake data', '16:36:15', 'assets/upload/absensi/fake_pulang_8_20250912.jpg', -5.3970981, 105.2667941, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(150, 9, '2025-09-12', '07:44:04', 'assets/upload/absensi/fake_masuk_9_20250912.jpg', -5.3970906, 105.2668003, 28, 'VALID', 'Fake data', '17:17:35', 'assets/upload/absensi/fake_pulang_9_20250912.jpg', -5.3970960, 105.2668009, 47, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(151, 10, '2025-09-12', '08:01:16', 'assets/upload/absensi/fake_masuk_10_20250912.jpg', -5.3970786, 105.2668025, 53, 'VALID', 'Fake data', '16:41:45', 'assets/upload/absensi/fake_pulang_10_20250912.jpg', -5.3971214, 105.2668136, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(152, 11, '2025-09-12', '08:10:16', 'assets/upload/absensi/fake_masuk_11_20250912.jpg', -5.3970976, 105.2667780, 37, 'VALID', 'Fake data', '16:34:11', 'assets/upload/absensi/fake_pulang_11_20250912.jpg', -5.3971049, 105.2668148, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(153, 12, '2025-09-12', '07:52:32', 'assets/upload/absensi/fake_masuk_12_20250912.jpg', -5.3971165, 105.2667925, 16, 'VALID', 'Fake data', '16:37:32', 'assets/upload/absensi/fake_pulang_12_20250912.jpg', -5.3970787, 105.2667874, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(154, 13, '2025-09-12', '07:55:52', 'assets/upload/absensi/fake_masuk_13_20250912.jpg', -5.3971008, 105.2668098, 6, 'VALID', 'Fake data', '16:32:13', 'assets/upload/absensi/fake_pulang_13_20250912.jpg', -5.3971194, 105.2667973, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(155, 14, '2025-09-12', '07:36:17', 'assets/upload/absensi/fake_masuk_14_20250912.jpg', -5.3971244, 105.2668072, 14, 'VALID', 'Fake data', '17:29:11', 'assets/upload/absensi/fake_pulang_14_20250912.jpg', -5.3971060, 105.2668221, 33, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(156, 15, '2025-09-12', '07:30:11', 'assets/upload/absensi/fake_masuk_15_20250912.jpg', -5.3971088, 105.2668055, 8, 'VALID', 'Fake data', '17:02:53', 'assets/upload/absensi/fake_pulang_15_20250912.jpg', -5.3970993, 105.2668215, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(157, 16, '2025-09-12', '08:02:58', 'assets/upload/absensi/fake_masuk_16_20250912.jpg', -5.3971075, 105.2668026, 40, 'VALID', 'Fake data', '17:23:38', 'assets/upload/absensi/fake_pulang_16_20250912.jpg', -5.3971080, 105.2667759, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(158, 4, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(159, 5, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(160, 6, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(161, 7, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(162, 8, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(163, 9, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(164, 10, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(165, 11, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(166, 12, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(167, 13, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(168, 14, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(169, 15, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(170, 16, '2025-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(171, 4, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(172, 5, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(173, 6, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(174, 7, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(175, 8, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(176, 9, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(177, 10, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(178, 11, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(179, 12, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(180, 13, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(181, 14, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(182, 15, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(183, 16, '2025-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(184, 4, '2025-09-15', '07:42:43', 'assets/upload/absensi/fake_masuk_4_20250915.jpg', -5.3971144, 105.2667857, 26, 'VALID', 'Fake data', '17:01:09', 'assets/upload/absensi/fake_pulang_4_20250915.jpg', -5.3971100, 105.2668220, 45, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(185, 5, '2025-09-15', '07:38:29', 'assets/upload/absensi/fake_masuk_5_20250915.jpg', -5.3970981, 105.2667813, 5, 'VALID', 'Fake data', '17:12:27', 'assets/upload/absensi/fake_pulang_5_20250915.jpg', -5.3971007, 105.2667902, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(186, 6, '2025-09-15', '07:47:52', 'assets/upload/absensi/fake_masuk_6_20250915.jpg', -5.3970849, 105.2668158, 38, 'VALID', 'Fake data', '17:26:15', 'assets/upload/absensi/fake_pulang_6_20250915.jpg', -5.3970922, 105.2667984, 23, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(187, 7, '2025-09-15', '07:50:22', 'assets/upload/absensi/fake_masuk_7_20250915.jpg', -5.3971175, 105.2667945, 29, 'VALID', 'Fake data', '16:49:37', 'assets/upload/absensi/fake_pulang_7_20250915.jpg', -5.3971181, 105.2668103, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(188, 8, '2025-09-15', '07:51:36', 'assets/upload/absensi/fake_masuk_8_20250915.jpg', -5.3971230, 105.2668132, 39, 'VALID', 'Fake data', '16:42:02', 'assets/upload/absensi/fake_pulang_8_20250915.jpg', -5.3970796, 105.2668218, 52, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(189, 9, '2025-09-15', '08:14:32', 'assets/upload/absensi/fake_masuk_9_20250915.jpg', -5.3971215, 105.2667938, 38, 'VALID', 'Fake data', '16:44:49', 'assets/upload/absensi/fake_pulang_9_20250915.jpg', -5.3971145, 105.2667904, 50, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(190, 10, '2025-09-15', '07:57:51', 'assets/upload/absensi/fake_masuk_10_20250915.jpg', -5.3971065, 105.2668248, 48, 'VALID', 'Fake data', '16:50:10', 'assets/upload/absensi/fake_pulang_10_20250915.jpg', -5.3971206, 105.2667967, 50, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(191, 11, '2025-09-15', '07:39:39', 'assets/upload/absensi/fake_masuk_11_20250915.jpg', -5.3971068, 105.2667838, 44, 'VALID', 'Fake data', '16:55:39', 'assets/upload/absensi/fake_pulang_11_20250915.jpg', -5.3970869, 105.2668016, 23, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(192, 12, '2025-09-15', '07:40:57', 'assets/upload/absensi/fake_masuk_12_20250915.jpg', -5.3971192, 105.2668174, 49, 'VALID', 'Fake data', '17:24:33', 'assets/upload/absensi/fake_pulang_12_20250915.jpg', -5.3970812, 105.2668074, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(193, 13, '2025-09-15', '07:35:25', 'assets/upload/absensi/fake_masuk_13_20250915.jpg', -5.3970867, 105.2667982, 6, 'VALID', 'Fake data', '17:14:19', 'assets/upload/absensi/fake_pulang_13_20250915.jpg', -5.3970943, 105.2668178, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(194, 14, '2025-09-15', '07:57:47', 'assets/upload/absensi/fake_masuk_14_20250915.jpg', -5.3970861, 105.2667766, 46, 'VALID', 'Fake data', '16:33:14', 'assets/upload/absensi/fake_pulang_14_20250915.jpg', -5.3970860, 105.2668119, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL);
INSERT INTO `absensi` (`id`, `user_id`, `tanggal`, `jam_masuk`, `foto_masuk`, `lat_masuk`, `long_masuk`, `jarak_masuk_meter`, `status_masuk`, `catatan_masuk`, `jam_pulang`, `foto_pulang`, `lat_pulang`, `long_pulang`, `jarak_pulang_meter`, `status_pulang`, `catatan_pulang`, `keterangan`, `created_at`, `updated_at`) VALUES
(195, 15, '2025-09-15', '07:53:21', 'assets/upload/absensi/fake_masuk_15_20250915.jpg', -5.3970972, 105.2667862, 27, 'VALID', 'Fake data', '17:06:00', 'assets/upload/absensi/fake_pulang_15_20250915.jpg', -5.3970932, 105.2667941, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(196, 16, '2025-09-15', '08:08:35', 'assets/upload/absensi/fake_masuk_16_20250915.jpg', -5.3971107, 105.2668178, 26, 'VALID', 'Fake data', '17:03:07', 'assets/upload/absensi/fake_pulang_16_20250915.jpg', -5.3971006, 105.2668140, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(197, 4, '2025-09-16', '08:08:15', 'assets/upload/absensi/fake_masuk_4_20250916.jpg', -5.3970782, 105.2667817, 47, 'VALID', 'Fake data', '17:22:42', 'assets/upload/absensi/fake_pulang_4_20250916.jpg', -5.3970837, 105.2667997, 54, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(198, 5, '2025-09-16', '07:51:06', 'assets/upload/absensi/fake_masuk_5_20250916.jpg', -5.3971062, 105.2667986, 16, 'VALID', 'Fake data', '17:14:37', 'assets/upload/absensi/fake_pulang_5_20250916.jpg', -5.3971239, 105.2668192, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(199, 6, '2025-09-16', '07:34:07', 'assets/upload/absensi/fake_masuk_6_20250916.jpg', -5.3971043, 105.2668147, 41, 'VALID', 'Fake data', '16:45:01', 'assets/upload/absensi/fake_pulang_6_20250916.jpg', -5.3971213, 105.2668059, 48, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(200, 7, '2025-09-16', '07:51:55', 'assets/upload/absensi/fake_masuk_7_20250916.jpg', -5.3970834, 105.2668099, 54, 'VALID', 'Fake data', '17:22:13', 'assets/upload/absensi/fake_pulang_7_20250916.jpg', -5.3971063, 105.2667880, 13, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(201, 8, '2025-09-16', '07:34:53', 'assets/upload/absensi/fake_masuk_8_20250916.jpg', -5.3971245, 105.2668113, 34, 'VALID', 'Fake data', '17:18:13', 'assets/upload/absensi/fake_pulang_8_20250916.jpg', -5.3971135, 105.2668120, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(202, 9, '2025-09-16', '08:07:29', 'assets/upload/absensi/fake_masuk_9_20250916.jpg', -5.3971184, 105.2667832, 26, 'VALID', 'Fake data', '17:08:11', 'assets/upload/absensi/fake_pulang_9_20250916.jpg', -5.3970798, 105.2668055, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(203, 10, '2025-09-16', '08:08:37', 'assets/upload/absensi/fake_masuk_10_20250916.jpg', -5.3971111, 105.2668158, 17, 'VALID', 'Fake data', '17:17:38', 'assets/upload/absensi/fake_pulang_10_20250916.jpg', -5.3971138, 105.2668117, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(204, 11, '2025-09-16', '08:06:34', 'assets/upload/absensi/fake_masuk_11_20250916.jpg', -5.3971223, 105.2668165, 54, 'VALID', 'Fake data', '16:57:42', 'assets/upload/absensi/fake_pulang_11_20250916.jpg', -5.3971081, 105.2667902, 30, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(205, 12, '2025-09-16', '07:57:23', 'assets/upload/absensi/fake_masuk_12_20250916.jpg', -5.3970984, 105.2668167, 33, 'VALID', 'Fake data', '16:51:40', 'assets/upload/absensi/fake_pulang_12_20250916.jpg', -5.3971205, 105.2667931, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(206, 13, '2025-09-16', '07:58:57', 'assets/upload/absensi/fake_masuk_13_20250916.jpg', -5.3970961, 105.2668231, 8, 'VALID', 'Fake data', '16:59:01', 'assets/upload/absensi/fake_pulang_13_20250916.jpg', -5.3971151, 105.2668017, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(207, 14, '2025-09-16', '08:05:50', 'assets/upload/absensi/fake_masuk_14_20250916.jpg', -5.3970878, 105.2667913, 25, 'VALID', 'Fake data', '16:31:34', 'assets/upload/absensi/fake_pulang_14_20250916.jpg', -5.3970785, 105.2668033, 7, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(208, 15, '2025-09-16', '07:53:45', 'assets/upload/absensi/fake_masuk_15_20250916.jpg', -5.3970999, 105.2668215, 11, 'VALID', 'Fake data', '17:24:10', 'assets/upload/absensi/fake_pulang_15_20250916.jpg', -5.3971200, 105.2668146, 38, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(209, 16, '2025-09-16', '08:12:11', 'assets/upload/absensi/fake_masuk_16_20250916.jpg', -5.3970901, 105.2668089, 19, 'VALID', 'Fake data', '16:57:42', 'assets/upload/absensi/fake_pulang_16_20250916.jpg', -5.3971045, 105.2668081, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(210, 4, '2025-09-17', '07:48:28', 'assets/upload/absensi/fake_masuk_4_20250917.jpg', -5.3970842, 105.2668176, 45, 'VALID', 'Fake data', '16:58:50', 'assets/upload/absensi/fake_pulang_4_20250917.jpg', -5.3970759, 105.2667984, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(211, 5, '2025-09-17', '07:55:28', 'assets/upload/absensi/fake_masuk_5_20250917.jpg', -5.3970925, 105.2668023, 44, 'VALID', 'Fake data', '16:47:25', 'assets/upload/absensi/fake_pulang_5_20250917.jpg', -5.3971203, 105.2668050, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(212, 6, '2025-09-17', '08:04:52', 'assets/upload/absensi/fake_masuk_6_20250917.jpg', -5.3970884, 105.2667917, 28, 'VALID', 'Fake data', '16:51:26', 'assets/upload/absensi/fake_pulang_6_20250917.jpg', -5.3971064, 105.2668144, 46, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(213, 7, '2025-09-17', '08:03:26', 'assets/upload/absensi/fake_masuk_7_20250917.jpg', -5.3971123, 105.2667768, 26, 'VALID', 'Fake data', '16:30:01', 'assets/upload/absensi/fake_pulang_7_20250917.jpg', -5.3970882, 105.2668091, 14, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(214, 8, '2025-09-17', '08:12:47', 'assets/upload/absensi/fake_masuk_8_20250917.jpg', -5.3971172, 105.2668215, 14, 'VALID', 'Fake data', '16:37:06', 'assets/upload/absensi/fake_pulang_8_20250917.jpg', -5.3971227, 105.2668189, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(215, 9, '2025-09-17', '07:58:16', 'assets/upload/absensi/fake_masuk_9_20250917.jpg', -5.3971059, 105.2667764, 54, 'VALID', 'Fake data', '17:22:04', 'assets/upload/absensi/fake_pulang_9_20250917.jpg', -5.3971065, 105.2667872, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(216, 10, '2025-09-17', '08:07:47', 'assets/upload/absensi/fake_masuk_10_20250917.jpg', -5.3970823, 105.2668126, 15, 'VALID', 'Fake data', '17:14:44', 'assets/upload/absensi/fake_pulang_10_20250917.jpg', -5.3971187, 105.2667947, 34, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(217, 11, '2025-09-17', '08:04:31', 'assets/upload/absensi/fake_masuk_11_20250917.jpg', -5.3971216, 105.2667767, 53, 'VALID', 'Fake data', '17:14:35', 'assets/upload/absensi/fake_pulang_11_20250917.jpg', -5.3970846, 105.2668156, 36, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(218, 12, '2025-09-17', '08:03:24', 'assets/upload/absensi/fake_masuk_12_20250917.jpg', -5.3970847, 105.2668150, 34, 'VALID', 'Fake data', '17:01:01', 'assets/upload/absensi/fake_pulang_12_20250917.jpg', -5.3970832, 105.2668063, 36, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(219, 13, '2025-09-17', '07:41:26', 'assets/upload/absensi/fake_masuk_13_20250917.jpg', -5.3971055, 105.2667845, 44, 'VALID', 'Fake data', '16:50:23', 'assets/upload/absensi/fake_pulang_13_20250917.jpg', -5.3971074, 105.2668118, 36, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(220, 14, '2025-09-17', '08:11:52', 'assets/upload/absensi/fake_masuk_14_20250917.jpg', -5.3970865, 105.2667778, 53, 'VALID', 'Fake data', '17:12:07', 'assets/upload/absensi/fake_pulang_14_20250917.jpg', -5.3970956, 105.2668164, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(221, 15, '2025-09-17', '07:49:22', 'assets/upload/absensi/fake_masuk_15_20250917.jpg', -5.3971249, 105.2668110, 34, 'VALID', 'Fake data', '17:17:40', 'assets/upload/absensi/fake_pulang_15_20250917.jpg', -5.3971150, 105.2668060, 30, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(222, 16, '2025-09-17', '07:59:02', 'assets/upload/absensi/fake_masuk_16_20250917.jpg', -5.3970889, 105.2668088, 15, 'VALID', 'Fake data', '16:31:08', 'assets/upload/absensi/fake_pulang_16_20250917.jpg', -5.3971016, 105.2667892, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(223, 4, '2025-09-18', '07:40:52', 'assets/upload/absensi/fake_masuk_4_20250918.jpg', -5.3971175, 105.2667764, 39, 'VALID', 'Fake data', '16:50:43', 'assets/upload/absensi/fake_pulang_4_20250918.jpg', -5.3970915, 105.2667907, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(224, 5, '2025-09-18', '08:08:36', 'assets/upload/absensi/fake_masuk_5_20250918.jpg', -5.3970945, 105.2667987, 32, 'VALID', 'Fake data', '16:47:49', 'assets/upload/absensi/fake_pulang_5_20250918.jpg', -5.3970823, 105.2667937, 20, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(225, 6, '2025-09-18', '07:50:08', 'assets/upload/absensi/fake_masuk_6_20250918.jpg', -5.3971103, 105.2667816, 43, 'VALID', 'Fake data', '16:58:41', 'assets/upload/absensi/fake_pulang_6_20250918.jpg', -5.3971217, 105.2668198, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(226, 7, '2025-09-18', '08:03:04', 'assets/upload/absensi/fake_masuk_7_20250918.jpg', -5.3970840, 105.2668197, 5, 'VALID', 'Fake data', '16:51:48', 'assets/upload/absensi/fake_pulang_7_20250918.jpg', -5.3970855, 105.2668181, 51, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(227, 8, '2025-09-18', '07:34:31', 'assets/upload/absensi/fake_masuk_8_20250918.jpg', -5.3970904, 105.2667828, 40, 'VALID', 'Fake data', '16:33:36', 'assets/upload/absensi/fake_pulang_8_20250918.jpg', -5.3971158, 105.2668119, 12, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(228, 9, '2025-09-18', '07:52:06', 'assets/upload/absensi/fake_masuk_9_20250918.jpg', -5.3971234, 105.2668094, 21, 'VALID', 'Fake data', '17:08:03', 'assets/upload/absensi/fake_pulang_9_20250918.jpg', -5.3971173, 105.2668185, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(229, 10, '2025-09-18', '08:06:55', 'assets/upload/absensi/fake_masuk_10_20250918.jpg', -5.3971028, 105.2668129, 28, 'VALID', 'Fake data', '16:32:04', 'assets/upload/absensi/fake_pulang_10_20250918.jpg', -5.3970857, 105.2668163, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(230, 11, '2025-09-18', '07:47:46', 'assets/upload/absensi/fake_masuk_11_20250918.jpg', -5.3970925, 105.2667784, 24, 'VALID', 'Fake data', '17:13:07', 'assets/upload/absensi/fake_pulang_11_20250918.jpg', -5.3971029, 105.2667776, 51, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(231, 12, '2025-09-18', '07:53:45', 'assets/upload/absensi/fake_masuk_12_20250918.jpg', -5.3970836, 105.2668029, 20, 'VALID', 'Fake data', '17:21:09', 'assets/upload/absensi/fake_pulang_12_20250918.jpg', -5.3971076, 105.2667840, 47, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(232, 13, '2025-09-18', '08:02:47', 'assets/upload/absensi/fake_masuk_13_20250918.jpg', -5.3971208, 105.2667866, 50, 'VALID', 'Fake data', '17:20:48', 'assets/upload/absensi/fake_pulang_13_20250918.jpg', -5.3970996, 105.2667752, 29, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(233, 14, '2025-09-18', '07:50:20', 'assets/upload/absensi/fake_masuk_14_20250918.jpg', -5.3970859, 105.2668027, 26, 'VALID', 'Fake data', '16:58:09', 'assets/upload/absensi/fake_pulang_14_20250918.jpg', -5.3971217, 105.2668212, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(234, 15, '2025-09-18', '07:45:03', 'assets/upload/absensi/fake_masuk_15_20250918.jpg', -5.3971046, 105.2667769, 53, 'VALID', 'Fake data', '17:12:42', 'assets/upload/absensi/fake_pulang_15_20250918.jpg', -5.3970918, 105.2667842, 51, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(235, 16, '2025-09-18', '07:34:00', 'assets/upload/absensi/fake_masuk_16_20250918.jpg', -5.3970920, 105.2667767, 14, 'VALID', 'Fake data', '17:20:23', 'assets/upload/absensi/fake_pulang_16_20250918.jpg', -5.3970933, 105.2668077, 23, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(236, 4, '2025-09-19', '08:09:51', 'assets/upload/absensi/fake_masuk_4_20250919.jpg', -5.3971091, 105.2668215, 40, 'VALID', 'Fake data', '17:12:57', 'assets/upload/absensi/fake_pulang_4_20250919.jpg', -5.3971013, 105.2667862, 39, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(237, 5, '2025-09-19', '08:07:00', 'assets/upload/absensi/fake_masuk_5_20250919.jpg', -5.3971243, 105.2668052, 53, 'VALID', 'Fake data', '16:33:27', 'assets/upload/absensi/fake_pulang_5_20250919.jpg', -5.3971066, 105.2668084, 16, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(238, 6, '2025-09-19', '07:37:08', 'assets/upload/absensi/fake_masuk_6_20250919.jpg', -5.3971202, 105.2667754, 42, 'VALID', 'Fake data', '17:14:35', 'assets/upload/absensi/fake_pulang_6_20250919.jpg', -5.3971023, 105.2667770, 46, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(239, 7, '2025-09-19', '07:32:36', 'assets/upload/absensi/fake_masuk_7_20250919.jpg', -5.3970858, 105.2668123, 23, 'VALID', 'Fake data', '17:09:31', 'assets/upload/absensi/fake_pulang_7_20250919.jpg', -5.3971173, 105.2668149, 31, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(240, 8, '2025-09-19', '07:39:43', 'assets/upload/absensi/fake_masuk_8_20250919.jpg', -5.3970992, 105.2668218, 11, 'VALID', 'Fake data', '17:19:32', 'assets/upload/absensi/fake_pulang_8_20250919.jpg', -5.3970875, 105.2667885, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(241, 9, '2025-09-19', '08:02:06', 'assets/upload/absensi/fake_masuk_9_20250919.jpg', -5.3971124, 105.2667810, 47, 'VALID', 'Fake data', '17:20:52', 'assets/upload/absensi/fake_pulang_9_20250919.jpg', -5.3970892, 105.2667769, 6, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(242, 10, '2025-09-19', '07:33:33', 'assets/upload/absensi/fake_masuk_10_20250919.jpg', -5.3971109, 105.2667834, 54, 'VALID', 'Fake data', '16:58:52', 'assets/upload/absensi/fake_pulang_10_20250919.jpg', -5.3971042, 105.2668066, 50, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(243, 11, '2025-09-19', '08:00:01', 'assets/upload/absensi/fake_masuk_11_20250919.jpg', -5.3970951, 105.2668247, 13, 'VALID', 'Fake data', '17:21:56', 'assets/upload/absensi/fake_pulang_11_20250919.jpg', -5.3970839, 105.2668005, 9, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(244, 12, '2025-09-19', '08:09:52', 'assets/upload/absensi/fake_masuk_12_20250919.jpg', -5.3971159, 105.2667875, 40, 'VALID', 'Fake data', '17:17:01', 'assets/upload/absensi/fake_pulang_12_20250919.jpg', -5.3970851, 105.2668070, 45, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(245, 13, '2025-09-19', '07:34:39', 'assets/upload/absensi/fake_masuk_13_20250919.jpg', -5.3971198, 105.2667853, 40, 'VALID', 'Fake data', '17:28:38', 'assets/upload/absensi/fake_pulang_13_20250919.jpg', -5.3970885, 105.2668109, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(246, 14, '2025-09-19', '08:07:40', 'assets/upload/absensi/fake_masuk_14_20250919.jpg', -5.3970754, 105.2667975, 18, 'VALID', 'Fake data', '16:30:49', 'assets/upload/absensi/fake_pulang_14_20250919.jpg', -5.3971125, 105.2667856, 20, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(247, 15, '2025-09-19', '08:10:31', 'assets/upload/absensi/fake_masuk_15_20250919.jpg', -5.3970960, 105.2667850, 18, 'VALID', 'Fake data', '17:12:51', 'assets/upload/absensi/fake_pulang_15_20250919.jpg', -5.3970859, 105.2668133, 29, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(248, 16, '2025-09-19', '07:35:19', 'assets/upload/absensi/fake_masuk_16_20250919.jpg', -5.3971179, 105.2667928, 22, 'VALID', 'Fake data', '17:11:34', 'assets/upload/absensi/fake_pulang_16_20250919.jpg', -5.3971046, 105.2668231, 34, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(249, 4, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(250, 5, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(251, 6, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(252, 7, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(253, 8, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(254, 9, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(255, 10, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(256, 11, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(257, 12, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(258, 13, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(259, 14, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(260, 15, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(261, 16, '2025-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(262, 4, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(263, 5, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(264, 6, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(265, 7, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(266, 8, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(267, 9, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(268, 10, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(269, 11, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(270, 12, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(271, 13, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(272, 14, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(273, 15, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(274, 16, '2025-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(275, 4, '2025-09-22', '07:32:02', 'assets/upload/absensi/fake_masuk_4_20250922.jpg', -5.3971016, 105.2667850, 34, 'VALID', 'Fake data', '16:53:13', 'assets/upload/absensi/fake_pulang_4_20250922.jpg', -5.3971178, 105.2668028, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(276, 5, '2025-09-22', '07:34:17', 'assets/upload/absensi/fake_masuk_5_20250922.jpg', -5.3971041, 105.2668151, 42, 'VALID', 'Fake data', '16:53:02', 'assets/upload/absensi/fake_pulang_5_20250922.jpg', -5.3970927, 105.2667788, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(277, 6, '2025-09-22', '07:30:00', 'assets/upload/absensi/fake_masuk_6_20250922.jpg', -5.3970919, 105.2667905, 33, 'VALID', 'Fake data', '17:24:20', 'assets/upload/absensi/fake_pulang_6_20250922.jpg', -5.3970837, 105.2667956, 34, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(278, 7, '2025-09-22', '08:00:57', 'assets/upload/absensi/fake_masuk_7_20250922.jpg', -5.3970908, 105.2667928, 41, 'VALID', 'Fake data', '17:05:15', 'assets/upload/absensi/fake_pulang_7_20250922.jpg', -5.3970878, 105.2668227, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(279, 8, '2025-09-22', '08:07:49', 'assets/upload/absensi/fake_masuk_8_20250922.jpg', -5.3970960, 105.2667941, 13, 'VALID', 'Fake data', '17:11:58', 'assets/upload/absensi/fake_pulang_8_20250922.jpg', -5.3970755, 105.2668176, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(280, 9, '2025-09-22', '08:09:49', 'assets/upload/absensi/fake_masuk_9_20250922.jpg', -5.3970970, 105.2667825, 8, 'VALID', 'Fake data', '17:22:28', 'assets/upload/absensi/fake_pulang_9_20250922.jpg', -5.3971160, 105.2667886, 46, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(281, 10, '2025-09-22', '07:42:55', 'assets/upload/absensi/fake_masuk_10_20250922.jpg', -5.3970763, 105.2667756, 11, 'VALID', 'Fake data', '17:08:23', 'assets/upload/absensi/fake_pulang_10_20250922.jpg', -5.3970853, 105.2667775, 48, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(282, 11, '2025-09-22', '07:38:56', 'assets/upload/absensi/fake_masuk_11_20250922.jpg', -5.3971058, 105.2667912, 28, 'VALID', 'Fake data', '16:52:42', 'assets/upload/absensi/fake_pulang_11_20250922.jpg', -5.3971010, 105.2667884, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(283, 12, '2025-09-22', '08:00:04', 'assets/upload/absensi/fake_masuk_12_20250922.jpg', -5.3970920, 105.2667896, 29, 'VALID', 'Fake data', '17:02:43', 'assets/upload/absensi/fake_pulang_12_20250922.jpg', -5.3971114, 105.2668114, 46, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(284, 13, '2025-09-22', '08:11:46', 'assets/upload/absensi/fake_masuk_13_20250922.jpg', -5.3971163, 105.2667791, 49, 'VALID', 'Fake data', '16:43:16', 'assets/upload/absensi/fake_pulang_13_20250922.jpg', -5.3971038, 105.2667980, 6, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(285, 14, '2025-09-22', '08:03:03', 'assets/upload/absensi/fake_masuk_14_20250922.jpg', -5.3970947, 105.2668164, 20, 'VALID', 'Fake data', '16:36:01', 'assets/upload/absensi/fake_pulang_14_20250922.jpg', -5.3970974, 105.2667981, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(286, 15, '2025-09-22', '08:09:49', 'assets/upload/absensi/fake_masuk_15_20250922.jpg', -5.3971019, 105.2668076, 48, 'VALID', 'Fake data', '16:55:26', 'assets/upload/absensi/fake_pulang_15_20250922.jpg', -5.3971004, 105.2667844, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(287, 16, '2025-09-22', '08:03:35', 'assets/upload/absensi/fake_masuk_16_20250922.jpg', -5.3971076, 105.2667998, 26, 'VALID', 'Fake data', '17:12:36', 'assets/upload/absensi/fake_pulang_16_20250922.jpg', -5.3971135, 105.2667762, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(288, 4, '2025-09-23', '07:33:25', 'assets/upload/absensi/fake_masuk_4_20250923.jpg', -5.3971204, 105.2667864, 48, 'VALID', 'Fake data', '17:08:10', 'assets/upload/absensi/fake_pulang_4_20250923.jpg', -5.3970955, 105.2667771, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(289, 5, '2025-09-23', '07:33:19', 'assets/upload/absensi/fake_masuk_5_20250923.jpg', -5.3971225, 105.2667762, 53, 'VALID', 'Fake data', '17:17:40', 'assets/upload/absensi/fake_pulang_5_20250923.jpg', -5.3971224, 105.2668190, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(290, 6, '2025-09-23', '07:56:16', 'assets/upload/absensi/fake_masuk_6_20250923.jpg', -5.3971158, 105.2667835, 19, 'VALID', 'Fake data', '17:27:45', 'assets/upload/absensi/fake_pulang_6_20250923.jpg', -5.3970785, 105.2668132, 6, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(291, 7, '2025-09-23', '08:07:41', 'assets/upload/absensi/fake_masuk_7_20250923.jpg', -5.3971194, 105.2667773, 49, 'VALID', 'Fake data', '16:50:05', 'assets/upload/absensi/fake_pulang_7_20250923.jpg', -5.3970754, 105.2668226, 44, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(292, 8, '2025-09-23', '07:32:27', 'assets/upload/absensi/fake_masuk_8_20250923.jpg', -5.3970786, 105.2667990, 35, 'VALID', 'Fake data', '17:07:51', 'assets/upload/absensi/fake_pulang_8_20250923.jpg', -5.3971094, 105.2668084, 25, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(293, 9, '2025-09-23', '07:30:31', 'assets/upload/absensi/fake_masuk_9_20250923.jpg', -5.3970825, 105.2667856, 30, 'VALID', 'Fake data', '17:24:59', 'assets/upload/absensi/fake_pulang_9_20250923.jpg', -5.3971224, 105.2668005, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(294, 10, '2025-09-23', '07:50:39', 'assets/upload/absensi/fake_masuk_10_20250923.jpg', -5.3971200, 105.2667812, 21, 'VALID', 'Fake data', '16:43:48', 'assets/upload/absensi/fake_pulang_10_20250923.jpg', -5.3971155, 105.2667878, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(295, 11, '2025-09-23', '08:05:43', 'assets/upload/absensi/fake_masuk_11_20250923.jpg', -5.3970834, 105.2668141, 25, 'VALID', 'Fake data', '17:12:40', 'assets/upload/absensi/fake_pulang_11_20250923.jpg', -5.3971089, 105.2667988, 25, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(296, 12, '2025-09-23', '07:58:44', 'assets/upload/absensi/fake_masuk_12_20250923.jpg', -5.3970773, 105.2668175, 24, 'VALID', 'Fake data', '16:54:17', 'assets/upload/absensi/fake_pulang_12_20250923.jpg', -5.3970824, 105.2667771, 37, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(297, 13, '2025-09-23', '07:36:10', 'assets/upload/absensi/fake_masuk_13_20250923.jpg', -5.3970885, 105.2667869, 54, 'VALID', 'Fake data', '16:46:44', 'assets/upload/absensi/fake_pulang_13_20250923.jpg', -5.3971050, 105.2667832, 35, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(298, 14, '2025-09-23', '07:56:24', 'assets/upload/absensi/fake_masuk_14_20250923.jpg', -5.3971205, 105.2668093, 12, 'VALID', 'Fake data', '17:14:02', 'assets/upload/absensi/fake_pulang_14_20250923.jpg', -5.3971152, 105.2668140, 20, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(299, 15, '2025-09-23', '07:38:49', 'assets/upload/absensi/fake_masuk_15_20250923.jpg', -5.3971220, 105.2668107, 24, 'VALID', 'Fake data', '17:18:07', 'assets/upload/absensi/fake_pulang_15_20250923.jpg', -5.3970828, 105.2668158, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(300, 16, '2025-09-23', '07:42:10', 'assets/upload/absensi/fake_masuk_16_20250923.jpg', -5.3970889, 105.2668150, 46, 'VALID', 'Fake data', '17:16:40', 'assets/upload/absensi/fake_pulang_16_20250923.jpg', -5.3971059, 105.2668038, 41, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(301, 4, '2025-09-24', '08:12:00', 'assets/upload/absensi/fake_masuk_4_20250924.jpg', -5.3971014, 105.2668028, 23, 'VALID', 'Fake data', '16:38:56', 'assets/upload/absensi/fake_pulang_4_20250924.jpg', -5.3970922, 105.2668168, 15, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(302, 5, '2025-09-24', '07:55:00', 'assets/upload/absensi/fake_masuk_5_20250924.jpg', -5.3971180, 105.2667764, 41, 'VALID', 'Fake data', '17:02:23', 'assets/upload/absensi/fake_pulang_5_20250924.jpg', -5.3970988, 105.2668249, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(303, 6, '2025-09-24', '07:35:14', 'assets/upload/absensi/fake_masuk_6_20250924.jpg', -5.3971093, 105.2667862, 13, 'VALID', 'Fake data', '16:42:33', 'assets/upload/absensi/fake_pulang_6_20250924.jpg', -5.3970991, 105.2668231, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(304, 7, '2025-09-24', '07:47:41', 'assets/upload/absensi/fake_masuk_7_20250924.jpg', -5.3971151, 105.2668154, 27, 'VALID', 'Fake data', '17:19:51', 'assets/upload/absensi/fake_pulang_7_20250924.jpg', -5.3970850, 105.2668004, 12, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(305, 8, '2025-09-24', '07:38:07', 'assets/upload/absensi/fake_masuk_8_20250924.jpg', -5.3971011, 105.2668176, 46, 'VALID', 'Fake data', '17:03:47', 'assets/upload/absensi/fake_pulang_8_20250924.jpg', -5.3971078, 105.2667767, 11, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(306, 9, '2025-09-24', '07:55:34', 'assets/upload/absensi/fake_masuk_9_20250924.jpg', -5.3971030, 105.2667999, 13, 'VALID', 'Fake data', '16:51:05', 'assets/upload/absensi/fake_pulang_9_20250924.jpg', -5.3971125, 105.2667848, 16, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(307, 10, '2025-09-24', '07:55:32', 'assets/upload/absensi/fake_masuk_10_20250924.jpg', -5.3971178, 105.2667760, 38, 'VALID', 'Fake data', '16:45:55', 'assets/upload/absensi/fake_pulang_10_20250924.jpg', -5.3971084, 105.2668182, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(308, 11, '2025-09-24', '07:31:15', 'assets/upload/absensi/fake_masuk_11_20250924.jpg', -5.3971166, 105.2668127, 18, 'VALID', 'Fake data', '16:33:59', 'assets/upload/absensi/fake_pulang_11_20250924.jpg', -5.3970982, 105.2667990, 44, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(309, 12, '2025-09-24', '07:53:55', 'assets/upload/absensi/fake_masuk_12_20250924.jpg', -5.3971113, 105.2668137, 7, 'VALID', 'Fake data', '17:25:11', 'assets/upload/absensi/fake_pulang_12_20250924.jpg', -5.3971023, 105.2668006, 14, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(310, 13, '2025-09-24', '07:49:24', 'assets/upload/absensi/fake_masuk_13_20250924.jpg', -5.3970961, 105.2668049, 17, 'VALID', 'Fake data', '16:59:10', 'assets/upload/absensi/fake_pulang_13_20250924.jpg', -5.3970919, 105.2668178, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(311, 14, '2025-09-24', '08:09:35', 'assets/upload/absensi/fake_masuk_14_20250924.jpg', -5.3970984, 105.2667758, 29, 'VALID', 'Fake data', '16:52:48', 'assets/upload/absensi/fake_pulang_14_20250924.jpg', -5.3971028, 105.2667790, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(312, 15, '2025-09-24', '07:33:58', 'assets/upload/absensi/fake_masuk_15_20250924.jpg', -5.3971127, 105.2668232, 9, 'VALID', 'Fake data', '17:01:03', 'assets/upload/absensi/fake_pulang_15_20250924.jpg', -5.3971079, 105.2667830, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(313, 16, '2025-09-24', '07:46:36', 'assets/upload/absensi/fake_masuk_16_20250924.jpg', -5.3970981, 105.2668040, 19, 'VALID', 'Fake data', '17:10:49', 'assets/upload/absensi/fake_pulang_16_20250924.jpg', -5.3970974, 105.2668108, 51, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(314, 4, '2025-09-25', '07:51:01', 'assets/upload/absensi/fake_masuk_4_20250925.jpg', -5.3970966, 105.2667969, 29, 'VALID', 'Fake data', '16:37:39', 'assets/upload/absensi/fake_pulang_4_20250925.jpg', -5.3971164, 105.2667989, 48, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(315, 5, '2025-09-25', '08:11:54', 'assets/upload/absensi/fake_masuk_5_20250925.jpg', -5.3971232, 105.2667946, 47, 'VALID', 'Fake data', '16:33:06', 'assets/upload/absensi/fake_pulang_5_20250925.jpg', -5.3970888, 105.2667981, 11, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(316, 6, '2025-09-25', '07:43:40', 'assets/upload/absensi/fake_masuk_6_20250925.jpg', -5.3971197, 105.2668059, 43, 'VALID', 'Fake data', '16:30:59', 'assets/upload/absensi/fake_pulang_6_20250925.jpg', -5.3970870, 105.2668125, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(317, 7, '2025-09-25', '07:34:30', 'assets/upload/absensi/fake_masuk_7_20250925.jpg', -5.3971205, 105.2667826, 29, 'VALID', 'Fake data', '17:29:48', 'assets/upload/absensi/fake_pulang_7_20250925.jpg', -5.3970995, 105.2668032, 19, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(318, 8, '2025-09-25', '08:03:46', 'assets/upload/absensi/fake_masuk_8_20250925.jpg', -5.3970806, 105.2667842, 17, 'VALID', 'Fake data', '17:14:21', 'assets/upload/absensi/fake_pulang_8_20250925.jpg', -5.3970789, 105.2667945, 14, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(319, 9, '2025-09-25', '08:04:25', 'assets/upload/absensi/fake_masuk_9_20250925.jpg', -5.3971119, 105.2667760, 20, 'VALID', 'Fake data', '16:59:41', 'assets/upload/absensi/fake_pulang_9_20250925.jpg', -5.3970980, 105.2667860, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(320, 10, '2025-09-25', '08:03:03', 'assets/upload/absensi/fake_masuk_10_20250925.jpg', -5.3971132, 105.2668236, 12, 'VALID', 'Fake data', '17:22:10', 'assets/upload/absensi/fake_pulang_10_20250925.jpg', -5.3970812, 105.2668134, 15, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(321, 11, '2025-09-25', '08:04:50', 'assets/upload/absensi/fake_masuk_11_20250925.jpg', -5.3971139, 105.2668146, 19, 'VALID', 'Fake data', '16:35:28', 'assets/upload/absensi/fake_pulang_11_20250925.jpg', -5.3970963, 105.2668050, 18, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(322, 12, '2025-09-25', '07:56:04', 'assets/upload/absensi/fake_masuk_12_20250925.jpg', -5.3971215, 105.2668055, 47, 'VALID', 'Fake data', '16:53:31', 'assets/upload/absensi/fake_pulang_12_20250925.jpg', -5.3971037, 105.2668225, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(323, 13, '2025-09-25', '07:53:29', 'assets/upload/absensi/fake_masuk_13_20250925.jpg', -5.3971157, 105.2667934, 19, 'VALID', 'Fake data', '16:47:50', 'assets/upload/absensi/fake_pulang_13_20250925.jpg', -5.3970927, 105.2667918, 42, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(324, 14, '2025-09-25', '08:02:38', 'assets/upload/absensi/fake_masuk_14_20250925.jpg', -5.3971058, 105.2668123, 33, 'VALID', 'Fake data', '17:09:18', 'assets/upload/absensi/fake_pulang_14_20250925.jpg', -5.3970980, 105.2668116, 7, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(325, 15, '2025-09-25', '07:30:24', 'assets/upload/absensi/fake_masuk_15_20250925.jpg', -5.3970788, 105.2668044, 13, 'VALID', 'Fake data', '16:36:01', 'assets/upload/absensi/fake_pulang_15_20250925.jpg', -5.3970759, 105.2668055, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(326, 16, '2025-09-25', '08:00:49', 'assets/upload/absensi/fake_masuk_16_20250925.jpg', -5.3971192, 105.2668012, 18, 'VALID', 'Fake data', '17:16:59', 'assets/upload/absensi/fake_pulang_16_20250925.jpg', -5.3971198, 105.2667833, 31, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(327, 4, '2025-09-26', '07:35:20', 'assets/upload/absensi/fake_masuk_4_20250926.jpg', -5.3971239, 105.2668128, 40, 'VALID', 'Fake data', '16:46:44', 'assets/upload/absensi/fake_pulang_4_20250926.jpg', -5.3971116, 105.2668002, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(328, 5, '2025-09-26', '07:32:10', 'assets/upload/absensi/fake_masuk_5_20250926.jpg', -5.3971197, 105.2667944, 35, 'VALID', 'Fake data', '17:25:36', 'assets/upload/absensi/fake_pulang_5_20250926.jpg', -5.3970860, 105.2667812, 18, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(329, 6, '2025-09-26', '07:30:01', 'assets/upload/absensi/fake_masuk_6_20250926.jpg', -5.3971160, 105.2668201, 53, 'VALID', 'Fake data', '16:38:21', 'assets/upload/absensi/fake_pulang_6_20250926.jpg', -5.3970856, 105.2668012, 17, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(330, 7, '2025-09-26', '08:01:14', 'assets/upload/absensi/fake_masuk_7_20250926.jpg', -5.3970894, 105.2667990, 18, 'VALID', 'Fake data', '17:22:01', 'assets/upload/absensi/fake_pulang_7_20250926.jpg', -5.3970974, 105.2667829, 11, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(331, 8, '2025-09-26', '07:39:07', 'assets/upload/absensi/fake_masuk_8_20250926.jpg', -5.3970946, 105.2667964, 20, 'VALID', 'Fake data', '16:47:47', 'assets/upload/absensi/fake_pulang_8_20250926.jpg', -5.3970982, 105.2668144, 21, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(332, 9, '2025-09-26', '07:43:23', 'assets/upload/absensi/fake_masuk_9_20250926.jpg', -5.3971004, 105.2668032, 22, 'VALID', 'Fake data', '16:33:09', 'assets/upload/absensi/fake_pulang_9_20250926.jpg', -5.3971143, 105.2668208, 51, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(333, 10, '2025-09-26', '08:12:05', 'assets/upload/absensi/fake_masuk_10_20250926.jpg', -5.3970817, 105.2668013, 6, 'VALID', 'Fake data', '17:03:34', 'assets/upload/absensi/fake_pulang_10_20250926.jpg', -5.3970892, 105.2668203, 23, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(334, 11, '2025-09-26', '07:38:03', 'assets/upload/absensi/fake_masuk_11_20250926.jpg', -5.3970871, 105.2667875, 53, 'VALID', 'Fake data', '16:37:50', 'assets/upload/absensi/fake_pulang_11_20250926.jpg', -5.3970887, 105.2667867, 54, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(335, 12, '2025-09-26', '07:42:15', 'assets/upload/absensi/fake_masuk_12_20250926.jpg', -5.3971061, 105.2667786, 16, 'VALID', 'Fake data', '17:23:56', 'assets/upload/absensi/fake_pulang_12_20250926.jpg', -5.3970836, 105.2667970, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(336, 13, '2025-09-26', '07:42:29', 'assets/upload/absensi/fake_masuk_13_20250926.jpg', -5.3971135, 105.2667907, 48, 'VALID', 'Fake data', '16:57:12', 'assets/upload/absensi/fake_pulang_13_20250926.jpg', -5.3970935, 105.2668147, 8, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(337, 14, '2025-09-26', '08:14:55', 'assets/upload/absensi/fake_masuk_14_20250926.jpg', -5.3970868, 105.2668162, 46, 'VALID', 'Fake data', '17:10:58', 'assets/upload/absensi/fake_pulang_14_20250926.jpg', -5.3970789, 105.2668028, 5, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(338, 15, '2025-09-26', '07:48:46', 'assets/upload/absensi/fake_masuk_15_20250926.jpg', -5.3971232, 105.2668213, 31, 'VALID', 'Fake data', '17:19:45', 'assets/upload/absensi/fake_pulang_15_20250926.jpg', -5.3970958, 105.2667964, 24, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(339, 16, '2025-09-26', '08:00:20', 'assets/upload/absensi/fake_masuk_16_20250926.jpg', -5.3971152, 105.2668228, 14, 'VALID', 'Fake data', '16:35:49', 'assets/upload/absensi/fake_pulang_16_20250926.jpg', -5.3970797, 105.2667869, 28, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(340, 4, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(341, 5, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(342, 6, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(343, 7, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(344, 8, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(345, 9, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(346, 10, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(347, 11, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(348, 12, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(349, 13, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(350, 14, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(351, 15, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(352, 16, '2025-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(353, 4, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(354, 5, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(355, 6, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(356, 7, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(357, 8, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(358, 9, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(359, 10, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(360, 11, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(361, 12, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(362, 13, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(363, 14, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(364, 15, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(365, 16, '2025-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LIBUR', '2025-12-20 14:47:57', NULL),
(366, 4, '2025-09-29', '07:59:11', 'assets/upload/absensi/fake_masuk_4_20250929.jpg', -5.3970837, 105.2667842, 26, 'VALID', 'Fake data', '17:08:47', 'assets/upload/absensi/fake_pulang_4_20250929.jpg', -5.3970793, 105.2668067, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(367, 5, '2025-09-29', '07:40:18', 'assets/upload/absensi/fake_masuk_5_20250929.jpg', -5.3970817, 105.2668072, 35, 'VALID', 'Fake data', '16:39:52', 'assets/upload/absensi/fake_pulang_5_20250929.jpg', -5.3970767, 105.2667918, 43, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(368, 6, '2025-09-29', '08:09:57', 'assets/upload/absensi/fake_masuk_6_20250929.jpg', -5.3971198, 105.2668179, 53, 'VALID', 'Fake data', '16:47:50', 'assets/upload/absensi/fake_pulang_6_20250929.jpg', -5.3970967, 105.2668218, 54, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(369, 7, '2025-09-29', '07:34:20', 'assets/upload/absensi/fake_masuk_7_20250929.jpg', -5.3970980, 105.2667956, 27, 'VALID', 'Fake data', '17:28:11', 'assets/upload/absensi/fake_pulang_7_20250929.jpg', -5.3970988, 105.2668107, 54, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(370, 8, '2025-09-29', '08:07:48', 'assets/upload/absensi/fake_masuk_8_20250929.jpg', -5.3971144, 105.2668019, 7, 'VALID', 'Fake data', '17:09:19', 'assets/upload/absensi/fake_pulang_8_20250929.jpg', -5.3971192, 105.2668057, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(371, 9, '2025-09-29', '08:04:03', 'assets/upload/absensi/fake_masuk_9_20250929.jpg', -5.3970937, 105.2668179, 25, 'VALID', 'Fake data', '16:59:29', 'assets/upload/absensi/fake_pulang_9_20250929.jpg', -5.3971141, 105.2668058, 26, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(372, 10, '2025-09-29', '07:43:21', 'assets/upload/absensi/fake_masuk_10_20250929.jpg', -5.3971152, 105.2667793, 47, 'VALID', 'Fake data', '17:28:50', 'assets/upload/absensi/fake_pulang_10_20250929.jpg', -5.3971071, 105.2668175, 13, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(373, 11, '2025-09-29', '07:43:57', 'assets/upload/absensi/fake_masuk_11_20250929.jpg', -5.3971232, 105.2667874, 11, 'VALID', 'Fake data', '17:25:48', 'assets/upload/absensi/fake_pulang_11_20250929.jpg', -5.3971127, 105.2667968, 27, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(374, 12, '2025-09-29', '08:10:29', 'assets/upload/absensi/fake_masuk_12_20250929.jpg', -5.3971162, 105.2667838, 22, 'VALID', 'Fake data', '16:45:37', 'assets/upload/absensi/fake_pulang_12_20250929.jpg', -5.3971136, 105.2667929, 10, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(375, 13, '2025-09-29', '07:50:46', 'assets/upload/absensi/fake_masuk_13_20250929.jpg', -5.3970756, 105.2668026, 44, 'VALID', 'Fake data', '16:48:54', 'assets/upload/absensi/fake_pulang_13_20250929.jpg', -5.3971152, 105.2667765, 33, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(376, 14, '2025-09-29', '08:02:44', 'assets/upload/absensi/fake_masuk_14_20250929.jpg', -5.3970776, 105.2668029, 52, 'VALID', 'Fake data', '16:32:29', 'assets/upload/absensi/fake_pulang_14_20250929.jpg', -5.3971060, 105.2668137, 41, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(377, 15, '2025-09-29', '07:45:17', 'assets/upload/absensi/fake_masuk_15_20250929.jpg', -5.3970999, 105.2667995, 52, 'VALID', 'Fake data', '16:44:26', 'assets/upload/absensi/fake_pulang_15_20250929.jpg', -5.3971061, 105.2667835, 40, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(378, 16, '2025-09-29', '07:32:45', 'assets/upload/absensi/fake_masuk_16_20250929.jpg', -5.3971168, 105.2668067, 39, 'VALID', 'Fake data', '17:00:17', 'assets/upload/absensi/fake_pulang_16_20250929.jpg', -5.3971010, 105.2668191, 53, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(379, 4, '2025-09-30', '07:39:53', 'assets/upload/absensi/fake_masuk_4_20250930.jpg', -5.3971160, 105.2667869, 37, 'VALID', 'Fake data', '17:02:48', 'assets/upload/absensi/fake_pulang_4_20250930.jpg', -5.3970862, 105.2667872, 49, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(380, 5, '2025-09-30', '08:02:24', 'assets/upload/absensi/fake_masuk_5_20250930.jpg', -5.3970785, 105.2667994, 37, 'VALID', 'Fake data', '17:16:14', 'assets/upload/absensi/fake_pulang_5_20250930.jpg', -5.3970793, 105.2667879, 32, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(381, 6, '2025-09-30', '08:13:25', 'assets/upload/absensi/fake_masuk_6_20250930.jpg', -5.3971159, 105.2667756, 30, 'VALID', 'Fake data', '17:01:32', 'assets/upload/absensi/fake_pulang_6_20250930.jpg', -5.3971203, 105.2668194, 13, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(382, 7, '2025-09-30', '07:37:03', 'assets/upload/absensi/fake_masuk_7_20250930.jpg', -5.3971105, 105.2668241, 6, 'VALID', 'Fake data', '16:44:38', 'assets/upload/absensi/fake_pulang_7_20250930.jpg', -5.3971197, 105.2668150, 38, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(383, 8, '2025-09-30', '08:14:43', 'assets/upload/absensi/fake_masuk_8_20250930.jpg', -5.3970783, 105.2668095, 37, 'VALID', 'Fake data', '16:40:19', 'assets/upload/absensi/fake_pulang_8_20250930.jpg', -5.3970793, 105.2667777, 31, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(384, 9, '2025-09-30', '07:51:15', 'assets/upload/absensi/fake_masuk_9_20250930.jpg', -5.3970859, 105.2667996, 10, 'VALID', 'Fake data', '16:34:42', 'assets/upload/absensi/fake_pulang_9_20250930.jpg', -5.3971219, 105.2667786, 13, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(385, 10, '2025-09-30', '07:59:36', 'assets/upload/absensi/fake_masuk_10_20250930.jpg', -5.3970867, 105.2668176, 53, 'VALID', 'Fake data', '16:46:13', 'assets/upload/absensi/fake_pulang_10_20250930.jpg', -5.3971022, 105.2667983, 53, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(386, 11, '2025-09-30', '07:49:17', 'assets/upload/absensi/fake_masuk_11_20250930.jpg', -5.3971127, 105.2668222, 54, 'VALID', 'Fake data', '16:35:32', 'assets/upload/absensi/fake_pulang_11_20250930.jpg', -5.3970997, 105.2667876, 42, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(387, 12, '2025-09-30', '08:12:42', 'assets/upload/absensi/fake_masuk_12_20250930.jpg', -5.3970988, 105.2668135, 19, 'VALID', 'Fake data', '16:36:05', 'assets/upload/absensi/fake_pulang_12_20250930.jpg', -5.3970920, 105.2668246, 54, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL);
INSERT INTO `absensi` (`id`, `user_id`, `tanggal`, `jam_masuk`, `foto_masuk`, `lat_masuk`, `long_masuk`, `jarak_masuk_meter`, `status_masuk`, `catatan_masuk`, `jam_pulang`, `foto_pulang`, `lat_pulang`, `long_pulang`, `jarak_pulang_meter`, `status_pulang`, `catatan_pulang`, `keterangan`, `created_at`, `updated_at`) VALUES
(388, 13, '2025-09-30', '08:12:29', 'assets/upload/absensi/fake_masuk_13_20250930.jpg', -5.3970866, 105.2667754, 41, 'VALID', 'Fake data', '17:09:04', 'assets/upload/absensi/fake_pulang_13_20250930.jpg', -5.3971225, 105.2667900, 22, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(389, 14, '2025-09-30', '08:08:08', 'assets/upload/absensi/fake_masuk_14_20250930.jpg', -5.3971156, 105.2667949, 26, 'VALID', 'Fake data', '17:26:04', 'assets/upload/absensi/fake_pulang_14_20250930.jpg', -5.3971052, 105.2667837, 39, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(390, 15, '2025-09-30', '08:10:40', 'assets/upload/absensi/fake_masuk_15_20250930.jpg', -5.3971019, 105.2668050, 35, 'VALID', 'Fake data', '16:46:57', 'assets/upload/absensi/fake_pulang_15_20250930.jpg', -5.3970969, 105.2668231, 11, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL),
(391, 16, '2025-09-30', '08:02:53', 'assets/upload/absensi/fake_masuk_16_20250930.jpg', -5.3971108, 105.2667866, 20, 'VALID', 'Fake data', '17:19:26', 'assets/upload/absensi/fake_pulang_16_20250930.jpg', -5.3971145, 105.2668036, 16, 'VALID', 'Fake data', 'HADIR (FAKE)', '2025-12-20 14:47:57', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi_log`
--

CREATE TABLE `absensi_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `absensi_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `aksi` enum('MASUK','PULANG') NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi_log`
--

INSERT INTO `absensi_log` (`id`, `absensi_id`, `user_id`, `aksi`, `waktu`, `ip_address`, `user_agent`) VALUES
(1, 1, 4, 'MASUK', '2025-12-20 05:42:28', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36'),
(2, 1, 4, 'PULANG', '2025-12-20 05:53:19', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kantor`
--

CREATE TABLE `kantor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_kantor` varchar(120) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `radius_meter` int(11) NOT NULL DEFAULT 100,
  `alamat` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kantor`
--

INSERT INTO `kantor` (`id`, `nama_kantor`, `latitude`, `longitude`, `radius_meter`, `alamat`, `updated_at`) VALUES
(1, 'Kantor Utama', -5.3971000, 105.2668000, 100, 'Alamat kantor...', '2025-12-20 02:06:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `jabatan`, `email`, `password`, `role`, `no_hp`, `alamat`, `foto_profil`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'Admin', NULL, 'admin@demo.com', '$2y$10$RN6D5OVav8qK0HqQfojhCuEG/pZ9MERtbFc9ko9KXRSzulMec6XBy', 'admin', NULL, NULL, NULL, 1, '2025-12-20 03:40:37', NULL),
(4, 'User', NULL, 'karyawan@demo.com', '$2y$10$L5hE8LANsuSmX6woVy2BqetPpr68c21wjFlhRhEccXN68NM.7pF0G', 'user', NULL, NULL, NULL, 1, '2025-12-20 03:55:50', NULL),
(5, 'Krisnawan Nurhaji', 'SBM', 'krisnawan@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(6, 'Dianah', 'BSM', 'dianah@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(7, 'Rinawati', 'SBC', 'rinawati@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(8, 'Abdul Yazid Syakur', 'SBC', 'abdul.yazid@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(9, 'Nopita Sari', 'SBC', 'nopita@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(10, 'Rico Septarian', 'SBC', 'rico@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(11, 'Auliya Rahman', 'SBC', 'auliya@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(12, 'Putri Sundari', 'SBC', 'putri@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(13, 'Muhamad Lucky Prihantono', 'SBC', 'lucky@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(14, 'Noviati', 'SBC', 'noviati@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(15, 'Mursyiddin Ali Akbar', 'SBC', 'mursyiddin@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(16, 'Tita Sari', 'SBC', 'tita@demo.com', 'PASTE_HASH', 'user', NULL, NULL, NULL, 1, '2025-12-20 14:41:58', NULL),
(17, 'kiki', 'Staff', 'rizki.qq05@gmail.com', '$2y$10$hbBBBTsr4cv3JO9jhT.Uc.rvl8ov2yJNmLSwgphw9YCNMCKJc8/m2', 'user', NULL, NULL, NULL, 1, '2025-12-21 01:34:12', NULL),
(18, 'santoso', 'Executive Manager (EM)', 'pratama@gmail.com', '$2y$10$CGZ59SSoY469jcmNNdO1beFXXRwonzCQn3yi9U3AB6HFjgOzE62y6', 'user', NULL, NULL, NULL, 1, '2025-12-21 01:53:15', NULL),
(19, 'toso', 'Senior Business Consultants (SBC)', 'toso@demo.com', '$2y$10$COXGa9vE7wbGkdR/vhsluevUbDdgOPFbPQPmlufOzwF3Af25.ex.y', 'user', NULL, NULL, NULL, 1, '2025-12-21 01:54:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_user_tanggal` (`user_id`,`tanggal`),
  ADD KEY `idx_tanggal` (`tanggal`),
  ADD KEY `idx_user_tanggal` (`user_id`,`tanggal`);

--
-- Indeks untuk tabel `absensi_log`
--
ALTER TABLE `absensi_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_absensi` (`absensi_id`),
  ADD KEY `idx_user_waktu` (`user_id`,`waktu`);

--
-- Indeks untuk tabel `kantor`
--
ALTER TABLE `kantor`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;

--
-- AUTO_INCREMENT untuk tabel `absensi_log`
--
ALTER TABLE `absensi_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kantor`
--
ALTER TABLE `kantor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `fk_absensi_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `absensi_log`
--
ALTER TABLE `absensi_log`
  ADD CONSTRAINT `fk_log_absensi` FOREIGN KEY (`absensi_id`) REFERENCES `absensi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
