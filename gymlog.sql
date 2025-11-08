-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2025 at 08:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymlog`
--

-- --------------------------------------------------------

--
-- Table structure for table `adatok`
--

CREATE TABLE `adatok` (
  `id` int(11) NOT NULL,
  `testsuly` int(11) DEFAULT NULL,
  `magassag` int(11) DEFAULT NULL,
  `nem` enum('férfi','nő') DEFAULT NULL,
  `felhasznaloId` int(11) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edzes`
--

CREATE TABLE `edzes` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `idotartam` int(11) DEFAULT NULL,
  `osszsuly` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  `felhasznaloId` int(11) NOT NULL,
  `leiras` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edzesterv`
--

CREATE TABLE `edzesterv` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `felhasznaloId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edzestervgyakorlat`
--

CREATE TABLE `edzestervgyakorlat` (
  `id` int(11) NOT NULL,
  `edzestervId` int(11) NOT NULL,
  `gyakorlatId` int(11) NOT NULL,
  `sorrend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nev` varchar(20) NOT NULL,
  `jelszo` varchar(20) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gyakorlat`
--

CREATE TABLE `gyakorlat` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `izomcsoport` varchar(20) DEFAULT NULL,
  `sullyal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gyakorlathozzaad`
--

CREATE TABLE `gyakorlathozzaad` (
  `id` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `sullyal` tinyint(1) NOT NULL,
  `megjegyzes` text DEFAULT NULL,
  `felhasznaloId` int(11) NOT NULL,
  `datum` date NOT NULL DEFAULT curdate(),
  `jovahagyva` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sorozat`
--

CREATE TABLE `sorozat` (
  `id` int(11) NOT NULL,
  `edzesId` int(11) NOT NULL,
  `gyakorlatId` int(11) NOT NULL,
  `ismertles` int(11) NOT NULL,
  `suly` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adatok`
--
ALTER TABLE `adatok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznaloId` (`felhasznaloId`);

--
-- Indexes for table `edzes`
--
ALTER TABLE `edzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznaloId` (`felhasznaloId`);

--
-- Indexes for table `edzesterv`
--
ALTER TABLE `edzesterv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznaloId` (`felhasznaloId`);

--
-- Indexes for table `edzestervgyakorlat`
--
ALTER TABLE `edzestervgyakorlat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `edzestervId` (`edzestervId`),
  ADD KEY `gyakorlatId` (`gyakorlatId`);

--
-- Indexes for table `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `gyakorlat`
--
ALTER TABLE `gyakorlat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gyakorlathozzaad`
--
ALTER TABLE `gyakorlathozzaad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznaloId` (`felhasznaloId`);

--
-- Indexes for table `sorozat`
--
ALTER TABLE `sorozat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `edzesId` (`edzesId`),
  ADD KEY `gyakorlatId` (`gyakorlatId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adatok`
--
ALTER TABLE `adatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edzes`
--
ALTER TABLE `edzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edzesterv`
--
ALTER TABLE `edzesterv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edzestervgyakorlat`
--
ALTER TABLE `edzestervgyakorlat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gyakorlat`
--
ALTER TABLE `gyakorlat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gyakorlathozzaad`
--
ALTER TABLE `gyakorlathozzaad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sorozat`
--
ALTER TABLE `sorozat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adatok`
--
ALTER TABLE `adatok`
  ADD CONSTRAINT `adatok_ibfk_1` FOREIGN KEY (`felhasznaloId`) REFERENCES `felhasznalo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `edzes`
--
ALTER TABLE `edzes`
  ADD CONSTRAINT `edzes_ibfk_1` FOREIGN KEY (`felhasznaloId`) REFERENCES `felhasznalo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `edzesterv`
--
ALTER TABLE `edzesterv`
  ADD CONSTRAINT `edzesterv_ibfk_1` FOREIGN KEY (`felhasznaloId`) REFERENCES `felhasznalo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `edzestervgyakorlat`
--
ALTER TABLE `edzestervgyakorlat`
  ADD CONSTRAINT `edzestervgyakorlat_ibfk_1` FOREIGN KEY (`edzestervId`) REFERENCES `edzesterv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `edzestervgyakorlat_ibfk_2` FOREIGN KEY (`gyakorlatId`) REFERENCES `gyakorlat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gyakorlathozzaad`
--
ALTER TABLE `gyakorlathozzaad`
  ADD CONSTRAINT `gyakorlathozzaad_ibfk_1` FOREIGN KEY (`felhasznaloId`) REFERENCES `felhasznalo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sorozat`
--
ALTER TABLE `sorozat`
  ADD CONSTRAINT `sorozat_ibfk_1` FOREIGN KEY (`edzesId`) REFERENCES `edzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sorozat_ibfk_2` FOREIGN KEY (`gyakorlatId`) REFERENCES `gyakorlat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
