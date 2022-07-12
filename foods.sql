-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2022 at 09:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foods`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantityAdded` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `userId`, `productId`, `quantityAdded`, `createdAt`, `updatedAt`) VALUES
(48, 11, 37, 4, '2022-07-09 11:16:40', '2022-07-09 11:19:12'),
(49, 11, 36, 1, '2022-07-09 11:18:10', '2022-07-09 11:18:10'),
(50, 11, 35, 4, '2022-07-09 11:18:22', '2022-07-09 11:18:22'),
(52, 13, 37, 2, '2022-07-10 02:35:15', '2022-07-10 02:35:59'),
(53, 13, 36, 1, '2022-07-10 02:35:18', '2022-07-10 02:35:18'),
(54, 13, 35, 9, '2022-07-10 02:35:21', '2022-07-10 02:36:24'),
(55, 13, 38, 5, '2022-07-10 02:35:24', '2022-07-10 02:36:28'),
(56, 13, 39, 4, '2022-07-10 02:35:32', '2022-07-10 02:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `customerinfos`
--

CREATE TABLE `customerinfos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customerinfos`
--

INSERT INTO `customerinfos` (`id`, `name`, `phone`, `address`, `createdAt`, `updatedAt`) VALUES
(27, 'vinhheo10', '0123456789', 'khongphaitoi', '2022-07-10 17:30:24', '2022-07-10 17:30:24'),
(28, 'vinh is me', '0123586987', 'notit', '2022-07-10 17:31:06', '2022-07-10 17:31:06'),
(29, 'long ngu xi', '0258965471', 'nha a ktx ngoai ngu', '2022-07-10 17:33:11', '2022-07-10 17:33:11'),
(30, 'long', '0147852369', 'ktx ngoai ngu', '2022-07-11 09:06:06', '2022-07-11 09:06:06'),
(31, 'long', '0147852369', 'khongphai', '2022-07-11 09:07:03', '2022-07-11 09:07:03'),
(32, 'say something', '0147852369', 'haha', '2022-07-11 09:24:59', '2022-07-11 09:24:59'),
(33, 'long oc cho', '0147550123', 'ky tuc xa ngoai ngu', '2022-07-11 10:37:27', '2022-07-11 10:37:27'),
(34, 'toi ten long', '0147856925', 'que ha giang', '2022-07-11 11:14:14', '2022-07-11 11:14:14'),
(35, 'fdsfsda', '0144852369', 'fdsafsda', '2022-07-11 11:36:30', '2022-07-11 11:36:30'),
(36, '/', '0123151616', '/', '2022-07-11 12:43:41', '2022-07-11 12:43:41'),
(37, 'vinh', '0123456789', 'vinh', '2022-07-11 12:58:36', '2022-07-11 12:58:36'),
(38, 'vinh vandi', '0147852369', 'xuan thuy cau giay', '2022-07-11 15:52:31', '2022-07-11 15:52:31'),
(39, 'dongian', '0329412987', 'noi nao', '2022-07-12 07:10:45', '2022-07-12 07:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `logintokens`
--

CREATE TABLE `logintokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logintokens`
--

INSERT INTO `logintokens` (`id`, `userId`, `token`, `createdAt`, `updatedAt`) VALUES
(95, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NDc0NDY2LCJleHAiOjE2NTc1NjA4NjZ9.IiIdqKuIEF_BPZ_sUwoaquWTrtCDsBeSTM4ExFnwqMM', '2022-07-10 17:34:26', '2022-07-10 17:34:26'),
(99, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTMwNTk4LCJleHAiOjE2NTc2MTY5OTh9.voqXVBajNHwaUG6beBwgaQMAabneT2TBfY-LqY-cfQk', '2022-07-11 09:09:58', '2022-07-11 09:09:58'),
(101, 14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsInVzZXJuYW1lIjoiVmluaDA3Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE2NTc1MzEyMjIsImV4cCI6MTY1NzYxNzYyMn0.YFvLWHP7HFPUwClE-ws7vTq9zu9HjummlPNZneRr-hk', '2022-07-11 09:20:22', '2022-07-11 09:20:22'),
(102, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzUzNTcxNCwiZXhwIjoxNjU3NjIyMTE0fQ.ART9nsdjEDHGH_vVKihSYU-cyalefn3JatEWG11LHv4', '2022-07-11 10:35:14', '2022-07-11 10:35:14'),
(103, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzUzNTg5MywiZXhwIjoxNjU3NjIyMjkzfQ.fllo7P9pmZ0QD8PUdhASKvjLwDLqsepKpQyvxueo3GA', '2022-07-11 10:38:13', '2022-07-11 10:38:13'),
(104, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzUzNjE5OSwiZXhwIjoxNjU3NjIyNTk5fQ.2wH8sl9LLWo-qYCq7b6LMRAyYjhoCs8F8DVjsnUtHzU', '2022-07-11 10:43:19', '2022-07-11 10:43:19'),
(107, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzUzNzA1MSwiZXhwIjoxNjU3NjIzNDUxfQ.QD7akahq3PJrzblSweolwLyNvLc3ekDC-JZsKfJQ_z8', '2022-07-11 10:57:31', '2022-07-11 10:57:31'),
(108, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzUzOTA4NCwiZXhwIjoxNjU3NjI1NDg0fQ.lammGSjHr_c0IIJHrdrOxICuugUe2LUsXEicafhpHIY', '2022-07-11 11:31:24', '2022-07-11 11:31:24'),
(111, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzU0MzIwOCwiZXhwIjoxNjU3NjI5NjA4fQ.E3ZE8xv9-aFNjTlDkxX1Ijo5nftsEF8AYpp1j3nEink', '2022-07-11 12:40:08', '2022-07-11 12:40:08'),
(112, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTQzNTYxLCJleHAiOjE2NTc2Mjk5NjF9.sLR6HqXY5QTfBPQh0x5zbuOe5Nu_yvWukHsxMBw1Zb0', '2022-07-11 12:46:01', '2022-07-11 12:46:01'),
(113, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTQ0MTExLCJleHAiOjE2NTc2MzA1MTF9.A26mrwXnMBPgmLCzIrLh31-UjCc0kv5esB9xUkvybRY', '2022-07-11 12:55:11', '2022-07-11 12:55:11'),
(114, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTQ1NTYwLCJleHAiOjE2NTc2MzE5NjB9.vDHSo_zhHof6fVauVsEkKei1fVa8_Pkn8z6SwpYKjD4', '2022-07-11 13:19:20', '2022-07-11 13:19:20'),
(115, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTQ4ODYyLCJleHAiOjE2NTc2MzUyNjJ9.PDIXBvN8uaF3vh8bVSvIGFkApf9dZ1t2vl6dBZIc9cI', '2022-07-11 14:14:22', '2022-07-11 14:14:22'),
(118, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTU0Nzc5LCJleHAiOjE2NTc2NDExNzl9.4Jg97Yy7hXY0vD0lrw9yanQcpx4bMLYn_aUtRrzPt28', '2022-07-11 15:52:59', '2022-07-11 15:52:59'),
(119, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NTYwNDY4LCJleHAiOjE2NTc2NDY4Njh9.Xg_9-Z9Jh7HHg6OsxTxAipS7EVKbpMQwO5L2mW6ZbMQ', '2022-07-11 17:27:48', '2022-07-11 17:27:48'),
(120, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjAwNjY0LCJleHAiOjE2NTc2ODcwNjR9.PpJMAEU0yTL_NXRCewXeoa9aZdmki6vy0IB1MsrKSq8', '2022-07-12 04:37:44', '2022-07-12 04:37:44'),
(121, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjAxMDM3LCJleHAiOjE2NTc2ODc0Mzd9.qrKK4ojKSYJhq2JBx9pbxDcDKsDYFsSQbMYRZucG7E8', '2022-07-12 04:43:57', '2022-07-12 04:43:57'),
(122, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjA0MTcxLCJleHAiOjE2NTc2OTA1NzF9.GQ09p_1QUEGkjuSV_xzVQmKpSDKl93yovfBXD6TFqCI', '2022-07-12 05:36:11', '2022-07-12 05:36:11'),
(123, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjA2MTAzLCJleHAiOjE2NTc2OTI1MDN9.wtG1ifIgkYi8rke0Ra0d_qRn27qsg9e3OzXx5OBH30Q', '2022-07-12 06:08:23', '2022-07-12 06:08:23'),
(125, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzYwNjc2MCwiZXhwIjoxNjU3NjkzMTYwfQ.8Qgxeg7sCgSEuCo4TWCyKw4o5bCyNyNV0VQrgkPAxjc', '2022-07-12 06:19:20', '2022-07-12 06:19:20'),
(126, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjA3MjAwLCJleHAiOjE2NTc2OTM2MDB9.ZaI8QMcjcw1Nb_OKwOyTfapPrurqDC07f5ovbkZaKx4', '2022-07-12 06:26:40', '2022-07-12 06:26:40'),
(127, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjA3MjQ4LCJleHAiOjE2NTc2OTM2NDh9.pGF2l6p6-mcAoUhSGzOPEwobhyZkwSOMxrtPFnc92bI', '2022-07-12 06:27:28', '2022-07-12 06:27:28'),
(128, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzYwNzI3NCwiZXhwIjoxNjU3NjkzNjc0fQ.lByubdbnn7D8dSYLcQukamoJ5nACe46bMfhJNL4OiME', '2022-07-12 06:27:54', '2022-07-12 06:27:54'),
(129, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzYwNzc4MiwiZXhwIjoxNjU3Njk0MTgyfQ.kUolPoFPya614BcImfFyOa433sr6HHXyIGY72eslhiI', '2022-07-12 06:36:22', '2022-07-12 06:36:22'),
(130, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjA4MTY3LCJleHAiOjE2NTc2OTQ1Njd9.YUbW3WL8kztG_rF79bi4uREXB-W02yxSAwpgFwKi8v4', '2022-07-12 06:42:47', '2022-07-12 06:42:47'),
(131, 10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsInVzZXJuYW1lIjoiTHVvbmdWaW5oIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjU3NjA5MTc2LCJleHAiOjE2NTc2OTU1NzZ9.TFGVeEy42my_K11jK-11-vOy7dLMBIeZQDoW_HdwQDg', '2022-07-12 06:59:36', '2022-07-12 06:59:36'),
(132, 12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInVzZXJuYW1lIjoibG9uZ3RyYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY1NzYwOTU3NiwiZXhwIjoxNjU3Njk1OTc2fQ.aMudXGLnXAuFvrtYjuffCtUHeuykTLPD8DUMM-7FhqA', '2022-07-12 07:06:16', '2022-07-12 07:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantityOrdered` int(11) DEFAULT NULL,
  `priceEach` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `customerInfoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `orderId`, `productId`, `quantityOrdered`, `priceEach`, `createdAt`, `updatedAt`, `customerInfoId`) VALUES
(52, 49, 36, 1, 100000, '2022-07-11 09:06:06', '2022-07-11 09:06:06', 30),
(53, 49, 37, 3, 30000, '2022-07-11 09:06:06', '2022-07-11 09:06:06', 30),
(54, 50, 36, 1, 100000, '2022-07-11 09:07:03', '2022-07-11 09:07:03', 31),
(56, 51, 36, 1, 100000, '2022-07-11 09:24:59', '2022-07-11 09:24:59', 32),
(57, 51, 37, 3, 30000, '2022-07-11 09:24:59', '2022-07-11 09:24:59', 32),
(58, 52, 36, 3, 300000, '2022-07-11 10:37:27', '2022-07-11 10:37:27', 33),
(59, 52, 35, 1, 100000, '2022-07-11 10:37:27', '2022-07-11 10:37:27', 33),
(60, 53, 35, 1, 100000, '2022-07-11 11:14:14', '2022-07-11 11:14:14', 34),
(61, 53, 37, 1, 10000, '2022-07-11 11:14:14', '2022-07-11 11:14:14', 34),
(62, 53, 29, 1, 200000, '2022-07-11 11:14:14', '2022-07-11 11:14:14', 34),
(63, 53, 38, 1, 1029, '2022-07-11 11:14:14', '2022-07-11 11:14:14', 34),
(64, 54, 38, 1, 1029, '2022-07-11 11:36:30', '2022-07-11 11:36:30', 35),
(65, 55, 36, 5, 500000, '2022-07-11 12:43:41', '2022-07-11 12:43:41', 36),
(66, 55, 37, 4, 40000, '2022-07-11 12:43:41', '2022-07-11 12:43:41', 36),
(67, 56, 36, 5, 500000, '2022-07-11 12:58:36', '2022-07-11 12:58:36', 37),
(68, 57, 36, 10, 1000000, '2022-07-11 15:52:31', '2022-07-11 15:52:31', 38),
(69, 58, 49, 1, 450000, '2022-07-12 07:10:45', '2022-07-12 07:10:45', 39),
(70, 58, 50, 2, 50000, '2022-07-12 07:10:45', '2022-07-12 07:10:45', 39),
(71, 58, 51, 3, 195000, '2022-07-12 07:10:45', '2022-07-12 07:10:45', 39),
(72, 58, 47, 2, 344000, '2022-07-12 07:10:45', '2022-07-12 07:10:45', 39);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `shippedDate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `OrderDate`, `shippedDate`, `status`, `createdAt`, `updatedAt`) VALUES
(46, 14, '2022-07-10 17:30:24', '2022-07-10 17:30:24', 'pending', '2022-07-10 17:30:24', '2022-07-10 17:30:24'),
(49, 14, '2022-07-11 09:06:06', '2022-07-11 09:06:06', 'shipped', '2022-07-11 09:06:06', '2022-07-11 14:14:51'),
(50, 14, '2022-07-11 09:07:03', '2022-07-11 09:07:03', 'canceled', '2022-07-11 09:07:03', '2022-07-11 14:26:10'),
(51, 14, '2022-07-11 09:24:59', '2022-07-11 09:24:59', 'shipped', '2022-07-11 09:24:59', '2022-07-11 14:20:12'),
(52, 12, '2022-07-11 10:37:27', '2022-07-11 10:37:27', 'canceled', '2022-07-11 10:37:27', '2022-07-11 14:26:23'),
(53, 12, '2022-07-11 11:14:14', '2022-07-11 11:14:14', 'shipped', '2022-07-11 11:14:14', '2022-07-11 14:49:39'),
(54, 12, '2022-07-11 11:36:30', '2022-07-11 11:36:30', 'shipped', '2022-07-11 11:36:30', '2022-07-11 14:49:44'),
(55, 12, '2022-07-11 12:43:41', '2022-07-11 12:43:41', 'canceled', '2022-07-11 12:43:41', '2022-07-11 14:49:48'),
(56, 10, '2022-07-11 12:58:36', '2022-07-11 12:58:36', 'canceled', '2022-07-11 12:58:36', '2022-07-11 14:49:53'),
(57, 12, '2022-07-11 15:52:31', '2022-07-11 15:52:31', 'shipped', '2022-07-11 15:52:31', '2022-07-11 15:53:09'),
(58, 12, '2022-07-12 07:10:45', '2022-07-12 07:10:45', 'shipped', '2022-07-12 07:10:45', '2022-07-12 07:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productName`, `price`, `type`, `status`, `description`, `image`, `createdAt`, `updatedAt`) VALUES
(29, 'Cơm Gạo Lứt Thuần Chay', 45000, 'đồ ăn', 'con ban', 'Cơm nấu từ gạo lứt Điện Biên nên dẻo- thơm-mễm dễ ăn.Thuần chay chủ yếu là rau củ quả,thuần thực vật. Thực đơn thay đổi theo ngày, suất cơm gồm 6-7 món.\nĐã được đặt  lần', '4c804970-f904-4307-aca2-2881d7c2-d82a658c-211002123222.jpeg', '2022-07-07 11:44:48', '2022-07-12 04:39:16'),
(35, 'Cơm Chay Gạo Tám + Sữa đậu nành', 55000, 'đồ ăn', 'con ban', 'Cơm gạo tám trắng.Thực đơn gồm 6-7 món thay đổi theo ngày, gồm rau củ quả luộc xào, đậu phụ, các món chiên xào- giả mặn, nộm. Mix thêm sữa đậu nành cân bằng đủ dinh dưỡng', 'e7f866bd-a12b-418f-80ef-de584551-57bc49f8-210916131806.jpeg', '2022-07-07 17:35:09', '2022-07-12 04:45:47'),
(36, 'Cơm Chay Gạo Tám Nấm Giò Kho Tộ', 50000, 'đồ ăn', 'còn bán', 'Suất cơm có món nấm giò kho là MÓN CHÍNH. Các món phụ thay đổi theo ngày gồm rau củ quả luộc xào, đậu phụ, nộm, các món chiên xào & đồ giả mặn. Kết hợp dễ ăn, thực đơn thay đổi liên tục theo ngày.', 'b2752fee-31e9-429e-b993-bdc1ad3f-f932fa9c-210718150339.jpeg', '2022-07-08 07:54:32', '2022-07-12 04:48:35'),
(37, 'Giò Lụa Chay - 500gr', 10000, 'đồ ăn', 'khan hang', 'Đồ đông lạnh, khách mua về giã đông. Hướng dẫn sử dụng xem trên bao bì sản phẩm.', '4de2c0b2-0f9b-44b8-9876-cce142ab-6241593a-210722184332.jpeg', '2022-07-08 18:02:09', '2022-07-12 04:50:43'),
(38, 'Chả Quế Chay - 500gr', 70000, 'đồ ăn', 'fasfas', 'Đồ đông lạnh, khách mua về giã đông. Hướng dẫn sử dụng xem trên bao bì sản phẩm.', 'a44d5c82-07b2-4d42-a411-0c2f20db-f0a137c6-211103134316.jpeg', '2022-07-09 07:01:27', '2022-07-12 04:52:08'),
(39, 'Tôm Chay 250gr', 50000, 'đồ ăn', 'con ban', 'Đồ đông lạnh, khách mua về cho vào chiên ở chảo dầu nóng, nhiều dầu để tôm vàng đều, giòn hơn.', '9655fdd8-1b64-4fa4-99f4-cff5d94d-bfe96f74-210916144741.jpeg', '2022-07-09 14:09:06', '2022-07-12 04:53:25'),
(40, 'Đùi Gà Sả chay -500gr', 75000, 'đồ ăn', 'con ban', 'Đồ đông lạnh, khách mua về giã đông. Hướng dẫn sử dụng xem trên bao bì sản phẩm.', 'b296dfce-7d6a-497e-8671-38e6e584-292481ef-211103134505.jpeg', '2022-07-10 17:04:43', '2022-07-12 04:54:47'),
(41, 'Dồi Chay', 75000, 'đồ ăn', '11', 'Đồ đông lạnh, khách mua về giã đông và tự chế biến.', '5cf28cbc-098a-4a22-b92d-c48e244f-f74cc1d9-200924111702.jpeg', '2022-07-11 12:50:36', '2022-07-12 04:56:20'),
(43, 'Nước Uống Sữa Trái Cây Nutriboost Hương Dâu Với Yến Mạch Và 5 Dưỡng Chất 1L', 30000, 'đồ uống', 'còn bán', 'Dòng sản phẩm sữa hương trái cây của Nutri Boost với vị dâu dễ uống thơm ngon, bổ dưỡng. Sữa trái cây Nutri Boost hương dâu giúp cơ thể bù đắp nước, bổ sung năng lượng, vitamin B3, B6, E, C, Canxi và Kẽm rất có lợi cho cơ thể, xua tan cơn khát và mệt mỏi,', '10455907f363fdfb61720addb2ec3fe2.png_720x720q80.jpg_.webp', '2022-07-12 05:00:56', '2022-07-12 05:00:56'),
(44, 'Nước Ngọt Coca Cola Zero 1.5L', 20000, 'đồ uống', 'còn bán', 'Nước Ngọt Coca Cola Zero 1.5L là sản phẩm nước giải khát được người tiêu dùng ưa chuộng bởi đặc tính mức Calo bằng 0 nhưng vẫn giữ nguyên vị như Coca Cola truyền thốn', '259435a884674a2ca457bd6b8d5ff973.png_720x720q80.jpg_.webp', '2022-07-12 05:10:39', '2022-07-12 05:10:39'),
(45, 'Thùng 24 Lon Nước Ngọt Coca Cola 320Ml', 288000, 'đồ uống', 'còn bán', 'Thùng 24 Lon Nước Ngọt Coca Cola 320Ml với lượng gas lớn sẽ giúp bạn xua tan mọi cảm giác mệt mỏi, căng thẳng, đem lại cảm giác thoải mái sau khi hoạt động ngoài trờ', 'ee9d11b83c0a67ad59ba2ce0603a728b.png_720x720q80.jpg_.webp', '2022-07-12 05:12:47', '2022-07-12 05:12:47'),
(46, 'COMBO 6 CHAI NƯỚC NGỌT KHÔNG ĐƯỜNG ZERO SUGAR COCA COLA 1.5L', 190000, 'đồ uống', 'còn bán', 'Nước giải khát không đường Coca Cola Zero với hương vị thơm ngon, không chỉ giải tỏa cơn khát trong những ngày nóng nực mà còn cung cấp nguồn năng lượng cùng hàm lượng khoáng chất dồi dào cho cơ thể. Sản phẩm không chứa đường nên rất phù hợp với những ngư', '4294087d9d403e55cc7cb9a865a0da9a.jpg_720x720q80.jpg_.webp', '2022-07-12 05:14:54', '2022-07-12 05:14:54'),
(47, 'Syrup Torani Chanh Tây/Đào/Dâu/Việt quất/Bạc Hà/Cam/ Chanh vàng/Bưởi hồng/ Ổi hồng/Vỏ Cam', 172000, 'đồ uống', 'còn bán', 'Syrup Torani Chanh Tây/Đào/Dâu/Việt quất/Bạc Hà/Cam/ Chanh vàng/Bưởi hồng/ Ổi hồng/Vỏ Cam/ milano/Mojito/Socola/Kiwi/Nho\nQuy cách: 700ml', '5c41120c4ab912b7ab7c39d7775fa7a2.jpg_720x720q80.jpg_.webp', '2022-07-12 05:17:35', '2022-07-12 05:18:00'),
(48, 'Set trà sữa Thái Xanh, Thái Đỏ tự pha, Set trà sữa trân châu đường đen 4 món', 15000, 'đồ uống', 'còn bán', 'Set Nguyên Liệu Trà Sữa ngon rẻ, nhiều topping', '878b95c75512fdd8e1563c4c5633f313.png_720x720q80.jpg_.webp', '2022-07-12 05:32:49', '2022-07-12 05:32:49'),
(49, 'Mâm cỗ 5 món', 450000, 'đồ ăn', 'còn bán', 'đầy đủ món ăn cho bạn thỏa sức ăn no nê với hội bận hoặc người thân', '80739e36-5b79-40e3-a983-4f4ce702-afb99727-210922081840.jpeg', '2022-07-12 05:37:55', '2022-07-12 05:37:55'),
(50, 'Cơm trắng (1 tô to)', 25000, 'đồ ắn', 'còn bán', 'Cơm tám trắng nấu dẻo. Lượng cơm vừa đủ cho nhóm 3-4 người ăn.', '7fc78b2b-1572-441b-ac63-a75886b9-eabd75be-210603212825.jpeg', '2022-07-12 05:39:28', '2022-07-12 05:39:28'),
(51, 'Tặng Kèm Gấu Bông Trà sữa] HILLWAY Trà Sữa Trân Châu 416g', 65000, 'đồ uống', 'còn bán', 'Khuyến Cáo: Không dùng cho người dị ứng với các thành phần của sản phẩm. Nhai kỹ trước khi nuốt. Trẻ em dưới 11 tuổi nên ăn dưới sự giám sát của người lớn', '43ee39de90a31fd39bf458211c3c08f1.jpg_720x720q80.jpg_.webp', '2022-07-12 05:41:52', '2022-07-12 05:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('add-all-foreignkey.js'),
('add-foreinkey-in-orderdetail-to-customerinfo.js'),
('change-price-type-in-product-table.js'),
('create-loginTokens.js'),
('create-table-cart.js'),
('create-table-customerInfo.js'),
('create-table-order-details.js'),
('create-table-ordres.js'),
('create-table-payment.js'),
('create-table-products.js'),
('create-table-user.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `forgotToken` varchar(255) DEFAULT NULL,
  `activeToken` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `password`, `phone`, `forgotToken`, `activeToken`, `role`, `createdAt`, `updatedAt`) VALUES
(10, 'LuongVinh', 'luongvinh@gmail.com', '$2a$10$oLFsIwD.XYLzmx7ocDrnhukMv1HbVgd/mCDm0ZLqFSxeeSMaGOVcq', '0332433744', NULL, NULL, 'admin', '2022-07-08 11:15:21', '2022-07-08 11:15:21'),
(11, 'vinh', 'vinhabc@gmail.com', '$2a$10$4Ew8hgCVudEmih7a97LAL.N7KcRgL5ldoJP2qdIqj/WsbegKfVBq.', '0124567123', NULL, NULL, 'user', '2022-07-09 11:16:02', '2022-07-09 11:16:02'),
(12, 'longtran', 'longtran@gmail.com', '$2a$10$uF3traU3f8wXCN5DVu7DXeM0ixwsbwMRldEMerkc2fS/po2QPObn.', '0258963147', NULL, NULL, 'user', '2022-07-09 14:06:21', '2022-07-09 14:06:21'),
(13, 'chocon', 'chocon@gmail.com', '$2a$10$P/pleb8KBMP6rzpKOk.KkO2PQFuozvD.6IC2jl33HYP0u25N4qp1G', '0145689754', NULL, NULL, 'user', '2022-07-10 02:34:25', '2022-07-10 02:34:25'),
(14, 'Vinh07', 'Vinh077@gmail.com', '$2a$10$S6OtChC.QsSbmIYYE6k2CetKDVsjy.q8HFrA3ENjMMVh1g5cJG..u', '0432598324', NULL, NULL, 'user', '2022-07-10 17:03:37', '2022-07-10 17:03:37'),
(15, 'chungtacuahientai', 'nothingatall@gmail.com', '$2a$10$U7yEPooCna6FwVpb94/Goem4qvo1GKsvTK3Q2/qnMDlx.iWERjz3C', '0123567890', NULL, NULL, 'user', '2022-07-11 08:37:59', '2022-07-11 08:37:59'),
(16, 'nothinghere', 'notit@gmail.com', '$2a$10$U7yEPooCna6FwVpb94/Goem4qvo1GKsvTK3Q2/qnMDlx.iWERjz3C', '0147258369', NULL, NULL, 'user', '2022-07-11 08:39:24', '2022-07-11 08:39:24'),
(17, 'cokhong', 'khongphaivay@gmail.com', '$2a$10$U7yEPooCna6FwVpb94/Goem4qvo1GKsvTK3Q2/qnMDlx.iWERjz3C', '0147852365', NULL, NULL, 'user', '2022-07-11 08:43:32', '2022-07-11 08:43:32'),
(19, 'vinh123', 'vinh@gmail.com', '$2a$10$HIzLK59DCXE7W/p5cXu0Ge56R5Zm/eVYmHTyLKN/Bxe9eBv1xRlA.', '0123456789', NULL, NULL, 'user', '2022-07-11 12:48:54', '2022-07-11 12:48:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_fkey_constraint_user` (`userId`),
  ADD KEY `cart_fkey_constraint_product` (`productId`);

--
-- Indexes for table `customerinfos`
--
ALTER TABLE `customerinfos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logintokens`
--
ALTER TABLE `logintokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logintoken_fkey_constraint_user` (`userId`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetail_fkey_constraint_order` (`orderId`),
  ADD KEY `orderdetail_fkey_constraint_product` (`productId`),
  ADD KEY `CustomerInfos_fkey_constraint_orderdetails` (`customerInfoId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_fkey_constraint_user` (`userId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_fkey_constraint_user` (`userId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `customerinfos`
--
ALTER TABLE `customerinfos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `logintokens`
--
ALTER TABLE `logintokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `cart_fkey_constraint_product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_fkey_constraint_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logintokens`
--
ALTER TABLE `logintokens`
  ADD CONSTRAINT `logintoken_fkey_constraint_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `CustomerInfos_fkey_constraint_orderdetails` FOREIGN KEY (`customerInfoId`) REFERENCES `customerinfos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_fkey_constraint_order` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_fkey_constraint_product` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_fkey_constraint_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payment_fkey_constraint_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
