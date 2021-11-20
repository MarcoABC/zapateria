-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2021 at 03:03 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `silva`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`silva`@`%` PROCEDURE `prAumentarCantidad` (IN `vid` INT, IN `vcantidad` INT, IN `vid_almacen` INT)  BEGIN
UPDATE tproducto_almacen SET cantidad = (cantidad+vcantidad) WHERE id_producto = vid AND id_almacen = vid_almacen;
END$$

CREATE DEFINER=`silva`@`%` PROCEDURE `prAumentarCantidadDestino` (IN `vid` INT, IN `vcantidad` INT, IN `vid_almacen` INT)  BEGIN
UPDATE tproducto_almacen SET cantidad = (cantidad+vcantidad) WHERE id_producto = vid AND id_almacen = vid_almacen;
END$$

CREATE DEFINER=`silva`@`%` PROCEDURE `prInsertarMovimiento` (IN `vid_sucursal` INT UNSIGNED, IN `vfecha` VARCHAR(255), IN `vdescripcion` TEXT, IN `vtotal` FLOAT UNSIGNED, IN `vid_empleado` INT UNSIGNED, IN `vid_concepto` INT UNSIGNED, IN `vid_tipo_transaccion` INT UNSIGNED, IN `vid_venta` INT UNSIGNED, IN `vid_compra` INT UNSIGNED)  BEGIN
INSERT INTO tmovimiento 
(id_sucursal, fecha, descripcion, total, id_empleado, id_concepto, id_tipo_transaccion, id_venta, id_compra)
VALUES
(vid_sucursal, vfecha, vdescripcion, vtotal, vid_empleado, vid_concepto, vid_tipo_transaccion, vid_venta, vid_compra);
END$$

CREATE DEFINER=`silva`@`%` PROCEDURE `prInsertarProductoAlmacen` (IN `vid_producto` INT, IN `vid_almacen` INT, IN `vcantidad` INT)  BEGIN
INSERT INTO tproducto_almacen VALUES (vid_producto, vid_almacen, vcantidad, 'N/A');
END$$

CREATE DEFINER=`silva`@`%` PROCEDURE `prReducirCantidad` (IN `vid` INT, IN `vcantidad` INT)  BEGIN
UPDATE tproducto_almacen SET cantidad = (cantidad-vcantidad) WHERE id_producto = vid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `talmacen`
--

CREATE TABLE `talmacen` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talmacen`
--

INSERT INTO `talmacen` (`id`, `nombre`, `id_sucursal`) VALUES
(1, 'Almacen_Sucursal #1', 1),
(2, 'Almacen_Sucursal #2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tcambio`
--

CREATE TABLE `tcambio` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `TOTAL` int DEFAULT NULL,
  `estado` int DEFAULT '0',
  `id_venta` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcambio`
--

INSERT INTO `tcambio` (`id`, `fecha`, `TOTAL`, `estado`, `id_venta`, `id_empleado`) VALUES
(27, '2021-07-02', 0, 0, 60, 2),
(28, '2021-07-02', 0, 0, 60, 2),
(29, '2021-07-02', 0, 0, 60, 2),
(30, '2021-07-02', 0, 0, 60, 2),
(31, '2021-07-02', 0, 0, 60, 2),
(32, '2021-07-02', 0, 0, 60, 2),
(33, '2021-07-02', 0, 0, 60, 2),
(34, '2021-07-02', 0, 0, 60, 2),
(35, '2021-07-02', 0, 0, 60, 2),
(36, '2021-07-02', 0, 0, 60, 2),
(37, '2021-07-02', 0, 0, 60, 2),
(38, '2021-07-02', 0, 0, 60, 2),
(39, '2021-07-02', 0, 0, 60, 2),
(40, '2021-07-02', 0, 0, 60, 2),
(41, '2021-07-02', 0, 0, 60, 2),
(42, '2021-07-02', 0, 0, 97, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tcategoria`
--

CREATE TABLE `tcategoria` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcategoria`
--

INSERT INTO `tcategoria` (`id`, `nombre`, `estado`) VALUES
(1, 'Deportivo', 0),
(2, 'De Vestir', 0),
(3, 'Informal', 0),
(4, 'Frio', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcliente`
--

