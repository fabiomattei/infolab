-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Creato il: Feb 29, 2020 alle 17:28
-- Versione del server: 10.4.10-MariaDB-1:10.4.10+maria~bionic
-- Versione PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infolabdb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attachment`
--

CREATE TABLE `attachment` (
                              `at_id` int(10) UNSIGNED NOT NULL,
                              `at_sbid` int(10) UNSIGNED NOT NULL,
                              `at_name` varchar(255) NOT NULL,
                              `at_date` date NOT NULL,
                              `at_body` blob NOT NULL,
                              `at_updated` datetime NOT NULL,
                              `at_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `schoolclass`
--

CREATE TABLE `schoolclass` (
                               `sc_id` int(11) UNSIGNED NOT NULL,
                               `sc_name` int(11) NOT NULL,
                               `sc_updated` datetime NOT NULL,
                               `sc_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `studentsubmission`
--

CREATE TABLE `studentsubmission` (
                                     `ss_id` int(10) UNSIGNED NOT NULL,
                                     `ss_userid` int(10) UNSIGNED NOT NULL,
                                     `ss_sbid` int(10) UNSIGNED NOT NULL,
                                     `ss_updated` datetime NOT NULL,
                                     `ss_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `submission`
--

CREATE TABLE `submission` (
                              `sb_id` int(11) UNSIGNED NOT NULL,
                              `sb_name` varchar(255) NOT NULL,
                              `sb_date` date NOT NULL,
                              `sb_body` text NOT NULL,
                              `sb_updated` datetime NOT NULL,
                              `sb_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
                        `usr_id` bigint(20) NOT NULL,
                        `usr_defaultgroup` varchar(80) CHARACTER SET utf8 NOT NULL DEFAULT '',
                        `usr_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
                        `usr_surname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
                        `usr_email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
                        `usr_hashedpsw` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
                        `usr_password_updated` datetime NOT NULL,
                        `usr_updated` datetime NOT NULL,
                        `usr_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`usr_id`, `usr_defaultgroup`, `usr_name`, `usr_surname`, `usr_email`, `usr_hashedpsw`, `usr_password_updated`, `usr_updated`, `usr_created`) VALUES
(1, 'administrationgroup', 'Admin', '', 'admin', '$2y$10$gUWxjdAJRE.KyWqEZh4w1.kRDAumgVamek.BBq.Li2CMkK7GGeeV2', '2018-10-28 10:04:49', '2018-10-21 10:13:39', '2018-10-21 00:00:00'),
(2, 'student', 'Manager', '', 'manager', '$2y$10$YmsVMDQrYjnEdbkqfB5pNuLzyeMQep0C/ahaRWQSs/AN63/U5SXTW', '2018-08-07 00:00:00', '2018-08-07 00:00:00', '2018-08-07 00:00:00'),
(3, 'student', 'Fabio', 'Mattei', 'burattino@gmail.com', '', '2020-02-28 00:00:00', '2020-02-28 21:54:14', '2020-02-28 21:33:41'),
(4, 'student', 'Laura', 'Joanson', 'laura@laura.it', '$2y$10$uCD6JxN7ym7EAMt6hfJ/dezsYpT8bNdi9l9Zutr0v4FBuTH8rgtnS', '2020-02-29 16:38:21', '2020-02-29 16:42:58', '2020-02-29 16:38:21'),
(5, 'student', 'Castello', 'Davide', 'castello@castello.it', '$2y$10$5LD7MVBH076ChT34w8VYKu6NE0i8hAyYw2/TZkbDFvbZhiVCDFqB6', '2020-02-29 16:57:57', '2020-02-29 16:57:57', '2020-02-29 16:57:57'),
(6, 'student', 'David', 'Michelangelo', 'burattino@gmail.com', '$2y$10$WiSZZKxAuM5toWj1Zn0wV./DcrX4WXVluohjkDSUtt1yp2OFEigRm', '2020-02-29 17:08:27', '2020-02-29 17:08:26', '2020-02-29 17:08:26'),
(7, 'student', 'Majestic', 'Davide', 'davide@davide.com', '$2y$10$nMk5tO4JoHjla/T7g3CP9urOaCU9oPQhU02bmYtdDN7BdDHKMXSd6', '2020-02-29 17:09:49', '2020-02-29 17:09:49', '2020-02-29 17:09:49');

-- --------------------------------------------------------

--
-- Struttura della tabella `usergroup`
--

CREATE TABLE `usergroup` (
                             `ug_id` int(10) UNSIGNED NOT NULL,
                             `ug_groupslug` varchar(80) COLLATE utf8_bin NOT NULL DEFAULT '',
                             `ug_userid` int(11) UNSIGNED NOT NULL DEFAULT 0,
                             `ug_updated` datetime NOT NULL,
                             `ug_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `usergroup`
--

INSERT INTO `usergroup` (`ug_id`, `ug_groupslug`, `ug_userid`, `ug_updated`, `ug_created`) VALUES
(1, 'student', 3, '2020-02-28 21:42:23', '2020-02-28 21:42:23'),
(2, 'student', 4, '2020-02-29 16:42:35', '2020-02-29 16:42:35'),
(3, 'student', 7, '2020-02-29 17:09:49', '2020-02-29 17:09:49'),
(4, 'student', 2, '2020-02-29 17:13:16', '2020-02-29 17:13:16');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attachment`
--
ALTER TABLE `attachment`
    ADD PRIMARY KEY (`at_id`);

--
-- Indici per le tabelle `schoolclass`
--
ALTER TABLE `schoolclass`
    ADD PRIMARY KEY (`sc_id`);

--
-- Indici per le tabelle `studentsubmission`
--
ALTER TABLE `studentsubmission`
    ADD PRIMARY KEY (`ss_id`);

--
-- Indici per le tabelle `submission`
--
ALTER TABLE `submission`
    ADD PRIMARY KEY (`sb_id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`usr_id`);

--
-- Indici per le tabelle `usergroup`
--
ALTER TABLE `usergroup`
    ADD PRIMARY KEY (`ug_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attachment`
--
ALTER TABLE `attachment`
    MODIFY `at_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `schoolclass`
--
ALTER TABLE `schoolclass`
    MODIFY `sc_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `studentsubmission`
--
ALTER TABLE `studentsubmission`
    MODIFY `ss_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `submission`
--
ALTER TABLE `submission`
    MODIFY `sb_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
    MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `usergroup`
--
ALTER TABLE `usergroup`
    MODIFY `ug_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
