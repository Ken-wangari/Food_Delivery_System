-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 12:52 PM
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
-- Database: `food-delivery-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@mail.com', '', '2024-10-06 03:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `dish_id` int(222) NOT NULL,
  `restaraunt_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`dish_id`, `restaraunt_id`, `title`, `slogan`, `price`, `img`) VALUES
(1, 1, 'beef kabsa', ' Pilau is a fragrant and savory rice dish popular across East Africa, the Middle East, and South Asia. It’s made by cooking rice with a blend of aromatic spices such as cumin, coriander, cinnamon, and cardamom, often accom', 400.00, '67091ec50d417.jpg'),
(2, 2, 'beef pasta', 'Beef pasta is a hearty and savory dish that combines tender beef with pasta in a rich, flavorful sauce. The beef is usually browned and cooked with ingredients like onions, garlic, and tomatoes, and then simmered with herb', 450.00, '67091ef59dd6c.jpg'),
(3, 2, 'Burger', 'A burger is a popular and versatile dish consisting of a ground meat patty, typically beef, served in a bun with various toppings and condiments. The patty is usually seasoned and grilled, fried, or broiled, and placed bet', 250.00, '67091f4624c86.jpg'),
(4, 3, 'Arabic Salad', 'Arabic salad is a fresh, light, and flavorful dish commonly served in Middle Eastern cuisine. It typically consists of chopped vegetables such as tomatoes, cucumbers, onions, and parsley, often mixed with fresh herbs like ', 150.00, '67091f7451081.jpg'),
(5, 1, 'Chicken Nachos', 'Chicken nachos are a delicious, cheesy, and savory snack or appetizer, perfect for sharing. They typically consist of crispy tortilla chips topped with seasoned, shredded chicken, melted cheese, and a variety of toppings. ', 550.00, '67091f9bd9a04.jpg'),
(6, 4, 'steamed chinese buns', 'Steamed Chinese buns, also known as baozi or bao, are soft, fluffy buns that are steamed to perfection and typically filled with a variety of ingredients. The dough is made from wheat flour, yeast, and water, giving the bu', 250.00, '6709203fc3c8d.jpg'),
(7, 4, 'Pork Belly', 'Pork belly is a rich, flavorful cut of meat that comes from the underside of the pig, known for its layers of fat and tender meat. It’s a highly versatile ingredient used in many cuisines around the world, especially popul', 450.00, '6709207d6ae98.jpg'),
(8, 5, 'Spaghetti Meatballs', ' Spaghetti and meatballs is a classic Italian-American dish that combines hearty meatballs with tender spaghetti noodles in a flavorful tomato sauce. The meatballs are typically made from ground beef or a mixture of beef a', 550.00, '6709217cae40a.jpg'),
(9, 5, 'Chicken Francese', 'Chicken Francese is a classic Italian-American dish that features tender chicken breasts coated in a light, golden-brown egg batter and then simmered in a flavorful lemon, white wine, and butter sauce. The chicken is first', 850.00, '670921b2df129.jpg'),
(10, 5, 'lasagna', 'American lasagna is a rich, comforting, and layered casserole made with pasta, meat, cheese, and tomato sauce. It typically consists of wide lasagna noodles layered with a hearty meat sauce, which is often made with ground', 1050.00, '670921e07154c.jpg'),
(11, 6, 'Bamia', 'Bamia is a traditional Middle Eastern dish featuring okra cooked with a rich, flavorful tomato-based sauce. The dish is popular in countries like Lebanon, Syria, Egypt, and other parts of the Arab world. The key ingredient', 650.00, '6709229ecc699.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `feedback` mediumtext NOT NULL,
  `feedbackDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaraunt_category`
--

CREATE TABLE `restaraunt_category` (
  `category_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `restaraunt_category`
--

INSERT INTO `restaraunt_category` (`category_id`, `c_name`, `date`) VALUES
(1, 'Continental', '2022-05-27 08:07:35'),
(2, 'Italian', '2021-04-07 08:45:23'),
(3, 'Chinese', '2021-04-07 08:45:25'),
(4, 'American', '2021-04-07 08:45:28'),
(5, 'Arabic', '2024-10-11 12:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaraunt_id` int(222) NOT NULL,
  `category_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaraunt_id`, `category_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(1, 1, 'Dk Restaraunt', 'dk@hotmail.com', '0786756425', 'https://dkchotel.com', '6am', '11pm', '24hr-x7', '122', '67091cbbdd948.jpg', '2024-10-15 10:42:31'),
(2, 2, 'Riri Restaraunt', 'riri@hotmail.com', '0745217896', 'https://ririre.com', '10am', '11pm', '24hr-x7', 'kamuliu', '67091d4f8386f.jpg', '2024-10-15 10:42:34'),
(3, 1, 'simi Restaraunt', 'simi@hotmail.com', '0745217896', 'https://simi.com', '10am', '11pm', '24hr-x7', 'nairobi', '67091e36b67ed.jpg', '2024-10-15 10:42:37'),
(4, 3, 'chan restaraunt', 'chan@hotmail.co', '0745214789', 'https://chan.com', '10am', '11pm', '24hr-x7', 'chines', '67091fe23c248.jpg', '2024-10-15 10:42:40'),
(5, 4, 'sanford Restaraunt', 'sanford@hotmal.com', '0745214789', 'https://sanford.com', '10am', '11pm', '24hr-x7', '45 moi avenue', '670920f7e926b.jpg', '2024-10-15 10:42:50'),
(6, 5, 'Alhussen Restaraunt', 'alhussein@hotmail.com', '0745698521', 'https://alhus.com', '10am', '11pm', '24hr-x7', 'parkland', '67092268dfed5.jpg', '2024-10-15 10:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(1, 'maina', 'maina', 'Mucira', 'man@gmail.com', '0786756425', '21232f297a57a5a743894a0e4a801fc3', '122', 1, '2024-10-15 10:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `order_id` int(222) NOT NULL,
  `user_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`order_id`, `user_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(2, 1, 'Pork Belly', 1, 450.00, NULL, '2024-10-15 10:08:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`dish_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaraunt_category`
--
ALTER TABLE `restaraunt_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaraunt_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `dish_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `restaraunt_category`
--
ALTER TABLE `restaraunt_category`
  MODIFY `category_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaraunt_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `order_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
