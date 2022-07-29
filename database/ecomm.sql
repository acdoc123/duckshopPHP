-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2022 at 04:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(29, 9, 3, 1),
(30, 9, 1, 1),
(31, 9, 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Laptop', 'laptop'),
(2, 'Desktop PC', 'desktop-pc'),
(3, 'Keyboard', 'keyboard'),
(4, 'Mouse', 'mouse'),
(5, 'Head Phone', 'head-phone'),
(6, 'Monitor ', 'monitor');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 11, 2, 1),
(22, 12, 2, 1),
(23, 13, 29, 1),
(24, 13, 8, 1),
(25, 14, 1, 2),
(26, 15, 1, 2),
(27, 15, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`, `stock`) VALUES
(1, 1, 'DELL Inspiron 15 7000 15.6', '<p>15-inch laptop ideal for gamers. Featuring the latest Intel&reg; processors for superior gaming performance, and life-like NVIDIA&reg; GeForce&reg; graphics and an advanced thermal cooling design.</p>\r\n', 'dell-inspiron-15-7000-15-6', 899, 'dell-inspiron-15-7000-15-6.jpg', '2022-07-24', 2, 5),
(2, 6, 'AOC - G2 Series C27G2 27\" LED Curved FHD', '<p>Level up your gameplay with the AOC C27G2 27&rdquo; curved gaming monitor with premium performance features that deliver an ultra-smooth gaming experience.The AOC Gaming C27G2 has a 1500R curved screen that provides immersive gaming and video playback experience as it surrounds your field-of-view. The 3-sided frameless design makes it an ideal model for a multi-monitor setup, giving you a seamless and even more immersive battle station. C27G2 is capable of displaying up to a 165Hz refresh rate and 1ms response time (MPRT), combined with Low Input Lag mode, gone are the days of stutters, lag, and skipped frames. Rated for AMD FreeSync Premium, C27G2&rsquo;s low frame-rate compensation allows for a wide range of Adaptive-Sync support, working in conjunction with your graphics card for smooth gameplay. A sleek ergonomic stand comes standard with the C27G2, allowing for easy height, swivel, and tilt adjustments, promoting a healthier sitting posture. It is also VESA compatible, allowing for mounting with 3rd party mounts once the stand is removed with the thoughtful quick release function. More than just a gaming monitor, the AOC C27G2 also displays a wide color gamut for more lifelike and realistic images (up to 119.9% sRGB area coverage*) when it comes to color-critical applications. The C27G2 is truly a well-rounded performer and is accompanied by the best warranty the gaming monitor industry has to offer: 3-Year Zero Dead Pixel Guarantee + 3-Year Advance Replacement + 1-Year Accidental Damage Warranty through AOC.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'aoc-g2-series-c27g2-27-led-curved-fhd', 209, 'microsoft-surface-pro-4-typecover-128-gb_1658666083.jpg', '2022-07-24', 3, 0),
(3, 1, 'DELL Inspiron 15 5000 15.6', '<p>Dell&#39;s 15.6-inch, midrange notebook is a bland, chunky block. It has long been the case that the Inspiron lineup lacks any sort of aesthetic muse, and the Inspiron 15 5000 follows this trend. It&#39;s a plastic, silver slab bearing Dell&#39;s logo in a mirror sheen.</p>\r\n\r\n<p>Lifting the lid reveals the 15.6-inch, 1080p screen surrounded by an almost offensively thick bezel and a plastic deck with a faux brushed-metal look. There&#39;s a fingerprint reader on the power button, and the keyboard is a black collection of island-style keys.</p>\r\n', 'dell-inspiron-15-5000-15-6', 599, 'dell-inspiron-15-5000-15-6.jpg', '2022-07-24', 1, 3),
(4, 6, 'LG - 32” UltraGear QHD Nano IPS 1ms 165Hz HDR Monitor withG-SYNC Compatibility - Black', '<p>32&quot; UltraWide QHD (2560 x 1440) Nano IPS Display</p>\r\n\r\n<p>At 32&quot; and 16:9 screen ratio (2560 x 1440), LG UltraGear delivers an unparalleled immersive experience and ultra-fast speed of 165Hz on a Nano IPS 1ms display.</p>\r\n\r\n<p>Overwhelming speed</p>\r\n\r\n<p>Responsiveness on a dime. With 1ms response time, gamers see fast action, obstacles and opponents in near real time for a clear advantage.</p>\r\n\r\n<p>An immersive experience that&#39;s all screen.</p>\r\n\r\n<p>Beautiful and practically bezel-less. Stay in the game with a virtually borderless screen on three sides and curve design that keeps you immersed in every moment.</p>\r\n', 'lg-32-ultragear-qhd-nano-ips-1ms-165hz-hdr-monitor-withg-sync-compatibility-black', 399, 'lenovo-ideapad-320s-14ikb-14-laptop-grey_1658666019.jpg', '2022-07-23', 12, 2),
(5, 5, 'LOGITECH PRO X GAMING HEADSET', '<p>DIMENSIONS</p>\r\n\r\n<p><strong>Length</strong>: 5.43 in (138 mm)</p>\r\n\r\n<p><strong>Width</strong>: 3.70 in (94 mm)</p>\r\n\r\n<p><strong>Height</strong>: 7.68 in (195 mm)</p>\r\n\r\n<p><strong>Weight (w/o cable)</strong>: 11.29 oz (320 g)</p>\r\n\r\n<p><strong>PC Cable Length</strong>: 6.5 ft (2 m)</p>\r\n\r\n<p><strong>PC splitter</strong>: 4.72 in (120 mm)</p>\r\n\r\n<p>TECHNICAL SPECIFICATIONS</p>\r\n\r\n<p>HEADPHONE</p>\r\n\r\n<ul>\r\n	<li><strong>Driver</strong>: Hybrid mesh PRO-G 1.97 in (50 mm)</li>\r\n	<li><strong>Magnet</strong>: Neodymium</li>\r\n	<li><strong>Frequency Response</strong>: 20Hz-20KHz</li>\r\n	<li><strong>Impedance</strong>: 35 Ohms</li>\r\n	<li><strong>Sensitivity</strong>: 91.7 dB SPL @ 1 mW &amp; 1 cm</li>\r\n</ul>\r\n\r\n<p>MATERIALS</p>\r\n\r\n<ul>\r\n	<li><strong>Fork</strong>: Aluminum</li>\r\n	<li><strong>Headband</strong>: Steel</li>\r\n	<li><strong>Ear and head pads</strong>: Memory Foam Leatherette</li>\r\n</ul>\r\n\r\n<p>PRO MICROPHONE</p>\r\n\r\n<ul>\r\n	<li><strong>Microphone Pickup Pattern</strong>: Cardioid (Unidirectional)</li>\r\n	<li><strong>Type</strong>: Electret Condenser</li>\r\n	<li><strong>Size</strong>: 0.24 in (6 mm)</li>\r\n	<li><strong>Frequency Response</strong>: 100Hz-10KHz</li>\r\n</ul>\r\n\r\n<p>WARRANTY INFORMATION</p>\r\n\r\n<p>2-Year Limited Hardware Warranty</p>\r\n', 'logitech-pro-x-gaming-headset', 129, 'apple-9-7-ipad-32-gb-gold_1658665657.jpg', '2022-07-24', 2, 8),
(6, 1, 'DELL Inspiron 15 5000 15', '<p>15-inch laptop delivering an exceptional viewing experience, a head-turning finish and an array of options designed to elevate your entertainment, wherever you go.</p>\r\n', 'dell-inspiron-15-5000-15', 449.99, 'dell-inspiron-15-5000-15.jpg', '2022-07-23', 4, 10),
(7, 5, 'G733', '<p>DIMENSIONS</p>\r\n\r\n<p>PHYSICAL SPECIFICATIONS</p>\r\n\r\n<ul>\r\n	<li><strong>Length</strong>: 7.64 in (194 mm)</li>\r\n	<li><strong>Width</strong>: 7.48 in (190 mm)</li>\r\n	<li><strong>Depth</strong>: 3.27 in (83 mm)</li>\r\n	<li><strong>Weight</strong>: 9.81 oz (278 g)</li>\r\n</ul>\r\n\r\n<p>TECHNICAL SPECIFICATIONS</p>\r\n\r\n<p>HEADPHONE</p>\r\n\r\n<ul>\r\n	<li><strong>Driver</strong>: PRO-G 1.57 in (40 mm)</li>\r\n	<li><strong>Frequency Response</strong>: 20Hz-20KHz</li>\r\n	<li><strong>Impedance</strong>: 39 Ohms (passive), 5k Ohms (active)</li>\r\n	<li><strong>Sensitivity</strong>: 87.5 dB SPL/mW</li>\r\n</ul>\r\n\r\n<p>MICROPHONE (BOOM)</p>\r\n\r\n<ul>\r\n	<li><strong>Microphone Pickup Pattern</strong>: Cardioid (Unidirectional)</li>\r\n	<li><strong>Size</strong>: 0.24 in (6 mm)</li>\r\n	<li><strong>Frequency Response</strong>: 100Hz-10KHz</li>\r\n	<li><strong>Wireless range</strong>: Up to 65.62 ft (20 m)&nbsp;<a href=\"javascript:void(0);\">1May vary based on user and computing conditions. Battery life is based on headset volume set to 50%.</a></li>\r\n	<li><strong>Connection Type</strong>: LIGHTSPEED wireless via USB</li>\r\n</ul>\r\n\r\n<p>BATTERY LIFE (RECHARGEABLE)</p>\r\n\r\n<ul>\r\n	<li><strong>No lighting</strong>: 29 Hrs</li>\r\n	<li><strong>Default lighting</strong>: 20 Hrs</li>\r\n</ul>\r\n\r\n<p>WARRANTY INFORMATION</p>\r\n\r\n<p>2-Year Limited Hardware Warranty</p>\r\n', 'g733', 149, 'apple-10-5-ipad-pro-64-gb-space-grey-2017_1658665579.jpg', '0000-00-00', 0, 9),
(8, 1, 'ASUS Transformer Mini T102HA 10.1\" 2 in 1 - Silver', '<p>Versatile Windows 10 device with keyboard and pen included, 2-in-1 functionality: use as both laptop and tablet.Update Windows periodically to ensure that your applications have the latest security settings.</p>\r\n\r\n<p>All day battery life, rated up to 11 hours of video playback; 128GB Solid State storage. Polymer Battery.With up to 11 hours between charges, you can be sure that Transformer Mini T102HA will be right there whenever you need it. You can charge T102HA via its micro USB port, so you can use a mobile charger or any power bank with a micro USB connector.</p>\r\n', 'asus-transformer-mini-t102ha-10-1-2-1-silver', 549.99, 'asus-transformer-mini-t102ha-10-1-2-1-silver.jpg', '2022-07-24', 1, 8),
(9, 2, 'PC SPECIALIST Vortex Core Lite Gaming PC', '<p>- Top performance for playing eSports and more&nbsp;<br />\r\n<br />\r\n- NVIDIA GeForce GTX graphics deliver smooth visuals&nbsp;<br />\r\n<br />\r\n- GeForce Experience delivers updates straight to your PC&nbsp;<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Core Lite&nbsp;</strong>is part of our Gaming range, bringing you the most impressive PCs available today. It has spectacular graphics and fast processing performance to suit the most exacting players.</p>\r\n', 'pc-specialist-vortex-core-lite-gaming-pc', 599.99, 'pc-specialist-vortex-core-lite-gaming-pc.jpg', '2022-07-04', 1, 5),
(10, 2, 'DELL Inspiron 5675 Gaming PC - Recon Blue', '<p>All-new gaming desktop featuring powerful AMD Ryzen&trade; processors, graphics ready for VR, LED lighting and a meticulous design for optimal cooling.</p>\r\n', 'dell-inspiron-5675-gaming-pc-recon-blue', 599.99, 'dell-inspiron-5675-gaming-pc-recon-blue.jpg', '2022-07-22', 1, 0),
(11, 2, 'HP Barebones OMEN X 900-099nn Gaming PC', '<p>What&#39;s inside matters.</p>\r\n\r\n<p>Without proper cooling, top tierperformance never reaches its fullpotential.</p>\r\n\r\n<p>Nine lighting zones accentuate theaggressive lines and smooth blackfinish of this unique galvanized steelcase.</p>\r\n', 'hp-barebones-omen-x-900-099nn-gaming-pc', 489.98, 'hp-barebones-omen-x-900-099nn-gaming-pc.jpg', '2018-05-12', 1, 2),
(12, 2, 'ACER Aspire GX-781 Gaming PC', '<p>- GTX 1050 graphics card lets you play huge games in great resolutions&nbsp;<br />\r\n<br />\r\n- Latest generation Core&trade; i5 processor can handle demanding media software&nbsp;<br />\r\n<br />\r\n- Superfast SSD storage lets you load programs in no time&nbsp;<br />\r\n<br />\r\nThe Acer&nbsp;<strong>Aspire&nbsp;GX-781 Gaming PC&nbsp;</strong>is part of our Gaming range, which offers the most powerful PCs available today. It has outstanding graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'acer-aspire-gx-781-gaming-pc', 749.99, 'acer-aspire-gx-781-gaming-pc.jpg', '2018-05-12', 3, 4),
(13, 2, 'HP Pavilion Power 580-015na Gaming PC', '<p>Features the latest quad core Intel i5 processor and discrete graphics. With this power, you&rsquo;re ready to take on any activity from making digital art to conquering new worlds in VR.</p>\r\n\r\n<p>Choose the performance and storage you need. Boot up in seconds with to 128 GB SSD.</p>\r\n\r\n<p>Ditch the dull grey box, this desktop comes infused with style. A new angular bezel and bold green and black design give your workspace just the right amount of attitude.</p>\r\n\r\n<p>Up to 3 times faster performance - GeForce GTX 10-series graphics cards are powered by Pascal to deliver twice the performance of previous-generation graphics cards.</p>\r\n', 'hp-pavilion-power-580-015na-gaming-pc', 799.99, 'hp-pavilion-power-580-015na-gaming-pc.jpg', '2018-05-12', 1, 5),
(14, 2, 'LENOVO Legion Y520 Gaming PC', '<p>- Multi-task with ease thanks to Intel&reg; i5 processor&nbsp;<br />\r\n<br />\r\n- Prepare for battle with NVIDIA GeForce GTX graphics card&nbsp;<br />\r\n<br />\r\n- VR ready for the next-generation of immersive gaming and entertainment<br />\r\n<br />\r\n- Tool-less upgrade helps you personalise your system to your own demands&nbsp;<br />\r\n<br />\r\nPart of our Gaming range, which features the most powerful PCs available today, the Lenovo&nbsp;<strong>Legion Y520 Gaming PC</strong>&nbsp;has superior graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'lenovo-legion-y520-gaming-pc', 899.99, 'lenovo-legion-y520-gaming-pc.jpg', '2018-05-10', 13, 0),
(15, 2, 'PC SPECIALIST Vortex Minerva XT-R Gaming PC', '<p>- NVIDIA GeForce GTX graphics for stunning gaming visuals<br />\r\n<br />\r\n- Made for eSports with a speedy 7th generation Intel&reg; Core&trade; i5 processor<br />\r\n<br />\r\n- GeForce technology lets you directly update drivers, record your gaming and more<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Minerva XT-R Gaming PC</strong>&nbsp;is part of our Gaming range, which offers the most powerful PCs available. Its high-performance graphics and processing are made to meet the needs of serious gamers.</p>\r\n', 'pc-specialist-vortex-minerva-xt-r-gaming-pc', 999.99, 'pc-specialist-vortex-minerva-xt-r-gaming-pc.jpg', '2018-07-09', 1, 7),
(16, 2, 'PC SPECIALIST Vortex Core II Gaming PC', '<p>Processor: Intel&reg; CoreTM i3-6100 Processor- Dual-core- 3.7 GHz- 3 MB cache</p>\r\n\r\n<p>Memory (RAM): 8 GB DDR4 HyperX, Storage: 1 TB HDD, 7200 rpm</p>\r\n\r\n<p>Graphics card: NVIDIA GeForce GTX 950 (2 GB GDDR5), Motherboard: ASUS H110M-R</p>\r\n\r\n<p>USB: USB 3.0 x 3- USB 2.0 x 5, Video interface: HDMI x 1- DisplayPort x 1- DVI x 2, Audio interface: 3.5 mm jack, Optical disc drive: DVD/RW, Expansion card slot PCIe: (x1) x 2</p>\r\n\r\n<p>Sound: 5.1 Surround Sound support PSU Corsair: VS350, 350W, Colour: Black- Green highlights, Box contents: PC Specialist Vortex Core- AC power cable</p>\r\n', 'pc-specialist-vortex-core-ii-gaming-pc', 649.99, 'pc-specialist-vortex-core-ii-gaming-pc.jpg', '2018-05-10', 2, 9),
(17, 3, 'Keychron Q2', '<p>Connectivity&nbsp;Wired</p>\r\n\r\n<p>Size&nbsp;&nbsp;Compact (65%)</p>\r\n\r\n<p>Mechanical&nbsp;&nbsp;Yes</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Keychron Q2 is a 65% compact wired keyboard that feels very similar to the&nbsp;<a href=\"https://www.rtings.com/keyboard/reviews/keychron/q1\">Keychron Q1</a>, but it&#39;s smaller and has upgraded PBT keycaps with a different shape. It&#39;s highly customizable and comes in a barebones version so that you can install your own switches and keycaps. There&#39;s also a variant that comes with a programmable knob. We tested the fully-assembled version with tactile Gateron G Pro Brown switches, which feel light to type on and are very quiet. Unlike most other Keychron boards, there&#39;s customization software available, so each key is macro-programmable, and the customization software is available on Windows and macOS, as well as Linux. Unfortunately, it doesn&#39;t come with a wrist rest, but you can buy one separately to improve comfort. While its PBT keycaps are a great upgrade from the usual ABS keycaps found on Keychron units, they&#39;re not translucent, so the backlighting doesn&#39;t shine through the legends. Also, while its latency is decently low, it&#39;s not as low as other gaming-oriented options.</p>\r\n', 'keychron-q2', 49.99, 'amazon-fire-7-tablet-alexa-2017-8-gb-black_1658664940.jpg', '2018-05-12', 1, 4),
(18, 3, 'Kinesis Freestyle Edge RGB', '<p>Connectivity&nbsp;Wired</p>\r\n\r\n<p>Size&nbsp;&nbsp;TenKeyLess (80%)</p>\r\n\r\n<p>Mechanical&nbsp;&nbsp;Yes</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Kinesis Freestyle Edge RGB is a fantastic gaming keyboard with a unique design. It&#39;s a fully split keyboard, meaning it has two halves that you can place however you like, as long as they&#39;re within 20 inches of each other because that&#39;s how long the connecting cable is. Thanks to this, it has excellent ergonomics, but it doesn&#39;t come with any incline settings; you can buy a &#39;Lift Kit&#39; separately. It has many features found in standard gaming keyboards, like macro-programmable keys and RGB lighting, and although it has low latency, it&#39;s slightly higher than some other options. It&#39;s available with Cherry MX Brown, Blue, and Red switches, so you can easily get the ones you prefer.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'kinesis-freestyle-edge-rgb', 79.99, 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black_1658664870.jpg', '2018-05-12', 2, 0),
(19, 3, 'Keychron K4', '<p>Connectivity&nbsp;Wireless</p>\r\n\r\n<p>Size&nbsp;&nbsp;Compact (96%)</p>\r\n\r\n<p>Mechanical&nbsp;&nbsp;Yes</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Keychron K4 is an overall decent wireless mechanical keyboard for most uses. It&#39;s a keyboard that can be configured with your preferred type of switches.&nbsp;Our unit is fitted with LK Optical Brown switches, which provide a good amount of tactility without producing much noise, making it a good option for use in quiet office settings. It&#39;s well-built, it has backlighting, and since it&#39;s a Bluetooth keyboard, it can be used with a wide range of devices. You can&nbsp;choose to have a plastic or full aluminum frame, and there&#39;s also an option with full RGB backlighting. Unfortunately, it doesn&#39;t have any programmable keys, doesn&#39;t come with a wrist rest, and there&#39;s no customization software. On the bright side, it has a multi-device pairing feature that lets you pair up to three&nbsp;devices at the same time, and it comes with keycaps for Windows and macOS.</p>\r\n', 'keychron-k4', 99.99, 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black_1658664813.jpg', '2018-05-10', 1, 10),
(20, 3, 'Obinslab Anne Pro 2', '<p>onnectivity&nbsp;Wireless</p>\r\n\r\n<p>Size&nbsp;&nbsp;Compact (60%)</p>\r\n\r\n<p>Mechanical&nbsp;&nbsp;Yes</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Obinslab Anne Pro 2 is an excellent 60% compact gaming keyboard that feels very well-built and looks sleek in most computer setups. It has exceptionally low wired latency, full RGB backlighting with individually-lit keys, and all keys are macro-programmable with the companion software. While this keyboard is available with a wide variety of switch options, our unit has Gateron Brown switches, which have a good amount of feedback, aren&#39;t too loud, and provide an excellent typing quality. Unfortunately, the height of the keyboard and the lack of incline settings or an included wrist rest may cause fatigue during long typing sessions, and the lack of arrow keys may bother some people.</p>\r\n', 'obinslab-anne-pro-2', 339, 'apple-9-7-ipad-32-gb-space-grey_1658664580.jpg', '2018-05-12', 1, 0),
(27, 1, 'Dell XPS 15 9560', '<p>The world&rsquo;s smallest 15.6-inch performance laptop packs powerhouse performance and a stunning InfinityEdge display &mdash; all in our most powerful XPS laptop. Featuring the latest Intel&reg; processors.</p>\r\n\r\n<h2>Operating system</h2>\r\n\r\n<p><strong>Available with Windows 10 Home&nbsp;</strong>- Get the best combination of Windows features you know and new improvements you&#39;ll love.</p>\r\n\r\n<h2>Innovation that inspires.</h2>\r\n\r\n<p>When you&rsquo;re at the forefront of ingenuity, you get noticed. That&rsquo;s why it&rsquo;s no surprise the XPS 15 was honored. The winning streak continues.</p>\r\n\r\n<h2>Meet the smallest 15.6-inch laptop on the planet.</h2>\r\n\r\n<p><strong>The world&rsquo;s only 15.6-inch InfinityEdge display*:</strong>&nbsp;The virtually borderless display maximizes screen space by accommodating a 15.6-inch display inside a laptop closer to the size of a 14-inch, thanks to a bezel measuring just 5.7mm.<br />\r\n&nbsp;<br />\r\n<strong>Operating System: Windows 10 Pro.</strong><br />\r\n<br />\r\n<strong>One-of-a-kind design:</strong>&nbsp;Measuring in at a slim 11-17mm and starting at just 4 pounds (1.8 kg) with a solid state drive, the XPS 15 is one of the world&rsquo;s lightest 15-inch performance-class laptop.</p>\r\n\r\n<h2>A stunning view, wherever you go.</h2>\r\n\r\n<p><strong>Dazzling detail:</strong>&nbsp;With the UltraSharp 4K Ultra HD display (3840 x 2160), you can see each detail of every pixel without needing to zoom in. And with 6 million more pixels than Full HD and 3 million more than the MacBook Pro, you can edit images with pinpoint accuracy without worrying about blurriness or jagged lines.<br />\r\n<br />\r\n<strong>Industry-leading color:</strong>&nbsp;The XPS 15 is the only laptop with 100% Adobe RGB color, covering a wider color gamut and producing shades of color outside conventional panels so you can see more of what you see in real life. And with over 1 billion colors, images appear smoother and color gradients are amazingly lifelike with more depth and dimension. Included is Dell PremierColor software, which automatically remaps content not already in Adobe RGB format for onscreen colors that appear amazingly accurate and true to life.<br />\r\n<br />\r\n<strong>Easy collaboration:</strong>&nbsp;See your screen from nearly every angle with an IGZO IPS panel, providing a wide viewing angle of up to 170&deg;.&nbsp;<br />\r\n<br />\r\n<strong>Brighten your day:</strong>&nbsp;With 350 nit brightness, it&rsquo;s brighter than a typical laptop.<br />\r\n<br />\r\n<strong>Touch-friendly:</strong>&nbsp;Tap, swipe and pinch your way around the screen. The optional touch display lets you interact naturally with your technology.</p>\r\n', 'dell-xps-15-9560', 1599, 'dell-xps-15-9560.jpg', '2022-07-24', 1, 9),
(28, 4, 'MX Anywhere 3', '<p>See the bigger picture and communicate in a whole new way. With the Galaxy Note8 in your hand, bigger things are just waiting to happen.&nbsp;</p>\r\n\r\n<h3>The Infinity Display that&#39;s larger than life.&nbsp;</h3>\r\n\r\n<p>More screen means more space to do great things. Go big with the Galaxy Note8&#39;s 6.3&quot; screen. It&#39;s the largest ever screen on a Note device and it still fits easily in your hand.</p>\r\n\r\n<p>*Infinity Display: a near bezel-less, full-frontal glass, edge-to-edge screen.</p>\r\n\r\n<p>*Screen measured diagonally as a full rectangle without accounting for the rounded corners.</p>\r\n\r\n<p>Use the S Pen to express yourself in ways that make a difference. Draw your own emojis to show how you feel or write a message on a photo and send it as a handwritten note. Do things that matter with the S Pen.</p>\r\n\r\n<p>*Image simulated for illustration purpose only.</p>\r\n', 'mx-anywhere-3', 79.99, 'samsung-note-8_1658665349.jpg', '2022-07-23', 4, 4),
(29, 4, 'MX MASTER 3S', '<h2>Dimensions<br />\r\nMX Master 3S Mouse<br />\r\nHeight: 4.92 in (124.9 mm)<br />\r\nWidth: 3.32 in (84.3 mm)<br />\r\nDepth: 2.01 in (51 mm)<br />\r\nWeight: 4.97 oz (141 g)<br />\r\nLogi Bolt USB Receiver<br />\r\nHeight: 0.72 in (18.4 mm)<br />\r\nWidth: 0.57 in (14.4 mm)<br />\r\nDepth: 0.26 in (6.6 mm)<br />\r\nWeight: 0.07 oz (2 g)<br />\r\nTechnical Specifications<br />\r\nSensor Technology<br />\r\nSensor Technology: Darkfield high precision<br />\r\nNominal value: 1000 dpi<br />\r\nDPI (Minimal and maximal value): 200-8000 dpi (can be set in increments of 50 dpi)<br />\r\nButtons<br />\r\n7 buttons (Left/Right-click, Back/Forward, App-Switch, Wheel mode-shift, Middle click)<br />\r\nScroll Wheel: Yes, with smart-shift<br />\r\nThumb wheel: Yes<br />\r\nGesture button: Yes<br />\r\nWireless operating distance<br />\r\n10 m (32.8 ft) 1Wireless range may vary depending on operating environment and computer setup.<br />\r\nWireless technology<br />\r\nAdvanced 2.4GHz wireless technology<br />\r\nBattery<br />\r\nRechargeable Li-Po (500 mAh) battery<br />\r\nGet three hours of use from a one-minute quick charge. 2Battery life may vary based on user and computing conditions.<br />\r\nOptional software<br />\r\nLogi Options+ and Logitech Flow<br />\r\nSustainability<br />\r\nMX Master 3S<br />\r\nPale Gray plastics: 22% post-consumer recycled material<br />\r\nGraphite plastics: 27% post-consumer recycled material<br />\r\nPaper Packaging: FSC&trade; - certified<br />\r\nWarranty Information<br />\r\n1-Year Limited Hardware Warranty<br />\r\nPart Number<br />\r\nGraphite: 910-006557<br />\r\nPale Gray: 910-006558<br />\r\nBlack: 910-006556</h2>\r\n', 'mx-master-3s', 99.99, 'samsung-galaxy-s9-128-gb_1658665237.jpg', '2022-07-24', 1, 20),
(31, 1, 'Asus ZenBook 13 UX325', '<p>Intel Core i5 1135G7, RAM 8GB, 256GB m.2 NVMe, 13.3&quot; FHD IPS (1920x1080), Intel Iris Xe, 67Wh, Pine Grey</p>\r\n', 'asus-zenbook-13-ux325', 899, 'asus-zenbook-13-ux325_1658646382.jpg', '0000-00-00', 0, 6),
(32, 1, 'ASUS TUF Gaming F15 2021', '<p>Intel Core i5 11400H, RAM 8GB, 512GB m.2 NVMe, 15.6 Full HD IPS 144Hz, Nvidia Geforce RTX 3050 4GB, 48Wh, Eclipse Grey</p>\r\n', 'asus-tuf-gaming-f15-2021', 999, 'asus-tuf-gaming-f15-2021.jpg', '2022-07-24', 1, 6),
(33, 1, 'Dell XPS 15 9570', '<p>Intel Core i7-8750H, RAM 8GB, 256GB m.2 NVMe, 15.6&quot; FHD IPS (1920 x 1080), GTX 1050Ti 4GB, 57Whr, Silver</p>\r\n', 'dell-xps-15-9570', 1699, 'dell-xps-15-9570.jpg', '0000-00-00', 0, 5),
(34, 1, 'Dell Vostro 14 3405', '<p>AMD Ryzen 5 3500U, RAM 4GB, SSD 256GB, 14.0&quot; FHD IPS (1920x1080), AMD Vega 8, 42Wh, Black</p>\r\n', 'dell-vostro-14-3405', 599, 'dell-vostro-14-3405.jpg', '0000-00-00', 0, 8),
(35, 1, '  Dell Gaming G7 7590', '<p>Intel Core i5-9300H, RAM 8GB, 128GB m.2 NVMe, 1TB HDD, 15.6&quot; FHD IPS (1920x1080), GTX1650 4GB, 60Whr, Black</p>\r\n', 'dell-gaming-g7-7590', 699, 'dell-gaming-g7-7590.jpg', '0000-00-00', 0, 4),
(36, 1, 'Razer Blade 15 Base Edition', '<p>Intel Core i7-10750H, RAM 16GB, 256GB m.2 NVMe, 15.6&quot; 144Hz FHD IPS (1920 x 1080), GTX1660 Ti 6GB, 80Whr, Quart Pink</p>\r\n', 'razer-blade-15-base-edition', 2199, 'razer-blade-15-base-edition.jpg', '0000-00-00', 0, 2),
(37, 1, 'Razer Blade 14 AMD', '<p>AMD Ryzen R9 5900HX, RAM 16GB, 1TB m.2 NVMe, 14.0&quot; FHD IPS 144Hz, Nvidia Geforce RTX 3060 6GB, 61.6Wh, Black</p>\r\n', 'razer-blade-14-amd', 2499, 'razer-blade-14-amd.jpg', '0000-00-00', 0, 3),
(38, 1, 'Razer Book 13', '<p>Intel Core i5-1135G7, RAM 8GB, 256GB m.2 NVMe, 13.4&quot; FHD+ IPS (1920x1200), Intel Iris Xe, 55Whr, Mecury White</p>\r\n', 'razer-book-13', 1599, 'razer-book-13.jpg', '0000-00-00', 0, 0),
(39, 1, 'Apple Macbook Air M1 2020', '<p>Apple M1, RAM 8GB, 256GB Nvme, 13.3&quot; Retina (2560 x 1600), Apple GPU (7 Cores), 49.9Wh, Space Grey</p>\r\n', 'apple-macbook-air-m1-2020', 1399, 'apple-macbook-air-m1-2020.jpg', '0000-00-00', 0, 11),
(40, 1, 'Apple Macbook Pro 13 M1 2020', '<p>Apple M1, RAM 8GB, 256GB NVMe, 13.3&quot; Retina (2560 x 1600), Apple GPU, Space Grey</p>\r\n', 'apple-macbook-pro-13-m1-2020', 1799, 'apple-macbook-pro-13-m1-2020.jpg', '0000-00-00', 0, 7),
(41, 1, 'Lenovo ThinkPad L13', '<p>Intel Core i5 10210U, RAM 8GB, 256GB m.2 NVMe, 13.3&quot; FHD IPS (1920 x 1080), Intel UHD 620, 46Wh, Black</p>\r\n', 'lenovo-thinkpad-l13', 999, 'lenovo-thinkpad-l13.jpg', '0000-00-00', 0, 4),
(42, 1, 'Lenovo ThinkPad X1 Carbon Gen 5', '<p>Intel Core i5-6300U, RAM 8GB, 256GB m.2 NVMe, 14&quot; FHD IPS (1920 x 1080), Intel HD 520, 57Whr, Black</p>\r\n', 'lenovo-thinkpad-x1-carbon-gen-5', 799, 'lenovo-thinkpad-x1-carbon-gen-5.jpg', '0000-00-00', 0, 3),
(43, 1, 'Lenovo IdeaPad 3 14', '<p>AMD Ryzen 5 5500U, RAM 8GB, 512GB m.2 NVMe, 14&quot; FHD TN (1920 x 1080), AMD Radeon Graphics, 38Wh, Arctic Grey (82KT003TVN)</p>\r\n', 'lenovo-ideapad-3-14', 799, 'lenovo-ideapad-3-14.jpg', '0000-00-00', 0, 1),
(44, 1, 'HP Omen 15 2020', '<p>AMD Ryzen R7-4800H, RAM 16GB, 1TB m.2 NVMe, 15.6&quot; 144Hz FHD IPS (1920 x 1080), GTX 1660Ti 6GB, 70.9Wh, Black</p>\r\n', 'hp-omen-15-2020', 1499, 'hp-omen-15-2020.jpg', '0000-00-00', 0, 4),
(45, 1, 'HP Pavilion 14 x360 (Intel Gen 11)', '<p>Intel Core i3-1115G4, RAM 4GB, 256GB m.2 NVMe, 14&quot; FHD IPS (1920 x 1080) TOUCH, Intel UHD G4, 43Wh, Warm Gold (14-dw1016TU)</p>\r\n', 'hp-pavilion-14-x360-intel-gen-11', 699, 'hp-pavilion-14-x360-intel-gen-11.jpg', '0000-00-00', 0, 11),
(46, 1, 'HP ZBook Studio X360', '<p>Intel Core i5-8300H, RAM 8GB, 256GB m.2 NVMe, 15.6&quot; FHD IPS (1920x1080) c?m ?ng, Intel UHD 630, 64Wh, Grey</p>\r\n', 'hp-zbook-studio-x360', 899, 'hp-zbook-studio-x360.jpg', '0000-00-00', 0, 5),
(47, 1, 'LG Gram 17\'\' 2021', '<p>Intel Core i7-1165G7, RAM 16GB, 256GB m.2 NVMe, 17.0&quot; 2K WQXGA IPS (2560x1600), Intel Iris Xe, 80Wh, Snow White</p>\r\n', 'lg-gram-17-2021', 2299, 'lg-gram-17-2021.jpg', '0000-00-00', 0, 8),
(48, 1, 'LG Gram 13', '<p>Intel Core i5-8265U, RAM 8GB, 256GB NVMe, 13.3&quot; FHD IPS TOUCH (1920 x 1080), Intel UHD 620, 72Whr, Dark Silver</p>\r\n', 'lg-gram-13', 899, 'lg-gram-13.jpg', '0000-00-00', 0, 9),
(49, 1, 'LG Gram 14\'\' 2021', '<p>Intel Core i5-1135G7, RAM 8GB, 256GB m.2 NVMe, 14&quot; FHD+ IPS (1920 x 1200), Intel Iris Xe, 72Wh, Snow White</p>\r\n', 'lg-gram-14-2021', 2799, 'lg-gram-14-2021.jpg', '0000-00-00', 0, 7),
(50, 1, 'Acer Swift X 2021', '<p>Acer Swift X SFX14-41G-R61A (R5-5600U | 16GB | 1TB | VGA RTX 3050Ti 4GB | 14&#39; FHD | Win 10) Gold</p>\r\n', 'acer-swift-x-2021', 1499, 'acer-swift-x-2021.jpg', '0000-00-00', 0, 8),
(51, 1, 'Acer Aspire 5 14', '<p>Intel Core i5-1135G7, RAM 8GB, 512GB m.2 NVMe, 14.0&quot; FHD IPS (1920x1080), Intel Iris Xe, 48Wh, Silver (A514-54-540F)</p>\r\n', 'acer-aspire-5-14', 799, 'acer-aspire-5-14.jpg', '0000-00-00', 0, 5),
(52, 1, 'Acer Nitro 5 2020 (Intel)', '<p>Intel Core i5 10300H, RAM 8GB, 256GB m.2 NVMe, 15.6 Full HD IPS, Nvidia Geforce GTX 1650 4GB, 58.5Wh, Black</p>\r\n', 'acer-nitro-5-2020-intel', 799, 'acer-nitro-5-2020-intel.jpg', '0000-00-00', 0, 11),
(53, 1, 'MSI GP76 Leopard (Intel Gen 11)', '<p>Intel Core i7-11800H, RAM 16GB, 1TB m.2 NVMe PCIe Gen 4, 17.3&quot; FHD IPS 144Hz (1920x1080), Nvidia Geforce RTX 3070 8GB, 65Wh, Core Black (11UG - 280VN)</p>\r\n', 'msi-gp76-leopard-intel-gen-11', 2699, 'msi-gp76-leopard-intel-gen-11.jpg', '0000-00-00', 0, 0),
(54, 1, 'MSI Modern 15 AMD A5M 2021', '<p>Ryzen 5 5500U, 8GB DDR4, 512GB NVMe PCIe Gen3x4 SSD, AMD Radeon Graphics, 15.6&quot; FHD 300nits IPS, 3C 52Wh, ax+BT, W10H, X&aacute;m (Carbon Gray)</p>\r\n', 'msi-modern-15-amd-a5m-2021', 899, 'msi-modern-15-amd-a5m-2021.jpg', '0000-00-00', 0, 4),
(55, 1, 'MSI GF65 Thin (Intel Gen 10)', '<p>Intel Core i5-10500H, RAM 16GB, 512GB m.2 NVMe, 15.6&quot; FHD IPS 144Hz (1920x1080), Nvidia Geforce RTX 3060 6GB, 51Whr, Black (10UE - 286VN)</p>\r\n', 'msi-gf65-thin-intel-gen-10', 1599, 'msi-gf65-thin-intel-gen-10.jpg', '2022-07-24', 2, 1),
(56, 1, 'Surface Laptop 3 15\"', '<p>Ryzen 5 3580U, RAM 8GB, 256GB m.2 NVMe, 15&quot; 2K IPS (2256 x 1504) c?m ?ng, AMD Radeon Vega 9, 45.8Whr, Grey</p>\r\n', 'surface-laptop-3-15', 1999, 'surface-laptop-3-15.jpg', '0000-00-00', 0, 0),
(57, 1, 'Surface Laptop Go', '<p>Intel Core i5-1035G1, RAM 8GB, 128GB NVMe, 12.4&quot; IPS (1536x1024) c?m ?ng, Intel UHD G1, 39.7Wh, Sandstone</p>\r\n', 'surface-laptop-go', 999, 'surface-laptop-go.jpg', '0000-00-00', 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2022-06-06'),
(11, 9, 'PAYID-MLBJ4FQ4T907337ER239431P', '2022-07-04'),
(12, 9, 'PAYID-MLLG7FA23W04032A90922351', '2022-07-19'),
(13, 9, 'PAYID-MLNBIJQ2W126206N36567130', '2022-07-22'),
(14, 9, 'PAYID-MLN7CFY53236554H5074945X', '2022-07-23'),
(15, 9, 'PAYID-MLN7FKI0L29919543656881Y', '2022-07-23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'Admin', 'Duck', '', '', 'thanos1.jpg', 1, '', '', '2022-05-01'),
(9, 'acdoc123@gmail.com', '$2y$10$Y.ADqV0iZ80LJrlRLukQOedot5Yf5DEYJJkykxvdxQWyFh1.1A9tS', 0, 'Hoang', 'Viet', 'Ben Cat, Binh Duong', '0909273571', 'opm.jpg', 1, 'k8FBpynQfqsv', 'C4k76MGFxrYoUdZ', '2022-05-05'),
(15, 'vietvyvanvi@gmail.com', '$2y$10$ycIkWyTXj27OHwis6UJGkOcIeOFcUSWXIAm5tUKYhFcu.HpVCsG0a', 0, 'Truong', 'Nhi', 'Khong co dia chi nha:))', '0123456789', '', 1, 'nFWJqOp8gGhV', '', '2022-07-20'),
(16, 'vi@gmail.com', '$2y$10$kKSkvEk.iAiT9u1HV4xyEO4JUF0uJStZIisEOCen/TTiAwMzvYSMa', 0, 'Vi', 'Ga', '', '', '', 1, 'MfQyo83ksCGW', '', '2022-07-20'),
(17, 'theseven@gmail.com', '$2y$10$J/YJVVpm/.McUf1fL6.JXOs/yjZJBpP4aqtvurutx2lkQ6c/7nwne', 0, 'Home', 'Lander', '', '', '', 0, 'k23KGzMgtrJe', '', '2022-07-20'),
(22, 'hehehe@admin.com', '$2y$10$bT16Qbzw9.O3yBTD2kE8H.24W3P7SFrYBf9l32TZ.k4EDB0dUHWj.', 0, 'Hehe', 'Hoho', 'US', '0123456789', '', 1, '', '', '2022-07-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
