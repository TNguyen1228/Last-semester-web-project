-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 08:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(20) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total_spent` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `phone`, `total_spent`) VALUES
('ID_02672133096', '02672133096', 55.67),
('ID_0349292753', '0349292753', 109.41),
('ID_0398292753', '0398292753', 7.50),
('ID_0934833472', '0934833472', 15.00),
('ID_0943635243', '0943635243', 0.00),
('ID_0976442532', '0976442532', 0.00),
('ID_0987458552', '0987458552', 380.00),
('ID_0987663232', '0987663232', 0.00),
('ID_0987799636', '0987799636', 17.20),
('ID_0987799637', '0987799637', 27.60),
('ID_0999999999', '0999999999', 36.82);

-- --------------------------------------------------------

--
-- Table structure for table `customers_booking`
--

CREATE TABLE `customers_booking` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `person` varchar(255) NOT NULL,
  `reservation_date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_booking`
--

INSERT INTO `customers_booking` (`id`, `name`, `phone`, `person`, `reservation_date`, `time`, `message`) VALUES
(11, 'Nguyễn Mạnh Tuấn', '+84349292753', 'Less than 5 person', '2024-01-08', '09:00 PM', NULL),
(13, 'Lam Le', '20231217', 'Less than 5 person', '2024-01-08', '08:00 AM', NULL),
(21, 'Phuong', '0987937244', '3-4 person', '0000-00-00', '09:00 AM', NULL),
(22, 'Phuong', '0987937244', '3-4 person', '2024-02-01', '09:00 AM', NULL),
(23, 'Phuong', '0987937244', '3-4 person', '2024-02-01', '09:00 AM', NULL),
(24, 'Phuong', '0987937244', '3-4 person', '2024-02-01', '09:00 AM', NULL),
(25, 'Phuong', '0987937244', '3-4 person', '2024-02-01', '09:00 AM', NULL),
(26, 'Phuong', '0987937244', '3-4 person', '2024-02-01', '09:00 AM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `position`, `contact_info`, `salary`, `hire_date`) VALUES
('ID_000000', 'Duy Long Ng', 'Receptionist', '0938233233', 220.00, '2024-01-07'),
('ID_444435', 'Levi', 'Bartender', '0987668372', 666.00, '2024-02-01'),
('ID_444444', 'Sofm', 'Manager', '0999879765', 998.00, '0000-00-00'),
('ID_448450', 'Ms. Marcus Connelly', 'Manager', '0828129535', 200.00, '2020-12-12'),
('ID_474166', 'Pauline Hand', 'Servant', '0349819366', 200.00, '2022-11-11'),
('ID_739142', 'Lonnie Bahringer', 'Servant', '0342592971', 150.00, '2023-01-01'),
('ID_941468', 'Jenna Adams', 'Bartender', '0790324452', 250.00, '2023-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `item_id` varchar(255) NOT NULL,
  `item_name` text NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `local_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`item_id`, `item_name`, `description`, `price`, `local_url`) VALUES
