-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 21 dec 2015 om 17:14
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
-- Tabelstructuur voor tabel `answerRecNine`
--

CREATE TABLE IF NOT EXISTS `answerRecNine` (
  `user_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pleasant` int(11) NOT NULL,
  `relevant` int(11) NOT NULL,
  `unexpected` int(11) NOT NULL,
  `interesting` int(11) NOT NULL,
  `cosineLike` double NOT NULL,
  `cosineDislike` double NOT NULL,
  `sortRec` text,
  `know` text,
  `like` text,
  PRIMARY KEY (`user_id`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden uitgevoerd voor tabel `answerRecNine`
--

INSERT INTO `answerRecNine` (`user_id`, `start_date`, `pleasant`, `relevant`, `unexpected`, `interesting`, `cosineLike`, `cosineDislike`, `sortRec`, `know`, `like`) VALUES
(15062, '2015-11-03 06:13:04', 1, 5, 5, 1, 0, -1, 'linked data', '2', '2'),
(18343, '2015-11-16 15:33:08', 3, 3, 3, 3, 0.2, -1, 'both', '1', '2'),
(30244, '2015-10-31 08:33:28', 3, 3, 3, 3, 0.4, 0, 'both', '2', '1'),
(31864, '2015-11-09 01:33:35', 2, 4, 2, 2, 0, -1, 'linked data', '2', '2'),
(33290, '2015-10-30 21:14:05', 1, 1, 1, 4, 0.2, 0, 'both', '1', '1'),
(35634, '2015-10-28 14:36:00', 1, 5, 5, 1, 0.4, 0.0957377759607, 'metadata', '1', '2'),
(39178, '2015-10-30 14:36:15', 1, 5, 5, 1, 0.370790811899, 0.166666666667, 'metadata', '1', '2'),
(40732, '2015-10-29 11:25:29', 2, 4, 4, 2, 0.4, 0, 'linked data', '2', '2'),
(43574, '2015-10-29 08:12:44', 5, 1, 1, 5, 0.4, 0, 'linked data', '2', '1'),
(43661, '2015-11-08 20:53:41', 3, 3, 3, 3, 0.4, 0, 'linked data', '2', '2'),
(44770, '2015-10-30 12:13:13', 3, 2, 4, 3, 0.2, 0, 'linked data', '1', '1'),
(53730, '2015-10-29 08:59:01', 4, 2, 3, 4, 0.4, -1, 'both', '1', '1'),
(56374, '2015-11-15 13:28:19', 2, 2, 2, 2, 0.5, -1, 'metadata', '2', '2'),
(69247, '2015-11-28 17:37:21', 4, 3, 4, 3, 0, 0.102062072616, 'both', '1', '1'),
(71397, '2015-11-04 13:18:43', 3, 3, 3, 3, 0.278470065542, -1, 'metadata', '2', '2'),
(78947, '2015-11-01 17:35:30', 4, 2, 1, 5, 0.2, 0.0721687836487, 'both', '1', '1'),
(82501, '2015-10-28 15:40:48', 4, 2, 3, 4, 0.2, 0, 'linked data', '1', '1'),
(83493, '2015-10-29 13:42:22', 1, 4, 2, 2, 0.255893973707, 0.026560635763, 'metadata', '2', '2'),
(86443, '2015-10-30 15:36:12', 2, 4, 3, 2, 0.2, 0.333333333333333, 'metadata', '1', '2'),
(88475, '2015-10-22 14:17:43', 2, 4, 4, 4, 0.4, -1, 'linked data', '2', '2'),
(89831, '2015-10-22 21:36:16', 1, 2, 2, 1, 0.166666666667, -1, 'linked data', '2', '2'),
(91021, '2015-11-03 20:03:15', 3, 3, 3, 3, 0.4, -1, 'both', '2', '2'),
(95565, '2015-10-28 22:02:15', 3, 3, 4, 4, 0.4, -1, 'linked data', '1', '1'),
(95859, '2015-10-28 20:24:39', 3, 3, 3, 3, 0.2, -1, 'linked data', '1', '1'),
(101854, '2015-11-17 19:37:24', 2, 4, 4, 2, 0.2, 0.125, 'metadata', '1', '2'),
(102847, '2015-10-29 04:33:14', 1, 5, 5, 1, 0.0490290337845, 0.013103560459, 'both', '2', '2'),
(104246, '2015-11-11 16:59:51', 2, 4, 4, 2, 0, 0.143365496944, 'metadata', '2', '2'),
(110202, '2015-11-04 19:30:30', 1, 5, 5, 1, 0.204124145232, 0, 'linked data', '2', '2'),
(117455, '2015-10-28 15:45:18', 3, 3, 3, 3, 0, 0, 'both', '1', '1'),
(123545, '2015-10-28 14:53:08', 4, 2, 2, 4, 0.4, 0, 'linked data', '1', '1'),
(129338, '2015-11-15 13:41:39', 3, 2, 3, 3, 0.4, -1, 'both', '1', '1'),
(132295, '2015-11-10 10:38:23', 2, 3, 2, 1, 0.344337567297, -1, 'linked data', '1', '2'),
(132838, '2015-11-10 16:05:43', 2, 4, 3, 3, 0.2, 0.0551198189805, 'metadata', '2', '2'),
(138125, '2015-10-29 07:44:10', 1, 5, 5, 1, 0.2, 0, 'both', '2', '2'),
(139815, '2015-11-09 12:46:45', 4, 2, 4, 3, 0.2, 0, 'linked data', '2', '1'),
(144440, '2015-11-24 19:24:31', 3, 2, 3, 4, 0.4, -1, 'both', '2', '1'),
(150465, '2015-11-01 19:25:58', 4, 2, 2, 4, 0.4, 0, 'linked data', '2', '1'),
(156995, '2015-11-01 15:24:15', 2, 4, 3, 3, 0.4, 0, 'both', '2', '2'),
(177271, '2015-10-29 22:44:11', 4, 2, 1, 5, 0.2, 0, 'linked data', '1', '1'),
(181685, '2015-11-14 08:25:14', 2, 2, 2, 3, 0.0536915100117, 0, 'linked data', '1', '1'),
(184836, '2015-10-31 18:15:29', 2, 5, 3, 1, 0.4, 0, 'linked data', '1', '2'),
(185258, '2015-10-31 08:34:18', 2, 4, 4, 2, 0.166666666667, 0, 'metadata', '2', '2'),
(188180, '2015-11-01 15:25:31', 3, 2, 3, 4, 0.2, 0.0721687836487, 'both', '1', '1'),
(189680, '2015-10-29 12:37:46', 3, 3, 3, 3, 0.306086050623, -1, 'metadata', '2', '2'),
(191261, '2015-10-29 21:16:30', 2, 1, 2, 4, 0.2, 0, 'linked data', '1', '1'),
(193183, '2015-11-07 00:04:47', 4, 2, 3, 4, 0.4, 0, 'linked data', '2', '1'),
(198317, '2015-11-01 12:00:13', 5, 1, 1, 5, 0.4, 0, 'metadata', '1', '1'),
(200194, '2015-10-28 16:34:23', 3, 3, 5, 2, 0.2, -1, 'both', '1', '2'),
(200927, '2015-11-14 11:28:24', 4, 2, 1, 5, 0.4, -1, 'both', '2', '1'),
(201682, '2015-10-29 09:30:22', 2, 2, 2, 2, 0.2, -1, 'metadata', '2', '2'),
(203153, '2015-11-20 18:02:43', 4, 2, 4, 4, 0.2, 0, 'linked data', '1', '1'),
(211234, '2015-11-13 09:20:00', 3, 3, 3, 3, 0.4, 0, 'metadata', '2', '2'),
(214509, '2015-11-03 00:13:47', 4, 2, 2, 4, 0.4, 0, 'both', '2', '1'),
(216440, '2015-10-29 09:29:16', 2, 4, 3, 2, 0, -1, 'metadata', '2', '2'),
(221057, '2015-10-28 15:56:12', 1, 5, 5, 1, 0.295643546459, 0.0919341727968, 'metadata', '2', '2'),
(229936, '2015-11-23 18:14:46', 4, 2, 2, 4, 0.4, 0, 'linked data', '2', '1'),
(229972, '2015-10-29 07:56:18', 1, 5, 5, 1, 0.2, 0.166666666667, 'metadata', '2', '2'),
(230352, '2015-11-26 09:26:28', 3, 3, 2, 3, 0.0382727752451, 0, 'both', '2', '1'),
(232484, '2015-11-14 10:24:53', 5, 4, 4, 3, 0.2, -1, 'both', '2', '1'),
(232713, '2015-10-28 16:17:12', 4, 4, 4, 4, 0.346225044865, -1, 'metadata', '1', '1'),
(233099, '2015-11-25 01:44:13', 4, 2, 4, 4, 0.4, 0, 'linked data', '1', '1'),
(234452, '2015-10-31 15:12:56', 1, 4, 4, 2, 0.2, 0, 'linked data', '1', '2'),
(235357, '2015-11-10 15:53:58', 4, 3, 2, 3, 0.4, 0, 'both', '2', '1'),
(235742, '2015-11-08 10:23:28', 2, 4, 4, 2, 0.4, 0, 'both', '2', '2'),
(241678, '2015-11-18 16:15:18', 2, 3, 3, 3, 0.4, 0, 'linked data', '2', '2'),
(247933, '2015-10-30 09:26:42', 3, 1, 2, 5, 0.0892689309429, 0, 'metadata', '1', '1'),
(248080, '2015-11-15 14:33:38', 1, 5, 5, 1, 0.4, 0, 'linked data', '2', '2'),
(249599, '2015-11-22 12:58:44', 1, 5, 5, 1, 0.2, 0.0308166775681, 'metadata', '2', '2'),
(259808, '2015-11-19 18:21:30', 5, 1, 3, 4, 0.4, 0.0504950552728, 'metadata', '2', '1'),
(269240, '2015-11-03 23:52:57', 3, 3, 4, 2, 0.4, 0, 'linked data', '2', '2'),
(270974, '2015-11-03 17:54:11', 2, 4, 4, 1, 0.4, 0.0835601696795, 'metadata', '2', '2'),
(273186, '2015-10-28 14:41:29', 1, 1, 4, 1, 0.0420944043011, -1, 'linked data', '2', '2'),
(275979, '2015-11-02 00:25:23', 1, 5, 5, 1, 0, 0, 'both', '2', '2'),
(287071, '2015-11-01 13:04:35', 4, 2, 3, 4, 0.4, 0, 'both', '2', '1'),
(287493, '2015-10-31 19:55:42', 1, 5, 5, 1, 0.4, 0.0211603125733, 'both', '2', '2'),
(288916, '2015-10-28 14:18:03', 3, 3, 4, 3, 0.2, 0, 'linked data', '2', '2'),
(293791, '2015-11-04 09:51:47', 5, 1, 4, 4, 0.4, 0, 'linked data', '2', '1'),
(300382, '2015-11-10 16:20:41', 3, 3, 4, 2, 0.2, 0, 'linked data', '2', '2'),
(305009, '2015-11-07 16:39:27', 1, 5, 4, 1, 0.4, 0, 'linked data', '2', '2'),
(318405, '2015-11-24 18:09:52', 1, 5, 5, 1, 0.2, 0.0256494588021, 'both', '1', '2'),
(337380, '2015-10-29 09:50:55', 4, 2, 2, 4, 0.2, 0, 'metadata', '2', '1'),
(339475, '2015-10-30 21:51:59', 2, 2, 3, 3, 0.2, 0.0314970394174, 'both', '1', '1'),
(344736, '2015-11-02 23:34:04', 4, 2, 4, 4, 0.4, 0, 'linked data', '1', '1'),
(345889, '2015-10-30 13:11:52', 2, 4, 3, 3, 0.4, 0.0360037748459, 'both', '2', '2'),
(348579, '2015-10-29 07:58:12', 2, 2, 2, 2, 0.4, 0.0120281306081, 'both', '2', '2'),
(355806, '2015-11-01 00:34:07', 4, 1, 4, 4, 0.2, 0, 'metadata', '1', '1'),
(356895, '2015-10-29 12:07:43', 2, 4, 4, 2, 0, 0, 'linked data', '2', '2'),
(367493, '2015-11-15 11:54:14', 1, 5, 2, 2, 0.2, 0, 'linked data', '2', '2'),
(373152, '2015-11-13 01:56:33', 3, 3, 3, 3, 0.2, -1, 'linked data', '2', '2'),
(377294, '2015-11-04 23:22:17', 2, 4, 4, 3, 0.127427369425, 0, 'linked data', '2', '2'),
(377393, '2015-11-11 04:46:03', 4, 2, 3, 4, 0.4, 0, 'metadata', '2', '1'),
(385425, '2015-11-05 13:57:50', 5, 2, 3, 3, 0.2, -1, 'metadata', '1', '1'),
(387486, '2015-11-07 13:56:56', 1, 5, 5, 1, -1, 0.166666666667, 'metadata', '2', '2'),
(390555, '2015-10-28 14:18:47', 4, 2, 3, 3, 0.4, 0, 'metadata', '1', '1'),
(394938, '2015-11-24 13:04:50', 3, 4, 5, 2, 0.0979764200176, 0.0245145168923, 'both', '1', '2'),
(395078, '2015-10-31 13:39:57', 4, 2, 2, 4, 0.404124145232, 0, 'linked data', '2', '1'),
(395573, '2015-11-08 22:26:21', 4, 2, 3, 4, 0.4, 0, 'both', '1', '1'),
(404650, '2015-11-04 19:35:48', 3, 1, 1, 5, 0.2, 0, 'linked data', '1', '1'),
(407089, '2015-11-12 15:05:57', 2, 2, 2, 4, 0.4, -1, 'linked data', '1', '1'),
(409110, '2015-10-29 12:41:09', 5, 1, 1, 5, 0.4, -1, 'linked data', '2', '1'),
(410368, '2015-11-07 19:53:09', 5, 4, 3, 2, 0.4, -1, 'linked data', '2', '2'),
(411273, '2015-11-03 20:41:40', 1, 5, 5, 1, 0.2, 0, 'both', '1', '2'),
(422006, '2015-11-02 02:03:35', 4, 1, 3, 3, 0.4, 0, 'both', '2', '1'),
(428469, '2015-11-16 08:41:32', 1, 5, 5, 1, 0.0833333333333, 0.133967252298, 'both', '2', '2'),
(454156, '2015-11-07 16:07:04', 5, 1, 3, 5, 0.4, 0, 'linked data', '2', '1'),
(458510, '2015-11-03 09:03:31', 4, 1, 2, 4, 0.4, -1, 'both', '2', '1'),
(465970, '2015-11-03 21:32:09', 3, 2, 3, 4, 0.4, -1, 'linked data', '2', '1'),
(479914, '2015-10-28 15:26:37', 2, 5, 3, 3, 0, 0.211880463942, 'metadata', '2', '2'),
(489842, '2015-10-31 09:51:28', 2, 2, 2, 2, 0.287267799625, -1, 'both', '1', '2'),
(494850, '2015-10-30 10:34:53', 3, 3, 3, 3, 0.333333333333, -1, 'metadata', '2', '1'),
(495381, '2015-10-29 11:13:31', 3, 3, 3, 3, 0.2, 0, 'both', '1', '2'),
(498923, '2015-11-10 01:14:41', 5, 1, 5, 1, 0.2, -1, 'both', '2', '2'),
(504091, '2015-11-08 08:32:48', 3, 1, 3, 5, 0.2, -1, 'both', '1', '1'),
(519409, '2015-11-22 08:53:28', 3, 3, 3, 3, 0.4, 0, 'metadata', '2', '2'),
(520698, '2015-10-30 22:34:06', 3, 3, 3, 3, 0.4, -1, 'metadata', '2', '2'),
(520743, '2015-11-04 10:27:41', 2, 3, 4, 2, 0.4, 0, 'linked data', '1', '2'),
(524629, '2015-10-29 06:14:21', 4, 2, 4, 4, 0.151374715077, 0.0408248290464, 'both', '1', '1'),
(526050, '2015-11-01 16:56:11', 3, 3, 3, 3, 0.222222222222, 0, 'linked data', '1', '1'),
(528019, '2015-11-10 16:47:26', 1, 5, 5, 1, 0.2, -1, 'metadata', '2', '2'),
(531538, '2015-10-29 06:46:11', 3, 1, 1, 5, 0.2, 0.102062072616, 'both', '1', '1'),
(534658, '2015-10-22 10:20:21', 2, 2, 2, 3, 0.0208333333333, 0, 'linked data', '2', '1'),
(538604, '2015-10-29 04:28:48', 2, 1, 1, 1, 0.4, -1, 'both', '2', '2'),
(538604, '2015-10-29 04:28:52', 2, 1, 1, 1, 0.4, -1, 'both', '2', '2'),
(542373, '2015-11-12 22:33:20', 4, 2, 3, 3, 0.5, 0, 'metadata', '2', '1'),
(546576, '2015-11-18 16:44:43', 1, 5, 5, 1, 0.4, 0, 'both', '2', '2'),
(549551, '2015-10-28 15:17:15', 4, 2, 3, 4, 0.4, 0, 'both', '2', '1'),
(555797, '2015-10-28 14:28:52', 2, 4, 4, 2, 0.2, 0.166666666667, 'both', '2', '2'),
(558245, '2015-10-31 14:53:11', 4, 2, 2, 4, 0.4, 0, 'linked data', '2', '1'),
(561701, '2015-10-30 09:16:48', 5, 1, 1, 5, 0.0666666666667, 0, 'linked data', '2', '1'),
(568389, '2015-11-13 10:44:58', 4, 3, 3, 4, 0.4, 0, 'linked data', '2', '1'),
(578114, '2015-10-28 18:02:03', 4, 2, 2, 4, 0.1235969373, 0, 'both', '1', '1'),
(582352, '2015-11-26 17:25:07', 3, 3, 3, 3, 0.26907323222, -1, 'linked data', '1', '1'),
(592556, '2015-10-28 14:53:56', 2, 5, 4, 1, 0.408248290463863, 0.306186217848, 'metadata', '2', '2'),
(593967, '2015-11-12 16:57:59', 4, 2, 4, 4, 0.4, 0, 'linked data', '2', '1'),
(608546, '2015-11-08 10:06:27', 5, 1, 1, 5, 0.348461712529, 0.136082763488, 'metadata', '1', '1'),
(615757, '2015-11-03 22:58:30', 4, 2, 4, 4, 0.54020690872, -1, 'metadata', '2', '1'),
(618535, '2015-11-03 15:58:47', 3, 3, 3, 3, 0.553553390593, -1, 'linked data', '2', '2'),
(618656, '2015-11-16 12:22:17', 4, 1, 2, 4, 0.221128856368, 0, 'linked data', '1', '1'),
(619199, '2015-11-10 22:14:21', 1, 5, 5, 1, 0.0416666666667, 0.0277777777778, 'both', '2', '2'),
(620464, '2015-11-01 06:42:09', 4, 1, 3, 4, 0.2, -1, 'linked data', '2', '1'),
(628198, '2015-10-29 00:30:03', 2, 4, 4, 2, 0.4, -1, 'metadata', '2', '2'),
(632674, '2015-10-29 09:04:06', 5, 2, 3, 4, 0.4, -1, 'both', '1', '1'),
(637808, '2015-10-29 16:30:46', 5, 3, 3, 4, 0.4, 0, 'both', '2', '1'),
(641081, '2015-10-28 16:12:47', 1, 4, 3, 2, 0.2, 0, 'linked data', '2', '2'),
(648930, '2015-11-23 13:35:32', 2, 4, 4, 2, 0.4, 0, 'linked data', '2', '2'),
(665541, '2015-10-29 12:59:16', 3, 3, 4, 4, 0.117851130198, 0, 'both', '1', '1'),
(667842, '2015-10-28 15:27:01', 3, 3, 3, 3, 0.0894427191, 0, 'linked data', '1', '1'),
(671653, '2015-10-31 20:39:59', 3, 3, 4, 2, 0.4, 0, 'both', '2', '1'),
(673570, '2015-10-29 00:30:46', 5, 1, 1, 5, 0.4, 0, 'linked data', '2', '1'),
(677245, '2015-11-10 01:08:59', 1, 5, 4, 1, 0.2, 0, 'both', '1', '2'),
(678140, '2015-11-21 00:23:12', 3, 3, 3, 3, 0.4, -1, 'metadata', '2', '2'),
(685811, '2015-11-04 15:18:00', 5, 2, 3, 3, 0.4, -1, 'metadata', '2', '1'),
(688107, '2015-11-28 03:02:58', 2, 2, 4, 2, 0.4, -1, 'metadata', '2', '2'),
(695274, '2015-11-07 16:04:43', 3, 3, 3, 3, 0.102062072616, 0, 'linked data', '2', '2'),
(696950, '2015-11-02 16:46:52', 2, 4, 4, 3, 0.2, 0.0245145168923, 'both', '2', '2'),
(697101, '2015-11-22 12:48:14', 1, 5, 5, 1, 0.344337567297, 0.0487950036474267, 'both', '2', '2'),
(702767, '2015-11-15 10:48:31', 3, 3, 3, 3, 0.25, -1, 'both', '2', '2'),
(712642, '2015-11-03 00:05:34', 3, 2, 2, 3, 0.4, 0, 'both', '1', '1'),
(716561, '2015-11-03 12:32:48', 1, 5, 5, 1, 0.2, 0, 'both', '2', '2'),
(717619, '2015-10-30 16:53:50', 4, 2, 2, 4, 0.4, 0, 'linked data', '2', '1'),
(718147, '2015-11-14 20:30:57', 2, 5, 4, 1, 0.4, 0, 'linked data', '2', '2'),
(720653, '2015-10-28 14:14:08', 2, 2, 2, 4, 0.553553390593, 0, 'linked data', '2', '1'),
(723605, '2015-10-31 12:12:35', 4, 2, 3, 4, 0.404124145232, 0.148316324759, 'metadata', '2', '1'),
(727366, '2015-10-28 16:05:40', 1, 5, 5, 1, 0.4, 0, 'metadata', '2', '2'),
(729021, '2015-11-27 11:35:59', 5, 1, 4, 5, 0.271579439605, 0, 'metadata', '1', '1'),
(731266, '2015-10-30 11:06:46', 3, 2, 3, 4, 0.375, 0, 'metadata', '1', '1'),
(733643, '2015-11-25 17:54:37', 2, 1, 2, 5, 0.2, 0.0511739259238, 'both', '1', '1'),
(738760, '2015-11-07 17:31:31', 4, 2, 2, 4, 0.017766726363, 0, 'linked data', '1', '1'),
(751482, '2015-10-30 12:46:54', 4, 3, 3, 3, 0.326268228522, 0, 'metadata', '2', '1'),
(755192, '2015-11-07 13:29:28', 3, 3, 3, 3, 0.2, 0.0258198889747, 'metadata', '2', '2'),
(755930, '2015-11-01 08:43:39', 3, 4, 3, 5, 0.5, -1, 'linked data', '2', '2'),
(756299, '2015-10-29 20:24:47', 2, 4, 5, 1, 0.4, 0, 'linked data', '2', '2'),
(756822, '2015-11-12 12:13:58', 3, 3, 3, 3, 0.4, -1, 'linked data', '2', '2'),
(759878, '2015-11-03 09:50:13', 3, 3, 3, 3, 0.5, 0, 'both', '1', '2'),
(764947, '2015-10-28 22:03:07', 5, 1, 3, 3, 0.2, -1, 'both', '2', '2'),
(767143, '2015-11-08 11:31:10', 3, 3, 3, 3, 0.383276638087, 0.126967725119, 'metadata', '1', '1'),
(773585, '2015-10-28 08:44:10', 5, 1, 4, 4, 0.2, 0, 'both', '2', '1'),
(779502, '2015-11-26 00:54:34', 4, 2, 3, 4, 0.458565772236, 0, 'metadata', '1', '1'),
(782428, '2015-10-28 22:05:37', 1, 5, 3, 1, 0, -1, 'metadata', '2', '2'),
(787066, '2015-10-29 03:22:12', 3, 3, 2, 4, 0.2, -1, 'linked data', '2', '2'),
(787855, '2015-11-15 17:51:44', 4, 2, 4, 3, 0.4, 0, 'both', '2', '1'),
(790097, '2015-11-25 16:34:15', 3, 4, 3, 2, 0.4, 0, 'both', '2', '2'),
(790430, '2015-11-03 15:28:50', 4, 2, 2, 4, 0.4, 0, 'linked data', '2', '1'),
(791985, '2015-11-12 14:47:49', 3, 2, 2, 4, 0.2, 0.144337567297, 'metadata', '1', '1'),
(792984, '2015-11-22 23:02:06', 4, 1, 1, 5, 0.2, 0, 'both', '1', '1'),
(793164, '2015-10-29 16:01:48', 1, 4, 4, 2, 0.2, -1, 'both', '2', '2'),
(794830, '2015-11-12 12:39:55', 4, 4, 4, 4, 0.166666666667, -1, 'metadata', '1', '1'),
(798756, '2015-11-07 12:54:09', 4, 2, 3, 3, 0.2, -1, 'metadata', '2', '1'),
(803882, '2015-11-18 11:06:00', 3, 3, 3, 3, 0.2, 0.19245008973, 'metadata', '1', '1'),
(803998, '2015-10-29 20:33:07', 2, 4, 4, 2, 0, -1, 'linked data', '2', '2'),
(806242, '2015-11-20 18:42:58', 3, 2, 2, 4, 0.4, -1, 'both', '1', '1'),
(808305, '2015-11-01 13:02:33', 2, 4, 4, 2, 0.2, 0, 'linked data', '2', '2'),
(808414, '2015-11-09 15:46:44', 2, 4, 3, 2, 0.4, -1, 'both', '2', '2'),
(814568, '2015-11-02 08:35:10', 4, 2, 3, 4, 0, -1, 'metadata', '2', '1'),
(821981, '2015-10-28 18:26:12', 1, 5, 5, 1, 0.272165526976, 0.166666666667, 'metadata', '2', '2'),
(836822, '2015-10-31 09:42:42', 2, 4, 4, 2, 0.227032572497, 0, 'linked data', '2', '2'),
(844696, '2015-10-28 20:48:20', 1, 4, 4, 1, 0.102062072616, 0.111111111111, 'both', '2', '2'),
(846027, '2015-11-11 21:35:36', 1, 1, 5, 5, 0.4, -1, 'linked data', '1', '1'),
(850495, '2015-10-28 15:43:45', 5, 1, 3, 4, 0.4, 0, 'linked data', '1', '1'),
(874921, '2015-10-31 22:23:10', 5, 5, 5, 5, 0.2, -1, 'linked data', '1', '1'),
(899059, '2015-10-29 22:53:20', 3, 3, 3, 3, 0.4, 0, 'metadata', '2', '2'),
(905580, '2015-11-15 14:53:34', 4, 2, 3, 3, 0.333333333333333, 0.051031036308, 'metadata', '2', '1'),
(906361, '2015-10-28 14:44:09', 2, 4, 4, 3, 0.2, 0, 'linked data', '2', '2'),
(907100, '2015-10-28 09:03:15', 1, 5, 4, 1, 0.5, -1, 'metadata', '2', '2'),
(916570, '2015-11-04 17:16:54', 3, 3, 2, 3, 0.2, -1, 'both', '2', '1'),
(918097, '2015-11-15 20:11:09', 2, 4, 2, 2, 0.4, 0.104443644867, 'both', '2', '2'),
(920818, '2015-10-29 12:33:20', 5, 1, 1, 5, 0.2, -1, 'both', '1', '1'),
(921819, '2015-11-02 21:15:27', 2, 4, 4, 2, 0.4, 0, 'both', '1', '2'),
(922493, '2015-10-29 18:10:31', 3, 3, 3, 3, 0.0555555555556, 0, 'linked data', '2', '2'),
(924055, '2015-10-28 17:58:39', 2, 4, 4, 2, 0.2, 0.11995696513, 'metadata', '2', '2'),
(932577, '2015-10-31 18:00:59', 2, 4, 4, 2, 0.0257172249937, -1, 'both', '2', '2'),
(936347, '2015-10-28 21:08:16', 3, 3, 3, 3, 0.0284901441149, 0, 'linked data', '2', '2'),
(940877, '2015-11-03 00:41:19', 2, 2, 3, 3, 0.4, 0, 'both', '2', '1'),
(942238, '2015-11-08 20:34:15', 2, 4, 3, 3, 0.4, 0, 'linked data', '2', '1'),
(944297, '2015-11-24 08:33:29', 4, 2, 3, 4, 0.4, -1, 'both', '1', '1'),
(948218, '2015-10-28 16:21:51', 3, 4, 3, 3, 0.2, 0.11909160254, 'metadata', '2', '2'),
(959078, '2015-10-28 20:17:20', 4, 2, 4, 2, 0.170710678119, 0, 'metadata', '2', '1'),
(962124, '2015-10-29 00:47:02', 4, 2, 4, 4, 0.2, 0, 'metadata', '2', '1'),
(965815, '2015-10-28 16:29:59', 2, 4, 2, 2, 0, -1, 'both', '2', '2'),
(966249, '2015-11-20 18:16:23', 1, 5, 2, 1, 0.4, -1, 'both', '1', '2'),
(970762, '2015-10-28 18:36:24', 3, 2, 2, 4, 0, 0, 'linked data', '1', '1'),
(971579, '2015-11-29 18:15:13', 2, 2, 2, 2, 0.408248290464, -1, 'linked data', '2', '2'),
(971839, '2015-11-06 21:35:48', 2, 4, 3, 3, 0.4, 0, 'linked data', '2', '2'),
(977509, '2015-11-23 13:06:59', 4, 2, 3, 3, -1, 0.216242308813, 'linked data', '2', '1'),
(981977, '2015-11-19 19:18:07', 4, 2, 3, 3, 0.4, 0, 'both', '2', '1'),
(985762, '2015-11-22 10:00:38', 1, 5, 5, 1, -1, 0.208333333333, 'both', '2', '2'),
(988267, '2015-11-29 17:30:11', 3, 2, 2, 3, 0.521090601279, -1, 'metadata', '1', '1'),
(996231, '2015-10-30 08:11:40', 2, 4, 4, 2, 0.353553390593, 0, 'metadata', '2', '2'),
(997208, '2015-10-28 14:14:31', 4, 2, 2, 4, 0.032075014955, 0, 'both', '1', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;