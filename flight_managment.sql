-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 11:19 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flight_managment`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `portID` varchar(3) NOT NULL,
  `portName` varchar(50) DEFAULT NULL,
  `portcountry` varchar(50) DEFAULT NULL,
  `portCity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`portID`, `portName`, `portcountry`, `portCity`) VALUES
('ADA', 'Adana Airport', 'Turkey', 'Adana'),
('ADB', 'Adnan Menderes Airport', 'Turkey', 'Izmir'),
('ASR', 'Erkilet Airport', 'Turkey', 'Kayseri'),
('AYT', 'Antalya Airport', 'Turkey', 'Antalya'),
('BAL', 'Batman Airport', 'Turkey', 'Batman'),
('BGG', 'Bingöl Airport', 'Turkey', 'Bingöl'),
('BJV', 'Bodrum-Milas Airport', 'Turkey', 'Bodrum'),
('BXN', 'Imsik Airport', 'Turkey', 'Bodrum'),
('BZI', 'Balikesir Airport', 'Turkey', 'Balikesir'),
('DIY', 'Diyarbakir Airport', 'Turkey', 'Diyarbakir'),
('DLM', 'Dalaman Airport', 'Turkey', 'Dalaman'),
('EDO', 'Canakkale Airport', 'Turkey', 'Canakkale'),
('ERC', 'Erzincan Airport', 'Turkey', 'Erzincan'),
('ESB', 'Esenboga Airport', 'Turkey', 'Ankara'),
('EZS', 'Elazi? Airport', 'Turkey', 'Elazig'),
('GNY', 'Sanliurfa Airport', 'Turkey', 'Sanliurfa'),
('GZP', 'Gazipasa Airport', 'Turkey', 'Antalya'),
('GZT', 'Gaziantep Airport', 'Turkey', 'Gaziantep'),
('HTY', 'Hatay Airport', 'Turkey', 'Hatay'),
('ISK', 'Isparta Airport', 'Turkey', 'Isparta'),
('KCM', 'Kahramanmaras Airport', 'Turkey', 'Kahramanmaras'),
('KFS', 'Kastamonu Airport', 'Turkey', 'Kastamonu'),
('KSY', 'Kars Airport', 'Turkey', 'Kars'),
('KZR', 'Zafer Airport', 'Turkey', 'Kutahya'),
('MLX', 'Malatya Airport', 'Turkey', 'Malatya'),
('MQJ', 'Merzifon Airport', 'Turkey', 'Amasya'),
('MQM', 'Mardin Airport', 'Turkey', 'Mardin'),
('MSR', 'Mus Airport', 'Turkey', 'Mus'),
('NAV', 'Nevsehir Kapadokya Airport', 'Turkey', 'Nevsehir'),
('NOP', 'Sinop Airport', 'Turkey', 'Sinop'),
('ONQ', 'Zonguldak Airport', 'Turkey', 'Zonguldak'),
('ORD', 'Ordu-Giresun Airport', 'Turkey', 'Ordu'),
('SZF', 'Samsun-Carsamba Airport', 'Turkey', 'Samsun'),
('TEQ', 'Tekirdag Airport', 'Turkey', 'Tekirdag'),
('TJK', 'Tokat Airport', 'Turkey', 'Tokat'),
('TZX', 'Trabzon Airport', 'Turkey', 'Trabzon'),
('USQ', 'Usak Airport', 'Turkey', 'Usak'),
('VAN', 'Van Ferit Melen Airport', 'Turkey', 'Van'),
('VAS', 'Sivas Airport', 'Turkey', 'Sivas'),
('YEI', 'Yenisehir Airport', 'Turkey', 'Yenisehir');

-- --------------------------------------------------------

--
-- Table structure for table `belongsto`
--