('CF_Americano', 'Americano(Hot/Iced)', 'A delightful concoction made by diluting espresso with hot water, delivering a rich, robust flavor with a smoother profile.', 2.25, './assets/images/americano.png'),
('CF_BlackEye', 'Black Eye', 'Bold and robust blend that delivers a powerful kick of energy with every sip, ensuring a rich and invigorating coffee experience.', 2.50, './assets/images/blackeye.png'),
('CF_Cappuccino', 'Cappuccino', 'Rich espresso meets frothy steamed milk, creating a harmonious balance of bold flavor and creamy texture in every delightful cup.', 1.64, './assets/images/cappuccino.png'),
('CF_Cortado', 'Cortado', 'Balanced with a splash of warm, silky milk, creating a harmonious and flavorful coffee indulgence.', 3.45, './assets/images/cortado.png'),
('CF_Latte', 'Latte(Hot/Iced)', 'A velvety blend of espresso and steamed milk, crowned with a delicate layer of foam, creating a creamy and satisfying coffee indulgence', 1.97, './assets/images/latte.png'),
('CF_Macchiato', 'Macchiato', 'Symphony of espresso perfection adorned with a touch of velvety foam, delivering a bold and rich flavor in every enticing sip.', 2.50, './assets/images/macchiato.png'),
('other_bottle_beer', 'Bottle beer', 'Each bottle holding a story of brewing expertise and tradition. Its convenience and portability make bottled beer a beloved choice for enthusiasts, allowing them to savor their favorite brews anywhere, anytime.', 0.82, './assets/images/other_bottle_beer.jpg'),
('other_mixed_fruit', 'Mixed Fruit', 'A vibrant medley of flavors, creating a delightful and refreshing treat for any occasion and any season', 5.00, './assets/images/other_mixed_fruit.jpg'),
('other_sunflower_seeds', 'Sunflower Seeds', 'Sunflower seeds add a delightful crunch and nutty flavor to your offerings', 0.60, './assets/images/other_sunflower_seeds.jpg'),
('smoothie_apple_pie', 'Apple Pie Smoothie', 'Combining fresh apple slices, warm cinnamon and oats, mixed with yogurt or almond milk, creating a comforting, spiked concoction.', 2.60, './assets/images/smoothie_apple_pie.jpg'),
('smoothie_coconut', 'Coconut Smoothie', 'A tropical oasis in a glass, combining creamy coconut milk or water with chunks of fresh fruit, offering a delightful balance of sweetness and nutty richness.', 2.26, './assets/images/smoothie_coconut.jpg'),
('smoothie_Mango', 'Mango Smoothies', 'A tropical delight, blending ripe, juicy mangoes with creamy yogurt or non-dairy alternatives, often enhanced with a splash of citrus or honey for a sweet-tangy fusion.', 2.10, './assets/images/smoothie_mango.jpg'),
('smoothie_mixed_fruit', 'Mixed Fruit With Yogurt', 'Creates a vibrant symphony of flavors and textures, blending assorted fresh fruits like berries, bananas, and kiwi with creamy yogurt, delivering a harmonious balance of sweetness and tanginess.', 2.26, './assets/images/smoothie_mixed_fruit.jpg'),
('SNACK_ChocoCake', 'Choco Cake', 'Decadent symphony of moist layers and velvety cocoa, ensuring an unforgettable experience for every chocolate lover.', 2.00, './assets/images/Snack_ChocoCake.png'),
('SNACK_ChristmasCookies', 'Christmas Cookies', 'Warmth of cinnamon, nutmeg, and a hint of sweetness to every delicious bite.', 1.50, './assets/images/Snack_Christmas_Cookies.png'),
('SNACK_CoffeeDonut', 'Coffee Donut', 'Rich coffee flavor, delivering a delectable treat that pairs perfectly with your favorite cup of coffee.', 2.45, './assets/images/Snack_Donut.png'),
('SNACK_CreamWhippedCake', 'Cream Whipped Cake', 'A luscious symphony of light and airy layers, generously adorned with billowy clouds of whipped cream for an irresistibly delightful treat.', 2.34, './assets/images/Snack_whipped_cake.png'),
('SNACK_Flan', 'Flan', 'A luscious dessert characterized by its smooth, creamy custard base complemented by a caramelized sugar topping.', 1.65, './assets/images/Snack_flan.png'),
('SNACK_Vanilla', 'Vanilla Panna Cotta', 'Delicate essence of vanilla, creating a luxurious and satisfying culinary experience.', 3.00, './assets/images/Snack_VPC.png'),
('TEA_BlueButterfly', 'Blue Butterfly Pea Flower Tea', 'A type of tea made from the dried flowers of the Clitoria ternatea plant. Enjoy hot or served over ice.', 2.75, './assets/images/Tea_BBPF.jpg'),
('TEA_Cream_Choco_Milk', 'Cream Chocolate Milk Tea', 'A heavenly blend of chocolatey richness and creamy perfection, topped with luscious whipped cream.', 2.50, './assets/images/Tea_Cream_Choco_Milk.png'),
('TEA_IcedApple', 'Iced Apple Tea', 'Crisp and refreshing blend that captures the essence of ripe apples in every cool and invigorating sip.', 2.25, './assets/images/Tea_Iced_Apple.jpg'),
('TEA_Matcha', 'Matcha Tea', 'Imported directly from Uji, Japan, our Matcha Supreme boasts a perfect blend of fragrant Uji Matcha', 2.20, './assets/images/Tea_Matcha.jpg'),
('TEA_PeachIced', 'Peach Iced Tea', 'A harmonious blend of premium tea leaves and succulent peach flavor, served over ice for a delightful and invigorating experience.', 2.70, './assets/images/Tea_Peach_Iced.jpg'),
('TEA_RubyRed', 'Ruby Red Tea', 'A luscious infusion of finest red tea leaves, brimming with robust flavor and warmth to elevate your tea experience.', 2.80, './assets/images/Tea_Ruby_Red.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(30) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
('23122815361002672133096', 'ID_02672133096', '2023-12-28', 24.72),
('2312281538120349292753_102', 'ID_0349292753', '2023-12-28', 40.00),
('2401012210470349292753_101', 'ID_0349292753', '2024-01-01', 0.10),
('2401041805020987458552', 'ID_0987458552', '2024-01-04', 80.00),
('2401041807430987458552', 'ID_0987458552', '2024-01-04', 75.00),
('2401041809040987458552', 'ID_0987458552', '2024-01-04', 75.00),
('2401041809170987458552', 'ID_0987458552', '2024-01-04', 75.00),
('24010518030702672133096', 'ID_02672133096', '2024-01-05', 11.00),
('2401051803400987799637', 'ID_0987799637', '2024-01-05', 12.40),
('2401051803580987799636', 'ID_0987799636', '2024-01-05', 17.20),
('2401051804280934833472', 'ID_0934833472', '2024-01-05', 15.00),
('24010520391202672133096', 'ID_02672133096', '2024-01-05', 7.50),
('2401072017330987799637', 'ID_0987799637', '2024-01-07', 15.20),
('2401090011540987458552', 'ID_0987458552', '2024-01-09', 75.00),
('2401102309230349292753', 'ID_0349292753', '2024-01-10', 4.75),
('2401112108190987799637_104', 'ID_0987799637', '2024-01-11', 0.00),
('24011200402102672133096', 'ID_02672133096', '2024-01-12', 12.45),
('2401120057210398292753', 'ID_0398292753', '2024-01-12', 7.50),
('2401120058080999999999', 'ID_0999999999', '2024-01-12', 30.40),
('2401120107400349292753', 'ID_0349292753', '2024-01-12', 11.95),
('2401120113010349292753', 'ID_0349292753', '2024-01-12', 14.92),
('2401120119440349292753', 'ID_0349292753', '2024-01-12', 16.07),
('2401120121510999999999', 'ID_0999999999', '2024-01-12', 6.42),
('2401120124290349292753', 'ID_0349292753', '2024-01-12', 21.62);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` varchar(30) NOT NULL,
  `order_item` varchar(255) NOT NULL,
  `quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `order_item`, `quantity`) VALUES
