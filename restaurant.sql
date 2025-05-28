-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2025 at 05:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menucategory`
--

CREATE TABLE `menucategory` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menucategory`
--

INSERT INTO `menucategory` (`catId`, `catName`, `dateCreated`) VALUES
(1, 'Appetizer', '2024-07-26 12:31:55'),
(2, 'Burger', '2024-07-26 12:31:55'),
(3, 'Pizza', '2024-07-26 12:33:18'),
(4, 'Beverage', '2024-07-26 12:33:18'),
(14, 'Chats', '2025-02-09 07:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `catName` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` enum('Available','Unavailable','','') NOT NULL DEFAULT 'Available',
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedDate` datetime NOT NULL,
  `is_popular` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`itemId`, `itemName`, `catName`, `price`, `status`, `description`, `image`, `dateCreated`, `updatedDate`, `is_popular`) VALUES
(3, 'French Fries', 'Appetizer', '760', 'Available', ' Crispy, golden-brown fries seasoned to perfection, served with your choice of dipping sauces.', 'fries.jpg', '2024-07-26 09:09:35', '2024-07-26 14:39:35', 0),
(5, 'Veggie Supreme Pizza', 'Pizza', '800', 'Available', 'Our Veggie Supreme Pizza, is loaded with a colorful array of seasonal vegetables, rich tomato sauce, and a generous layer of gooey cheese.', 'veggie-pizza.jpg', '2024-07-26 09:10:36', '2024-07-26 14:40:36', 1),
(6, 'Prawn Pizza', 'Pizza', '1200', 'Available', 'Dive into our Prawn Pizza, topped with succulent, seasoned prawns, tangy tomato sauce, and a blend of melted cheeses.', 'prawn-piza.jpg', '2024-07-26 09:12:03', '2024-07-26 14:42:03', 0),
(7, 'Cheese Pizza', 'Pizza', '800', 'Unavailable', 'Indulge in the classic simplicity of our Cheese Pizza, topped with a generous layer of gooey mozzarella and a perfectly seasoned tomato sauce.', 'cheese-pizza.jpg', '2024-07-26 09:13:09', '2024-07-26 14:43:09', 1),
(8, 'BBQ Chicken Pizza', 'Pizza', '1000', 'Available', 'Savor the smoky goodness of our BBQ Chicken Pizza, featuring tender chicken pieces smothered in barbecue sauce.', 'bbq-pizza.jpg', '2024-07-26 09:13:45', '2024-07-26 14:43:45', 0),
(9, 'Firebird Burger', 'Burger', '2100', 'Available', 'Crispy fried chicken breast, shredded iceberg lettuce, melted white cheddar, topped with our spicy mayo and sauces on a toasted bun.', 'firebird-burger.jpeg', '2024-08-03 14:37:51', '2024-08-03 16:37:09', 0),
(10, 'Hybrid Burger', 'Burger', '1800', 'Available', 'Crispy chicken breast, melted white cheddar, char-grilled beef patty, chicken bacon with our signature sauces on a toasted bun.', 'hybrid-burger.jpeg', '2024-08-03 15:07:32', '2024-08-03 17:07:01', 1),
(11, 'BBQ Chicken Burger', 'Burger', '1900', 'Available', 'Char-grilled beef patty, iceberg lettuce, red onions, melted white cheddar, BBQ sauce topped with our sauces on a toasted bun. ', 'bbq-burger.jpeg', '2024-08-03 15:09:50', '2024-08-03 17:07:34', 1),
(12, 'Crispy Chicken Burger', 'Burger', '1900', 'Unavailable', 'Marinated crispy fried chicken breast, cheddar cheese, shredded iceberg lettuce topped with our signature mayo and sauces on a toasted bun', 'crispy-burger.jpeg', '2024-08-03 15:21:27', '2024-08-03 17:20:42', 0),
(13, 'Strawberry Mocktail', 'Beverage', '550', 'Available', 'Refreshingly sweet and tangy, this Strawberry Mocktail blends ripe strawberries with a splash of citrus, creating a vibrant.', 'strawberry-drink.png', '2024-08-03 14:18:11', '2024-08-03 16:09:51', 0),
(14, 'Orange Sizzler', 'Beverage', '350', 'Available', 'Enjoy the zing of our Orange Sizzler, a mix of fresh orange juice with a fizzy twist, perfect for adding a burst of to your day.', 'orange-drink.png', '2024-08-03 14:24:49', '2024-08-03 16:24:05', 1),
(15, 'Dragon Fruit Mojito', 'Beverage', '760', 'Available', 'Experience a tropical twist with our Dragon Fruit Mojito, featuring exotic dragon fruit, mint, and lime, all muddled together.', 'Dragon-fruit-drink.png', '2024-08-03 14:25:57', '2024-08-03 16:24:54', 0),
(16, 'Watermelon Smoothie', 'Beverage', '400', 'Available', 'A blend of juicy watermelon and a hint of lime, delivering a hydrating and deliciously fruity escape from the heat.', 'watermelon-drink.png', '2024-08-03 14:26:56', '2024-08-03 16:26:00', 0),
(33, 'Garlic Bread', 'Appetizer', '350', 'Available', 'Golden, toasted bread topped with buttery garlic and herbs. Crispy and savory, perfect for starting your meal.', 'garlic-bread.avif', '2024-08-08 16:37:43', '2024-08-08 22:07:43', 1),
(34, 'Chicken Wing', 'Appetizer', '480', 'Available', 'Tender, juicy chicken wings tossed in your choice of flavorful sauces. Perfectly crispy on the outside and succulent on the inside.', 'chicken-wing.avif', '2024-08-08 16:43:59', '2024-08-08 22:13:59', 0),
(35, 'Samosa', 'Appetizer', '120', 'Available', 'Crispy, golden-brown samosas filled with a savory blend of spiced potatoes and peas.', 'samosa.avif', '2024-08-08 16:45:44', '2024-08-08 22:15:44', 0),
(37, 'Pani Puri', 'Chats', '150', 'Available', ' Crispy, golden-brown puri , served with your choice of dipping panii.', 'panipuri.jpg', '2025-02-09 07:07:57', '2025-02-09 12:37:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pmode` enum('Cash','Card','Takeaway','') NOT NULL DEFAULT 'Cash',
  `payment_status` enum('Pending','Successful','Rejected','') NOT NULL DEFAULT 'Pending',
  `sub_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` enum('Pending','Completed','Cancelled','Processing','On the way') NOT NULL DEFAULT 'Pending',
  `cancel_reason` varchar(255) DEFAULT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `email`, `firstName`, `lastName`, `phone`, `address`, `pmode`, `payment_status`, `sub_total`, `grand_total`, `order_date`, `order_status`, `cancel_reason`, `note`) VALUES