CREATE TABLE `tcliente` (
  `id` int NOT NULL,
  `estado` int DEFAULT '0',
  `id_persona` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcliente`
--

INSERT INTO `tcliente` (`id`, `estado`, `id_persona`) VALUES
(1, 1, 3),
(2, 0, 6),
(3, 0, 7),
(4, 0, 8),
(5, 0, 9),
(6, 1, 10),
(7, 1, 11),
(9, 1, 15),
(10, 0, 17),
(11, 0, 18),
(12, 0, 19),
(13, 0, 20),
(14, 0, 21),
(15, 0, 22),
(16, 0, 23),
(17, 0, 24),
(18, 0, 26),
(19, 0, 27),
(20, 0, 28);

-- --------------------------------------------------------

--
-- Table structure for table `tcolor`
--

CREATE TABLE `tcolor` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcolor`
--

INSERT INTO `tcolor` (`id`, `nombre`, `estado`) VALUES
(1, 'Rojo', 0),
(2, 'Amarillo', 0),
(3, 'Celeste', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tcompra`
--

CREATE TABLE `tcompra` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estado` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tcompra`
--

INSERT INTO `tcompra` (`id`, `fecha`, `total`, `estado`) VALUES
(0, NULL, 0, 0),
(2, '2021-06-10', 172, 0),
(3, '2021-06-10', 1200, 0),
(4, '2021-06-11', 1500, 0),
(5, '2021-06-11', 1500, 0),
(6, '2021-06-11', 240, 0),
(7, '2021-06-11', 220, 0),
(8, '2021-06-11', 286, 0),
(9, '2021-06-11', 66, 0),
(10, '2021-06-14', 5204, 0),
(11, '2021-06-17', 110, 0),
(12, '2021-06-17', 600, 0),
(13, '2021-06-17', 172, 0),
(14, '2021-06-17', 172, 0),
(15, '2021-06-17', 172, 0),
(16, '2021-06-18', 22, 0),
(17, '2021-06-18', 142, 0),
(18, '2021-06-18', 186, 0),
(19, '2021-06-18', 50, 0),
(20, '2021-06-18', 90, 0),
(21, '2021-06-18', 90, 0),
(22, '2021-06-18', 3000, 0),
(23, '2021-06-18', 45, 0),
(24, '2021-06-18', 900, 0),
(25, '2021-06-18', 1400, 0),
(26, '2021-06-19', 11560, 0),
(27, '2021-06-19', 59, 0),
(28, '2021-06-19', 2441, 0),
(29, '2021-06-23', 772, 0),
(30, '2021-06-23', 80, 0),
(31, '2021-06-23', 11910, 0),
(32, '2021-06-23', 4783, 0),
(33, '2021-06-23', 11900, 0),
(34, '2021-06-23', 80, 0),
(35, '2021-06-23', 4744, 0),
(36, '2021-06-24', 41, 0),
(37, '2021-06-24', 39, 0),
(38, '2021-06-24', 30, 0),
(39, '2021-06-24', 90, 0),
(40, '2021-06-24', 129, 0),
(41, '2021-06-24', 41, 0),
(42, '2021-06-24', 60, 0),
(43, '2021-06-24', 9, 0),
(44, '2021-06-24', 1410, 0),
(45, '2021-06-24', 363, 0),
(46, '2021-06-24', 45, 0),
(47, '2021-06-24', 731, 0),
(48, '2021-06-24', 10, 0),
(49, '2021-06-24', 179, 0),
(50, '2021-06-25', 89, 0),
(51, '2021-06-28', 150, 0),
(52, '2021-06-28', 39, 0),
(53, '2021-06-28', 1350, 0),
(54, '2021-06-28', 6965, 0),
(55, '2021-06-28', 7226, 0),
(56, '2021-06-28', 30, 0),
(57, '2021-06-28', 186, 0),
(58, '2021-06-28', 170, 0),
(59, '2021-06-28', 801, 0),
(60, '2021-06-28', 6989, 0),
(61, '2021-06-28', 199, 0),
(62, '2021-06-28', 11689, 0),
(63, '2021-06-28', 534, 0),
(64, '2021-06-28', 120, 0),
(65, '2021-06-28', 2523, 0),
(66, '2021-06-28', 2523, 0),
(67, '2021-06-30', 270, 0),
(68, '2021-06-30', 7742, 0),
(69, '2021-07-02', 159, 0),
(70, '2021-07-02', 20, 0),
(71, '2021-07-02', 54500, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tconcepto`
--

CREATE TABLE `tconcepto` (
  `id` int NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tconcepto`
--

INSERT INTO `tconcepto` (`id`, `descripcion`) VALUES
(1, 'Venta Productos'),
(2, 'Compra Productos'),
(3, 'Servicios'),
(4, 'Pasanaco');

-- --------------------------------------------------------

--
-- Table structure for table `tdetalle_cambio`
--

CREATE TABLE `tdetalle_cambio` (
  `id_cambio` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_cambio`
--

INSERT INTO `tdetalle_cambio` (`id_cambio`, `id_producto`, `cantidad`, `precio`) VALUES
(27, 12, 1, 10),
(28, 3, 1, 30),
(29, 9, 1, 2312),
(30, 9, 1, 2312),
(31, 9, 1, 2312),
(31, 1, 0, 9),
(31, 10, 0, 22),
(32, 9, 1, 2312),
(32, 1, 0, 9),
(32, 10, 0, 22),
(33, 9, 1, 2312),
(33, 1, 0, 9),
(33, 10, 0, 22),
(34, 11, 1, 120),
(34, 1, 0, 9),
(34, 10, 0, 22),
(35, 11, 1, 120),
(35, 1, 0, 9),
(35, 10, 0, 22),
(36, 11, 1, 120),
(36, 1, 0, 9),
(36, 10, 0, 22),
(37, 11, 1, 120),
(37, 1, 0, 9),
(37, 10, 0, 22),
(38, 11, 1, 120),
(38, 1, 0, 9),
(38, 10, 0, 22),
(39, 11, 1, 120),
(39, 1, 0, 9),
(39, 10, 0, 22),
(40, 12, 1, 10),
(40, 1, 0, 9),
(40, 10, 0, 22),
(41, 12, 1, 10),
(41, 1, 0, 9),
(41, 10, 0, 22),
(42, 1, 1, 9),
(42, 13, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tdetalle_compra`
--

CREATE TABLE `tdetalle_compra` (
  `id_compra` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `estado` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_compra`
--

INSERT INTO `tdetalle_compra` (`id_compra`, `id_producto`, `cantidad`, `precio`, `estado`) VALUES
(2, 11, 1, 120, 0),
(2, 10, 1, 22, 0),
(2, 3, 1, 30, 0),
(3, 11, 10, 120, 0),
(4, 3, 10, 30, 0),
(4, 11, 10, 120, 0),
(5, 3, 50, 30, 0),
(6, 3, 8, 30, 0),
(7, 10, 10, 22, 0),
(8, 10, 13, 22, 0),
(9, 10, 3, 22, 0),
(10, 11, 43, 120, 0),
(10, 10, 2, 22, 0),
(11, 10, 5, 22, 0),
(12, 11, 5, 120, 0),
(13, 3, 1, 30, 0),
(13, 10, 1, 22, 0),
(13, 11, 1, 120, 0),
(14, 11, 1, 120, 0),
(14, 10, 1, 22, 0),
(14, 3, 1, 30, 0),
(14, 11, 1, 120, 0),
(14, 10, 1, 22, 0),
(14, 3, 1, 30, 0),
(14, 11, 1, 120, 0),
(14, 10, 1, 22, 0),
(14, 3, 1, 30, 0),
(15, 11, 1, 120, 0),
(15, 10, 1, 22, 0),
(15, 3, 1, 30, 0),
(16, 10, 1, 22, 0),
(17, 11, 1, 120, 0),
(17, 10, 1, 22, 0),
(18, 10, 3, 22, 0),
(18, 3, 4, 30, 0),
(19, 12, 5, 10, 0),
(20, 1, 10, 9, 0),
(21, 1, 10, 9, 0),
(22, 3, 100, 30, 0),
(23, 1, 5, 9, 0),
(24, 1, 100, 9, 0),
(25, 2, 10, 50, 0),
(25, 1, 100, 9, 0),
(26, 9, 5, 2312, 0),
(27, 1, 1, 9, 0),
(27, 2, 1, 50, 0),
(28, 11, 1, 120, 0),
(28, 1, 1, 9, 0),
(28, 9, 1, 2312, 0),
(29, 10, 1, 22, 0),
(29, 2, 3, 50, 0),
(29, 11, 5, 120, 0),
(30, 3, 1, 30, 0),
(30, 2, 1, 50, 0),
(31, 9, 5, 2312, 0),
(31, 2, 7, 50, 0),
(32, 1, 1, 9, 0),
(32, 9, 2, 2312, 0),
(32, 2, 3, 50, 0),
(33, 12, 4, 10, 0),
(33, 9, 5, 2312, 0),
(33, 2, 6, 50, 0),
(34, 3, 1, 30, 0),
(34, 2, 1, 50, 0),
(35, 11, 1, 120, 0),
(35, 9, 2, 2312, 0),
(36, 10, 1, 22, 0),
(36, 12, 1, 10, 0),
(36, 1, 1, 9, 0),
(37, 1, 1, 9, 0),
(37, 3, 1, 30, 0),
(38, 3, 1, 30, 0),
(39, 12, 1, 10, 0),
(39, 2, 1, 50, 0),
(39, 3, 1, 30, 0),
(40, 11, 1, 120, 0),
(40, 1, 1, 9, 0),
(41, 12, 1, 10, 0),
(41, 1, 1, 9, 0),
(41, 10, 1, 22, 0),
(42, 12, 1, 10, 0),
(42, 2, 1, 50, 0),
(43, 1, 1, 9, 0),
(44, 1, 10, 9, 0),
(44, 11, 9, 120, 0),
(44, 3, 8, 30, 0),
(45, 1, 7, 9, 0),
(45, 2, 6, 50, 0),
(46, 1, 5, 9, 0),
(47, 3, 10, 30, 0),
(47, 2, 7, 50, 0),
(47, 1, 9, 9, 0),
(48, 12, 1, 10, 0),
(49, 1, 1, 9, 0),
(49, 11, 1, 120, 0),
(49, 2, 1, 50, 0),
(50, 3, 1, 30, 0),
(50, 2, 1, 50, 0),
(50, 1, 1, 9, 0),
(51, 3, 5, 30, 0),
(52, 1, 1, 9, 0),
(52, 3, 1, 30, 0),
(53, 11, 10, 120, 0),
(53, 2, 3, 50, 0),
(54, 9, 3, 2312, 0),
(54, 12, 2, 10, 0),
(54, 1, 1, 9, 0),
(55, 9, 3, 2312, 0),
(55, 11, 2, 120, 0),
(55, 2, 1, 50, 0),
(56, 3, 1, 30, 0),
(2, 11, 1, 120, 0),
(2, 10, 1, 22, 0),
(2, 3, 1, 30, 0),
(3, 11, 10, 120, 0),
(4, 3, 10, 30, 0),
(4, 11, 10, 120, 0),
(5, 3, 50, 30, 0),
(6, 3, 8, 30, 0),
(7, 10, 10, 22, 0),
(8, 10, 13, 22, 0),
(9, 10, 3, 22, 0),
(10, 11, 43, 120, 0),
(10, 10, 2, 22, 0),
(11, 10, 5, 22, 0),
(12, 11, 5, 120, 0),
(13, 3, 1, 30, 0),
(13, 10, 1, 22, 0),
(13, 11, 1, 120, 0),
(14, 11, 1, 120, 0),
(14, 10, 1, 22, 0),
(14, 3, 1, 30, 0),
(14, 11, 1, 120, 0),
(14, 10, 1, 22, 0),
(14, 3, 1, 30, 0),
(14, 11, 1, 120, 0),
(14, 10, 1, 22, 0),
(14, 3, 1, 30, 0),
(15, 11, 1, 120, 0),
(15, 10, 1, 22, 0),
(15, 3, 1, 30, 0),
(16, 10, 1, 22, 0),
(17, 11, 1, 120, 0),
(17, 10, 1, 22, 0),
(18, 10, 3, 22, 0),
(18, 3, 4, 30, 0),
(19, 12, 5, 10, 0),
(20, 1, 10, 9, 0),
(21, 1, 10, 9, 0),
(22, 3, 100, 30, 0),
(23, 1, 5, 9, 0),
(24, 1, 100, 9, 0),
(25, 2, 10, 50, 0),
(25, 1, 100, 9, 0),
(26, 9, 5, 2312, 0),
(27, 1, 1, 9, 0),
(27, 2, 1, 50, 0),
(28, 11, 1, 120, 0),
(28, 1, 1, 9, 0),
(28, 9, 1, 2312, 0),
(29, 10, 1, 22, 0),
(29, 2, 3, 50, 0),
(29, 11, 5, 120, 0),
(30, 3, 1, 30, 0),
(30, 2, 1, 50, 0),
(31, 9, 5, 2312, 0),
(31, 2, 7, 50, 0),
(32, 1, 1, 9, 0),
(32, 9, 2, 2312, 0),
(32, 2, 3, 50, 0),
(33, 12, 4, 10, 0),
(33, 9, 5, 2312, 0),
(33, 2, 6, 50, 0),
(34, 3, 1, 30, 0),
(34, 2, 1, 50, 0),
(35, 11, 1, 120, 0),
(35, 9, 2, 2312, 0),
(36, 10, 1, 22, 0),
(36, 12, 1, 10, 0),
(36, 1, 1, 9, 0),
(37, 1, 1, 9, 0),
(37, 3, 1, 30, 0),
(38, 3, 1, 30, 0),
(39, 12, 1, 10, 0),
(39, 2, 1, 50, 0),
(39, 3, 1, 30, 0),
(40, 11, 1, 120, 0),
(40, 1, 1, 9, 0),
(41, 12, 1, 10, 0),
(41, 1, 1, 9, 0),
(41, 10, 1, 22, 0),
(42, 12, 1, 10, 0),
(42, 2, 1, 50, 0),
(43, 1, 1, 9, 0),
(44, 1, 10, 9, 0),
(44, 11, 9, 120, 0),
(44, 3, 8, 30, 0),
(45, 1, 7, 9, 0),
(45, 2, 6, 50, 0),
(46, 1, 5, 9, 0),
(47, 3, 10, 30, 0),
(47, 2, 7, 50, 0),
(47, 1, 9, 9, 0),
(48, 12, 1, 10, 0),
(49, 1, 1, 9, 0),
(49, 11, 1, 120, 0),
(49, 2, 1, 50, 0),
(50, 3, 1, 30, 0),
(50, 2, 1, 50, 0),
(50, 1, 1, 9, 0),
(51, 3, 5, 30, 0),
(52, 1, 1, 9, 0),
(52, 3, 1, 30, 0),
(53, 11, 10, 120, 0),
(53, 2, 3, 50, 0),
(54, 9, 3, 2312, 0),
(54, 12, 2, 10, 0),
(54, 1, 1, 9, 0),
(55, 9, 3, 2312, 0),
(55, 11, 2, 120, 0),
(55, 2, 1, 50, 0),
(56, 3, 1, 30, 0),
(57, 1, 4, 9, 0),
(57, 3, 5, 30, 0),
(58, 11, 1, 120, 0),
(58, 2, 1, 50, 0),
(59, 11, 6, 120, 0),
(59, 1, 9, 9, 0),
(60, 9, 3, 2312, 0),
(60, 10, 2, 22, 0),
(60, 1, 1, 9, 0),
(61, 3, 3, 30, 0),
(61, 2, 2, 50, 0),
(61, 1, 1, 9, 0),
(62, 9, 5, 2312, 0),
(62, 11, 1, 120, 0),
(62, 1, 1, 9, 0),
(63, 12, 7, 10, 0),
(63, 10, 12, 22, 0),
(63, 2, 4, 50, 0),
(64, 11, 1, 120, 0),
(65, 12, 1, 10, 0),
(65, 11, 1, 120, 0),
(65, 10, 1, 22, 0),
(65, 9, 1, 2312, 0),
(65, 2, 1, 50, 0),
(65, 1, 1, 9, 0),
(66, 12, 1, 10, 0),
(66, 11, 1, 120, 0),
(66, 10, 1, 22, 0),
(66, 9, 1, 2312, 0),
(66, 2, 1, 50, 0),
(66, 1, 1, 9, 0),
(67, 1, 10, 9, 0),
(67, 3, 6, 30, 0),
(68, 3, 87, 30, 0),
(68, 10, 231, 22, 0),
(68, 2, 1, 50, 0),
(69, 11, 1, 120, 0),
(69, 3, 1, 30, 0),
(69, 1, 1, 9, 0),
(70, 13, 10, 2, 0),
(71, 2, 1000, 50, 0),
(71, 1, 500, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tdetalle_venta`
--

CREATE TABLE `tdetalle_venta` (
  `id_venta` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdetalle_venta`
--

INSERT INTO `tdetalle_venta` (`id_venta`, `id_producto`, `cantidad`, `precio`) VALUES
(6, 10, 1, 22),
(6, 3, 1, 30),
(7, 10, 1, 22),
(7, 3, 1, 30),
(8, 3, 18, 30),
(9, 3, 3, 90),
(10, 10, 1, 22),
(11, 10, 98, 2156),
(11, 3, 5, 150),
(12, 10, 1, 22),
(13, 10, 1, 22),
(13, 3, 1, 30),
(14, 10, 1, 22),
(15, 10, 1, 22),
(15, 3, 4, 120),
(16, 10, 4, 88),
(17, 10, 10, 220),
(17, 3, 10, 300),
(18, 3, 2, 60),
(19, 10, 1, 22),
(19, 3, 2, 30),
(20, 10, 10, 22),
(20, 3, 10, 30),
(21, 3, 3, 30),
(22, 3, 3, 30),
(23, 3, 34, 30),
(24, 3, 1, 30),
(25, 3, 4, 30),
(26, 3, 3, 30),
(26, 10, 4, 22),
(27, 10, 2, 22),
(27, 3, 2, 30),
(28, 3, 5, 30),
(29, 10, 4, 22),
(30, 3, 5, 30),
(31, 3, 5, 30),
(32, 3, 5, 30),
(33, 10, 1, 22),
(34, 3, 1, 30),
(35, 11, 20, 120),
(35, 3, 10, 30),
(36, 11, 5, 120),
(36, 3, 2, 30),
(39, 3, 1, 30),
(40, 11, 1, 120),
(41, 3, 99, 30),
(42, 10, 2, 22),
(45, 3, 12, 30),
(46, 11, 1, 120),
(46, 3, 1, 30),
(47, 11, 1, 120),
(48, 11, 2, 120),
(48, 3, 2, 30),
(49, 3, 10, 30),
(50, 3, 10, 30),
(51, 11, 10, 120),
(52, 11, 5, 120),
(53, 11, 1, 120),
(53, 3, 4, 30),
(54, 11, 3, 120),
(54, 3, 5, 30),
(55, 3, 1, 30),
(56, 11, 4, 120),
(57, 3, 2, 30),
(57, 11, 2, 120),
(58, 10, 5, 22),
(59, 3, 5, 30),
(60, 1, 3, 9),
(60, 10, 5, 22),
(61, 10, 2, 22),
(61, 1, 3, 9),
(62, 11, 1, 120),
(63, 12, 1, 10),
(63, 9, 1, 2312),
(65, 10, 1, 22),
(27, 12, 1, 10),
(28, 3, 1, 30),
(83, 9, 1, 2312),
(84, 9, 1, 2312),
(85, 9, 1, 2312),
(85, 1, 0, 9),
(85, 10, 0, 22),
(86, 9, 1, 2312),
(86, 1, 0, 9),
(86, 10, 0, 22),
(87, 9, 1, 2312),
(87, 1, 0, 9),
(87, 10, 0, 22),
(88, 11, 1, 120),
(88, 1, 0, 9),
(88, 10, 0, 22),
(89, 11, 1, 120),
(89, 1, 0, 9),
(89, 10, 0, 22),
(90, 11, 1, 120),
(90, 1, 0, 9),
(90, 10, 0, 22),
(91, 11, 1, 120),
(91, 1, 0, 9),
(91, 10, 0, 22),
(92, 11, 1, 120),
(92, 1, 0, 9),
(92, 10, 0, 22),
(93, 11, 1, 120),
(93, 1, 0, 9),
(93, 10, 0, 22),
(94, 12, 1, 10),
(94, 1, 0, 9),
(94, 10, 0, 22),
(95, 12, 1, 10),
(95, 1, 0, 9),
(95, 10, 0, 22),
(96, 12, 1, 10),
(96, 11, 1, 120),
(96, 10, 1, 22),
(96, 9, 1, 2312),
(96, 3, 1, 30),
(96, 2, 1, 50),
(96, 1, 1, 9),
(97, 13, 10, 2),
(98, 1, 1, 9),
(98, 13, 5, 2),
(99, 3, 1000, 30),
(99, 1, 1, 9),
(100, 2, 900, 50),
(100, 1, 1000, 9);

-- --------------------------------------------------------

--
-- Table structure for table `templeado`
--

CREATE TABLE `templeado` (
  `id` int NOT NULL,
  `sueldo` float DEFAULT NULL,
  `estado` int DEFAULT '0',
  `idPersona` int DEFAULT NULL,
  `id_sucursal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `templeado`
--

INSERT INTO `templeado` (`id`, `sueldo`, `estado`, `idPersona`, `id_sucursal`) VALUES
(1, 100, 0, 1, 1),
(2, 10, 0, 2, 2),
(3, 10.04, 0, 4, 2),
(4, 123, 0, 5, 2),
(5, 1231230, 0, 12, 1),
(6, 123, 0, 13, 2),
(8, 123, 0, 16, 1),
(9, 1, 0, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tmarca`
--

CREATE TABLE `tmarca` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmarca`
--

INSERT INTO `tmarca` (`id`, `nombre`, `estado`) VALUES
(1, 'Nike', 0),
(2, 'Gucci', 0),
(3, 'Supreme', 0),
(4, 'Adidas', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tmovimiento`
--

CREATE TABLE `tmovimiento` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` text,
  `total` float DEFAULT NULL,
  `estado` int DEFAULT '0',
  `id_empleado` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `id_tipo_transaccion` int DEFAULT NULL,
  `id_venta` int DEFAULT NULL,
  `id_compra` int DEFAULT NULL,
  `id_sucursal` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmovimiento`
--

INSERT INTO `tmovimiento` (`id`, `fecha`, `descripcion`, `total`, `estado`, `id_empleado`, `id_concepto`, `id_tipo_transaccion`, `id_venta`, `id_compra`, `id_sucursal`) VALUES
(1, '2021-06-08', 'Venta', 120, 0, 1, 1, 1, 35, 0, 1),
(2, '2021-06-08', 'Venta', 660, 0, 1, 1, 1, 36, 0, 1),
(3, '2021-06-08', 'Venta', 30, 0, 1, 1, 1, 39, 0, 1),
(4, '2021-06-08', 'Venta', 120, 0, 1, 1, 1, 40, 0, 1),
(5, '2021-06-08', 'Venta', 2970, 0, 1, 1, 1, 41, 0, 1),
(6, '2021-06-08', 'Venta', 44, 0, 2, 1, 1, 42, 0, 2),
(7, '2021-06-10', 'Compra', 172, 0, 1, 2, 2, 0, 2, 1),
(8, '2021-06-10', 'Compra', 1200, 0, 1, 2, 2, 0, 3, 1),
(9, '2021-06-10', 'as', 123, 0, 1, 3, 1, 0, 0, 1),
(10, '2021-06-10', 'Venta', 150, 0, 1, 1, 1, 46, 0, 1),
(13, '2021-06-10', 'Venta', 120, 0, 1, 1, 1, 47, 0, 1),
(75, '2021-06-10', 'REGISTRA PORFAVOOOOOOR', 123123, 0, 1, 3, 1, 0, 0, 1),
(76, '2021-06-10', 'AL PARECER, SI REGISTRA', 100, 0, 1, 3, 2, 0, 0, 1),
(77, '2021-06-10', 'sdasedas', 32123, 0, 1, 3, 1, 0, 0, 1),
(78, '2021-06-10', 'pork diosito', 3213, 0, 1, 3, 1, 0, 0, 1),
(79, '2021-06-10', 'Venta', 300, 0, 1, 1, 1, 48, 0, 1),
(80, '2021-06-11', 'Venta', 300, 0, 1, 1, 1, 49, 0, 1),
(81, '2021-06-11', 'Venta', 300, 0, 1, 1, 1, 50, 0, 1),
(82, '2021-06-11', 'Venta', 1200, 0, 1, 1, 1, 51, 0, 1),
(83, '2021-06-11', 'Venta', 600, 0, 1, 1, 1, 52, 0, 1),
(84, '2021-06-11', 'Compra', 1500, 0, 1, 2, 2, 0, 4, 1),
(85, '2021-06-11', 'Compra', 1500, 0, 1, 2, 2, 0, 5, 1),
(86, '2021-06-11', 'Compra', 240, 0, 1, 2, 2, 0, 6, 1),
(87, '2021-06-11', 'Compra', 220, 0, 1, 2, 2, 0, 7, 1),
(88, '2021-06-11', 'Venta', 240, 0, 1, 1, 1, 53, 0, 1),
(89, '2021-06-11', 'Compra', 286, 0, 1, 2, 2, 0, 8, 1),
(90, '2021-06-11', 'Pasanaco', 32, 0, 1, 4, 1, 0, 0, 1),
(91, '2021-06-11', 'Venta', 510, 0, 1, 1, 1, 54, 0, 1),
(92, '2021-06-11', 'Compra', 66, 0, 1, 2, 2, 0, 9, 1),
(93, '2021-06-14', 'Wiii', 423, 0, 1, 3, 1, 0, 0, 1),
(94, '2021-06-14', 'Venta', 30, 0, 1, 1, 1, 55, 0, 1),
(95, '2021-06-14', 'aaa', 44, 0, 1, 3, 1, 0, 0, 1),
(96, '2021-06-14', 'INSERTA POR PORFAVOOOOOR', 31231200, 0, 1, 3, 1, 0, 0, 1),
(97, '2021-06-14', 'Compra', 5204, 0, 1, 2, 2, 0, 10, 1),
(98, '2021-06-14', 'Nose', 1, 0, 1, 3, 1, 0, 0, 1),
(99, '2021-06-14', '2', 2, 0, 1, 3, 1, 0, 0, 1),
(100, '2021-06-14', '3', 3, 0, 1, 3, 1, 0, 0, 1),
(101, '2021-06-14', '4', 4, 0, 1, 3, 2, 0, 0, 1),
(102, '2021-06-14', 'Venta', 480, 0, 1, 1, 1, 56, 0, 1),
(103, '2021-06-14', 'Me toco pasano de 553boli', 553, 0, 1, 4, 1, 0, 0, 1),
(104, '2021-06-17', 'Venta', 300, 0, 1, 1, 1, 57, 0, 1),
(105, '2021-06-17', '123', 123, 0, 1, 3, 1, 0, 0, 1),
(106, '2021-06-17', 'Compra', 110, 0, 1, 2, 2, 0, 11, 1),
(107, '2021-06-17', 'Compra', 600, 0, 1, 2, 2, 0, 12, 1),
(108, '2021-06-17', 'Compra', 172, 0, 1, 2, 2, 0, 13, 1),
(109, '2021-06-17', 'Compra', 172, 0, 1, 2, 2, 0, 14, 1),
(110, '2021-06-17', 'Compra', 172, 0, 1, 2, 2, 0, 14, 1),
(111, '2021-06-17', 'Compra', 172, 0, 1, 2, 2, 0, 14, 2),
(112, '2021-06-17', 'Compra', 172, 0, 1, 2, 2, 0, 15, 1),
(113, '2021-06-18', 'Compra', 22, 0, 1, 2, 2, 0, 16, 2),
(114, '2021-06-18', 'Compra', 142, 0, 1, 2, 2, 0, 17, 1),
(115, '2021-06-18', 'Compra', 186, 0, 1, 2, 2, 0, 18, 1),
(116, '2021-06-18', 'Compra', 50, 0, 1, 2, 2, 0, 19, 1),
(117, '2021-06-18', 'Venta', 110, 0, 1, 1, 1, 58, 0, 1),
(118, '2021-06-18', 'Comida!', 4543, 0, 1, 3, 2, 0, 0, 1),
(119, '2021-06-18', 'Compra', 90, 0, 1, 2, 2, 0, 20, 1),
(120, '2021-06-18', 'Compra', 90, 0, 1, 2, 2, 0, 21, 1),
(121, '2021-06-18', 'Venta', 150, 0, 1, 1, 1, 59, 0, 1),
(122, '2021-06-18', 'Compra', 3000, 0, 1, 2, 2, 0, 22, 1),
(123, '2021-06-18', 'Compra', 45, 0, 1, 2, 2, 0, 23, 1),
(124, '2021-06-18', 'Compra', 900, 0, 1, 2, 2, 0, 24, 1),
(125, '2021-06-18', 'Compra', 1400, 0, 1, 2, 2, 0, 25, 1),
(126, '2021-06-19', 'Compra', 11560, 0, 1, 2, 2, 0, 26, 1),
(127, '2021-06-19', 'Compra', 59, 0, 1, 2, 2, 0, 27, 1),
(128, '2021-06-19', 'Compra', 2441, 0, 1, 2, 2, 0, 28, 1),
(129, '2021-06-23', 'Venta', 137, 0, 2, 1, 1, 60, 0, 2),
(130, '2021-06-23', 'Venta', 71, 0, 2, 1, 1, 61, 0, 2),
(131, '2021-06-23', 'Pasanacuuu', 2, 0, 2, 4, 2, 0, 0, 2),
(132, '2021-06-23', 'aaaaaa', 453, 0, 1, 4, 2, 0, 0, 1),
(133, '2021-06-23', 'asdasas', 300, 0, 2, 3, 1, 0, 0, 2),
(134, '2021-06-23', 'Compra', 772, 0, 2, 2, 2, 0, 29, 2),
(135, '2021-06-23', 'Compra', 80, 0, 2, 2, 2, 0, 30, 2),
(136, '2021-06-23', 'Compra', 11910, 0, 2, 2, 2, 0, 31, 2),
(137, '2021-06-23', 'Compra', 4783, 0, 2, 2, 2, 0, 32, 2),
(138, '2021-06-23', 'Compra', 11900, 0, 2, 2, 2, 0, 33, 2),
(139, '2021-06-23', 'Compra', 80, 0, 2, 2, 2, 0, 34, 2),
(140, '2021-06-23', 'Compra', 4744, 0, 2, 2, 2, 0, 35, 2),
(141, '2021-06-24', 'Compra', 41, 0, 2, 2, 2, 0, 36, 2),
(142, '2021-06-24', 'Compra', 39, 0, 2, 2, 2, 0, 37, 2),
(143, '2021-06-24', 'Compra', 30, 0, 2, 2, 2, 0, 38, 2),
(144, '2021-06-24', 'Compra', 90, 0, 2, 2, 2, 0, 39, 2),
(145, '2021-06-24', 'Compra', 129, 0, 2, 2, 2, 0, 40, 2),
(146, '2021-06-24', 'Compra', 41, 0, 2, 2, 2, 0, 41, 2),
(147, '2021-06-24', 'Compra', 60, 0, 2, 2, 2, 0, 42, 2),
(148, '2021-06-24', 'Compra', 9, 0, 2, 2, 2, 0, 43, 2),
(149, '2021-06-24', 'Compra', 1410, 0, 2, 2, 2, 0, 44, 2),
(150, '2021-06-24', 'Compra', 363, 0, 2, 2, 2, 0, 45, 2),
(151, '2021-06-24', 'Compra', 45, 0, 2, 2, 2, 0, 46, 2),
(152, '2021-06-24', 'Compra', 731, 0, 2, 2, 2, 0, 47, 2),
(153, '2021-06-24', 'Compra', 10, 0, 2, 2, 2, 0, 48, 2),
(154, '2021-06-24', 'Compra', 179, 0, 2, 2, 2, 0, 49, 2),
(155, '2021-06-25', 'Compra', 89, 0, 2, 2, 2, 0, 50, 2),
(156, '2021-06-28', 'Compra', 150, 0, 2, 2, 2, 0, 51, 2),
(157, '2021-06-28', 'Compra', 39, 0, 2, 2, 2, 0, 52, 2),
(158, '2021-06-28', 'Compra', 1350, 0, 2, 2, 2, 0, 53, 2),
(159, '2021-06-28', 'Compra', 6965, 0, 2, 2, 2, 0, 54, 2),
(160, '2021-06-28', 'Compra', 7226, 0, 2, 2, 2, 0, 55, 2),
(161, '2021-06-28', 'Compra', 30, 0, 2, 2, 2, 0, 56, 2),
(162, '2021-06-28', 'Compra', 186, 0, 2, 2, 2, 0, 57, 2),
(163, '2021-06-28', 'Compra', 170, 0, 2, 2, 2, 0, 58, 2),
(164, '2021-06-28', 'Compra', 801, 0, 2, 2, 2, 0, 59, 2),
(165, '2021-06-28', 'Compra', 6989, 0, 2, 2, 2, 0, 60, 2),
(166, '2021-06-28', 'Compra', 199, 0, 2, 2, 2, 0, 61, 2),
(167, '2021-06-28', 'EEEE', 22, 0, 2, 3, 1, 0, 0, 2),
(168, '2021-06-28', 'Compra', 11689, 0, 2, 2, 2, 0, 62, 2),
(174, '2021-06-30', 'Venta', 2322, 0, 1, 1, 1, 63, 0, 1),
(175, '2021-06-30', 'Compra', 270, 0, 1, 2, 2, 0, 67, 1),
(176, '2021-06-30', 'Compra', 7742, 0, 1, 2, 2, 0, 68, 1),
(177, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 60, 0, 1),
(178, '2021-07-02', 'Venta', 22, 0, 1, 1, 1, 65, 0, 1),
(179, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 86, 0, 1),
(180, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 87, 0, 1),
(181, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 88, 0, 1),
(182, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 89, 0, 1),
(183, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 90, 0, 1),
(184, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 91, 0, 1),
(185, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 92, 0, 1),
(186, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 93, 0, 1),
(187, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 94, 0, 1),
(188, '2021-07-02', 'Cambio - Ingreso', 0, 0, 2, 1, 1, 95, 0, 1),
(189, '2021-07-02', 'Venta', 2553, 0, 1, 1, 1, 96, 0, 1),
(190, '2021-07-02', 'Compra', 159, 0, 1, 2, 2, 0, 69, 1),
(191, '2021-07-02', 'Compra', 20, 0, 1, 2, 2, 0, 70, 1),
(192, '2021-07-02', 'Venta', 20, 0, 1, 1, 1, 97, 0, 1),
(193, '2021-07-02', 'Cambio - Ingreso', 0, 0, 1, 1, 1, 98, 0, 1),
(194, '2021-07-02', 'Venta', 30009, 0, 1, 1, 1, 99, 0, 1),
(195, '2021-07-02', 'Venta', 54000, 0, 1, 1, 1, 100, 0, 1),
(196, '2021-07-02', 'Compra', 54500, 0, 1, 2, 2, 0, 71, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tpersona`
--

CREATE TABLE `tpersona` (
  `id` int NOT NULL,
  `ci` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apPaterno` varchar(100) DEFAULT NULL,
  `apMaterno` varchar(100) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpersona`
--

INSERT INTO `tpersona` (`id`, `ci`, `nombre`, `apPaterno`, `apMaterno`, `telefono`, `direccion`) VALUES
(1, '8191588', 'Jose Armando', 'Silva ', 'Moro', 78490889, '7mo. Anillo'),
(2, '90', 'Emiliano', 'Perez', 'Moro', 22222222, 'Adcdas'),
(3, '1', 'Asd', 'Asd', 'Asxd', 12322222, 'N/A'),
(4, '1233', 'Lucas', 'Asd', 'Asd', 12333456, 'asd'),
(5, '2', 'Andres', 'Roca', 'Xdddd', 27387283, 'aaAaA'),
(6, '7263', 'Juancito', 'Pinto', 'Xd', 12222222, 'N/A'),
(7, '1SC', 'Asd', 'Asd', 'Asd', 12312312, 'N/A'),
(8, '1', 'Asdqasd', 'Asd', 'Asd', 12312312, 'N/A'),
(9, '4SC', 'Asdasdasd', 'Asdasda', 'Asdasd', 12312312, 'N/A'),
(10, '52312', 'Asads', 'Easda', 'Isdasd', 22222312, 'N/A'),
(11, '1234567', 'Piensa', 'Mark', 'Piensa', 12345678, 'N/A'),
(12, '33', 'Marktres', 'Marktres', 'Marktres', 12333333, 'Marktres'),
(13, '22', 'Markdos', 'Markdos', 'Markdos', 12312312, 'Markdos'),
(15, '6663', 'Seise', 'Seise', 'Seise', 66666663, 'N/A'),
(16, '5', 'Silva', 'Silva', 'Silva', 12312312, 'Silva'),
(17, '2', 'Pedro', 'Martinez', 'Asd', 12312312, 'N/A'),
(18, '6', 'Asd', 'Sda', 'Adss', 12312312, 'N/A'),
(19, '534231', 'Asdasd', 'Asdas', 'Adasd', 12312312, 'N/A'),
(20, '1231212312', 'Asdasda', 'Asdasda', 'Asdasd', 22222222, 'N/A'),
(21, '43442', 'Adsads', 'Dasasd', 'Dasads', 23212312, 'N/A'),
(22, '123123', 'Fsdfsdf', 'Sdfsdf', 'Sdfsdfsdf', 23421341, 'N/A'),
(23, '222222', 'Sdasads', 'Adsasd', 'Sdasd', 23123123, 'N/A'),
(24, '74543', 'Linke', 'Link', 'Linka', 12312312, 'N/A'),
(25, '0', 'Marco', 'Marco', 'Marco', 12312312, 'marco'),
(26, '564908564890', 'Soy Nuebo', 'Soy Nuebo', 'Soy Nuebo', 12323112, 'N/A'),
(27, '132123123123231231', 'Soy Nuebo', 'Soy Nuebo', 'Soi Nuebo', 12312312, 'N/A'),
(28, '55', 'Mario', 'Moreno', 'Lopez', 55555555, 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `tproducto`
--

CREATE TABLE `tproducto` (
  `id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `talla` varchar(100) DEFAULT NULL,
  `foto` text,
  `precio` float DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_color` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tproducto`
--

INSERT INTO `tproducto` (`id`, `nombre`, `talla`, `foto`, `precio`, `id_marca`, `id_categoria`, `id_color`, `id_proveedor`) VALUES
(1, 'Tailwind 79', '20', 'https://www.boliviamall.com/images/TTIPC055_M.jpg', 9, 2, 2, 1, 1),
(2, 'React Vision', '30', 'https://www.boliviamall.com/images/TTIPC055_M.jpg', 50, 3, 1, 1, 1),
(3, 'Air Force 1', '20', 'p1.jpg', 30, 2, 1, 1, 2),
(9, 'Air Max 270', '2222', 'p3.jpg', 2312, 1, 3, 1, 2),
(10, 'Waffle Racer', '22', 'a.mp4', 22, 1, 2, 1, 2),
(11, 'Sneakers', '22', NULL, 120, 2, 2, 2, 2),
(12, 'Champ', '10', 'p2.jpg', 10, 2, 3, 2, 2),
(13, 'Nimodo Pue', '123', 'LINA.jpg', 2, 2, 3, 1, 3),
(14, 'Nimodo Pue', '123', 'LINA.jpg', 2, 2, 3, 1, 3),
(15, 'Zapatilla Algo', '23', NULL, 152, 2, 1, 1, 3),
(16, 'Zapatos Super', '23', 'descarga (1).jfif', 120, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tproducto_almacen`
--

CREATE TABLE `tproducto_almacen` (
  `id_producto` int DEFAULT NULL,
  `id_almacen` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tproducto_almacen`
--

INSERT INTO `tproducto_almacen` (`id_producto`, `id_almacen`, `cantidad`, `ubicacion`) VALUES
(3, 1, 87, 'A_2'),
(1, 1, 255, 'N/A'),
(9, 1, 993, 'N/A'),
(2, 1, 580, 'N/A'),
(12, 1, 969, 'N/A'),
(10, 1, 1237, 'N/A'),
(11, 1, 992, 'N/A'),
(10, 2, 0, 'N/A'),
(11, 2, 0, 'N/A'),
(3, 2, 0, 'N/A'),
(2, 2, 510, 'N/A'),
(1, 2, 255, 'N/A'),
(13, 1, 5, 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `tproveedor`
--

CREATE TABLE `tproveedor` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tproveedor`
--

INSERT INTO `tproveedor` (`id`, `nombre`, `telefono`, `estado`) VALUES
(1, 'Microsoft', 12345678, 1),
(2, 'Apple', 11231231, 0),
(3, 'Zalza', 11111111, 0),
(4, 'Xddddddddddddddddddddddddd', 12345688, 0),
(5, 'Sdfsdfsdfsdf', 24234234, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tsucursal`
--

CREATE TABLE `tsucursal` (
  `id` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tsucursal`
--

INSERT INTO `tsucursal` (`id`, `nombre`) VALUES
(1, 'Sucursal #1'),
(2, 'Sucursal #2');

-- --------------------------------------------------------

--
-- Table structure for table `ttemporal`
--

CREATE TABLE `ttemporal` (
  `id` int NOT NULL,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` float NOT NULL,
  `estado` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttemporal`
--

INSERT INTO `ttemporal` (`id`, `id_compra`, `id_producto`, `cantidad`, `precio`, `estado`) VALUES
(1, 0, 0, 0, 0, 0),
(2, 57, 1, 0, 9, 0),
(3, 57, 3, 0, 30, 0),
(4, 58, 11, 0, 120, 0),
(5, 58, 2, 0, 50, 0),
(6, 59, 11, 0, 120, 0),
(7, 59, 1, 0, 9, 0),
(8, 60, 9, 0, 2312, 0),
(9, 60, 10, 0, 22, 0),
(10, 60, 1, 0, 9, 0),
(11, 61, 3, 0, 30, 0),
(12, 61, 2, 0, 50, 0),
(13, 61, 1, 0, 9, 0),
(14, 62, 9, 0, 2312, 0),
(15, 62, 11, 0, 120, 0),
(16, 62, 1, 0, 9, 0),
(17, 63, 12, 0, 10, 0),
(18, 63, 10, 0, 22, 0),
(19, 63, 2, 0, 50, 0),
(20, 64, 11, 0, 120, 0),
(21, 65, 12, 0, 10, 0),
(22, 65, 11, 0, 120, 0),
(23, 65, 10, 0, 22, 0),
(24, 65, 9, 0, 2312, 0),
(25, 65, 2, 0, 50, 0),
(26, 65, 1, 0, 9, 0),
(27, 66, 12, 0, 10, 0),
(28, 66, 11, 0, 120, 0),
(29, 66, 10, 0, 22, 0),
(30, 66, 9, 0, 2312, 0),
(31, 66, 2, 0, 50, 0),
(32, 66, 1, 0, 9, 0),
(33, 67, 1, 0, 9, 0),
(34, 67, 3, 0, 30, 0),
(35, 68, 3, 0, 30, 0),
(36, 68, 10, 0, 22, 0),
(37, 68, 2, 0, 50, 0),
(38, 69, 11, 0, 120, 0),
(39, 69, 3, 0, 30, 0),
(40, 69, 1, 0, 9, 0),
(41, 70, 13, 0, 2, 0),
(42, 71, 2, 0, 50, 0),
(43, 71, 1, 0, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ttipousuario`
--

CREATE TABLE `ttipousuario` (
  `id` int NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttipousuario`
--

INSERT INTO `ttipousuario` (`id`, `descripcion`) VALUES
(1, 'Admnin'),
(2, 'Vendedor'),
(3, 'Encargado de Sucursal'),
(4, 'Encargado de Almacen');

-- --------------------------------------------------------

--
-- Table structure for table `ttipo_transaccion`
--

CREATE TABLE `ttipo_transaccion` (
  `id` int NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ttipo_transaccion`
--

INSERT INTO `ttipo_transaccion` (`id`, `descripcion`) VALUES
(1, 'Ingreso'),
(2, 'Egreso');

-- --------------------------------------------------------

--
-- Table structure for table `tusuario`
--

CREATE TABLE `tusuario` (
  `id` int NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  `id_tipo_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tusuario`
--

INSERT INTO `tusuario` (`id`, `usuario`, `password`, `estado`, `idEmpleado`, `id_tipo_usuario`) VALUES
(1, 'admin', '$2y$10$b.xHvdUHwU1DXZRA5TFwVehdh8BnZW5eG9E2625uwqWOFCpuEmMda', 0, 1, 1),
(2, '90', '$2y$10$ukDUBiHRergSJ7SVDm/stOPleYmLRcOEjQWgoPNZuoToQ1y5jXavq', 0, 2, 1),
(3, '1233', '$2y$10$n5nPrG/1/RfmgSWNYNQsoOHGOjcpGUiLP4b1N3kjGr/wPY0RiLLNi', 0, 3, 4),
(4, '2', '$2y$10$rUIeYOlZcv38btRzzCJ9jOBKY.apn.E9WBtghhbxxYi/WJLcsObBW', 0, 4, 3),
(5, '33', '$2y$10$pae99WCD7V4YoibozwWZMO9ia3x24CKndCcFlsL3.Dc0y4p4RL7L2', 0, 5, 2),
(6, '22', '$2y$10$avPZk9g5oSuixjbSw2QL4OZ92GCSkuCJNNBeuUtGbjXJx2wLuGivm', 0, 6, 2),
(7, '5', '$2y$10$KONEsJ9Ea5MZ1tfMwLcIKuaiha2tqL0hYeAm8HR3JX3XpudbIwLjG', 0, 8, 2),
(8, '001', '$2y$10$Q/YSfrhSN47MbXFVj7OY/eJm8uPCXwRq4wx139T.W36cRVkULFO3i', 0, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tventa`
--

CREATE TABLE `tventa` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estado` int DEFAULT '0',
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tventa`
--

INSERT INTO `tventa` (`id`, `fecha`, `total`, `estado`, `id_cliente`, `id_empleado`) VALUES
(0, NULL, 0, 0, NULL, NULL),
(6, '2021-06-04', 52, 0, 5, 1),
(7, '2021-06-04', 52, 0, 2, 1),
(8, '2021-06-04', 30, 0, 4, 1),
(9, '2021-06-04', 30, 0, 5, 1),
(10, '2021-06-04', 22, 0, 5, 1),
(11, '2021-06-04', 2306, 0, 2, 1),
(12, '2021-06-04', 22, 0, 4, 1),
(13, '2021-06-04', 52, 0, 5, 1),
(14, '2021-06-04', 22, 0, 4, 1),
(15, '2021-06-04', 142, 0, 5, 1),
(16, '2021-06-04', 88, 0, 5, 1),
(17, '2021-06-04', 520, 0, 1, 1),
(18, '2021-06-04', 60, 0, 5, 1),
(19, '2021-06-04', 82, 0, 3, 1),
(20, '2021-06-04', 520, 0, 4, 1),
(21, '2021-06-04', 90, 0, 3, 1),
(22, '2021-06-04', 90, 0, 3, 1),
(23, '2021-06-04', 1020, 0, 2, 1),
(24, '2021-06-06', 30, 0, 2, 1),
(25, '2021-06-06', 120, 0, 1, 1),
(26, '2021-06-06', 178, 0, 6, 1),
(27, '2021-06-06', 104, 0, 5, 1),
(28, '2021-06-06', 150, 0, 1, 2),
(29, '2021-06-06', 88, 0, 5, 2),
(30, '2021-06-06', 150, 0, 4, 1),
(31, '2021-06-06', 150, 0, 1, 1),
(32, '2021-06-06', 150, 0, 6, 1),
(33, '2021-06-07', 22, 0, 3, 2),
(34, '2021-06-07', 30, 0, 3, 1),
(35, '2021-06-07', 2700, 0, 5, 1),
(36, '2021-06-08', 660, 0, 6, 1),
(37, '2021-06-08', 1080, 0, 6, 1),
(38, '2021-06-08', 270, 0, 5, 1),
(39, '2021-06-08', 30, 0, 4, 1),
(40, '2021-06-08', 120, 0, 4, 1),
(41, '2021-06-08', 2970, 0, 4, 1),
(42, '2021-06-08', 44, 0, 5, 2),
(45, '2021-06-10', 360, 0, 4, 1),
(46, '2021-06-10', 150, 0, 4, 1),
(47, '2021-06-10', 120, 0, 6, 1),
(48, '2021-06-10', 300, 0, 4, 1),
(49, '2021-06-11', 300, 0, 3, 1),
(50, '2021-06-11', 300, 0, 3, 1),
(51, '2021-06-11', 1200, 0, 5, 1),
(52, '2021-06-11', 600, 0, 3, 1),
(53, '2021-06-11', 240, 0, 3, 1),
(54, '2021-06-11', 510, 0, 4, 1),
(55, '2021-06-14', 30, 0, 4, 1),
(56, '2021-06-14', 480, 0, 4, 1),
(57, '2021-06-17', 300, 0, 5, 1),
(58, '2021-06-18', 110, 0, 15, 1),
(59, '2021-06-18', 150, 0, 13, 1),
(60, '2021-06-23', 137, 1, 13, 2),
(61, '2021-06-23', 71, 0, 15, 2),
(62, '2021-06-28', 120, 0, 16, 2),
(63, '2021-06-30', 2322, 0, 16, 1),
(65, '2021-07-02', 22, 0, 16, 1),
(66, '2021-07-02', 0, 0, 13, NULL),
(67, '2021-07-02', 0, 0, 13, NULL),
(68, '2021-07-02', 0, 0, 13, NULL),
(69, '2021-07-02', 0, 0, 13, NULL),
(70, '2021-07-02', 0, 0, 13, NULL),
(71, '2021-07-02', 0, 0, 13, NULL),
(72, '2021-07-02', 0, 0, 13, NULL),
(73, '2021-07-02', 0, 0, 13, NULL),
(74, '2021-07-02', 0, 0, 13, NULL),
(75, '2021-07-02', 0, 0, 13, NULL),
(76, '2021-07-02', 0, 0, 13, NULL),
(77, '2021-07-02', 0, 0, 13, NULL),
(78, '2021-07-02', 0, 0, 13, NULL),
(79, '2021-07-02', 0, 0, 13, NULL),
(80, '2021-07-02', 0, 0, 13, 2),
(81, '2021-07-02', 0, 0, 13, 2),
(82, '2021-07-02', 0, 0, 13, 2),
(83, '2021-07-02', 0, 0, 13, 2),
(84, '2021-07-02', 0, 0, 13, 2),
(85, '2021-07-02', 0, 0, 13, 2),
(86, '2021-07-02', 0, 0, 13, 2),
(87, '2021-07-02', 0, 0, 13, 2),
(88, '2021-07-02', 0, 0, 13, 2),
(89, '2021-07-02', 0, 0, 13, 2),
(90, '2021-07-02', 0, 0, 13, 2),
(91, '2021-07-02', 0, 0, 13, 2),
(92, '2021-07-02', 0, 0, 13, 2),
(93, '2021-07-02', 0, 0, 13, 2),
(94, '2021-07-02', 0, 0, 13, 2),
(95, '2021-07-02', 0, 2, 13, 2),
(96, '2021-07-02', 2553, 0, 1, 1),
(97, '2021-07-02', 20, 1, 18, 1),
(98, '2021-07-02', 0, 2, 18, 1),
(99, '2021-07-02', 30009, 0, 20, 1),
(100, '2021-07-02', 54000, 0, 20, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `talmacen`
--
ALTER TABLE `talmacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indexes for table `tcambio`
--
ALTER TABLE `tcambio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indexes for table `tcategoria`
--
ALTER TABLE `tcategoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcliente`
--
ALTER TABLE `tcliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indexes for table `tcolor`
--
ALTER TABLE `tcolor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tcompra`
--
ALTER TABLE `tcompra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tconcepto`
--
ALTER TABLE `tconcepto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tdetalle_cambio`
--
ALTER TABLE `tdetalle_cambio`
  ADD KEY `id_cambio` (`id_cambio`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `tdetalle_compra`
--
ALTER TABLE `tdetalle_compra`
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `tdetalle_venta`
--
ALTER TABLE `tdetalle_venta`
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `templeado`
--
ALTER TABLE `templeado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPersona` (`idPersona`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indexes for table `tmarca`
--
ALTER TABLE `tmarca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmovimiento`
--
ALTER TABLE `tmovimiento`
  ADD PRIMARY KEY (`id`,`id_sucursal`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_concepto` (`id_concepto`),
  ADD KEY `id_tipo_transaccion` (`id_tipo_transaccion`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indexes for table `tpersona`
--
ALTER TABLE `tpersona`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tproducto`
--
ALTER TABLE `tproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_color` (`id_color`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indexes for table `tproducto_almacen`
--
ALTER TABLE `tproducto_almacen`
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_almacen` (`id_almacen`);

--
-- Indexes for table `tproveedor`
--
ALTER TABLE `tproveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tsucursal`
--
ALTER TABLE `tsucursal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ttemporal`
--
ALTER TABLE `ttemporal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ttipousuario`
--
ALTER TABLE `ttipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ttipo_transaccion`
--
ALTER TABLE `ttipo_transaccion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tusuario`
--
ALTER TABLE `tusuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indexes for table `tventa`
--
ALTER TABLE `tventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `talmacen`
--
ALTER TABLE `talmacen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tcambio`
--
ALTER TABLE `tcambio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tcategoria`
--
ALTER TABLE `tcategoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tcliente`
--
ALTER TABLE `tcliente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tcolor`
--
ALTER TABLE `tcolor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tcompra`
--
ALTER TABLE `tcompra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tconcepto`
--
ALTER TABLE `tconcepto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `templeado`
--
ALTER TABLE `templeado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tmarca`
--
ALTER TABLE `tmarca`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tmovimiento`
--
ALTER TABLE `tmovimiento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `tpersona`
--
ALTER TABLE `tpersona`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tproducto`
--
ALTER TABLE `tproducto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tproveedor`
--
ALTER TABLE `tproveedor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tsucursal`
--
ALTER TABLE `tsucursal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ttemporal`
--
ALTER TABLE `ttemporal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `ttipousuario`
--
ALTER TABLE `ttipousuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ttipo_transaccion`
--
ALTER TABLE `ttipo_transaccion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tusuario`
--
ALTER TABLE `tusuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tventa`
--
ALTER TABLE `tventa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `talmacen`
--
ALTER TABLE `talmacen`
  ADD CONSTRAINT `talmacen_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `tsucursal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tcambio`
--
ALTER TABLE `tcambio`
  ADD CONSTRAINT `tcambio_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `tventa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tcambio_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `templeado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tcliente`
--
ALTER TABLE `tcliente`
  ADD CONSTRAINT `tcliente_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `tpersona` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tdetalle_cambio`
--
ALTER TABLE `tdetalle_cambio`
  ADD CONSTRAINT `tdetalle_cambio_ibfk_1` FOREIGN KEY (`id_cambio`) REFERENCES `tcambio` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tdetalle_cambio_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tproducto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tdetalle_compra`
--
ALTER TABLE `tdetalle_compra`
  ADD CONSTRAINT `tdetalle_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `tcompra` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tdetalle_compra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tproducto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tdetalle_venta`
--
ALTER TABLE `tdetalle_venta`
  ADD CONSTRAINT `tdetalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `tventa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tdetalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tproducto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `templeado`
--
ALTER TABLE `templeado`
  ADD CONSTRAINT `templeado_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `tpersona` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `templeado_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `tsucursal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tmovimiento`
--
ALTER TABLE `tmovimiento`
  ADD CONSTRAINT `tmovimiento_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `templeado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tmovimiento_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `tconcepto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tmovimiento_ibfk_3` FOREIGN KEY (`id_tipo_transaccion`) REFERENCES `ttipo_transaccion` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tmovimiento_ibfk_4` FOREIGN KEY (`id_venta`) REFERENCES `tventa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tmovimiento_ibfk_5` FOREIGN KEY (`id_compra`) REFERENCES `tcompra` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tmovimiento_ibfk_6` FOREIGN KEY (`id_sucursal`) REFERENCES `tsucursal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tproducto`
--
ALTER TABLE `tproducto`
  ADD CONSTRAINT `tproducto_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `tmarca` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tproducto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `tcategoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tproducto_ibfk_3` FOREIGN KEY (`id_color`) REFERENCES `tcolor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tproducto_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `tproveedor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tproducto_almacen`
--
ALTER TABLE `tproducto_almacen`
  ADD CONSTRAINT `tproducto_almacen_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tproducto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tproducto_almacen_ibfk_2` FOREIGN KEY (`id_almacen`) REFERENCES `talmacen` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tusuario`
--
ALTER TABLE `tusuario`
  ADD CONSTRAINT `tusuario_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `ttipousuario` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tusuario_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `templeado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tventa`
--
ALTER TABLE `tventa`
  ADD CONSTRAINT `tventa_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tcliente` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tventa_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `templeado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