('2401120121510999999999', 'Bottle beer', 1),
('2401120121510999999999', 'Mixed Fruit', 1),
('2401120121510999999999', 'Sunflower Seeds', 1),
('2401120124290349292753', 'Blue Butterfly Pea Flower Tea', 1),
('2401120124290349292753', 'Bottle beer', 1),
('2401120124290349292753', 'Cream Chocolate Milk Tea', 1),
('2401120124290349292753', 'Iced Apple Tea', 1),
('2401120124290349292753', 'Matcha Tea', 1),
('2401120124290349292753', 'Mixed Fruit', 1),
('2401120124290349292753', 'Peach Iced Tea', 1),
('2401120124290349292753', 'Ruby Red Tea', 1),
('2401120124290349292753', 'Sunflower Seeds', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_items`
--

CREATE TABLE `room_items` (
  `room_number` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_condition` varchar(50) DEFAULT NULL,
  `last_checked` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_items`
--

INSERT INTO `room_items` (`room_number`, `item_name`, `quantity`, `item_condition`, `last_checked`) VALUES
(101, 'Amplifier', 1, 'Fair', '2024-04-01'),
(101, 'Lighting System', 2, 'Good', '2023-12-17'),
(101, 'Microphone', 4, 'Good', '2023-12-20'),
(101, 'Monitor', 1, 'Excellent', '2023-12-19'),
(101, 'Speaker', 2, 'Fair', '2023-12-21'),
(102, 'Amplifier', 1, 'Good', '2023-12-18'),
(102, 'Lighting System', 2, 'Excellent', '2023-12-17'),
(102, 'Microphone', 6, 'Excellent', '2023-12-20'),
(102, 'Monitor', 1, 'Fair', '2023-12-19'),
(102, 'Speaker', 4, 'Good', '2023-12-21'),
(103, 'Amplifier', 1, 'Good', '2023-12-18'),
(103, 'Lighting System', 2, 'Excellent', '2023-12-17'),
(103, 'Microphone', 6, 'Good', '2023-12-20'),
(103, 'Monitor', 1, 'Fair', '2023-12-19'),
(103, 'Speaker', 4, 'Excellent', '2023-12-21'),
(104, 'Amplifier', 1, 'Fair', '2023-12-18'),
(104, 'Lighting System', 3, 'Good', '2023-12-17'),
(104, 'Microphone', 6, 'Fair', '2023-12-20'),
(104, 'Monitor', 1, 'Excellent', '2023-12-19'),
(104, 'Speaker', 6, 'Good', '2023-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `room_management`
--

CREATE TABLE `room_management` (
  `room_number` int(3) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_management`
--

INSERT INTO `room_management` (`room_number`, `date`, `time_in`, `time_out`) VALUES
(104, '2024-01-07', '20:11:50', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `room_menu`
--

CREATE TABLE `room_menu` (
  `room_number` int(3) NOT NULL,
  `price_per_hour` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_menu`
--

INSERT INTO `room_menu` (`room_number`, `price_per_hour`) VALUES
(101, 6.00),
(102, 8.00),
(103, 8.00),
(104, 12.00),
(201, 3.00),
(202, 3.00),
(203, 3.00),
(204, 3.00),
(205, 3.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customers_booking`
--
ALTER TABLE `customers_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`order_item`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `room_items`
--
ALTER TABLE `room_items`
  ADD PRIMARY KEY (`room_number`,`item_name`);

--
-- Indexes for table `room_management`
--
ALTER TABLE `room_management`
  ADD PRIMARY KEY (`date`,`time_in`),
  ADD KEY `room_number` (`room_number`);

--
-- Indexes for table `room_menu`
--
ALTER TABLE `room_menu`
  ADD PRIMARY KEY (`room_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers_booking`
--
ALTER TABLE `customers_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_items`
--
ALTER TABLE `room_items`
  ADD CONSTRAINT `room_items_ibfk_1` FOREIGN KEY (`room_number`) REFERENCES `room_menu` (`room_number`);

--
-- Constraints for table `room_management`
--
ALTER TABLE `room_management`
  ADD CONSTRAINT `room_management_ibfk_1` FOREIGN KEY (`room_number`) REFERENCES `room_menu` (`room_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