(60, 'lohitmdevadiga@gmail.com', 'Lohit', 'devadiga', '9110258470', 'kundapura', 'Cash', 'Successful', 2280.00, 2410.00, '2025-02-21 16:27:06', 'Completed', '', ''),
(61, 'lohitmdevadiga@gmail.com', 'Lohit', 'devadiga', '9110258470', 'kundapura', 'Takeaway', 'Successful', 1110.00, 1110.00, '2025-05-11 11:52:40', 'Completed', '', ''),
(62, 'ld@gmail.com', 'Demoo', 'Devadiga', '9110258470', 'mujfrrtf', 'Takeaway', 'Successful', 1110.00, 1110.00, '2025-05-11 15:36:01', 'Completed', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `itemName`, `image`, `quantity`, `price`, `total_price`) VALUES
(136, 60, 'Veggie Supreme Pizza', 'veggie-pizza.jpg', 1, 800, 800.00),
(137, 60, 'Chicken Wing', 'chicken-wing.avif', 1, 480, 480.00),
(138, 60, 'BBQ Chicken Pizza', 'bbq-pizza.jpg', 1, 1000, 1000.00),
(139, 61, 'French Fries', 'fries.jpg', 1, 760, 760.00),
(140, 61, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00),
(141, 62, 'French Fries', 'fries.jpg', 1, 760, 760.00),
(142, 62, 'Garlic Bread', 'garlic-bread.avif', 1, 350, 350.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `noOfGuests` int(50) NOT NULL,
  `reservedTime` time NOT NULL,
  `reservedDate` date NOT NULL,
  `reservedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','On Process','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text DEFAULT NULL,
  `review_date` date DEFAULT current_timestamp(),
  `status` enum('approved','pending','rejected') DEFAULT 'pending',
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `email`, `order_id`, `rating`, `review_text`, `review_date`, `status`, `response`) VALUES
(33, 'lohitmdevadiga@gmail.com', 60, 5, 'good food and good quality packing. ', '2025-05-11', 'approved', 'Thank you for your feedback..'),
(34, 'lohitmdevadiga@gmail.com', 61, 3, 'too good', '2025-05-11', 'approved', 'Thank you for your feedback..'),
(35, 'ld@gmail.com', 62, 5, 'nice service', '2025-05-11', 'approved', 'Thank you for your feedback..');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `role` enum('superadmin','admin','delivery boy','waiter') NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_image` varchar(255) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `firstName`, `lastName`, `email`, `contact`, `role`, `password`, `createdAt`, `updatedAt`, `profile_image`) VALUES
(2, 'Lohit', 'Devadiga', 'ld@gmail.com', '9110258470', 'superadmin', 'lo123', '2025-01-02 19:45:36', '2025-02-10 06:56:54', 'user-boy.jpg'),
(5, 'koushik', 's', 'admin@gmail.com', '0000000001', 'admin', 'admin123', '2024-08-04 06:51:20', '2025-02-10 07:05:21', 'user-girl.png'),
(9, 'DeliveryBoy', 's', 'ravi@gmail.com', '0000000001', 'delivery boy', '1234', '2025-05-11 11:42:35', '2025-05-11 11:42:35', 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) NOT NULL DEFAULT 'default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `firstName`, `lastName`, `contact`, `password`, `dateCreated`, `profile_image`) VALUES
('ld@gmail.com', 'Demoo', 'devadiga', '1234567890', '1111', '2025-05-11 15:35:07', 'default.jpg'),
('lohitmdevadiga@gmail.com', 'Lohit', 'Devadiga', '9110258470', '1234', '2025-02-10 07:15:48', 'hybrid-burger.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menucategory`
--
ALTER TABLE `menucategory`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `itemId` (`itemName`) USING BTREE;

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `email` (`email`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `menucategory`
--
ALTER TABLE `menucategory`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
