-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Lip 2023, 13:13
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sk`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `device_type`
--

CREATE TABLE `device_type` (
  `id_device` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `device_type`
--

INSERT INTO `device_type` (`id_device`, `name`) VALUES
(3, 'Karta graficzna'),
(4, 'Monitor'),
(5, 'Procesor'),
(6, 'Zasilacz'),
(7, 'Laptop'),
(8, 'Komputer Stacjonarny'),
(9, 'Telefon'),
(10, 'Telewizor');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `repair_type`
--

CREATE TABLE `repair_type` (
  `id_repair` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `repair_type`
--

INSERT INTO `repair_type` (`id_repair`, `name`) VALUES
(3, 'Diagnostyka'),
(4, 'Czyszczenie'),
(5, 'Naprawa'),
(6, 'Reklamacja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `report`
--

CREATE TABLE `report` (
  `id_report` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `model` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `comment` text DEFAULT NULL,
  `cost` float(5,2) DEFAULT NULL,
  `date_of_report` date DEFAULT current_timestamp(),
  `date_of_repair` date DEFAULT NULL,
  `id_repair` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `id_status` int(11) DEFAULT 3,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role_type`
--

CREATE TABLE `role_type` (
  `id_role` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `role_type`
--

INSERT INTO `role_type` (`id_role`, `name`) VALUES
(1, 'admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_type`
--

CREATE TABLE `status_type` (
  `id_status` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `status_type`
--

INSERT INTO `status_type` (`id_status`, `name`) VALUES
(3, 'Przyjęty'),
(4, 'Diagnozowany'),
(5, 'Naprawiony'),
(6, 'Wysłano'),
(7, 'Zakończony');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_user`, `name`, `surname`, `login`, `password`, `id_role`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `device_type`
--
ALTER TABLE `device_type`
  ADD PRIMARY KEY (`id_device`);

--
-- Indeksy dla tabeli `repair_type`
--
ALTER TABLE `repair_type`
  ADD PRIMARY KEY (`id_repair`);

--
-- Indeksy dla tabeli `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `id_device` (`id_device`),
  ADD KEY `id_repair` (`id_repair`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeksy dla tabeli `role_type`
--
ALTER TABLE `role_type`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeksy dla tabeli `status_type`
--
ALTER TABLE `status_type`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `device_type`
--
ALTER TABLE `device_type`
  MODIFY `id_device` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `repair_type`
--
ALTER TABLE `repair_type`
  MODIFY `id_repair` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `report`
--
ALTER TABLE `report`
  MODIFY `id_report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT dla tabeli `role_type`
--
ALTER TABLE `role_type`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `status_type`
--
ALTER TABLE `status_type`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `device_type` (`id_device`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`id_repair`) REFERENCES `repair_type` (`id_repair`),
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`id_status`) REFERENCES `status_type` (`id_status`),
  ADD CONSTRAINT `report_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role_type` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
