-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2022 a las 12:17:22
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_amosis_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medida_id` bigint(20) UNSIGNED DEFAULT NULL,
  `marca_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `venta` decimal(10,2) DEFAULT NULL,
  `stock_minimo` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `barra`, `medida_id`, `marca_id`, `categoria_id`, `compra`, `venta`, `stock_minimo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'PRODUCTO 1', '003', 2, 1, 1, '1.00', '2.00', '10.00', 1, '2022-08-06 10:08:27', '2022-08-07 04:40:14'),
(2, '5656', '6556', 2, 1, 1, '0.00', '0.00', '0.00', 0, '2022-08-06 10:21:25', '2022-08-06 10:21:33'),
(3, 'PRODUCTO 3', '0100', 2, 1, 1, '10.50', '17.00', '5.00', 1, '2022-08-07 08:49:41', '2022-08-07 10:52:57'),
(4, 'PRODUCTO 2', '10221', 2, 1, 1, '10.00', '15.00', '15.00', 1, '2022-08-07 08:55:28', '2022-08-08 03:20:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `user_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2022-08-08 08:37:41', '2022-08-09 04:38:45'),
(2, 1, 1, '2022-08-09 04:38:45', '2022-08-09 04:38:45'),
(3, 3, 1, '2022-08-09 08:55:12', '2022-08-09 08:55:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_compras`
--

CREATE TABLE `caja_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_compras`
--

INSERT INTO `caja_compras` (`id`, `caja_id`, `compra_id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '10.00', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(2, 2, 3, '20.50', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_movimientos`
--

CREATE TABLE `caja_movimientos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_movimientos`
--

INSERT INTO `caja_movimientos` (`id`, `caja_id`, `tipo`, `monto`, `motivo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '10.00', NULL, 1, '2022-08-09 03:02:11', '2022-08-09 03:02:11'),
(2, 1, 1, '10.00', NULL, 0, '2022-08-09 03:02:32', '2022-08-09 03:25:29'),
(3, 1, 1, '12.00', '--', 1, '2022-08-09 03:10:52', '2022-08-09 03:10:52'),
(4, 1, 2, '1.00', 'ñ{{', 1, '2022-08-09 03:22:34', '2022-08-09 03:22:34'),
(5, 2, 1, '0.00', 'mm', 0, '2022-08-09 04:40:02', '2022-08-09 04:40:13'),
(6, 2, 1, '10.00', 'mm', 1, '2022-08-09 04:41:26', '2022-08-09 04:41:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_ventas`
--

CREATE TABLE `caja_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_ventas`
--

INSERT INTO `caja_ventas` (`id`, `caja_id`, `venta_id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '15.00', 1, '2022-08-09 03:56:40', '2022-08-09 03:56:40'),
(2, 2, 2, '32.00', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(3, 2, 3, '32.00', 1, '2022-08-15 09:18:38', '2022-08-15 09:18:38'),
(4, 2, 4, '49.00', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(5, 2, 5, '30.00', 1, '2022-08-16 04:52:29', '2022-08-16 04:52:29'),
(6, 2, 6, '15.00', 1, '2022-08-16 07:43:23', '2022-08-16 07:43:23'),
(7, 2, 7, '19.00', 1, '2022-08-17 03:24:24', '2022-08-17 03:24:24'),
(8, 2, 8, '19.00', 1, '2022-08-17 03:25:54', '2022-08-17 03:25:54'),
(9, 2, 9, '15.00', 1, '2022-08-17 03:39:16', '2022-08-17 03:39:16'),
(10, 2, 10, '30.00', 1, '2022-08-17 03:46:33', '2022-08-17 03:46:33'),
(11, 2, 11, '15.00', 1, '2022-08-17 04:03:06', '2022-08-17 04:03:06'),
(12, 2, 12, '17.00', 1, '2022-08-17 04:06:27', '2022-08-17 04:06:27'),
(13, 2, 13, '15.00', 1, '2022-08-17 04:09:51', '2022-08-17 04:09:51'),
(14, 2, 14, '15.00', 1, '2022-08-17 04:11:28', '2022-08-17 04:11:28'),
(15, 2, 15, '32.00', 1, '2022-08-17 04:12:46', '2022-08-17 04:12:46'),
(16, 2, 16, '15.00', 1, '2022-08-17 04:17:59', '2022-08-17 04:17:59'),
(17, 2, 17, '15.00', 1, '2022-08-17 04:18:59', '2022-08-17 04:18:59'),
(18, 2, 18, '15.00', 1, '2022-08-17 04:24:26', '2022-08-17 04:24:26'),
(19, 2, 19, '15.00', 1, '2022-08-17 04:25:06', '2022-08-17 04:25:06'),
(20, 2, 20, '15.00', 1, '2022-08-17 04:28:25', '2022-08-17 04:28:25'),
(21, 2, 21, '32.00', 1, '2022-08-17 10:08:04', '2022-08-17 10:08:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'FRUTAS', 1, '2022-08-06 09:02:00', '2022-08-06 09:02:13'),
(2, 'SD', 0, '2022-08-06 09:02:20', '2022-08-06 09:02:31'),
(3, 'LACTEOS', 1, '2022-08-08 03:21:31', '2022-08-08 03:21:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proveedor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `total`, `tipo`, `motivo`, `proveedor`, `estado`, `created_at`, `updated_at`) VALUES
(1, '21.50', 1, '', 'PUBLICO GENERAL', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(2, '10.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(3, '20.50', 1, '', 'PUBLICO GENERAL', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_inventarios`
--

CREATE TABLE `compra_inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantidad` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra_inventarios`
--

INSERT INTO `compra_inventarios` (`id`, `inventario_id`, `compra_id`, `precio`, `cantidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 27, 1, '1.00', '1.00', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(2, 28, 1, '10.50', '1.00', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(3, 29, 1, '10.00', '1.00', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(4, 31, 2, '10.00', '1.00', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(5, 35, 3, '10.00', '1.00', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13'),
(6, 36, 3, '10.50', '1.00', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `path`, `estado`, `created_at`, `updated_at`) VALUES
(1, '/storage/monedas/aDNXlA9Qohsnqezi6LNEzQH0sXq2Cr4FsjsApJM8.png', 1, '2022-08-15 07:15:05', '2022-08-15 07:15:05'),
(2, '/storage/monedas/9spupCb93TLPDo3YVZ8GHCPP7klhQfpCvfcgRzBq.png', 1, '2022-08-15 07:15:58', '2022-08-15 07:15:58'),
(3, '/storage/monedas/kxjixY5PrYhchlbr1uVmElrHFBqFzfoLExvpTsbG.png', 1, '2022-08-15 07:16:21', '2022-08-15 07:16:21'),
(4, '/storage/monedas/mgauRaixTOjD55kxg5n9WTXUowpz5Wn96QuerxOW.png', 1, '2022-08-15 07:17:39', '2022-08-15 07:17:39'),
(5, '/storage/monedas/di5Ms6VN5MOluC0HHdkn3fTvHcxP0GZhc4ptG65g.png', 1, '2022-08-15 07:19:43', '2022-08-15 07:19:43'),
(6, '/storage/monedas/WvgKn7SpFUDnPoEcqe1IqhmouuPwy7eG3eZfY7N6.png', 1, '2022-08-15 08:31:24', '2022-08-15 08:31:24'),
(7, '/storage/monedas/ODc3CaFL9PVfXMmE9HrKVE76yYZwvIceiC21U6DK.png', 1, '2022-08-15 08:31:42', '2022-08-15 08:31:42'),
(8, '/storage/monedas/FjipPmYwRsa7FNr7O987X5ffjJzS0fbUfV6vb8mv.png', 1, '2022-08-15 08:31:58', '2022-08-15 08:31:58'),
(9, '/storage/monedas/wNh2r2xmKonBmXH7ublYfvkR6uvnoi8n2qG9wYpq.png', 1, '2022-08-15 08:32:14', '2022-08-15 08:32:14'),
(10, '/storage/monedas/SuUwHFtbkJr8CpXlCk0OzUOZr2iHbp0gXpb8YjPB.png', 1, '2022-08-15 08:32:31', '2022-08-15 08:32:31'),
(11, '/storage/monedas/ctXA6T9ObOhYPIAj6UYl3vtJseBlojcHdY98R0wE.png', 1, '2022-08-15 08:32:46', '2022-08-15 08:32:46'),
(12, '/storage/monedas/cyIf1eK6k2Yuv7Z62uoqdI5XwlGNdarWx6NBgkAK.png', 1, '2022-08-15 08:33:01', '2022-08-15 08:33:01'),
(13, '/storage/monedas/ifIiADNBit69uaZF5uKIiteq9rtcifcq68S85JK9.png', 1, '2022-08-15 08:33:17', '2022-08-15 08:33:17'),
(14, '/storage/monedas/TeDK6CCC0cWC48yPXnwXRNUXSYsV5WyO3xRtgt10.png', 1, '2022-08-15 08:33:29', '2022-08-15 08:33:29'),
(15, '/storage/monedas/39HfVQrKASq3SihB3yKuVqQijK2WbO8DkjuvV3cy.png', 1, '2022-08-15 08:39:17', '2022-08-15 08:39:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `articulo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `venta` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id`, `articulo_id`, `compra`, `venta`, `cantidad`, `tipo`, `motivo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '1.00', '2.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 0, '2022-08-07 04:52:23', '2022-08-07 05:50:47'),
(2, 1, '1.00', '2.00', '1.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 04:58:05', '2022-08-07 04:58:05'),
(3, 1, '1.00', '2.00', '1.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:01:47', '2022-08-07 05:01:47'),
(4, 1, '1.00', '2.00', '3.00', 2, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:12:15', '2022-08-07 05:12:15'),
(5, 1, '1.00', '2.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:33:51', '2022-08-07 05:33:51'),
(6, 1, '1.00', '2.00', '5.00', 2, 'AJUSTE DE INVENTARIO', 0, '2022-08-07 05:34:28', '2022-08-07 05:50:55'),
(7, 1, '1.00', '2.00', '3.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:51:10', '2022-08-07 05:51:10'),
(8, 1, '1.00', '2.00', '1.00', 2, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 06:06:16', '2022-08-07 06:06:16'),
(9, 1, '1.00', '2.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-07 10:51:11', '2022-08-07 10:51:11'),
(10, 4, '9.00', '5.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-07 10:51:11', '2022-08-07 10:51:11'),
(11, 1, '1.00', '2.00', '1.00', 1, 'COMPRA 4', 1, '2022-08-07 10:52:12', '2022-08-07 10:52:12'),
(12, 4, '9.00', '5.00', '1.00', 1, 'COMPRA 4', 1, '2022-08-07 10:52:12', '2022-08-07 10:52:12'),
(13, 3, '17.50', '10.00', '5.00', 1, 'COMPRA 4', 1, '2022-08-07 10:52:12', '2022-08-07 10:52:12'),
(14, 4, '9.00', '5.00', '1.00', 1, 'COMPRA 5', 1, '2022-08-08 03:19:26', '2022-08-08 03:19:26'),
(15, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 5', 1, '2022-08-08 03:19:26', '2022-08-08 03:19:26'),
(16, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 6', 1, '2022-08-08 03:55:52', '2022-08-08 03:55:52'),
(17, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 6', 1, '2022-08-08 03:55:52', '2022-08-08 03:55:52'),
(18, 1, '1.00', '2.00', '3.00', 2, 'VENTA 2', 1, '2022-08-08 04:08:15', '2022-08-08 04:08:15'),
(19, 4, '10.00', '15.00', '4.00', 2, 'VENTA 3', 1, '2022-08-08 04:39:43', '2022-08-08 04:39:43'),
(20, 3, '10.50', '17.00', '6.00', 2, 'VENTA 3', 1, '2022-08-08 04:39:43', '2022-08-08 04:39:43'),
(21, 3, '10.50', '17.00', '1.00', 2, 'VENTA 4', 1, '2022-08-08 04:44:52', '2022-08-08 04:44:52'),
(22, 1, '1.00', '2.00', '3.00', 2, 'VENTA 5', 1, '2022-08-08 04:45:01', '2022-08-08 04:45:01'),
(23, 1, '1.00', '2.00', '7.00', 2, 'VENTA 6', 1, '2022-08-08 04:45:10', '2022-08-08 04:45:10'),
(24, 1, '1.00', '2.00', '4.00', 1, 'COMPRA 7', 1, '2022-08-08 04:45:40', '2022-08-08 04:45:40'),
(25, 3, '10.50', '17.00', '3.00', 1, 'COMPRA 7', 1, '2022-08-08 04:45:40', '2022-08-08 04:45:40'),
(26, 4, '10.00', '15.00', '5.00', 1, 'COMPRA 7', 1, '2022-08-08 04:45:40', '2022-08-08 04:45:40'),
(27, 1, '1.00', '2.00', '1.00', 1, 'COMPRA 1', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(28, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 1', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(29, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 1', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(30, 1, '1.00', '2.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-08 04:48:42', '2022-08-08 04:48:42'),
(31, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 2', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(32, 4, '10.00', '15.00', '1.00', 2, 'VENTA 1', 1, '2022-08-09 03:56:40', '2022-08-09 03:56:40'),
(33, 4, '10.00', '15.00', '1.00', 2, 'VENTA 2', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(34, 3, '10.50', '17.00', '1.00', 2, 'VENTA 2', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(35, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13'),
(36, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13'),
(37, 4, '10.00', '15.00', '1.00', 2, 'VENTA 3', 1, '2022-08-15 09:18:38', '2022-08-15 09:18:38'),
(38, 3, '10.50', '17.00', '1.00', 2, 'VENTA 3', 1, '2022-08-15 09:18:38', '2022-08-15 09:18:38'),
(39, 3, '10.50', '17.00', '1.00', 2, 'VENTA 4', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(40, 1, '1.00', '2.00', '1.00', 2, 'VENTA 4', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(41, 4, '10.00', '15.00', '2.00', 2, 'VENTA 4', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(42, 4, '10.00', '15.00', '2.00', 2, 'VENTA 5', 1, '2022-08-16 04:52:29', '2022-08-16 04:52:29'),
(43, 4, '10.00', '15.00', '1.00', 2, 'VENTA 6', 1, '2022-08-16 07:43:23', '2022-08-16 07:43:23'),
(44, 3, '10.50', '17.00', '1.00', 2, 'VENTA 7', 1, '2022-08-17 03:24:24', '2022-08-17 03:24:24'),
(45, 1, '1.00', '2.00', '1.00', 2, 'VENTA 7', 1, '2022-08-17 03:24:24', '2022-08-17 03:24:24'),
(46, 3, '10.50', '17.00', '1.00', 2, 'VENTA 8', 1, '2022-08-17 03:25:54', '2022-08-17 03:25:54'),
(47, 1, '1.00', '2.00', '1.00', 2, 'VENTA 8', 1, '2022-08-17 03:25:54', '2022-08-17 03:25:54'),
(48, 3, '10.50', '17.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-17 03:28:53', '2022-08-17 03:28:53'),
(49, 4, '10.00', '15.00', '50.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-17 03:29:18', '2022-08-17 03:29:18'),
(50, 4, '10.00', '15.00', '1.00', 2, 'VENTA 9', 1, '2022-08-17 03:39:16', '2022-08-17 03:39:16'),
(51, 4, '10.00', '15.00', '2.00', 2, 'VENTA 10', 1, '2022-08-17 03:46:33', '2022-08-17 03:46:33'),
(52, 4, '10.00', '15.00', '1.00', 2, 'VENTA 11', 1, '2022-08-17 04:03:06', '2022-08-17 04:03:06'),
(53, 3, '10.50', '17.00', '1.00', 2, 'VENTA 12', 1, '2022-08-17 04:06:27', '2022-08-17 04:06:27'),
(54, 4, '10.00', '15.00', '1.00', 2, 'VENTA 13', 1, '2022-08-17 04:09:51', '2022-08-17 04:09:51'),
(55, 4, '10.00', '15.00', '1.00', 2, 'VENTA 14', 1, '2022-08-17 04:11:28', '2022-08-17 04:11:28'),
(56, 4, '10.00', '15.00', '1.00', 2, 'VENTA 15', 1, '2022-08-17 04:12:46', '2022-08-17 04:12:46'),
(57, 3, '10.50', '17.00', '1.00', 2, 'VENTA 15', 1, '2022-08-17 04:12:46', '2022-08-17 04:12:46'),
(58, 4, '10.00', '15.00', '1.00', 2, 'VENTA 16', 1, '2022-08-17 04:17:59', '2022-08-17 04:17:59'),
(59, 4, '10.00', '15.00', '1.00', 2, 'VENTA 17', 1, '2022-08-17 04:18:59', '2022-08-17 04:18:59'),
(60, 4, '10.00', '15.00', '1.00', 2, 'VENTA 18', 1, '2022-08-17 04:24:26', '2022-08-17 04:24:26'),
(61, 4, '10.00', '15.00', '1.00', 2, 'VENTA 19', 1, '2022-08-17 04:25:06', '2022-08-17 04:25:06'),
(62, 4, '10.00', '15.00', '1.00', 2, 'VENTA 20', 1, '2022-08-17 04:28:25', '2022-08-17 04:28:25'),
(63, 3, '10.50', '17.00', '1.00', 2, 'VENTA 21', 1, '2022-08-17 10:08:04', '2022-08-17 10:08:04'),
(64, 4, '10.00', '15.00', '1.00', 2, 'VENTA 21', 1, '2022-08-17 10:08:04', '2022-08-17 10:08:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'LG ', 1, '2022-08-06 09:27:17', '2022-08-07 08:54:48'),
(2, 'k', 0, '2022-08-06 09:27:24', '2022-08-06 09:27:37'),
(3, 'GLORIA', 1, '2022-08-08 03:21:01', '2022-08-08 03:21:01'),
(4, 'kjkj', 0, '2022-08-14 10:37:38', '2022-08-14 10:49:50'),
(5, 'ghjg', 0, '2022-08-14 10:51:43', '2022-08-14 10:51:52'),
(6, 'kjh', 0, '2022-08-14 11:00:29', '2022-08-14 11:00:35'),
(7, 'hjhj', 0, '2022-08-15 06:06:07', '2022-08-15 06:06:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `nombre`, `codigo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD', 'UND', 0, '2022-08-05 06:45:33', '2022-08-06 07:05:04'),
(2, 'KILOGRAMO', 'KG', 1, '2022-08-05 06:49:03', '2022-08-06 07:14:43'),
(3, '1', '2', 0, '2022-08-05 09:07:30', '2022-08-05 09:52:10'),
(4, NULL, NULL, 0, '2022-08-05 09:34:41', '2022-08-05 09:46:44'),
(5, NULL, NULL, 0, '2022-08-05 09:35:53', '2022-08-05 09:46:46'),
(6, NULL, NULL, 0, '2022-08-05 09:37:18', '2022-08-05 09:46:10'),
(7, 'LITRO', 'LT', 1, '2022-08-05 09:52:21', '2022-08-05 09:52:21'),
(8, 'hj', 'k', 0, '2022-08-05 10:04:45', '2022-08-05 10:04:50'),
(9, 'n', 'nn', 0, '2022-08-05 10:04:58', '2022-08-05 10:05:16'),
(10, 'fgfg', 'fgfg', 0, '2022-08-05 10:12:44', '2022-08-06 06:31:33'),
(11, '', '', 0, '2022-08-05 10:19:49', '2022-08-05 10:19:56'),
(12, 'UNIDAD', 'UND', 1, '2022-08-06 06:36:10', '2022-08-07 08:54:33'),
(13, 'vnm', 'kgj', 0, '2022-08-06 06:36:16', '2022-08-06 07:06:17'),
(14, 'nm', 'nmnm', 0, '2022-08-06 06:37:00', '2022-08-09 08:31:13'),
(15, 'hh', 'jjj', 0, '2022-08-06 06:40:38', '2022-08-09 08:31:16'),
(16, 'jf', 'fj', 0, '2022-08-06 06:49:47', '2022-08-09 08:31:21'),
(17, 'kk', 'kk', 0, '2022-08-06 06:49:54', '2022-08-09 08:31:25'),
(18, 'fgfg', 'fgfg', 0, '2022-08-06 07:44:50', '2022-08-09 08:31:29'),
(19, 'as', 'as', 0, '2022-08-06 07:46:11', '2022-08-09 08:31:40'),
(20, 'jfhj', 'fg', 0, '2022-08-06 07:48:10', '2022-08-09 08:31:33'),
(21, NULL, NULL, 0, '2022-08-06 07:48:20', '2022-08-09 08:30:52'),
(22, 'hh', 'hhh', 0, '2022-08-06 07:48:43', '2022-08-09 08:31:37'),
(23, 'nm', 'nm', 0, '2022-08-06 07:48:53', '2022-08-09 08:30:56'),
(24, 'ghgh', 'ghgh', 0, '2022-08-06 07:49:45', '2022-08-09 08:30:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos`
--

CREATE TABLE `metodos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `metodos`
--

INSERT INTO `metodos` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'EFECTIVO', 1, '2022-08-16 03:22:13', '2022-08-16 03:22:13'),
(2, 'TRANSFERENCIA', 1, '2022-08-16 03:23:00', '2022-08-16 03:23:00'),
(3, 'DEPOSITO', 1, '2022-08-16 03:23:09', '2022-08-16 03:23:09'),
(4, 'YAPE', 1, '2022-08-16 03:23:14', '2022-08-16 03:23:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2022_08_05_055844_create_medidas_table', 1),
(3, '2022_08_05_060125_create_categorias_table', 1),
(4, '2022_08_05_060310_create_marcas_table', 2),
(5, '2022_08_05_060432_create_articulos_table', 3),
(6, '2022_08_07_032306_create_inventarios_table', 4),
(11, '2022_08_07_103657_create_compras_table', 5),
(12, '2022_08_08_031546_create_compra_inventarios_table', 5),
(13, '2022_08_08_040211_create_ventas_table', 5),
(14, '2022_08_08_040345_create_venta_inventarios_table', 5),
(15, '2022_08_08_045914_create_users_table', 6),
(16, '2022_08_08_083127_create_cajas_table', 7),
(17, '2022_08_09_025342_create_caja_movimientos_table', 8),
(18, '2022_08_09_034252_create_caja_compras_table', 9),
(19, '2022_08_09_034339_create_caja_ventas_table', 9),
(20, '2022_08_15_064052_create_images_table', 10),
(21, '2022_08_15_064351_create_monedas_table', 11),
(22, '2022_08_15_064523_create_moneda_images_table', 11),
(23, '2022_08_16_031443_create_metodos_table', 12),
(24, '2022_08_16_091733_create_sucursals_table', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, '10.00', 0, '2022-08-15 07:16:21', '2022-08-15 08:31:04'),
(2, '11.00', 0, '2022-08-15 07:17:39', '2022-08-15 07:33:22'),
(3, '11.00', 0, '2022-08-15 07:19:43', '2022-08-15 08:30:59'),
(4, '0.10', 1, '2022-08-15 08:31:24', '2022-08-15 08:31:24'),
(5, '0.20', 1, '2022-08-15 08:31:42', '2022-08-15 08:31:42'),
(6, '0.50', 1, '2022-08-15 08:31:58', '2022-08-15 08:31:58'),
(7, '1.00', 1, '2022-08-15 08:32:14', '2022-08-15 08:32:14'),
(8, '2.00', 1, '2022-08-15 08:32:31', '2022-08-15 08:32:31'),
(9, '5.00', 1, '2022-08-15 08:32:46', '2022-08-15 08:32:46'),
(10, '10.00', 1, '2022-08-15 08:33:01', '2022-08-15 08:33:01'),
(11, '20.00', 1, '2022-08-15 08:33:17', '2022-08-15 08:33:17'),
(12, '50.00', 1, '2022-08-15 08:33:29', '2022-08-15 08:33:29'),
(13, '100.00', 1, '2022-08-15 08:39:17', '2022-08-15 08:39:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda_images`
--

CREATE TABLE `moneda_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `moneda_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `moneda_images`
--

INSERT INTO `moneda_images` (`id`, `moneda_id`, `image_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, '2022-08-15 07:16:21', '2022-08-15 07:16:21'),
(2, 2, 4, 1, '2022-08-15 07:17:39', '2022-08-15 07:17:39'),
(3, 3, 5, 1, '2022-08-15 07:19:43', '2022-08-15 07:19:43'),
(4, 4, 6, 1, '2022-08-15 08:31:24', '2022-08-15 08:31:24'),
(5, 5, 7, 1, '2022-08-15 08:31:42', '2022-08-15 08:31:42'),
(6, 6, 8, 1, '2022-08-15 08:31:58', '2022-08-15 08:31:58'),
(7, 7, 9, 1, '2022-08-15 08:32:14', '2022-08-15 08:32:14'),
(8, 8, 10, 1, '2022-08-15 08:32:31', '2022-08-15 08:32:31'),
(9, 9, 11, 1, '2022-08-15 08:32:46', '2022-08-15 08:32:46'),
(10, 10, 12, 1, '2022-08-15 08:33:01', '2022-08-15 08:33:01'),
(11, 11, 13, 1, '2022-08-15 08:33:17', '2022-08-15 08:33:17'),
(12, 12, 14, 1, '2022-08-15 08:33:29', '2022-08-15 08:33:29'),
(13, 13, 15, 1, '2022-08-15 08:39:17', '2022-08-15 08:39:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursals`
--

CREATE TABLE `sucursals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documento` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `impresora` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `impresora_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursals`
--

INSERT INTO `sucursals` (`id`, `nombre`, `direccion`, `telefono`, `documento`, `impresora`, `impresora_url`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'JHONY CREATIVO', 'Calle Santa anita', '91118714360', 'RUC 2323', 'TM-20II', 'http://miprinters.com/proyects/LUMEN/printers/public/api/amosis/v1', 1, '2022-08-16 09:35:34', '2022-08-17 04:29:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `username`, `email`, `password`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Jhonycreativo', 'jhony', 'jhonycreativo.code@gmail.com', '$2y$10$oZsis9tWArXrwxgglkimZuN3nhKmsoB1pI/1L8YKAhcpethPzIPmW', 1, 1, '2022-08-08 05:38:15', '2022-08-08 05:53:48'),
(2, 'l', 'l', 'k', '$2y$10$.drHVmnHeHx3VQfm75Ds7enHJUqVoQBfZXOvFT8oteiE/cqTbt45m', 1, 0, '2022-08-08 06:05:20', '2022-08-08 06:05:28'),
(3, 'admin', 'admin', 'admin', '$2y$10$n3Xb/WNfWmX/AzH2sccYIu4YNbu1iBcU3/E1NqitUVA0M.OnxvMlS', 1, 1, '2022-08-09 08:55:00', '2022-08-09 08:55:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cambio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `total`, `pago`, `cambio`, `tipo`, `motivo`, `cliente`, `estado`, `created_at`, `updated_at`) VALUES
(1, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 0, '2022-08-09 03:56:40', '2022-08-09 06:12:23'),
(2, '32.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-09 06:12:09', '2022-08-09 06:12:09'),
(3, '32.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-15 09:18:38', '2022-08-15 09:18:38'),
(4, '49.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(5, '30.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-16 04:52:29', '2022-08-16 04:52:29'),
(6, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-16 07:43:23', '2022-08-16 07:43:23'),
(7, '19.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 03:24:24', '2022-08-17 03:24:24'),
(8, '19.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 03:25:54', '2022-08-17 03:25:54'),
(9, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 03:39:16', '2022-08-17 03:39:16'),
(10, '30.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 03:46:33', '2022-08-17 03:46:33'),
(11, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:03:06', '2022-08-17 04:03:06'),
(12, '17.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:06:27', '2022-08-17 04:06:27'),
(13, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:09:51', '2022-08-17 04:09:51'),
(14, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:11:28', '2022-08-17 04:11:28'),
(15, '32.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:12:46', '2022-08-17 04:12:46'),
(16, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:17:59', '2022-08-17 04:17:59'),
(17, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:18:59', '2022-08-17 04:18:59'),
(18, '100.00', '0.00', '15.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:24:26', '2022-08-17 04:24:26'),
(19, '15.00', '100.00', '85.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:25:06', '2022-08-17 04:25:06'),
(20, '15.00', '100.00', '85.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 04:28:25', '2022-08-17 04:28:25'),
(21, '32.00', '32.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-17 10:08:04', '2022-08-17 10:08:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_inventarios`
--

CREATE TABLE `venta_inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_inventarios`
--

INSERT INTO `venta_inventarios` (`id`, `inventario_id`, `venta_id`, `precio`, `cantidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 32, 1, '15.00', '1.00', 1, '2022-08-09 03:56:40', '2022-08-09 03:56:40'),
(2, 33, 2, '15.00', '1.00', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(3, 34, 2, '17.00', '1.00', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(4, 37, 3, '15.00', '1.00', 1, '2022-08-15 09:18:38', '2022-08-15 09:18:38'),
(5, 38, 3, '17.00', '1.00', 1, '2022-08-15 09:18:38', '2022-08-15 09:18:38'),
(6, 39, 4, '17.00', '1.00', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(7, 40, 4, '2.00', '1.00', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(8, 41, 4, '15.00', '2.00', 1, '2022-08-15 09:21:05', '2022-08-15 09:21:05'),
(9, 42, 5, '15.00', '2.00', 1, '2022-08-16 04:52:29', '2022-08-16 04:52:29'),
(10, 43, 6, '15.00', '1.00', 1, '2022-08-16 07:43:23', '2022-08-16 07:43:23'),
(11, 44, 7, '17.00', '1.00', 1, '2022-08-17 03:24:24', '2022-08-17 03:24:24'),
(12, 45, 7, '2.00', '1.00', 1, '2022-08-17 03:24:24', '2022-08-17 03:24:24'),
(13, 46, 8, '17.00', '1.00', 1, '2022-08-17 03:25:54', '2022-08-17 03:25:54'),
(14, 47, 8, '2.00', '1.00', 1, '2022-08-17 03:25:54', '2022-08-17 03:25:54'),
(15, 50, 9, '15.00', '1.00', 1, '2022-08-17 03:39:16', '2022-08-17 03:39:16'),
(16, 51, 10, '15.00', '2.00', 1, '2022-08-17 03:46:33', '2022-08-17 03:46:33'),
(17, 52, 11, '15.00', '1.00', 1, '2022-08-17 04:03:06', '2022-08-17 04:03:06'),
(18, 53, 12, '17.00', '1.00', 1, '2022-08-17 04:06:27', '2022-08-17 04:06:27'),
(19, 54, 13, '15.00', '1.00', 1, '2022-08-17 04:09:51', '2022-08-17 04:09:51'),
(20, 55, 14, '15.00', '1.00', 1, '2022-08-17 04:11:28', '2022-08-17 04:11:28'),
(21, 56, 15, '15.00', '1.00', 1, '2022-08-17 04:12:46', '2022-08-17 04:12:46'),
(22, 57, 15, '17.00', '1.00', 1, '2022-08-17 04:12:46', '2022-08-17 04:12:46'),
(23, 58, 16, '15.00', '1.00', 1, '2022-08-17 04:17:59', '2022-08-17 04:17:59'),
(24, 59, 17, '15.00', '1.00', 1, '2022-08-17 04:18:59', '2022-08-17 04:18:59'),
(25, 60, 18, '15.00', '1.00', 1, '2022-08-17 04:24:26', '2022-08-17 04:24:26'),
(26, 61, 19, '15.00', '1.00', 1, '2022-08-17 04:25:06', '2022-08-17 04:25:06'),
(27, 62, 20, '15.00', '1.00', 1, '2022-08-17 04:28:25', '2022-08-17 04:28:25'),
(28, 63, 21, '17.00', '1.00', 1, '2022-08-17 10:08:04', '2022-08-17 10:08:04'),
(29, 64, 21, '15.00', '1.00', 1, '2022-08-17 10:08:04', '2022-08-17 10:08:04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulos_medida_id_foreign` (`medida_id`),
  ADD KEY `articulos_marca_id_foreign` (`marca_id`),
  ADD KEY `articulos_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_compras_caja_id_foreign` (`caja_id`),
  ADD KEY `caja_compras_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_movimientos_caja_id_foreign` (`caja_id`);

--
-- Indices de la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_ventas_caja_id_foreign` (`caja_id`),
  ADD KEY `caja_ventas_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `compra_inventarios_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventarios_articulo_id_foreign` (`articulo_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodos`
--
ALTER TABLE `metodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda_images`
--
ALTER TABLE `moneda_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moneda_images_moneda_id_foreign` (`moneda_id`),
  ADD KEY `moneda_images_image_id_foreign` (`image_id`);

--
-- Indices de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `venta_inventarios_venta_id_foreign` (`venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `metodos`
--
ALTER TABLE `metodos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `moneda_images`
--
ALTER TABLE `moneda_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `articulos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `articulos_medida_id_foreign` FOREIGN KEY (`medida_id`) REFERENCES `medidas` (`id`);

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  ADD CONSTRAINT `caja_compras_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `caja_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD CONSTRAINT `caja_movimientos_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`);

--
-- Filtros para la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  ADD CONSTRAINT `caja_ventas_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `caja_ventas_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  ADD CONSTRAINT `compra_inventarios_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `compra_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_articulo_id_foreign` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `moneda_images`
--
ALTER TABLE `moneda_images`
  ADD CONSTRAINT `moneda_images_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `moneda_images_moneda_id_foreign` FOREIGN KEY (`moneda_id`) REFERENCES `monedas` (`id`);

--
-- Filtros para la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  ADD CONSTRAINT `venta_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`),
  ADD CONSTRAINT `venta_inventarios_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
