-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2026 at 02:15 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `construction_portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_features`
--

CREATE TABLE `about_features` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_features`
--

INSERT INTO `about_features` (`id`, `icon`, `title`, `description`, `sort_order`, `is_active`) VALUES
(1, 'bi-shield-check', 'Licensed & Insured', 'Fully certified with comprehensive coverage for every project we undertake.', 1, 1),
(2, 'bi-clock', 'On-Time Delivery', 'Proven track record of completing projects within schedule and budget.', 2, 1),
(3, 'bi-people', 'Expert Workforce', 'Over 120 skilled professionals across all construction disciplines.', 3, 1),
(4, 'bi-trophy', 'Award Winning', 'Recognized with 35+ industry awards for quality and innovation.', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `about_section`
--

CREATE TABLE `about_section` (
  `id` int(11) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `secondary_image` varchar(255) DEFAULT NULL,
  `experience_number` varchar(20) DEFAULT NULL,
  `experience_label` varchar(100) DEFAULT NULL,
  `primary_btn_text` varchar(100) DEFAULT NULL,
  `secondary_btn_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_section`
--

INSERT INTO `about_section` (`id`, `subtitle`, `title`, `description`, `main_image`, `secondary_image`, `experience_number`, `experience_label`, `primary_btn_text`, `secondary_btn_text`) VALUES
(1, 'About Constructify', 'We Build With Precision, Passion & Purpose', 'Since 1998, we have been delivering world-class construction services across residential, commercial, and infrastructure sectors. Our commitment to quality craftsmanship and client satisfaction drives everything we do.', 'about-main.jpg', 'about-secondary.jpg', '25+', 'Years of Experience', 'Start Your Project', 'View Our Work');

-- --------------------------------------------------------

--
-- Table structure for table `hero_section`
--

CREATE TABLE `hero_section` (
  `id` int(11) NOT NULL,
  `badge_text` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_highlight` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `primary_btn_text` varchar(100) DEFAULT NULL,
  `secondary_btn_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero_section`
--

INSERT INTO `hero_section` (`id`, `badge_text`, `title`, `title_highlight`, `description`, `background_image`, `primary_btn_text`, `secondary_btn_text`) VALUES
(1, 'Trusted Construction Partner Since 1998', 'Building Tomorrow\'s Infrastructure', 'Today', 'Voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.', 'hero-bg.jpg', 'Explore Our Projects', 'Request a Quote');

-- --------------------------------------------------------

--
-- Table structure for table `hero_stats`
--

CREATE TABLE `hero_stats` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `suffix` varchar(10) DEFAULT '+',
  `label` varchar(100) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero_stats`
--

INSERT INTO `hero_stats` (`id`, `number`, `suffix`, `label`, `sort_order`, `is_active`) VALUES
(1, 25, '+', 'Years Experience', 1, 1),
(2, 850, '+', 'Projects Completed', 2, 1),
(3, 120, '+', 'Team Experts', 3, 1),
(4, 35, '+', 'Industry Awards', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `title`, `description`, `image`, `sort_order`, `is_active`) VALUES
(1, 1, 'Sunset Ridge Villa', 'Premium residential complex with contemporary architecture', 'project-1.jpg', 1, 1),
(2, 2, 'Metro Business Hub', 'State-of-the-art office complex in the city center', 'project-2.jpg', 2, 1),
(3, 3, 'Riverside Highway Bridge', 'Major bridge connecting the northern corridor', 'project-3.jpg', 3, 1),
(4, 1, 'Lakeview Apartments', 'Modern lakeside living with panoramic views', 'project-4.jpg', 4, 1),
(5, 2, 'Central Shopping Plaza', 'Multi-level retail destination with modern amenities', 'project-5.jpg', 5, 1),
(6, 3, 'Northern Rail Terminal', 'Multi-modal transportation hub for the metro area', 'project-6.jpg', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects_section`
--