CREATE TABLE `belongsto` (
  `ticketNum` varchar(15) NOT NULL,
  `lugID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cabincrew`
--

CREATE TABLE `cabincrew` (
  `crewName` varchar(50) DEFAULT NULL,
  `crewSname` varchar(50) DEFAULT NULL,
  `crewID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cabincrew`
--

INSERT INTO `cabincrew` (`crewName`, `crewSname`, `crewID`) VALUES
('Yasemin', 'Ozkan', 1205773),
('Zehra', 'Güzel', 1685522),
('Gul', 'Cakir', 2294222),
('Özlem', 'Gül', 2873529),
('Mehmet', 'Yilmaz', 3388252),
('Okan', 'Çetinkaya', 3609888),
('Mustafa', 'Erdogan', 3847891),
('Ahmet', 'Kaya', 4676760),
('Huseyin', 'Sari', 5139529),
('Nur', 'Yildiz', 5232122),
('Ali', 'Demir', 5281451),
('Osman', 'Özdemir', 5598118),
('Irem', 'Ozcan', 6086873),
('Esra', 'Kaplan', 6501133),
('Emre', 'Tekin', 6854164),
('Fatma', 'Öztürk', 7089241),
('Tolga', 'Gunes', 8114448),
('Murat', 'Y?ld?r?m', 8475385),
('Can', 'Çetin', 8941492),
('Zeynep', 'Çelik', 9679567),
('Sevil', 'Kilic', 9788822),
('Elif', 'Dogan', 9853296),
('Ayse', 'Kose', 9950674);

-- --------------------------------------------------------

--
-- Table structure for table `flies`
--

CREATE TABLE `flies` (
  `pilLicense` varchar(15) NOT NULL,
  `tailID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flies`
--

INSERT INTO `flies` (`pilLicense`, `tailID`) VALUES
('7890123456789A', 'TC-APG'),
('EFGHIJKLMNOPQR', 'TC-APZ'),
('GHIJKhMNOPQRST', 'TC-APG'),
('STUVWXYZ0123456', 'TC-APZ');

-- --------------------------------------------------------

--
-- Table structure for table `goesto`
--

CREATE TABLE `goesto` (
  `tailID` varchar(6) NOT NULL,
  `portID` varchar(3) NOT NULL,
  `flDate` date DEFAULT NULL,
  `flTime` time DEFAULT NULL,
  `fgate` varchar(5) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goesto`
--

INSERT INTO `goesto` (`tailID`, `portID`, `flDate`, `flTime`, `fgate`, `status`) VALUES
('TC-APG', 'DIY', '2022-12-21', '20:00:00', 'F789', 'GATE OPEN'),
('TC-APZ', 'MSR', '2022-12-21', '23:00:00', 'C456', 'ON TIME');

-- --------------------------------------------------------

--
-- Table structure for table `luggage`
--

CREATE TABLE `luggage` (
  `lugID` varchar(15) NOT NULL,
  `lugWeight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `luggage`
--

INSERT INTO `luggage` (`lugID`, `lugWeight`) VALUES
('fff', 10),
('ggg', 6),
('hhh', 9),
('rrr', 12),
('ttt', 14),
('www', 8);

-- --------------------------------------------------------

--
-- Table structure for table `manages`
--

CREATE TABLE `manages` (
  `tailID` varchar(6) NOT NULL,
  `crewID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manages`
--

INSERT INTO `manages` (`tailID`, `crewID`) VALUES
('TC-APG', 4676760),
('TC-APG', 6086873),
('TC-APG', 8114448);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `pasName` varchar(50) DEFAULT NULL,
  `pasSname` varchar(50) DEFAULT NULL,
  `pasID` int(11) NOT NULL,
  `ticketNum` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`pasName`, `pasSname`, `pasID`, `ticketNum`) VALUES
('Stephanie', 'Brown', 1234890, 'RTUVWaYZ01245'),
('Christopher', 'Davis', 2578901, 'EGHaJKLMNPQR'),
('Rachel', 'Williams', 6703456, '789012a4789A'),
('Ivan', 'Dragon', 12345689, 'ABCDHIJklMNO'),
('Megan', 'Martinez', 12345690, '123567a9ABCE'),
('Matthew', 'Anderson', 12367801, 'FGHJaLMNOQRS'),
('Emily', 'Davis', 23456712, 'STUVWXZ01a356'),
('Lauren', 'Anderson', 23678912, 'TUVXYa01235A'),
('Joshua', 'Taylor', 34567013, 'GHJKLMNaPRST'),
('Richard', 'Garcia', 34780123, 'GHIKLMaOPQST'),
('James', 'Smith', 34789123, '45678123aBCD'),
('Ashley', 'Garcia', 45671234, 'UVWYZ01a3467'),
('Haley', 'Taylor', 45678234, 'UVWXZ012a45B'),
('Jessica', 'Smith', 45789234, 'EFGHKLaNOPQRS'),
('Jane', 'Doe', 54453729, 'PQRSTUVWXYZ0123'),
('Joseph', 'Miller', 56712345, 'IJLMNOPaRSV'),
('Robert', 'Williams', 59012345, 'TUXYa0123456'),
('Samantha', 'Miller', 67923456, 'WXZ1a34568A'),
('William', 'Jones', 78914567, 'BCDEFGHIaMNOP'),
('Thomas', 'Rodriguez', 78934567, 'KMNOaQRSTUWX'),
('Amanda', 'Rodriguez', 89015678, 'YZ12a456789B'),
('Michelle', 'Jones', 89235678, 'QRSTUVWaY023A'),
('Charles', 'Martinez', 90123679, 'MOPQaSTUVXYZ'),
('David', 'Brown', 90126789, 'CDEFHIJKLaNOQ'),
('Janetis', 'Doesnt', 234567812, 'RSTUvwXYZ0123'),
('John', 'Doe', 2147483647, 'ABCDEFGHIJKLMNO');

-- --------------------------------------------------------

--
-- Table structure for table `pilots`
--

CREATE TABLE `pilots` (
  `pilName` varchar(50) NOT NULL,
  `pilSurname` varchar(50) NOT NULL,
  `pilLicense` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pilots`
--

INSERT INTO `pilots` (`pilName`, `pilSurname`, `pilLicense`) VALUES
('Megan', 'Martinez', '123456789ABCDE'),
('James', 'Smith', '4567890123ABCD'),
('Rachel', 'Williams', '7890123456789A'),
('John', 'Doe', 'ABCDEFGHIJKLMNO'),
('William', 'Jones', 'BCDEFGHIJKLMNOP'),
('David', 'Brown', 'CDEFGHIJKLMNOPQ'),
('Christopher', 'Davis', 'EFGHIJKLMNOPQR'),
('Jessica', 'Smith', 'EFGHIJKLMNOPQRS'),
('Matthew', 'Anderson', 'FGHIJKLMNOPQRS'),
('Joshua', 'Taylor', 'GHIJKhMNOPQRST'),
('Richard', 'Garcia', 'GHIJKLMNOPQRST'),
('Joseph', 'Miller', 'IJKLMNOPQRSTUV'),
('Thomas', 'Rodriguez', 'KLMNOPQRSTUVWX'),
('Charles', 'Martinez', 'MNOPQRSTUVWXYZ'),
('Jane', 'Doe', 'PQRSTUVWXYZ0123'),
('Michelle', 'Jones', 'QRSTUVWXYZ0123A'),
('Stephanie', 'Brown', 'RSTUVWXYZ012345'),
('Emily', 'Davis', 'STUVWXYZ0123456'),
('Robert', 'Williams', 'TUVWXYZ0123456'),
('Lauren', 'Anderson', 'TUVWXYZ012345A'),
('Ashley', 'Garcia', 'UVWXYZ01234567'),
('Haley', 'Taylor', 'UVWXYZ0123456B'),
('Samantha', 'Miller', 'WXYZ012345678A'),
('Amanda', 'Rodriguez', 'YZ0123456789AB');

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE `planes` (
  `tailID` varchar(6) NOT NULL,
  `plAirway` varchar(50) DEFAULT NULL,
  `plType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`tailID`, `plAirway`, `plType`) VALUES
('TC-APB', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APC', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APD', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APE', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APF', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APG', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APH', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-API', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APJ', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APK', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APL', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APM', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APN', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APO', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APP', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APQ', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APR', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APS', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APT', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APU', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APV', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APW', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APX', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APY', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-APZ', 'Pegasus Airlines', 'Airbus A320-200'),
('TC-JJP', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZD', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZG', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZH', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZL', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZM', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZN', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZO', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZP', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZQ', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZR', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZS', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZT', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZU', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZV', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZW', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZX', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZY', 'Turkish Airlines', 'Airbus A321-200'),
('TC-JZZ', 'Turkish Airlines', 'Airbus A321-200'),
('TC-LBG', 'Turkish Airlines', 'Boeing 737-800'),
('TC-LBI', 'Turkish Airlines', 'Boeing 737-800'),
('TC-LBJ', 'Turkish Airlines', 'Boeing 737-800'),
('TC-LBK', 'Turkish Airlines', 'Boeing 737-800'),
('TC-LBL', 'Turkish Airlines', 'Boeing 737-800'),
('TC-LBM', 'Turkish Airlines', 'Boeing 737-800'),
('TC-LBN', 'Turkish Airlines', 'Boeing 737-800');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `ticketNum` varchar(15) NOT NULL,
  `tailID` varchar(6) NOT NULL,
  `seatNum` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`portID`);

--
-- Indexes for table `belongsto`
--
ALTER TABLE `belongsto`
  ADD PRIMARY KEY (`ticketNum`,`lugID`),
  ADD KEY `lugID` (`lugID`);

--
-- Indexes for table `cabincrew`
--
ALTER TABLE `cabincrew`
  ADD PRIMARY KEY (`crewID`);

--
-- Indexes for table `flies`
--
ALTER TABLE `flies`
  ADD PRIMARY KEY (`pilLicense`,`tailID`),
  ADD KEY `tailID` (`tailID`);

--
-- Indexes for table `goesto`
--
ALTER TABLE `goesto`
  ADD PRIMARY KEY (`tailID`,`portID`),
  ADD KEY `portID` (`portID`);

--
-- Indexes for table `luggage`
--
ALTER TABLE `luggage`
  ADD PRIMARY KEY (`lugID`);

--
-- Indexes for table `manages`
--
ALTER TABLE `manages`
  ADD PRIMARY KEY (`tailID`,`crewID`),
  ADD KEY `crewID` (`crewID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`pasID`),
  ADD UNIQUE KEY `ticketNum` (`ticketNum`),
  ADD UNIQUE KEY `pasID` (`pasID`),
  ADD UNIQUE KEY `ticketNum_2` (`ticketNum`);

--
-- Indexes for table `pilots`
--
ALTER TABLE `pilots`
  ADD PRIMARY KEY (`pilLicense`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`tailID`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`ticketNum`,`tailID`),
  ADD KEY `tailID` (`tailID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongsto`
--
ALTER TABLE `belongsto`
  ADD CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`ticketNum`) REFERENCES `passenger` (`ticketNum`),
  ADD CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`lugID`) REFERENCES `luggage` (`lugID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flies`
--
ALTER TABLE `flies`
  ADD CONSTRAINT `flies_ibfk_1` FOREIGN KEY (`pilLicense`) REFERENCES `pilots` (`pilLicense`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `flies_ibfk_2` FOREIGN KEY (`tailID`) REFERENCES `planes` (`tailID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `goesto`
--
ALTER TABLE `goesto`
  ADD CONSTRAINT `goesto_ibfk_1` FOREIGN KEY (`tailID`) REFERENCES `planes` (`tailID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `goesto_ibfk_2` FOREIGN KEY (`portID`) REFERENCES `airports` (`portID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `manages`
--
ALTER TABLE `manages`
  ADD CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`tailID`) REFERENCES `planes` (`tailID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`crewID`) REFERENCES `cabincrew` (`crewID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`tailID`) REFERENCES `planes` (`tailID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`ticketNum`) REFERENCES `passenger` (`ticketNum`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
