-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2025 a las 19:37:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bpmsdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` char(50) DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'administrador', 'admin', 3005388714, 'jeison.95garcia@gmail.com', '$2y$10$1MaErKmSGW/pWxWsGQ.CneCrPFNN5qqnRN/WfstR6WT35iSRyM3tK', '2025-05-25 06:21:50'),
(2, 'administrador', 'admin1', 301145255, 'correo@gmail.com', '$2y$10$ulYdPF2NgVvTB7V6IVq2keXLwSFZTa1qV5QZUCgHHfSxyoGOuP7ha', '2025-06-24 22:57:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblappointment`
--

CREATE TABLE `tblappointment` (
  `ID` int(10) NOT NULL,
  `AptNumber` varchar(80) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `PhoneNumber` bigint(11) DEFAULT NULL,
  `AptDate` varchar(120) DEFAULT NULL,
  `AptTime` varchar(120) DEFAULT NULL,
  `Services` varchar(120) DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(250) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `RemarkDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tblappointment`
--

INSERT INTO `tblappointment` (`ID`, `AptNumber`, `Name`, `Email`, `PhoneNumber`, `AptDate`, `AptTime`, `Services`, `ApplyDate`, `Remark`, `Status`, `RemarkDate`) VALUES
(8, '496532914', 'Roman Garcia', 'rgarcia@correo.com', 3211076843, '1/23/2025', '6:30pm', 'Fruit Facial', '2025-01-23 23:50:09', 'Excelente Cliente', '1', '2025-01-23 23:52:03'),
(9, '304302609', 'Lucia grajales', 'lgrajales@correo.com', 3065439781, '1/24/2025', '9:00am', 'Fruit Facial', '2025-01-24 13:56:31', 'La srta realizÃ³ el proceso correspondiente.', '1', '2025-06-12 17:40:03'),
(10, '604686038', 'JUAN ARANGO', 'JARANGO@CORREO.COM', 3147641979, '1/24/2025', '1:00pm', 'Masaje Facial', '2025-01-24 14:54:02', 'Excelente cliente, recomendado', '1', '2025-06-12 17:40:10'),
(11, '932355891', 'Dilan cabal', 'DCABAL@CORREO.COM', 3178674931, '1/24/2025', '10:30am', 'Masaje Facial', '2025-01-24 15:11:49', 'Se realizó el pedido a satisfacción.', '1', '2025-06-12 17:40:23'),
(12, '182457009', 'Juan Gallego', 'JGALLEGO@CORREO.COM', 3163798467, '1/24/2025', '1:30am', 'Masaje Facial', '2025-01-24 16:20:12', 'Acepto', '1', '2025-06-12 17:40:37'),
(13, '958882735', 'Rocio Calam', 'rcalam@correo.com', 3010123201, '1/24/2025', '10:30pm', 'Layer Haircut', '2025-01-24 16:43:01', 'Se le cobra', '2', '2025-01-24 16:44:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcustomers`
--

CREATE TABLE `tblcustomers` (
  `ID` int(10) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Gender` enum('Mujer','Hombre','No definido') DEFAULT NULL,
  `Details` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tblcustomers`
--

INSERT INTO `tblcustomers` (`ID`, `Name`, `Email`, `MobileNumber`, `Gender`, `Details`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Juan Pérez', 'jperez@correo.com', 3144567894613, 'Hombre', 'Taking Hair Spa', '2025-05-26 11:09:10', '2025-05-24 15:08:36'),
(2, 'Edith Velazco', 'dgarzon@correo.com', 3014673497814, 'Mujer', 'Taken haircut', '2025-05-26 11:10:02', '2025-05-24 15:08:42'),
(3, 'Daniel Garzon', 'dgarzon@correo.com', 3126743476978, 'Hombre', 'Buen Cliente', '2025-05-26 11:10:28', '2025-05-24 15:08:50'),
(4, 'Adrian Narvaez', 'anarvaez@correo.com', 3149874625789, 'Hombre', 'Taking Body Spa', '2025-05-19 13:38:58', '2025-05-24 15:08:07'),
(5, 'Norman Palao', 'npalao@correo.com', 3169463781497, 'Hombre', 'Cliente frecuente,  le gusta los servicios premium tenerlo muy en cuenta', '2025-05-21 16:24:53', '2025-05-24 15:08:58'),
(6, 'Roberto Galán', 'rgalan@correo.com', 3172232526, 'Hombre', 'Interesante cliente', '2025-05-24 14:56:35', '2025-06-12 17:36:24'),
(7, 'Humberto Gonzalez', 'hgonzalez@correo.com', 3179768047, 'Hombre', 'Creado satisfactoriamente', '2025-05-24 17:06:53', '2025-05-24 17:09:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `Userid`, `ServiceId`, `BillingId`, `PostingDate`) VALUES
(26, 1, 1, 535139230, '2025-05-23 23:55:32'),
(27, 6, 1, 232733358, '2025-05-24 14:58:47'),
(28, 4, 10, 635394484, '2025-05-24 16:51:26'),
(29, 4, 15, 609822877, '2025-05-24 17:02:06'),
(30, 4, 16, 609822877, '2025-05-24 17:02:06'),
(31, 1, 1, 789938761, '2025-05-04 20:50:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'Acerca de', '                                                Somos lal mejor barbería, porque usamos la mejor aplicación, nuestra vida es más fácil y todo es más sencillo de controlar desde que manejamos nuestro sistema de barbería.', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contacto', '                                                        Ciénaga, Magdalena - Colombia', 'correo@gmail.com', 573162430081, NULL, '08:00 am a 6:30 pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblservices`
--

CREATE TABLE `tblservices` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `Cost` decimal(6,3) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `Cost`, `CreationDate`) VALUES
(1, 'Masaje Facial', 12.000, '2025-05-25 11:22:38'),
(2, 'Facial de Fruta', 11.500, '2025-05-25 11:22:53'),
(3, 'Facial de Pepino', 10.000, '2025-05-25 11:23:10'),
(4, 'Manicure de Lujo', 15.000, '2025-05-25 11:23:34'),
(5, 'Integral de Pedicure y Coerte de Cabello', 13.500, '2025-05-25 11:23:47'),
(6, 'Manicure Precio Estudiantes', 6.500, '2025-05-25 11:24:01'),
(7, 'Depilado de Piernas', 40.000, '2025-05-25 11:24:19'),
(8, 'Corte de Cabello Hombre', 15.000, '2025-05-25 11:24:38'),
(9, 'Corte de Barba', 11.500, '2025-05-25 11:24:53'),
(10, 'Masaje Espalda', 40.000, '2025-05-25 11:25:08'),
(11, 'Teñido de Cabello', 12.000, '2025-05-25 11:25:35'),
(12, 'Peinado  con Rayos', 54.000, '2025-05-19 13:36:27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tblappointment`
--
ALTER TABLE `tblappointment`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tblcustomers`
--
ALTER TABLE `tblcustomers`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblappointment`
--
ALTER TABLE `tblappointment`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tblcustomers`
--
ALTER TABLE `tblcustomers`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblservices`
--
ALTER TABLE `tblservices`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
