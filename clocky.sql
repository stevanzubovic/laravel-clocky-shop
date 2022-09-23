-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 04:01 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clocky`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'cuckoo', '2022-05-03 14:12:23', NULL),
(2, 'wall', '2022-05-04 12:38:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `email`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'dsada@dsa.a', 'da', NULL, '2022-05-09 10:42:40', '2022-05-09 10:42:40'),
(2, 'mynew@mail.com', 'I was wondering about....', 12, '2022-05-09 10:44:23', '2022-05-09 10:44:23'),
(3, 'mynew@mail.com', 'I was wondering about....', 12, '2022-05-09 10:49:23', '2022-05-09 10:49:23'),
(4, 'admin@admin.com', 'Message 1', 11, '2022-05-09 11:07:46', '2022-05-09 11:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `percent` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `percent`, `name`, `created_at`, `updated_at`) VALUES
(1, 20, 'mayday', '2022-05-05 16:06:20', NULL),
(2, 15, 'black friday', '2022-05-06 10:26:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `url`, `alt`, `created_at`, `updated_at`) VALUES
(1, '20021801.jpg', 'Paying Homage To Artisans From A Time Long Since Past\n\nThis lovely 8 Day Mechanical Cuckoo Clock represents a genuine, high quality hand-crafted Black Forest cuckoo clock, produced by artisan clock makers TRENKLE from Simonswald in the Black Forest region of Germany.\n\nMeasuring 27cm in height*, this beautiful clock portrays a delightful scene in the bavarian countryside, featuring a chalet house with a unique facade consisting of both brick and wood. Out the front of the chalet includes many features hand carved out of timber, including a dog and a water trough, as well as a pine tree. One unique feature of this clock is a clock peddler who features on the right hand side of the clock. The story of the clock peddler dates back hundreds of years where the artisans would spend long winters crafting cuckoo clocks, then travel far and wide in the spring to sell their unique creations. Today the clock peddler is celebrated as a prominent symbol of the successes that the cuckoo clock industry has seen throughout the years, and are often symbolised in many cuckoo clock designs, paying homage to artisans from a time long since past. \n\nThis fascinating scene also includes a wooden clock dial in the centre of the chalet, and hand painted details including red window shutters and flowers underneath the windowsills. \n\nChalet style cuckoo clocks are the most famous and common type of cuckoo clock, and are often featured in the shape of alpine houses. They usually feature carvings that represent life in the mountain regions of Europe (mainly around Southern Germany, The Black Forest, Switzerland and Austria). Chalet style cuckoo clocks can range from simple arrangements of carved features to very detailed scenes with many moving parts (known as automaton). This clock features both hand crafted and hand carved details to provide a truly unique timepiece that is sure to spark a sense of joy.\n\nThe in-built cuckoo of this clock calls the time each hour and once at half past through a door that opens, with a manual shut-off mode. This particular clock needs to be wound once a week and does not include music.\n\nThis beautifully designed clock by TRENKLE is a charming timepiece, suitable for those looking for a quality traditional cuckoo clock using carving methods that have been practised for hundreds of years.', '2022-05-03 14:19:34', NULL),
(2, '20068653.jpg', '4 Leaf & Bird 1 Day Mechanical Carved Cuckoo Clock 20cm By SCHNEIDER', '2022-05-03 14:20:48', NULL),
(3, '52243.jpg', 'Heidi House Battery Chalet Cuckoo Clock With Edelweiss Flowers 21cm By TRENKLE', '2022-05-03 14:26:31', NULL),
(4, '20077358.webp', '1/4 Hour 1 Day Mechanical Chalet Cuckoo Clock 20cm By ENGSTLER', '2022-05-03 14:31:30', NULL),
(6, '52643.jpg', '5 Leaf & Bird 1 Day Mechanical Carved Cuckoo Clock 20cm By HÖNES', '2022-05-03 14:38:18', NULL),
(7, '20041717.jpg', 'Dog & Water Trough 1 Day Mechanical Chalet Cuckoo Clock 22cm By TRENKLE', '2022-05-03 18:53:16', NULL),
(8, '20084950.jpg', 'Alphorn Battery Chalet Cuckoo Clock 19cm By ENGSTLER', '2022-05-03 18:53:19', NULL),
(9, '20070168.jpg', 'Bears Battery Chalet Cuckoo Clock 25cm By ENGSTLER', '2022-05-03 15:14:53', NULL),
(10, '20077051.jpg', 'Black Cube 8 Day Mechanical Modern Cuckoo Clock With Clear Front 26cm By ROMBA', '2022-05-03 15:17:59', NULL),
(11, '20084226.jpg', '12.5cm Black Nautical Quartz Clock By FISCHER', '2022-05-04 18:53:33', NULL),
(12, '114015.jpg', '18cm Brass Ship\'s Bell Nautical Quartz Clock By HERMLE', '2022-05-04 18:56:44', NULL),
(13, '113802.jpg', '26cm Alma Pink Children\'s Time Teaching Wall Clock By ACCTIM', '2022-05-04 18:59:59', NULL),
(14, '20075385.jpg', '29cm Black & White Square Glass Wall Clock By AMS', '2022-05-04 19:01:53', NULL),
(15, '5013348620019.jpg', '30cm Black Silent Modern Wall Clock By BRAUN', '2022-05-04 19:03:22', NULL),
(16, '96927.jpg', '34cm Beige Owl Gufino Modern Wall Clock By ARTI E MESTIERI', '2022-05-04 19:06:46', NULL),
(17, '96522.jpg', '43cm Stella Silver Starburst Wall Clock By ACCTIM', '2022-05-04 19:13:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `displayed_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `displayed_text`, `route`, `order`, `created_at`, `updated_at`) VALUES
(1, 'home', 'home', 1, '2022-04-09 09:04:00', NULL),
(2, 'login', 'login', 2, '2022-04-09 09:05:14', NULL),
(3, 'register', 'register', 3, '2022-04-09 09:05:46', NULL),
(5, 'logout', 'logout', 998, '2022-04-23 11:12:31', NULL),
(6, 'admin', 'adminPanel', 4, '2022-05-05 10:37:36', NULL),
(9, 'cart', 'cart', 0, '2022-05-08 11:28:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_09_131440_create_menu_table', 2),
(6, '2022_04_24_170554_create_role', 3),
(7, '2022_05_03_132226_create_product', 4),
(8, '2022_05_03_135147_create_price', 4),
(9, '2022_05_03_135311_create_discount', 4),
(10, '2022_05_03_135435_create_category', 4),
(11, '2022_05_03_135514_create_image', 4),
(12, '2022_05_04_121932_create_price_product', 5),
(13, '2022_05_08_160428_create_receipt', 6),
(14, '2022_05_08_161506_create_user_receipt_table', 7),
(15, '2022_05_09_120453_create_contacts_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 11, '2022-05-08 16:16:46', '2022-05-08 16:16:46'),
(15, 12, '2022-05-08 16:29:49', '2022-05-08 16:29:49'),
(16, 12, '2022-05-08 16:32:14', '2022-05-08 16:32:14'),
(17, 12, '2022-05-08 16:33:18', '2022-05-08 16:33:18'),
(18, 12, '2022-05-08 16:33:49', '2022-05-08 16:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `amount`, `created_at`, `updated_at`) VALUES
(1, '620.00', '2022-05-03 14:15:42', NULL),
(2, '380.00', '2022-05-06 10:17:58', NULL),
(3, '997.00', '2022-05-06 10:17:41', NULL),
(4, '315.00', '2022-05-06 10:20:34', NULL),
(5, '380.00', '2022-05-06 10:20:31', NULL),
(6, '455.00', '2022-05-06 15:41:25', NULL),
(7, '240.00', '2022-05-06 15:41:43', NULL),
(8, '970.00', '2022-05-06 15:42:33', NULL),
(9, '330.00', '2022-05-06 15:42:33', NULL),
(10, '550.00', '2022-05-06 15:45:30', NULL),
(11, '490.00', '2022-05-06 15:45:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price_id`, `image_id`, `category_id`, `discount_id`, `created_at`, `updated_at`) VALUES
(1, 'Clock Peddler 8 Day Mechanical Chalet Cuckoo Clock 27cm By TRENKLE', 'Paying Homage To Artisans From A Time Long Since Past\n\nThis lovely 8 Day Mechanical Cuckoo Clock represents a genuine, high quality hand-crafted Black Forest cuckoo clock, produced by artisan clock makers TRENKLE from Simonswald in the Black Forest region of Germany.\n\nMeasuring 27cm in height*, this beautiful clock portrays a delightful scene in the bavarian countryside, featuring a chalet house with a unique facade consisting of both brick and wood. Out the front of the chalet includes many features hand carved out of timber, including a dog and a water trough, as well as a pine tree. One unique feature of this clock is a clock peddler who features on the right hand side of the clock. The story of the clock peddler dates back hundreds of years where the artisans would spend long winters crafting cuckoo clocks, then travel far and wide in the spring to sell their unique creations. Today the clock peddler is celebrated as a prominent symbol of the successes that the cuckoo clock industry has seen throughout the years, and are often symbolised in many cuckoo clock designs, paying homage to artisans from a time long since past. \n\nThis fascinating scene also includes a wooden clock dial in the centre of the chalet, and hand painted details including red window shutters and flowers underneath the windowsills. \n\nChalet style cuckoo clocks are the most famous and common type of cuckoo clock, and are often featured in the shape of alpine houses. They usually feature carvings that represent life in the mountain regions of Europe (mainly around Southern Germany, The Black Forest, Switzerland and Austria). Chalet style cuckoo clocks can range from simple arrangements of carved features to very detailed scenes with many moving parts (known as automaton). This clock features both hand crafted and hand carved details to provide a truly unique timepiece that is sure to spark a sense of joy.\n\nThe in-built cuckoo of this clock calls the time each hour and once at half past through a door that opens, with a manual shut-off mode. This particular clock needs to be wound once a week and does not include music.\n\nThis beautifully designed clock by TRENKLE is a charming timepiece, suitable for those looking for a quality traditional cuckoo clock using carving methods that have been practised for hundreds of years.', 1, 1, 1, 1, '2022-05-03 14:22:44', NULL),
(2, '4 Leaf & Bird 1 Day Mechanical Carved Cuckoo Clock 20cm By SCHNEIDER', 'A Traditional Cuckoo Clock Design By SCHNEIDER\n\nNothing speaks traditional charm quite like this 4 Leaf & Bird Cuckoo Clock By SCHNEIDER, which is a genuine, high quality hand-crafted Black Forest cuckoo clock, produced by clock makers SCHNEIDER from Schonach in the Black Forest region of Germany.\n\nMeasuring 20cm in height*, this beautiful clock features a bird carving along with an arrangement of 4 leaves adorning the clock’s body, a design commonly featured on many of the early cuckoo clocks and which still makes up one of the most popular styles of cuckoo clock carving today, though the design more commonly features 5 leaves instead of 4. The ornamental leaves around the front of the clock are characteristic of the traditionally carved cuckoo clocks. The design of a frame of leaves can also be crowned with a carved deer head which is also known as a hunting style cuckoo clock. \n\nThe in-built cuckoo of this beautiful clock calls the time on the half hour as well as each hour, with a permanent automatic night-time shut-off mode that is enabled by lifting and pulling a lever. There is no music with this clock and it needs to be wound once a day. \n\nThis beautifully designed clock by SCHNEIDER is a charming timepiece, suitable for those looking for a quality traditional cuckoo clock that is reliable and very precise at keeping time, whilst keeping in line with design features that use carving methods that have been practised for hundreds of years.', 3, 2, 1, NULL, '2022-05-03 14:32:39', NULL),
(3, 'Heidi House Battery Chalet Cuckoo Clock With Edelweiss Flowers 21cm By TRENKLE', 'A charming character comes easily to this traditional Deer with Bench Seat and Edelweiss Battery Chalet Cuckoo Clock By ENGSTLER, which represents a fine example of a genuine, high quality hand-crafted Black Forest cuckoo clock, produced from Schwarzwald in Germany, a region otherwise known as the Black Forest. \n\nMeasuring 24cm in height*, this beautiful chalet style cuckoo clock depicts an authentic half-timbered house scene in the bavarian countryside. The chalet features a carved dear grazing near a water trough, a bench seat, carved pine tree and edelweiss flowers on the edges of the chalet. \n\nChalet cuckoo clocks are the most famous and common type of cuckoo clocks and are often shaped as alpine houses, featuring carvings representing life in the mountain regions of Europe (around southern Germany, Switzerland and Austria). Chalet style cuckoo clocks are can range from simple arrangements of carved features to very detailed scenes with many moving parts (also known as automaton).\n\nThe in-built cuckoo of this beautiful clock calls the time each hour, with an automatic night-time shut-off that is controlled by a light sensor. When the room is dark enough, the cuckoo will no longer sound allowing you a sound sleep, before recommencing as the room lights up again the next morning. There is also a manual override to silence the cuckoo altogether should that be preferred. This particular chalet cuckoo clock also features music with 12 different traditional melodies, however this can also be turned off via a switch.\n\nThis beautifully designed clock by ENGSTLER is very charismatic and also represents an accurate timepiece, suitable for those looking for a quartz battery cuckoo clock that is reliable and very precise at keeping time, whilst keeping in design features using carving methods that have been practised for hundreds of years. ', 2, 3, 1, NULL, '2022-05-03 14:32:47', NULL),
(4, '1/4 Hour 1 Day Mechanical Chalet Cuckoo Clock 20cm By ENGSTLER', 'This charming 1 Day Mechanical Chalet Cuckoo Clock was designed by world renowned clock makers HÖNES from the Black Forest in Germany, where the company was established in 1950.\n\nThis lovely clock portrays a delightful farming scene in the Bavarian countryside, featuring a timber chalet with a unique facade and two windows. Out the front of the chalet and to the right is a wood chopper, standing next to a pile of chopped logs, whilst to the left stand a cow, a water trough and a carved tree. These fascinating details have all been hand painted, with additional hand painted features including the window shutters and the cuckoo door, both of which have been painted bright yellow, whilst colourful flowers are depicted in the windowsills. This unique clock also features a timber pendulum that hangs below the clock itself, alongside the weights, rounding out the fascinating scene.\n\nThis particular clock runs on a 1 day mechanism, and therefore needs to be wound once a day simply by pulling the weights. The in-built cuckoo of this clock calls the time each hour and once at half past, and it does not play any music. \n\nChalet cuckoo clocks are the most common type of cuckoo clock, and are often shaped as alpine houses that represent life in the mountain regions of Europe (mainly around Southern Germany, Switzerland and Austria). Chalet style cuckoo clocks can range from simple arrangements of carved features to very detailed scenes with many moving parts (known as automaton). The automaton for this clock is the wood chopper.\n\nThis beautifully designed clock by HÖNES is a charming timepiece, suitable for those looking for a quality cuckoo clock using carving methods that have been practised for hundreds of years.', 1, 4, 1, 1, '2022-05-03 14:32:59', NULL),
(5, '5 Leaf & Bird 1 Day Mechanical Carved Cuckoo Clock 20cm By HÖNES', 'This quaint little Battery Chalet Cuckoo Clock By ENGSTLER represents a fine example of a genuine, high quality hand-crafted Black Forest cuckoo clock, produced from Schwarzwald in Germany, a region otherwise known as the Black Forest. \n\nMeasuring 20cm in height*, this pleasing chalet style cuckoo clock portrays the scene of a small alpine chalet in the mountainous woodlands of Southern Germany. The chalet features a rabbit, trees and a deer as added details around the house. \n\nChalet cuckoo clocks are the most famous and common type of cuckoo clocks and are often shaped as alpine houses, featuring carvings representing life in the mountain regions of Europe (around southern Germany, Switzerland and Austria). The in-built cuckoo of this beautiful clock calls the time each hour, with a permanent automatic night-time shut-off that is controlled by a light sensor. When the room is dark enough, the cuckoo will no longer sound allowing you a sound sleep, before recommencing as the room lights up again the next morning. There is also a manual override to silence the cuckoo altogether should that be preferred. This cuckoo clock does not come with any moving features or music.\n\nThis beautifully designed clock by ENGSTLER is a charming timepiece, suitable for those looking for a quartz battery cuckoo clock that is reliable and very precise at keeping time, whilst keeping in design features using carving methods that have been practised for hundreds of years. ', 5, 6, 1, NULL, '2022-05-03 14:39:22', NULL),
(6, 'Dog & Water Trough 1 Day Mechanical Chalet Cuckoo Clock 22cm By TRENKLE', 'This lovely 1 Day Mechanical Cuckoo Clock represents a genuine, high quality hand-crafted Black Forest cuckoo clock, produced by artisan clock makers TRENKLE from Simonswald in the Black Forest region of Germany.\n\nMeasuring 22cm in height*, this beautiful clock portrays a delightful scene in the bavarian countryside, featuring a chalet house with a unique facade consisting of both brick and wood. Out the front of the chalet includes many features hand carved out of timber, including a dog and a water trough, as well as a fence and a pine tree. This fascinating scene also includes a wooden clock dial in the centre of the chalet, and hand painted details including floral art along the walls of the clock and at the base.\n\nChalet style cuckoo clocks are the most famous and common type of cuckoo clock, and are often featured in the shape of alpine houses. They usually feature carvings that represent life in the mountain regions of Europe (mainly around Southern Germany, The Black Forest, Switzerland and Austria). Chalet style cuckoo clocks can range from simple arrangements of carved features to very detailed scenes with many moving parts (known as automaton). This clock features both hand crafted and hand carved details to provide a truly unique timepiece that is sure to spark a sense of joy.\n\nThe in-built cuckoo of this clock calls the time each hour and once at half past through a door that opens, with a manual shut-off mode. This particular clock needs to be wound once a day and does not include music.\n\nThis beautifully designed clock by TRENKLE is a charming timepiece, suitable for those looking for a quality traditional cuckoo clock using carving methods that have been practised for hundreds of years.', 4, 7, 1, NULL, '2022-05-03 15:05:34', NULL),
(7, 'Alphorn Battery Chalet Cuckoo Clock 19cm By ENGSTLER', 'Attention to detail is easily apparent with this exquisite battery Carved Cuckoo Clock by German designer ENGSTLER from Schwarzwald in the Black Forest in Germany.\n\nMeasuring 30cm in height*, this beautiful clock features a deer carving at the crown of the clock along with an arrangement of 5 ornamental leaves adorning the clock’s body, a design which represents a very famous and traditional element for cuckoo clock designs, making up one of the most popular styles of cuckoo clock carvings today. The design of a frame of leaves is often crowned with a carved bird, however this particular clock instead features a deer. A wooden clock dial is featured in the middle of the timepiece, with easy to read roman numerals. The clock also features a timber pendulum that hangs below the clock, alongside the decorative weights. \n\nThe in-built cuckoo of this beautiful clock calls the time each hour, with an automatic night shut off mode that is controlled by a light sensor. When the room is dark enough the cuckoo will no longer sound, allowing you a sound sleep before recommencing again the next morning as the room gets light again. There is a manual override to silence the clock altogether should that be preferred. This clock does not come with music or moving automata.\n\nThis beautifully designed clock by ENGSTLER is aesthetically pleasing and represents an accurate timepiece, suitable for those looking for a quartz battery cuckoo clock that is reliable and very precise at keeping time, whilst keeping in design features using carving methods that have been practised for hundreds of years.', 1, 8, 1, NULL, '2022-05-03 15:08:47', NULL),
(8, 'Bears Battery Chalet Cuckoo Clock 25cm By ENGSTLER', 'This traditional 1 Day Mechanical Carved Cuckoo Clock By ENGSTLER represents a fine example of a genuine, high quality hand-crafted Black Forest cuckoo clock, produced from Schwarzwald in Germany, a region otherwise known as the Black Forest. \n\nMeasuring 22cm in height*, this beautifully hand-carved clock features two squirrels sitting either side of the clock dial, as well as a bird at the top of the clock. Beautiful oak foliage also adorns the clock, rounding out this fantastic flora & fauna scene. \n\nThe in-built cuckoo of this beautiful clock calls the time each hour and once at half past, with a manual shut-off mode that is enabled by lifting and pulling a lever. This clock needs to be wound once a day and it does not come with music.\n\nThis beautifully designed clock by ENGSTLER is a charming timepiece, suitable for those looking for a quality traditional wind up cuckoo clock using carving methods that have been practised for hundreds of years. ', 9, 9, 1, NULL, '2022-05-03 15:15:38', NULL),
(9, 'Black Cube 8 Day Mechanical Modern Cuckoo Clock With Clear Front 26cm By ROMBA', 'Looking for a cuckoo clock that offers something a little bit different than the traditional wooden carvings and chalets? Why not consider this trendy modern cube cuckoo clock, which fits perfectly in any modern home or workplace. Featuring a splash of artistic flair, this unique design was designed by world renowned clock makers ROMBA from the Black Forest in Germany, where the company was established in 1894, and could easily find a home on the kitchen, living or dining room walls of the avid cuckoo clock lover.\n\nModern, original and artistic are three terms that easily come to mind when considering this trendy cube cuckoo clock. Measuring 26cm* in height, this see through clock is featured in the shape of a large cube, which provides an eye catching timepiece on the wall - with see through clear tinted panels, black coloured lattice windows and beech coloured edging that allows high visibility into the inner mechanics of the clock. The clock also features easy to read wooden hands - do note there are no numbers on this clock, nor is there a cuckoo door for the bird. Rounding out the modern aesthetic of this timepiece is a small pendulum that is also black in colour, that hangs alongside the black weights. Perhaps the most fascinating feature is that the clock has an artistic and trendy design, providing a modern take on the traditional cuckoo clock.\n\nThis particular clock runs on an 8 day mechanism, and therefore needs to be wound once a week simply by pulling the weights. The in-built wooden cuckoo of this clock has been painted white and calls the time each hour and once at half past, with a manual night shut off lever should that be preferred. There is no music with this clock. ', 8, 10, 1, 2, '2022-05-03 15:18:26', NULL),
(10, '12.5cm Black Nautical Quartz Clock By FISCHER', 'This 12.5cm Quartz Nautical Clock is 100% made in Germany by world-renowned experts Fischer, and features a stylish yet functional design. This clock has been manufactured with meticulous precision and attention to detail, using robust and high-quality materials that make this nautical clock not only appealing in looks, but also suitable for real-world applications.\n\nThis nautical clock features a clean white dial with easy-to-read Arabic numerals, protected by a mineral glass lens, and a black case. This eye-catching quartz clock houses a highly precise and reliable quartz battery movement for world-class timekeeping accuracy that you come to expect from anything German-made.\n\nMade from high quality materials that are built to last a lifetime, this nautical clock is the perfect gift idea that will keep on giving for many years to come. ', 1, 11, 2, NULL, '2022-05-04 18:54:28', NULL),
(11, '18cm Brass Ship\'s Bell Nautical Quartz Clock By HERMLE', 'This Nautical Clock is 100% made in Germany by world-renowned experts Fischer, and features a stylish yet functional design that has been manufactured with meticulous precision and attention to detail, using robust and high-quality materials. This nautical clock is not only appealing in looks, but also suitable for real-world applications.\n\nThis nautical clock features a clean white dial with easy-to-read Arabic numerals, protected by a solid polished brass case and a mineral glass cover. This eye-catching nautical quartz clock houses a highly precise and reliable quartz battery movement for world-class timekeeping accuracy that you come to expect from anything German-made.\n\nMade from high quality materials that are built to last a lifetime, this nautical clock is the perfect gift idea that will keep on giving for many years to come. ', 11, 12, 2, NULL, '2022-05-04 18:57:10', NULL),
(12, '26cm Alma Pink Children\'s Time Teaching Wall Clock By ACCTIM', 'This clean modern Runwell - 20cm Pink Blush Wall Clock By ACCTIM, fits perfectly in any modern home or workplace. It’s fantastic, classic analogue design could easily find a home on the kitchen, living or dining room walls, or add a desirable improvement to a number of different workplaces including the office, or a school, hospital, dentist, or doctors settings, amongst a number of other businesses, without adding too much flair. \n\nMeasuring 20cm in diameter, this beautiful clock features a plastic covered round white dial with a pink blush coloured rim, and neat black hands that move around the dial towards simplistic black numerals. Perhaps the most fascinating feature is how all aspects of this clock are very clean and cheerful in design, creating an overall minimalistic aesthetic that could easily suit most spaces without being too overbearing in appearance.\n\nThis beautifully designed clock by ACCTIM is aesthetically pleasing and represents an accurate timepiece, suitable for those looking for a wall clock that is simplistic and contemporary in appearance, is reliable and very precise at keeping time.', 10, 13, 2, NULL, '2022-05-04 19:00:37', NULL),
(13, '29cm Black & White Square Glass Wall Clock By AMS', 'Nothing appeals with modern charm quite like this Black & White Square Glass Wall Clock By AMS designed to make a statement in the modern Australian space. This trendy wall clock with its brilliant two tone modern colour scheme of white and black could easily become the feature piece of any kitchen, living or dining room wall, or add a desirable improvement to a number of different workplaces including the office.\n\nMeasuring 29cm in diameter, this beautiful clock features a mineral glass covered square white dial with a square black border and neat black hands. Perhaps the most fascinating feature is how all aspects of this clock are very clean and simplistic in design, creating an overall minimalistic aesthetic that could easily suit most spaces without being too overbearing in appearance.\n\nThis beautifully designed clock by AMS is aesthetically pleasing and represents an accurate timepiece, suitable for those looking for a modern wall clock that is reliable and very precise at keeping time. The clock is driven by a high quality battery operated quartz movement.', 7, 14, 2, NULL, '2022-05-04 19:02:18', NULL),
(14, '30cm Black Silent Modern Wall Clock By BRAUN', 'Nothing appeals with modern charm quite like this 30cm Black Wall Clock By BRAUN, designed to make a statement in the modern Australian space. This trendy wall clock with its brilliant colour scheme of white and black could easily become the feature piece of any kitchen, bedroom, study, living or dining room wall, or add a desirable improvement to a number of different workplaces including the office and the school classroom. \n\nMeasuring 30cm in diameter, this beautiful clock features a round easy to read black dial with neat contrasting black and white hands pointing towards neat white numerals. It would be handy to note that the second hand is a sweep hand, which silently moves around the dial, providing a great solution for a quiet study or office environment. Rounding out the body of this fastinating clock is a semi tempered glass lens to protect the entire dial. Perhaps the most fascinating feature is how all aspects of this clock are very clean and simplistic in design, creating an overall minimalistic aesthetic that could easily suit most spaces without being too overbearing in appearance.\n\nThis beautifully designed clock by BRAUN is aesthetically pleasing and represents an accurate timepiece, suitable for those looking for a modern wall clock that is reliable and very precise at keeping time. The clock is driven by a high quality battery operated quartz movement.', 1, 15, 2, NULL, '2022-05-04 19:05:51', NULL),
(15, '34cm Beige Owl Gufino Modern Wall Clock By ARTI E MESTIERI', 'This adorable Beige Owl Gulfino Modern Wall Clock By ARTI E MESTIERI doubles perfectly as a functional timepiece and a unique art piece designed to suit a number of space in the modern Australian home or office space. With its brilliant neat abstract design and modern beige colour scheme, this clock could easily become the feature piece of any kitchen, bedroom, study, living or dining room wall, or add a desirable improvement to a number of different workplaces including the trendy office or retail business, as well as in design studios, art studios and school classrooms. \n\nMeasuring 34cm in height, this delightful clock resembles a beige owl, with neat hands in the centre of the owl. Perhaps the most fascinating feature is the artistic design feature of the clock, with no numerals, adding to the artistic flair of the timepiece. This clock would be a fantastic gift idea for the owl lover in your life, as it provides a functional timepiece and art piece both in the one item.\n\nThis beautifully designed clock by ARTI E MESTIERI is aesthetically pleasing and represents an accurate timepiece, suitable for those looking for a modern wall clock that is reliable and very precise at keeping time. The clock is driven by a high quality battery operated quartz movement.', 7, 16, 2, 1, '2022-05-04 19:07:31', NULL),
(16, '43cm Stella Silver Starburst Wall Clock By ACCTIM', 'This retro 43cm Stella Silver Starburst Wall Clock By ACCTIM is designed to represent both a timepiece and a feature artpiece in one. With its original design and unique flair, this visually stunning modern wall clock could easily become the feature piece of any kitchen, bedroom, study, living or dining room wall, or add a desirable improvement to a number of different workplaces who want to add a touch of art and intrigue to their walls. Complete the retro look in your home with this stunning Stella designer wall clock by ACCTIM today. \n\nMeasuring 43cm in diameter, this beautiful clock resembles a blazing sun, with large silver rays spreading out from the central clock dial. The material of this clock is plastic. \n\nThis beautifully designed clock by ACCTIM is aesthetically pleasing and represents an accurate timepiece, suitable for those looking for a wall clock that is both stylish and artistic in appearance, is reliable and very precise at keeping time.', 5, 17, 2, 2, '2022-05-04 19:13:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`id`, `product_id`, `quantity`, `order_id`, `created_at`, `updated_at`) VALUES
(3, 2, 2, 14, '2022-05-08 16:16:46', '2022-05-08 16:16:46'),
(4, 12, 1, 14, '2022-05-08 16:16:46', '2022-05-08 16:16:46'),
(5, 12, 1, 15, '2022-05-08 16:29:49', '2022-05-08 16:29:49'),
(6, 11, 1, 15, '2022-05-08 16:29:49', '2022-05-08 16:29:49'),
(7, 16, 1, 15, '2022-05-08 16:29:49', '2022-05-08 16:29:49'),
(8, 8, 1, 16, '2022-05-08 16:32:14', '2022-05-08 16:32:14'),
(9, 3, 1, 17, '2022-05-08 16:33:18', '2022-05-08 16:33:18'),
(10, 14, 1, 18, '2022-05-08 16:33:49', '2022-05-08 16:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` tinyint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'user', '2022-04-25 10:33:19', NULL),
(2, 'admin', '2022-04-25 10:33:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleId` tinyint(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `roleId`, `created_at`, `updated_at`) VALUES
(11, 'admin', 'admin@admin.com', NULL, '$2y$10$PRFaXSobmtDRerqRqwj7C.21FmQTChjGUAcZMQwABQ05qQGlK5XYG', NULL, 2, '2022-05-06 16:39:20', '2022-05-06 16:39:20'),
(12, 'user', 'user@user.com', NULL, '$2y$10$PrYpzj1YOHEF15c5M2dhu.1uQzGZnCNZtJDbzAQHxn9A/E.cjsycq', NULL, 1, '2022-05-06 16:40:09', '2022-05-06 16:40:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_id` (`price_id`),
  ADD KEY `image_id` (`image_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `roleId` (`roleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` tinyint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `receipts_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
