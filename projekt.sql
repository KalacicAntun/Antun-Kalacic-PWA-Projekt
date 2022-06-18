-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220616.7a6bd9eb57
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2022 at 08:06 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt`
--
CREATE DATABASE IF NOT EXISTS `projekt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projekt`;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) NOT NULL,
  `korisnicko_ime` varchar(32) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(3, 'Antun', 'Kalačić', 'admin', '$2y$10$VWRQ48dD31aZj8OOLsza8O59UmK2ZSTdraQRtaeqjNZa4MlLjK1wi', 1),
(9, 'Ivo', 'Ivić', 'ivo123', '$2y$10$7O4biJpDySX01Zh7ISgboOKXjbzU94jTOhikdthXbfR5SAYMTy1Xu', 0),
(10, 'Jelena', 'Jelenić', 'jelena', '$2y$10$94PjCgH4KiHqy5Zoie31EutKNOan8n0rra1tz2pwAczXEqa2jjlEW', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `naslov` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `sazetak` text CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `tekst` longtext CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `kategorija` varchar(64) CHARACTER SET latin2 COLLATE latin2_croatian_ci NOT NULL,
  `arhiva` tinyint(1) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `kategorija`, `arhiva`, `filename`) VALUES
(6, '14.06.2022.', 'Lorem ipsum dolor sit amet', '                        Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula.                            ', '                        Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.                                                                ', 'Kultura', 0, 'slika1.jpg'),
(13, '14.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.            ', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.            ', 'Sport', 0, 'slika2.jpg'),
(14, '14.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Kultura', 0, 'slika3.jpg'),
(15, '14.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika2.jpg'),
(16, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika1.jpg'),
(17, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika1.jpg'),
(18, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika1.jpg'),
(30, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika3.jpg'),
(31, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika1.jpg'),
(32, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Kultura', 0, 'slika1.jpg'),
(33, '15.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet, iaculis convallis leo facilisis. Vestibulum blandit quam lorem, vitae aliquet velit rutrum ut. Quisque efficitur lacus non commodo auctor. Suspendisse potenti. Aenean scelerisque aliquet tortor, sed aliquam quam imperdiet quis. Sed turpis magna, hendrerit eget lorem vitae, consequat accumsan tellus. Aenean eros ex, faucibus vel nunc non, elementum luctus sapien. Morbi ex mi, mattis non rhoncus ac, faucibus ut purus. Proin posuere dignissim massa, vitae porttitor sapien feugiat quis. Nullam eget molestie ligula, nec cursus purus.', 'Sport', 0, 'slika1.jpg'),
(93, '17.06.2022.', 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in varius orci.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in varius orci. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum volutpat vulputate lorem, in feugiat nulla rhoncus sit amet. Maecenas ornare purus lorem, eget sollicitudin mauris molestie bibendum. Curabitur blandit euismod lacus id varius. In ornare velit at erat semper lacinia. Quisque ultrices massa in orci eleifend, ac lobortis tellus rutrum.', 'Sport', 0, 'slika1.jpg'),
(94, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.', 'Kultura', 0, 'slika2.jpg'),
(96, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.', 'Kultura', 0, 'slika1.jpg'),
(97, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.', 'Kultura', 0, 'slika3.jpg'),
(98, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.', 'Kultura', 1, 'slika3.jpg'),
(99, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.', 'Kultura', 1, 'slika3.jpg'),
(100, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.', 'Sport', 1, 'slika2.jpg'),
(101, '18.06.2022.', 'Lorem ipsum dolor sit amet', 'Aliquam fringilla egestas ipsum, et porta quam accumsan nec. Ut semper nibh a velit imperdiet.    ', 'Donec tortor velit, viverra quis ligula at, venenatis eleifend ligula. Aenean pretium ex ullamcorper magna aliquam, a suscipit orci accumsan. Morbi molestie sem vitae sem venenatis, a pretium sem vulputate. Duis fermentum venenatis cursus. Curabitur pretium imperdiet est id semper. Vivamus a urna vitae dui blandit suscipit et sit amet justo. Maecenas gravida elementum massa, sodales euismod leo ullamcorper nec. Mauris feugiat lorem ut semper porttitor. Fusce fermentum fermentum nisi in sagittis. Aenean vel erat non libero dictum viverra. Sed dui tortor, pellentesque nec sem tempus, fermentum pellentesque lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras elementum dignissim massa, eu pellentesque ipsum rhoncus porta. Fusce eget ex feugiat elit consequat luctus.    ', 'Sport', 1, 'slika2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