CREATE TABLE `projects_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects_section`
--

INSERT INTO `projects_section` (`id`, `title`, `subtitle`) VALUES
(1, 'Our Projects', 'Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum');

-- --------------------------------------------------------

--
-- Table structure for table `project_categories`
--

CREATE TABLE `project_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_categories`
--

INSERT INTO `project_categories` (`id`, `name`, `slug`, `sort_order`, `is_active`) VALUES
(1, 'Residential', 'residential', 1, 1),
(2, 'Commercial', 'commercial', 2, 1),
(3, 'Infrastructure', 'infrastructure', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `icon`, `title`, `description`, `sort_order`, `is_active`) VALUES
(1, 'bi-house', 'Residential Building', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet consectetur adipisci velit.', 1, 1),
(2, 'bi-building', 'Commercial Projects', 'Ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam.', 2, 1),
(3, 'bi-hammer', 'Renovation & Remodeling', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae.', 3, 1),
(4, 'bi-signpost-split', 'Road & Infrastructure', 'Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet.', 4, 1),
(5, 'bi-clipboard-data', 'Project Management', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia.', 5, 1),
(6, 'bi-rulers', 'Architecture & Design', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium.', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_section`
--

CREATE TABLE `services_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text DEFAULT NULL,
  `card_image` varchar(255) DEFAULT NULL,
  `card_title` varchar(255) DEFAULT NULL,
  `card_link_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services_section`
--

INSERT INTO `services_section` (`id`, `title`, `subtitle`, `card_image`, `card_title`, `card_link_text`) VALUES
(1, 'Our Services', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur', 'services-card.jpg', 'We Deliver Excellence in Every Project', 'Get a Free Consultation');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'site_name', 'Constructify'),
(2, 'phone', '+1 (555) 234-6789'),
(3, 'nav_button_text', 'Get Estimate');

-- --------------------------------------------------------

--
-- Table structure for table `track_record_section`
--

CREATE TABLE `track_record_section` (
  `id` int(11) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `link_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `track_record_section`
--

INSERT INTO `track_record_section` (`id`, `subtitle`, `title`, `description`, `link_text`) VALUES
(1, 'Our Track Record', 'Numbers That Speak for Our Commitment', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore.', 'View Our Projects');

-- --------------------------------------------------------

--
-- Table structure for table `track_record_stats`
--

CREATE TABLE `track_record_stats` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `suffix` varchar(10) DEFAULT '+',
  `label` varchar(100) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `track_record_stats`
--

INSERT INTO `track_record_stats` (`id`, `icon`, `number`, `suffix`, `label`, `sort_order`, `is_active`) VALUES
(1, 'bi-bar-chart', 850, '+', 'Projects Delivered', 1, 1),
(2, 'bi-emoji-smile', 620, '+', 'Satisfied Clients', 2, 1),
(3, 'bi-people', 120, '+', 'Skilled Workers', 3, 1),
(4, 'bi-award', 35, '+', 'Industry Awards', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_features`
--
ALTER TABLE `about_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_section`
--
ALTER TABLE `about_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_section`
--
ALTER TABLE `hero_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_stats`
--
ALTER TABLE `hero_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `projects_section`
--
ALTER TABLE `projects_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_categories`
--
ALTER TABLE `project_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services_section`
--
ALTER TABLE `services_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `track_record_section`
--
ALTER TABLE `track_record_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_record_stats`
--
ALTER TABLE `track_record_stats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_features`
--
ALTER TABLE `about_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `about_section`
--
ALTER TABLE `about_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hero_section`
--
ALTER TABLE `hero_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hero_stats`
--
ALTER TABLE `hero_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `projects_section`
--
ALTER TABLE `projects_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_categories`
--
ALTER TABLE `project_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services_section`
--
ALTER TABLE `services_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `track_record_section`
--
ALTER TABLE `track_record_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `track_record_stats`
--
ALTER TABLE `track_record_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `project_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
