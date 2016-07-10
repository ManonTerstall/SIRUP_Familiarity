-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 21 dec 2015 om 17:15
-- Serverversie: 5.5.46-cll
-- PHP-versie: 5.4.42

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `wmprojec_vistatv`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usersStart`
--

CREATE TABLE IF NOT EXISTS `usersStart` (
  `user_id` int(11) NOT NULL,
  `date_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`date_start`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `usersStart`
--

INSERT INTO `usersStart` (`user_id`, `date_start`) VALUES
(0, '2015-10-28 18:40:37'),
(0, '2015-10-29 20:27:36'),
(0, '2015-10-29 21:13:23'),
(0, '2015-10-30 16:46:55'),
(0, '2015-11-01 17:28:48'),
(0, '2015-11-03 09:47:19'),
(0, '2015-11-04 20:15:15'),
(0, '2015-11-07 13:46:35'),
(0, '2015-11-07 17:16:59'),
(0, '2015-11-08 22:16:15'),
(0, '2015-11-12 17:00:25'),
(0, '2015-11-14 08:19:55'),
(0, '2015-11-19 18:29:48'),
(0, '2015-11-27 11:30:17'),
(2284, '2015-11-09 21:10:43'),
(15062, '2015-11-03 06:07:52'),
(18343, '2015-11-16 15:26:51'),
(30244, '2015-10-31 08:28:28'),
(31146, '2015-11-15 19:54:19'),
(31864, '2015-11-09 01:27:51'),
(33290, '2015-10-30 21:08:02'),
(33761, '2015-11-09 10:14:12'),
(35634, '2015-10-28 14:32:57'),
(38839, '2015-11-18 22:58:15'),
(39178, '2015-10-30 14:31:30'),
(40732, '2015-10-29 11:18:14'),
(43574, '2015-10-29 08:07:08'),
(43661, '2015-11-08 20:39:41'),
(44770, '2015-10-30 12:06:57'),
(49769, '2015-11-28 21:57:26'),
(53730, '2015-10-29 08:50:33'),
(54025, '2015-10-30 12:04:04'),
(56374, '2015-11-15 13:25:20'),
(57479, '2015-12-01 10:32:24'),
(69247, '2015-11-28 17:31:52'),
(71397, '2015-11-04 13:13:42'),
(71473, '2015-11-15 15:10:11'),
(75954, '2015-10-28 16:16:14'),
(75954, '2015-10-28 16:16:40'),
(76433, '2015-12-01 10:39:17'),
(78947, '2015-11-01 17:28:40'),
(80390, '2015-10-28 15:15:55'),
(82501, '2015-10-28 15:34:12'),
(83493, '2015-10-29 13:36:41'),
(86443, '2015-10-30 15:28:58'),
(88475, '2015-10-22 14:08:13'),
(89831, '2015-10-22 21:32:07'),
(91021, '2015-11-03 19:57:15'),
(95565, '2015-10-28 21:57:00'),
(95859, '2015-10-28 20:19:14'),
(101854, '2015-11-17 19:30:11'),
(102847, '2015-10-29 04:27:36'),
(104246, '2015-11-11 16:53:47'),
(105415, '2015-10-25 15:07:58'),
(110202, '2015-11-04 19:24:58'),
(111746, '2015-12-01 10:26:52'),
(113567, '2015-12-01 10:40:01'),
(117455, '2015-10-28 15:39:45'),
(123545, '2015-10-28 14:47:13'),
(129338, '2015-11-15 13:38:02'),
(129734, '2015-10-29 05:01:37'),
(132295, '2015-11-10 10:34:57'),
(132838, '2015-11-10 16:00:08'),
(134661, '2015-11-11 21:23:50'),
(138125, '2015-10-29 07:37:31'),
(139815, '2015-11-09 12:41:40'),
(141611, '2015-10-29 13:21:03'),
(144440, '2015-11-24 19:19:33'),
(148757, '2015-11-28 12:57:39'),
(150465, '2015-11-01 19:17:32'),
(156995, '2015-11-01 15:04:32'),
(157182, '2015-11-01 21:09:47'),
(177271, '2015-10-29 22:33:48'),
(180593, '2015-12-01 09:41:24'),
(181685, '2015-11-14 08:19:25'),
(184836, '2015-10-31 18:03:07'),
(185258, '2015-10-31 08:29:19'),
(188180, '2015-11-01 15:20:14'),
(189680, '2015-10-29 12:33:35'),
(191261, '2015-10-29 20:58:45'),
(193183, '2015-11-06 23:54:32'),
(198317, '2015-11-01 11:51:40'),
(200194, '2015-10-28 16:27:07'),
(200927, '2015-11-14 11:22:54'),
(201682, '2015-10-29 09:25:49'),
(203153, '2015-11-20 17:50:36'),
(211234, '2015-11-13 09:12:41'),
(214509, '2015-11-03 00:03:53'),
(216440, '2015-10-29 09:24:28'),
(218413, '2015-10-29 13:18:51'),
(221057, '2015-10-28 15:50:02'),
(228805, '2015-11-11 02:34:04'),
(229936, '2015-11-23 18:06:29'),
(229972, '2015-10-29 07:50:57'),
(230352, '2015-11-26 09:19:59'),
(232484, '2015-11-14 10:22:26'),
(232713, '2015-10-28 16:10:55'),
(233099, '2015-11-25 01:35:59'),
(234452, '2015-10-31 15:09:03'),
(235357, '2015-11-10 15:43:29'),
(235742, '2015-11-08 10:15:02'),
(241678, '2015-11-18 16:10:06'),
(247933, '2015-10-30 09:16:00'),
(248080, '2015-11-15 14:28:55'),
(249599, '2015-11-22 12:55:05'),
(259808, '2015-11-19 18:14:42'),
(269240, '2015-11-03 23:48:02'),
(270974, '2015-11-03 17:45:18'),
(273186, '2015-10-28 14:06:38'),
(275979, '2015-11-02 00:19:11'),
(277170, '2015-10-22 21:58:14'),
(278372, '2015-10-24 16:14:08'),
(287071, '2015-11-01 12:59:02'),
(287493, '2015-10-31 19:50:13'),
(288916, '2015-10-28 14:14:07'),
(293791, '2015-11-04 09:44:17'),
(294842, '2015-12-01 10:29:55'),
(299563, '2015-11-27 23:40:49'),
(300382, '2015-11-10 16:14:55'),
(305009, '2015-11-07 16:33:57'),
(312114, '2015-10-29 04:23:54'),
(318405, '2015-11-24 17:58:47'),
(325334, '2015-10-29 07:50:54'),
(330105, '2015-11-14 00:22:44'),
(335267, '2015-11-11 16:18:46'),
(335921, '2015-10-29 02:11:14'),
(336172, '2015-10-30 23:30:50'),
(337380, '2015-10-29 09:43:45'),
(339475, '2015-10-30 21:48:21'),
(344736, '2015-11-02 23:26:30'),
(345889, '2015-10-30 13:05:23'),
(348579, '2015-10-29 07:53:17'),
(355806, '2015-11-01 00:28:50'),
(356895, '2015-10-29 12:01:06'),
(359089, '2015-11-22 15:54:32'),
(367493, '2015-11-15 11:49:05'),
(367834, '2015-10-31 00:43:17'),
(372979, '2015-10-22 13:01:10'),
(373152, '2015-11-13 01:53:28'),
(377294, '2015-11-04 23:14:51'),
(377393, '2015-11-11 04:40:51'),
(385425, '2015-11-05 13:51:40'),
(387036, '2015-11-01 19:31:10'),
(387486, '2015-11-07 13:50:09'),
(390555, '2015-10-28 14:10:19'),
(390877, '2015-11-01 22:00:26'),
(394938, '2015-11-24 12:53:51'),
(395078, '2015-10-31 13:35:41'),
(395535, '2015-11-01 18:21:27'),
(395573, '2015-11-08 22:15:44'),
(395578, '2015-10-22 22:14:27'),
(399137, '2015-10-31 22:41:44'),
(404650, '2015-11-04 19:30:37'),
(407089, '2015-11-12 14:59:58'),
(409110, '2015-10-29 12:37:06'),
(409945, '2015-10-30 23:33:01'),
(410368, '2015-11-07 19:48:47'),
(411273, '2015-11-03 20:35:47'),
(414802, '2015-11-20 23:20:46'),
(422006, '2015-11-02 01:58:47'),
(422105, '2015-11-09 21:13:39'),
(424125, '2015-11-10 00:19:39'),
(425915, '2015-11-09 15:39:11'),
(426585, '2015-10-28 16:39:00'),
(428469, '2015-11-16 08:35:29'),
(454156, '2015-11-07 15:58:50'),
(458510, '2015-11-03 08:56:53'),
(465970, '2015-11-03 21:29:22'),
(469200, '2015-11-03 15:54:12'),
(479914, '2015-10-28 15:21:32'),
(489842, '2015-10-31 09:49:42'),
(494850, '2015-10-30 10:32:19'),
(495381, '2015-10-29 07:04:42'),
(498923, '2015-11-10 01:09:25'),
(503722, '2015-11-04 19:35:22'),
(504091, '2015-11-08 08:27:06'),
(519409, '2015-11-22 08:49:42'),
(520698, '2015-10-30 22:30:58'),
(520743, '2015-11-04 10:15:14'),
(524629, '2015-10-29 06:08:42'),
(526050, '2015-11-01 16:50:00'),
(528019, '2015-11-10 16:42:08'),
(531538, '2015-10-29 06:41:15'),
(534178, '2015-11-04 14:29:36'),
(534658, '2015-10-22 10:12:42'),
(538604, '2015-10-29 04:22:01'),
(538604, '2015-10-29 04:24:19'),
(542373, '2015-11-12 22:28:13'),
(546576, '2015-11-18 16:38:59'),
(549551, '2015-10-28 15:12:27'),
(549838, '2015-11-07 17:16:27'),
(555797, '2015-10-28 14:19:33'),
(558245, '2015-10-31 14:44:56'),
(558973, '2015-10-29 22:26:01'),
(559483, '2015-10-29 07:01:36'),
(561701, '2015-10-30 09:11:06'),
(562694, '2015-11-14 10:30:32'),
(568389, '2015-11-13 10:38:36'),
(570820, '2015-12-01 10:29:12'),
(578114, '2015-10-28 17:57:57'),
(582352, '2015-11-26 17:18:37'),
(585847, '2015-10-22 21:56:16'),
(587363, '2015-11-01 14:58:02'),
(592556, '2015-10-28 14:49:33'),
(593967, '2015-11-12 16:52:33'),
(600570, '2015-11-13 22:08:44'),
(604129, '2015-11-15 21:18:11'),
(608546, '2015-11-08 10:02:03'),
(615757, '2015-11-03 22:53:22'),
(618535, '2015-11-03 15:53:00'),
(618656, '2015-11-16 11:42:04'),
(619199, '2015-11-10 22:09:39'),
(620381, '2015-12-01 10:20:41'),
(620464, '2015-11-01 06:33:50'),
(621523, '2015-11-08 10:00:03'),
(628198, '2015-10-29 00:23:30'),
(632674, '2015-10-29 09:00:45'),
(637808, '2015-10-29 16:24:43'),
(641081, '2015-10-28 16:05:03'),
(644005, '2015-12-01 10:35:34'),
(645078, '2015-10-22 22:16:01'),
(648930, '2015-11-23 13:30:17'),
(651673, '2015-10-22 13:01:14'),
(658896, '2015-10-30 16:20:23'),
(659158, '2015-10-29 04:16:20'),
(659158, '2015-10-29 04:16:21'),
(660824, '2015-11-18 23:26:42'),
(665541, '2015-10-29 12:56:17'),
(667842, '2015-10-28 15:18:13'),
(671653, '2015-10-31 20:31:26'),
(673570, '2015-10-29 00:19:51'),
(677245, '2015-11-10 00:58:05'),
(678140, '2015-11-21 00:20:25'),
(678314, '2015-11-19 19:00:31'),
(678803, '2015-10-28 14:35:48'),
(685811, '2015-11-04 15:06:39'),
(688107, '2015-11-28 02:57:00'),
(693543, '2015-11-28 18:17:06'),
(693994, '2015-10-29 11:17:00'),
(695274, '2015-11-07 16:00:32'),
(696241, '2015-11-09 12:39:24'),
(696950, '2015-11-02 16:40:22'),
(697101, '2015-11-22 12:43:06'),
(697737, '2015-10-30 16:19:27'),
(702767, '2015-11-15 10:44:42'),
(704671, '2015-10-31 18:17:21'),
(706238, '2015-11-29 11:38:10'),
(706611, '2015-10-30 12:01:45'),
(707616, '2015-10-23 11:48:31'),
(708226, '2015-11-25 10:46:05'),
(712642, '2015-11-02 23:54:28'),
(716561, '2015-11-03 12:24:46'),
(716906, '2015-10-22 21:58:20'),
(717619, '2015-10-30 16:46:23'),
(718147, '2015-11-14 20:24:25'),
(720653, '2015-10-28 14:10:17'),
(723605, '2015-10-31 12:06:45'),
(726083, '2015-11-03 15:37:44'),
(727366, '2015-10-28 15:59:32'),
(729021, '2015-11-27 11:29:38'),
(731266, '2015-10-30 11:01:23'),
(733643, '2015-11-25 17:35:07'),
(738727, '2015-11-25 10:05:47'),
(738760, '2015-11-07 17:19:00'),
(740415, '2015-10-28 14:46:26'),
(742767, '2015-11-03 06:04:44'),
(746490, '2015-11-01 18:23:21'),
(749947, '2015-10-28 14:00:00'),
(751482, '2015-10-30 12:35:48'),
(755192, '2015-11-07 13:25:44'),
(755930, '2015-11-01 08:41:55'),
(756299, '2015-10-29 20:17:09'),
(756822, '2015-11-12 12:10:50'),
(757439, '2015-10-25 15:33:44'),
(759878, '2015-11-03 09:46:47'),
(764040, '2015-10-22 22:15:30'),
(764947, '2015-10-28 21:58:03'),
(767143, '2015-11-08 11:26:13'),
(768717, '2015-10-22 22:00:46'),
(773585, '2015-10-28 08:38:10'),
(778826, '2015-12-01 10:41:07'),
(779502, '2015-11-26 00:48:57'),
(782428, '2015-10-28 21:53:53'),
(787066, '2015-10-29 03:16:52'),
(787855, '2015-11-15 17:45:02'),
(790097, '2015-11-25 16:29:36'),
(790430, '2015-11-03 15:20:50'),
(791985, '2015-11-12 14:41:06'),
(792984, '2015-11-22 22:56:25'),
(793164, '2015-10-29 15:54:23'),
(794830, '2015-11-12 12:36:20'),
(798756, '2015-11-07 12:41:16'),
(803882, '2015-11-18 11:02:12'),
(803998, '2015-10-29 20:27:00'),
(806242, '2015-11-20 18:39:30'),
(808305, '2015-11-01 12:56:24'),
(808414, '2015-11-09 15:41:07'),
(814568, '2015-11-02 08:27:28'),
(821981, '2015-10-28 18:17:23'),
(836822, '2015-10-31 09:37:08'),
(844453, '2015-12-01 13:28:47'),
(844696, '2015-10-28 20:41:07'),
(846027, '2015-11-11 21:31:45'),
(850495, '2015-10-28 15:36:15'),
(858475, '2015-10-31 22:21:28'),
(874921, '2015-10-31 22:18:58'),
(877420, '2015-10-22 15:23:43'),
(880619, '2015-10-30 08:35:09'),
(890617, '2015-11-01 12:53:13'),
(892164, '2015-11-04 01:27:40'),
(894275, '2015-10-28 14:29:45'),
(896101, '2015-10-29 18:50:26'),
(899059, '2015-10-29 22:47:56'),
(905580, '2015-11-15 14:49:37'),
(906361, '2015-10-28 14:38:47'),
(907100, '2015-10-28 08:57:22'),
(916570, '2015-11-04 17:08:00'),
(918097, '2015-11-15 20:04:37'),
(920818, '2015-10-29 12:26:16'),
(921819, '2015-11-02 21:07:40'),
(922493, '2015-10-29 18:01:54'),
(924055, '2015-10-28 17:53:20'),
(926559, '2015-10-29 20:22:10'),
(932577, '2015-10-31 17:56:10'),
(936347, '2015-10-28 21:03:29'),
(937450, '2015-10-28 15:10:55'),
(939096, '2015-11-03 19:47:51'),
(940877, '2015-11-03 00:37:40'),
(942238, '2015-11-08 20:29:07'),
(944297, '2015-11-24 08:29:11'),
(945334, '2015-11-26 16:40:49'),
(948218, '2015-10-28 16:18:00'),
(959078, '2015-10-28 20:09:23'),
(959787, '2015-11-13 22:10:46'),
(962124, '2015-10-29 00:37:48'),
(965815, '2015-10-28 16:24:39'),
(966249, '2015-11-20 18:09:10'),
(967894, '2015-10-22 22:04:17'),
(970762, '2015-10-28 18:30:27'),
(971579, '2015-11-29 18:13:31'),
(971839, '2015-11-06 21:29:50'),
(976989, '2015-10-30 23:39:17'),
(977509, '2015-11-23 13:00:36'),
(981921, '2015-12-01 10:32:58'),
(981977, '2015-11-19 19:05:13'),
(985762, '2015-11-22 09:55:15'),
(988267, '2015-11-29 17:22:45'),
(993102, '2015-10-29 01:53:20'),
(996231, '2015-10-30 08:05:53'),
(997208, '2015-10-28 14:10:01'),
(999764, '2015-10-31 20:45:01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;