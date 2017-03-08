-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 05, 2017 at 11:11 
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrott`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_mrot_regions`
--

CREATE TABLE `wp_mrot_regions` (
  `id` int(11) NOT NULL,
  `region_id` int(3) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_mrot_regions`
--

INSERT INTO `wp_mrot_regions` (`id`, `region_id`, `alias`, `name1`, `name2`) VALUES
(1, 1, 'v-respublike-adygeya', 'Республика Адыгея', 'Республике Адыгея'),
(2, 4, 'v-respublike-altaj', 'Республика Алтай', 'Республике Алтай'),
(3, 2, 'v-respublike-bashkortostan', 'Республика Башкортостан', 'Республике Башкортостан'),
(4, 3, 'v-respublike-buryatiya', 'Республика Бурятия', 'Республике Бурятия'),
(5, 5, 'v-respublike-dagestan', 'Республика Дагестан', 'Республике Дагестан'),
(6, 6, 'v-respublike-ingushetiya', 'Республика Ингушетия', 'Республике Ингушетия'),
(7, 7, 'v-kabardino-balkarskoj-respublike', 'Кабардино-Балкарская республика', 'Кабардино-Балкарской республике'),
(8, 8, 'v-respublike-kalmykiya', 'Республика Калмыкия', 'Республике Калмыкия'),
(9, 9, 'v-karachaevo-cherkesskoj-respublike', 'Карачаево-Черкесская республика', 'Карачаево-Черкесской республике'),
(10, 10, 'v-respublike-kareliya', 'Республика Карелия', 'Республике Карелия'),
(11, 11, 'v-respublike-komi', 'Республика Коми', 'Республике Коми'),
(12, 91, 'v-respublike-krym', 'Республика Крым', 'Республике Крым'),
(13, 12, 'v-respublike-marij-ehl', 'Республика Марий Эл', 'Республике Марий Эл'),
(14, 13, 'v-respublike-mordoviya', 'Республика Мордовия', 'Республике Мордовия'),
(15, 14, 'v-respublike-saha-yakutiya', 'Республика Саха (Якутия)', 'Республике Саха (Якутия)'),
(16, 15, 'v-respublike-severnaya-osetiya-alaniya', 'Республика Северная Осетия — Алания', 'Республике Северная Осетия — Алания'),
(17, 16, 'v-respublike-tatarstan', 'Республика Татарстан', 'Республике Татарстан'),
(18, 17, 'v-respublike-tyva', 'Республика Тыва', 'Республике Тыва'),
(19, 18, 'v-udmurtskoj-respublike', 'Удмуртская республика', 'Удмуртской республике'),
(20, 19, 'v-respublike-hakasiya', 'Республика Хакасия', 'Республике Хакасия'),
(21, 20, 'v-chechenskoj-respublike', 'Чеченская республика', 'Чеченской республике'),
(22, 21, 'v-chuvashskoj-respublike', 'Чувашская республика', 'Чувашской республике'),
(23, 22, 'v-altajskom-krae', 'Алтайский край', 'Алтайском крае'),
(24, 75, 'v-zabajkalskom-krae', 'Забайкальский край', 'Забайкальском крае'),
(25, 41, 'v-kamchatskom-krae', 'Камчатский край', 'Камчатском крае'),
(26, 23, 'v-krasnodarskom-krae', 'Краснодарский край', 'Краснодарском крае'),
(27, 24, 'v-krasnoyarskom-krae', 'Красноярский край', 'Красноярском крае'),
(28, 59, 'v-permskom-krae', 'Пермский край', 'Пермском крае'),
(29, 25, 'v-primorskom-krae', 'Приморский край', 'Приморском крае'),
(30, 26, 'v-stavropolskom-krae', 'Ставропольский край', 'Ставропольском крае'),
(31, 27, 'v-habarovskom-krae', 'Хабаровский край', 'Хабаровском крае'),
(32, 28, 'v-amurskoj-oblasti', 'Амурская область', 'Амурской области'),
(33, 29, 'v-arhangelskoj-oblasti', 'Архангельская область', 'Архангельской области'),
(34, 30, 'v-astrahanskoj-oblasti', 'Астраханская область', 'Астраханской области'),
(35, 31, 'v-belgorodskoj-oblasti', 'Белгородская область', 'Белгородской области'),
(36, 32, 'v-bryanskoj-oblasti', 'Брянская область', 'Брянской области'),
(37, 33, 'v-vladimirskoj-oblasti', 'Владимирская область', 'Владимирской области'),
(38, 34, 'v-volgogradskoj-oblasti', 'Волгоградская область', 'Волгоградской области'),
(39, 35, 'v-vologodskoj-oblasti', 'Вологодская область', 'Вологодской области'),
(40, 36, 'v-voronezhskoj-oblasti', 'Воронежская область', 'Воронежской области'),
(41, 37, 'v-ivanovskoj-oblasti', 'Ивановская область', 'Ивановской области'),
(42, 38, 'v-irkutskoj-oblasti', 'Иркутская область', 'Иркутской области'),
(43, 39, 'v-kaliningradskoj-oblasti', 'Калининградская область', 'Калининградской области'),
(44, 40, 'v-kaluzhskoj-oblasti', 'Калужская область', 'Калужской области'),
(45, 42, 'v-kemerovskoj-oblasti', 'Кемеровская область', 'Кемеровской области'),
(46, 43, 'v-kirovskoj-oblasti', 'Кировская область', 'Кировской области'),
(47, 44, 'v-kostromskoj-oblasti', 'Костромская область', 'Костромской области'),
(48, 45, 'v-kurganskoj-oblasti', 'Курганская область', 'Курганской области'),
(49, 46, 'v-kurskoj-oblasti', 'Курская область', 'Курской области'),
(50, 47, 'v-leningradskoj-oblasti', 'Ленинградская область', 'Ленинградской области'),
(51, 48, 'v-lipeckaya-oblasti', 'Липецкая область', 'Липецкая области'),
(52, 49, 'v-magadanskoj-oblasti', 'Магаданская область', 'Магаданской области'),
(53, 50, 'v-moskovskoj-oblasti', 'Московская область', 'Московской области'),
(54, 51, 'v-murmanskoj-oblasti', 'Мурманская область', 'Мурманской области'),
(55, 52, 'v-nizhegorodskoj-oblasti', 'Нижегородская область', 'Нижегородской области'),
(56, 53, 'v-novgorodskoj-oblasti', 'Новгородская область', 'Новгородской области'),
(57, 54, 'v-novosibirskoj-oblasti', 'Новосибирская область', 'Новосибирской области'),
(58, 55, 'v-omskoj-oblasti', 'Омская область', 'Омской области'),
(59, 56, 'v-orenburgskoj-oblasti', 'Оренбургская область', 'Оренбургской области'),
(60, 57, 'v-orlovskoj-oblasti', 'Орловская область', 'Орловской области'),
(61, 58, 'v-penzenskoj-oblasti', 'Пензенская область', 'Пензенской области'),
(62, 60, 'v-pskovskoj-oblasti', 'Псковская область', 'Псковской области'),
(63, 61, 'v-rostovskoj-oblasti', 'Ростовская область', 'Ростовской области'),
(64, 62, 'v-ryazanskoj-oblasti', 'Рязанская область', 'Рязанской области'),
(65, 63, 'v-samarskoj-oblasti', 'Самарская область', 'Самарской области'),
(66, 64, 'v-saratovskoj-oblasti', 'Саратовская область', 'Саратовской области'),
(67, 65, 'v-sahalinskoj-oblasti', 'Сахалинская область', 'Сахалинской области'),
(68, 66, 'v-sverdlovskoj-oblasti', 'Свердловская область', 'Свердловской области'),
(69, 67, 'v-smolenskoj-oblasti', 'Смоленская область', 'Смоленской области'),
(70, 68, 'v-tambovskoj-oblasti', 'Тамбовская область', 'Тамбовской области'),
(71, 69, 'v-tverskoj-oblasti', 'Тверская область', 'Тверской области'),
(72, 70, 'v-tomskoj-oblasti', 'Томская область', 'Томской области'),
(73, 71, 'v-tulskoj-oblasti', 'Тульская область', 'Тульской области'),
(74, 72, 'v-tyumenskoj-oblasti', 'Тюменская область', 'Тюменской области'),
(75, 73, 'v-ulyanovskoj-oblasti', 'Ульяновская область', 'Ульяновской области'),
(76, 74, 'v-chelyabinskoj-oblasti', 'Челябинская область', 'Челябинской области'),
(77, 76, 'v-yaroslavskoj-oblasti', 'Ярославская область', 'Ярославской области'),
(78, 79, 'v-evrejskoj-avtonomnoj-oblasti', 'Еврейская автономная область', 'Еврейской автономной области'),
(79, 83, 'v-neneckom-avtonomnom-okruge', 'Ненецкий автономный округ', 'Ненецком автономном округе'),
(80, 86, 'v-hanty-mansijskom-avtonomnom-okruge---yugra', 'Ханты-Мансийский автономный округ - Югра', 'Ханты-Мансийском автономном округе - Югра'),
(81, 87, 'v-chukotskom-avtonomnomj-okruge', 'Чукотский автономный округ', 'Чукотском автономномй округе'),
(82, 89, 'v-yamalo-neneckom-avtonomnom-okruge', 'Ямало-Ненецкий автономный округ', 'Ямало-Ненецком автономном округе'),
(83, 92, 'v-sevastopole', 'Севастополь', 'Севастополе'),
(100, 77, 'v-moskve', 'Москва', 'Москве'),
(101, 78, 'v-sankt-peterburge', 'Санкт-Петербург', 'Санкт-Петербурге');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_mrot_regions`
--
ALTER TABLE `wp_mrot_regions`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
