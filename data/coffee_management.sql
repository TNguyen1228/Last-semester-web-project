-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 09:39 AM
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
  `total_spent` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `phone`, `total_spent`) VALUES
('ID_02672133096', '02672133096', 24.72),
('ID_0349292753', '0349292753', 40.00);

-- --------------------------------------------------------

--
-- Table structure for table `customers_booking`
--

CREATE TABLE `customers_booking` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `person` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('ID_057674', 'Nicole Bauch', 'Servant', '0554882542', 200.00, '2023-01-10'),
('ID_190391', 'Miss May Schneider IV', 'Bartender', '0178541449', 250.00, '2020-11-19'),
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
('2312281538120349292753_102', 'ID_0349292753', '2023-12-28', 40.00);

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
(101, 'Amplifier', 1, 'Good', '2023-12-27'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

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
