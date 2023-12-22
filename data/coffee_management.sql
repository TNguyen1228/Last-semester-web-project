-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2023 lúc 11:15 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `coffee_management`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `loyalty_points` int(11) DEFAULT NULL,
  `total_spent` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `phone`, `loyalty_points`, `total_spent`) VALUES
('ID_000983', 'Tyrone Cummerata', '0459470472', 147, 459.27),
('ID_002563', 'Ralph Schneider', '0668364400', 155, 286.82),
('ID_004734', 'Jean Streich', '0657591145', 83, 416.53),
('ID_004896', 'Constance Rogahn IV', '0227810589', 67, 108.87),
('ID_013123', 'Roberta Borer', '0850045207', 191, 475.10),
('ID_014020', 'Miss Kendra Wunsch', '0657933824', 187, 216.06),
('ID_015622', 'Timothy Lehner', '0378999122', 78, 447.74),
('ID_017372', 'Steven Feeney', '0393274718', 91, 353.79),
('ID_019346', 'Eileen Satterfield', '0491469434', 170, 319.66),
('ID_022370', 'Elsa Donnelly', '0075187788', 121, 167.64),
('ID_029856', 'Silvia Brakus', '0297942622', 56, 323.77),
('ID_034212', 'Jeremiah Braun', '0161339386', 140, 178.19),
('ID_035242', 'Mrs. Darla Erdman', '0794771667', 57, 397.95),
('ID_035373', 'Howard McGlynn', '0752451181', 60, 135.13),
('ID_035449', 'Kenny Schumm', '0281971142', 118, 379.35),
('ID_036972', 'Bernadette Marvin', '0023535915', 112, 273.77),
('ID_037144', 'Eleanor Senger', '0442239796', 123, 220.40),
('ID_038003', 'Clyde Cruickshank PhD', '0634179478', 32, 313.75),
('ID_038438', 'Barry Murphy', '0033163744', 169, 17.03),
('ID_039400', 'Ms. Caleb Legros I', '0178096759', 22, 405.83),
('ID_040603', 'Jerome Marquardt', '0212781890', 192, 453.94),
('ID_042747', 'Eunice Collier', '0638371725', 73, 425.18),
('ID_045846', 'Francis Kertzmann', '0942585982', 22, 419.05),
('ID_047634', 'Ernest Labadie PhD', '0497831472', 24, 184.33),
('ID_047643', 'Josh Ernser', '0080150057', 100, 137.99),
('ID_048847', 'Ms. Eleanor Hilll', '0269377886', 180, 415.30),
('ID_049297', 'Kurt Walsh', '0591555777', 32, 25.41),
('ID_049852', 'Rogelio Hills', '0448563695', 74, 229.66),
('ID_053388', 'Timmy Collins', '0986065398', 144, 414.24),
('ID_055286', 'Adrian O\'Hara', '0695192659', 69, 491.86),
('ID_060623', 'Lila Spinka', '0569557783', 17, 161.32),
('ID_063822', 'Derek Larkin', '0860059809', 43, 452.67),
('ID_065007', 'Troy Herman', '0758070878', 151, 72.17),
('ID_067175', 'Alyssa Goodwin', '0561114344', 159, 180.85),
('ID_067295', 'Jim Mayer Sr.', '0838472569', 73, 450.38),
('ID_067755', 'Gwendolyn Maggio V', '0107847618', 143, 364.06),
('ID_069609', 'Krista McKenzie', '0811944103', 136, 436.53),
('ID_073902', 'Charlotte Nicolas', '0285120179', 126, 237.32),
('ID_075993', 'Nicolas Hessel', '0409375883', 145, 370.74),
('ID_077030', 'Mitchell Beier', '0439723766', 147, 490.42),
('ID_079697', 'George Morissette', '0471575192', 80, 387.14),
('ID_080273', 'Stuart Keeling V', '0127480911', 23, 55.77),
('ID_080362', 'Gertrude Kovacek', '0165150691', 79, 127.83),
('ID_080939', 'Eddie Rau', '0779235367', 28, 59.27),
('ID_081601', 'Shari Schaefer MD', '0278904662', 8, 396.10),
('ID_082750', 'Marlene Roberts', '0203367130', 76, 115.84),
('ID_088459', 'Erik Stanton', '0350729815', 121, 474.70),
('ID_088730', 'Erica Willms', '0887168194', 87, 310.34),
('ID_090542', 'Rochelle O\'Reilly', '0203954921', 39, 1.19),
('ID_090852', 'Melody Baumbach DDS', '0489504593', 121, 499.67),
('ID_093526', 'Jean Robel', '0905153420', 157, 216.24),
('ID_095077', 'Salvatore Ledner', '0521108652', 51, 221.99),
('ID_095122', 'Salvatore Borer', '0631170342', 11, 343.86),
('ID_096947', 'Winifred Nikolaus', '0659143656', 140, 402.80),
('ID_099101', 'Rufus Mante IV', '0626548334', 77, 341.23),
('ID_101423', 'Shawna Tillman', '0675592309', 165, 431.19),
('ID_102605', 'Marguerite Reinger', '0068973369', 76, 19.75),
('ID_106087', 'Traci Zboncak', '0468988581', 77, 479.80),
('ID_112918', 'Lila Mante', '0866063078', 25, 122.34),
('ID_113031', 'Elisa Hills', '0978498800', 148, 213.59),
('ID_114266', 'Frank Powlowski', '0885157341', 187, 471.98),
('ID_116103', 'Hector O\'Hara', '0298626324', 49, 236.63),
('ID_118839', 'Matt Goodwin II', '0097786460', 23, 341.94),
('ID_118846', 'Ida Waelchi', '0466493376', 66, 198.70),
('ID_120764', 'Dwight Huels DVM', '0837140810', 91, 490.81),
('ID_121910', 'Leticia Welch PhD', '0622966807', 162, 286.16),
('ID_125042', 'Yvette Marks', '0314528674', 23, 348.10),
('ID_127142', 'Denise Ernser', '0632454781', 117, 439.35),
('ID_128461', 'Lorraine Jones', '0873984341', 200, 416.17),
('ID_134251', 'Arthur Pollich', '0803675753', 110, 82.70),
('ID_137022', 'Eddie Rodriguez', '0687319124', 66, 488.95),
('ID_138388', 'Leslie Spencer IV', '0508555084', 6, 368.71),
('ID_138687', 'Doyle Abshire', '0933541469', 70, 251.35),
('ID_139338', 'Lora Krajcik', '0458366312', 141, 460.68),
('ID_144444', 'Lynette Williamson', '0789220654', 138, 287.65),
('ID_152486', 'Lorenzo Herzog', '0242461529', 94, 499.88),
('ID_155997', 'Roland Skiles', '0814140555', 101, 460.51),
('ID_156438', 'Gloria Hamill', '0823364991', 121, 350.44),
('ID_162722', 'Judy Brown', '0954605782', 161, 295.74),
('ID_163554', 'Bernard Volkman', '0913655000', 146, 408.27),
('ID_167727', 'Leigh Rogahn', '0796671068', 61, 326.48),
('ID_169149', 'Allan Nitzsche', '0147717584', 45, 27.32),
('ID_170500', 'Elisa Lynch', '0548718941', 113, 111.67),
('ID_175350', 'Latoya Stamm', '0022891217', 25, 326.95),
('ID_177813', 'Latoya Bayer', '0314291540', 32, 421.70),
('ID_178962', 'Woodrow Lebsack', '0019315751', 120, 407.64),
('ID_181025', 'Wade Koepp', '0703988562', 143, 302.42),
('ID_181099', 'Pat Anderson', '0666567528', 134, 398.10),
('ID_187136', 'Orville Sporer', '0915125488', 160, 278.65),
('ID_187863', 'Hugh Raynor', '0407115021', 73, 36.48),
('ID_193248', 'Wesley Wolff', '0244960092', 38, 195.48),
('ID_196990', 'Rogelio Harvey', '0013727910', 161, 305.59),
('ID_200755', 'Jean Weissnat', '0588849899', 52, 253.21),
('ID_201212', 'Carol Kuphal', '0349283498', 8, 454.66),
('ID_203484', 'Luke Jakubowski', '0303163455', 47, 30.48),
('ID_203953', 'Cameron Parisian', '0240728165', 188, 117.15),
('ID_203969', 'Angelica Wyman', '0545585035', 22, 107.96),
('ID_207771', 'Ms. Stewart Blanda I', '0714177101', 55, 339.89),
('ID_208548', 'Flora Zulauf', '0320259122', 73, 130.68),
('ID_211589', 'Wallace Weissnat', '0070094917', 14, 350.52),
('ID_212226', 'Richard Prohaska', '0183511245', 109, 276.84),
('ID_216820', 'Tami Cruickshank', '0617623335', 78, 417.69),
('ID_218966', 'Dallas Dooley', '0002595562', 23, 14.61),
('ID_219948', 'Mr. Lena Hilpert', '0191435372', 106, 64.03),
('ID_224319', 'Marilyn Ankunding', '0385727365', 190, 457.64),
('ID_228950', 'Rose Oberbrunner', '0342482366', 46, 130.55),
('ID_230637', 'Mr. Grace Baumbach', '0112581972', 70, 198.34),
('ID_238465', 'Garrett Schimmel', '0487590353', 168, 213.95),
('ID_239220', 'Tim Berge', '0322978962', 72, 56.60),
('ID_240759', 'Angelo Fay', '0294002120', 54, 106.12),
('ID_243791', 'Mrs. Reginald Stark', '0044925063', 123, 9.66),
('ID_244016', 'Kenny Brekke', '0063332314', 39, 333.32),
('ID_245579', 'Kristina Upton', '0541946231', 65, 373.37),
('ID_247016', 'Miriam Walsh', '0495490948', 39, 436.57),
('ID_247649', 'Rickey Howell III', '0839014316', 131, 471.35),
('ID_247814', 'Nathan Tromp', '0312383843', 124, 414.09),
('ID_249653', 'Lee Thiel DDS', '0533982576', 86, 251.90),
('ID_253868', 'Stacey Cummerata', '0917701209', 156, 233.98),
('ID_254763', 'Gerardo Hermann', '0620292872', 198, 252.70),
('ID_254983', 'Mae Ortiz', '0379709538', 100, 470.32),
('ID_254993', 'Irma Weber DVM', '0226901465', 145, 44.05),
('ID_255912', 'Ken Heidenreich', '0064852007', 107, 266.11),
('ID_256943', 'Laverne Bahringer', '0817985113', 125, 494.61),
('ID_259688', 'Miss Max Sanford', '0564543352', 62, 297.44),
('ID_260578', 'Terri Pfeffer', '0755098350', 192, 410.72),
('ID_261177', 'Craig Nienow', '0269407394', 139, 263.53),
('ID_265295', 'Mario Friesen', '0357775853', 77, 475.45),
('ID_269815', 'Blanca Konopelski', '0947115004', 69, 436.65),
('ID_270800', 'Jeffrey Greenfelder', '0602778712', 4, 485.37),
('ID_270981', 'Lorraine Altenwerth', '0793176687', 134, 338.44),
('ID_273976', 'Tiffany Ziemann', '0612874461', 88, 186.63),
('ID_274232', 'Patrick Fahey', '0685278820', 130, 469.08),
('ID_274296', 'Melvin Murphy', '0783510821', 199, 84.30),
('ID_282790', 'Angel Windler', '0548608492', 130, 245.66),
('ID_282875', 'Benjamin Ritchie', '0232902174', 128, 39.35),
('ID_289207', 'Rogelio Schaefer', '0899612922', 111, 371.49),
('ID_293586', 'Eddie Nader', '0892747277', 125, 63.05),
('ID_295447', 'Randal Buckridge', '0286588286', 36, 476.68),
('ID_302186', 'Delores Jerde', '0542659409', 92, 96.74),
('ID_303622', 'Molly Beier', '0920696738', 47, 275.76),
('ID_304905', 'Ramon Bayer', '0737742288', 15, 137.38),
('ID_305195', 'Johnnie Rutherford', '0645610187', 36, 474.52),
('ID_305920', 'Boyd Lakin', '0648489401', 200, 347.29),
('ID_310738', 'Tony Schneider', '0647054340', 169, 228.03),
('ID_313858', 'Patty Lang', '0401024527', 55, 431.55),
('ID_316435', 'Miss Israel Renner', '0381375229', 162, 473.47),
('ID_317012', 'Cody Cronin DDS', '0969145554', 119, 164.56),
('ID_317139', 'Clay Denesik', '0958062091', 33, 464.35),
('ID_319343', 'Marcella Kuhic', '0989081089', 62, 12.24),
('ID_320045', 'Earnest Bartoletti', '0557613172', 90, 178.46),
('ID_321231', 'Katrina Haag', '0234855011', 146, 390.80),
('ID_321814', 'Lynn Fay', '0206396752', 165, 442.62),
('ID_325127', 'Marian Daugherty I', '0493662554', 77, 180.08),
('ID_325762', 'Elias Gibson', '0432284240', 105, 206.89),
('ID_329234', 'Garrett Morissette', '0003915758', 191, 66.72),
('ID_331689', 'Peggy Rodriguez DVM', '0389181096', 83, 374.22),
('ID_334148', 'Ms. Tyrone Weimann', '0290244166', 54, 178.75),
('ID_335311', 'Miss Cedric Renner', '0459411670', 116, 397.42),
('ID_335414', 'Kristina O\'Conner', '0811782482', 70, 311.35),
('ID_336207', 'Lucille Kulas', '0522409146', 16, 99.03),
('ID_339183', 'Tomas Corkery II', '0082654306', 171, 275.57),
('ID_340783', 'Lora Hahn', '0018946329', 82, 240.21),
('ID_342247', 'Joshua Cronin', '0158458985', 169, 212.67),
('ID_342861', 'Nicole Carter', '0823623092', 190, 189.43),
('ID_344612', 'Devin Conn', '0916282464', 145, 320.02),
('ID_345024', 'Joanna Raynor', '0628176470', 137, 35.62),
('ID_346299', 'Clifton Hammes II', '0155914973', 84, 419.36),
('ID_347006', 'Saul Keeling', '0897769878', 192, 428.82),
('ID_347852', 'Cory Kunde', '0907141931', 27, 237.36),
('ID_351525', 'Kelvin Bechtelar DVM', '0896060352', 23, 456.59),
('ID_351556', 'Eddie Hansen', '0024987132', 92, 477.12),
('ID_355896', 'Emanuel Kuhlman', '0011528552', 152, 134.96),
('ID_367745', 'Margie Rowe', '0162700244', 29, 369.40),
('ID_368757', 'Jaime Hayes', '0564496650', 71, 321.19),
('ID_372686', 'Ernesto Wolf Sr.', '0957735035', 52, 271.81),
('ID_373861', 'Judy Weber', '0916283273', 130, 261.06),
('ID_374466', 'Joshua Tillman', '0680599027', 25, 95.02),
('ID_377948', 'Kristen Fadel', '0968395616', 127, 358.64),
('ID_382050', 'Matt Hane', '0801867187', 131, 33.96),
('ID_385227', 'Nellie Walker', '0537162540', 167, 384.30),
('ID_389341', 'Faith Waters II', '0835295740', 160, 462.79),
('ID_392370', 'Dolores Hodkiewicz', '0741283272', 185, 418.80),
('ID_392487', 'Claude Mohr', '0464762228', 60, 253.29),
('ID_402468', 'Samuel Bernier', '0507392263', 70, 255.45),
('ID_402751', 'Ian Murray', '0487812558', 75, 175.92),
('ID_405183', 'Elisa Baumbach', '0931153640', 62, 229.44),
('ID_405626', 'Randolph Funk', '0797763570', 55, 29.35),
('ID_408829', 'Dr. Corey Hills', '0449462883', 136, 435.52),
('ID_410395', 'Lela Johnson', '0862123637', 193, 474.26),
('ID_413183', 'Clinton Emard', '0234758896', 20, 366.82),
('ID_414181', 'Devin Cremin', '0305370914', 123, 171.71),
('ID_421594', 'Fred Padberg', '0092454338', 119, 431.09),
('ID_422763', 'Tina Reichel', '0500818888', 98, 178.42),
('ID_423523', 'Ms. Harry Purdy', '0991376645', 18, 281.86),
('ID_427739', 'Joanna Beier', '0295125317', 53, 258.13),
('ID_427953', 'Teresa Langosh', '0990120540', 130, 95.19),
('ID_428429', 'Jeanne Padberg', '0763122848', 92, 62.44),
('ID_430869', 'Malcolm Pfannerstill', '0243054518', 188, 273.53),
('ID_431166', 'Brooke Rogahn', '0451532710', 127, 108.33),
('ID_432367', 'Catherine Lehner', '0808748349', 185, 356.13),
('ID_435747', 'Dominic Boyle', '0542918940', 21, 214.21),
('ID_437700', 'Elizabeth Rath', '0485274650', 87, 195.77),
('ID_438655', 'Cory Feeney', '0033090452', 177, 256.10),
('ID_439786', 'Priscilla Herzog DDS', '0117731428', 25, 121.48),
('ID_440184', 'Stanley Casper', '0013522438', 19, 270.92),
('ID_440740', 'Jamie Lockman I', '0732855008', 151, 175.54),
('ID_441522', 'Evan Rosenbaum I', '0380359422', 189, 62.65),
('ID_445871', 'Javier Krajcik', '0972471213', 150, 15.01),
('ID_448219', 'Julio Brakus', '0337670498', 60, 40.09),
('ID_454037', 'Ms. Leah Kerluke', '0607016551', 148, 499.20),
('ID_454301', 'Lester Reichert', '0036800841', 101, 423.99),
('ID_454332', 'Nichole Flatley', '0788609826', 105, 496.07),
('ID_456099', 'Moses Spinka', '0342193082', 64, 244.98),
('ID_456259', 'Ashley Wehner PhD', '0647189411', 118, 484.62),
('ID_457934', 'Allan Christiansen', '0553220329', 65, 283.82),
('ID_458056', 'Eileen Hagenes', '0002734428', 99, 256.36),
('ID_460075', 'Calvin Batz', '0801505867', 135, 138.26),
('ID_466979', 'Miss Darrin Schimmel', '0168816787', 50, 461.96),
('ID_468425', 'Danielle Hoppe', '0522489878', 96, 315.20),
('ID_470431', 'Adrienne Waters', '0331489525', 45, 497.82),
('ID_472607', 'Debra Schuster', '0697842894', 116, 54.92),
('ID_474021', 'Kerry White', '0371134328', 139, 417.26),
('ID_477040', 'Dixie Rohan', '0974618747', 124, 87.12),
('ID_477523', 'Ella Runolfsson', '0433077943', 187, 58.51),
('ID_478124', 'Maggie Heidenreich', '0642074037', 54, 352.07),
('ID_479152', 'Ms. Crystal Schneider', '0837162757', 89, 139.95),
('ID_480140', 'Agnes Dach', '0370263847', 133, 348.74),
('ID_480557', 'Jonathan Auer I', '0078963254', 88, 249.79),
('ID_482442', 'Lynn Upton', '0771067134', 170, 372.74),
('ID_484233', 'Frankie Schimmel', '0155205509', 76, 214.25),
('ID_485230', 'Olga McCullough DDS', '0127473329', 2, 74.79),
('ID_485697', 'Jennie Collier', '0056634337', 33, 165.22),
('ID_485903', 'Julio Harber', '0921738421', 142, 118.96),
('ID_486448', 'Roosevelt Mitchell', '0132202830', 138, 313.29),
('ID_487323', 'Rhonda Hartmann', '0393841319', 168, 317.29),
('ID_489741', 'Dana Schumm', '0885780795', 180, 417.33),
('ID_489850', 'Ed Klocko', '0965272079', 145, 261.86),
('ID_490612', 'Ms. Olive Heller', '0351796230', 125, 378.29),
('ID_492294', 'Charlene Reinger II', '0795635360', 181, 306.57),
('ID_494766', 'Kevin Wiegand I', '0351162400', 186, 209.14),
('ID_495681', 'John DuBuque', '0949165206', 85, 440.57),
('ID_497193', 'Martin Corkery', '0110616690', 60, 459.12),
('ID_497735', 'Terrence Hilpert', '0151292736', 73, 304.67),
('ID_500785', 'Lonnie Wuckert', '0776219113', 12, 110.45),
('ID_507232', 'Victoria Hessel', '0497830565', 166, 396.93),
('ID_511757', 'Angelina Frami', '0392095202', 59, 496.63),
('ID_512606', 'Steven Breitenberg', '0620135421', 5, 382.47),
('ID_513307', 'Phillip Rogahn', '0932677066', 22, 384.24),
('ID_515009', 'Marlon Paucek', '0105757676', 168, 203.80),
('ID_515219', 'Ismael Greenfelder', '0044221203', 74, 202.99),
('ID_515587', 'Ramona Tremblay', '0457292162', 15, 455.86),
('ID_522271', 'Suzanne Erdman', '0624983498', 57, 56.75),
('ID_528043', 'Fredrick Rodriguez', '0644966365', 40, 52.68),
('ID_529167', 'Roosevelt O\'Keefe', '0986050655', 101, 369.70),
('ID_529792', 'Lynn Hills', '0823013819', 56, 103.08),
('ID_532768', 'Kristen White IV', '0683751923', 171, 226.46),
('ID_536560', 'Penny Greenfelder V', '0399502667', 2, 485.62),
('ID_541848', 'Tricia Wyman', '0472868481', 46, 391.73),
('ID_543556', 'Damon Hilpert', '0678413383', 68, 178.51),
('ID_544114', 'Dianne Deckow', '0701406898', 168, 313.89),
('ID_545618', 'Tamara Kozey', '0860210019', 158, 362.20),
('ID_546647', 'Ronald Bradtke', '0016602913', 151, 240.17),
('ID_547006', 'Clifford Stehr', '0351913766', 83, 257.36),
('ID_550534', 'Dixie Heaney', '0502377521', 89, 401.30),
('ID_550661', 'Mrs. Matt O\'Kon', '0998921216', 16, 243.09),
('ID_551425', 'Mrs. Austin Abshire', '0992866582', 149, 317.63),
('ID_551645', 'Eleanor Stanton', '0985186687', 7, 145.98),
('ID_552291', 'Marcia Douglas', '0861499275', 61, 35.84),
('ID_553150', 'Gina Goyette', '0106302645', 176, 403.33),
('ID_558243', 'Steven Steuber Sr.', '0001083423', 172, 299.85),
('ID_558850', 'Eula Ernser', '0590334351', 68, 440.38),
('ID_561364', 'Kristen Dietrich', '0214221554', 115, 275.06),
('ID_563071', 'Marguerite Greenfelder', '0051833285', 193, 15.21),
('ID_564483', 'Bruce Murazik', '0501323435', 188, 31.96),
('ID_566449', 'Lana Stoltenberg', '0811545147', 186, 401.32),
('ID_570245', 'Alexandra Weber', '0891906658', 108, 406.27),
('ID_570988', 'Hugo Beier', '0382882263', 178, 68.93),
('ID_577288', 'Miss Alexandra Stanton', '0740152708', 55, 443.81),
('ID_577303', 'Nelson Kovacek Jr.', '0545325263', 126, 479.70),
('ID_578030', 'Reginald Swift', '0421785524', 79, 18.33),
('ID_579546', 'Julio Grimes', '0433107538', 163, 38.50),
('ID_581061', 'Willie Gerlach', '0437136453', 72, 321.69),
('ID_582012', 'Bruce Gulgowski', '0290589287', 175, 159.41),
('ID_582853', 'Dallas Raynor', '0279529598', 74, 370.75),
('ID_582927', 'Sarah Will', '0422787647', 28, 6.39),
('ID_583996', 'Elsa Greenfelder DVM', '0376219530', 158, 395.27),
('ID_593207', 'Wade Corkery', '0789970247', 162, 281.43),
('ID_594832', 'Mr. Noah Hodkiewicz', '0122386793', 138, 430.69),
('ID_596121', 'Heidi Collins', '0015009091', 41, 192.98),
('ID_598068', 'Felipe Rolfson', '0530206734', 192, 416.01),
('ID_599317', 'Olive Dach', '0876045116', 47, 92.64),
('ID_599820', 'Maurice Stanton', '0914387587', 184, 435.88),
('ID_600336', 'Dominic Beahan', '0587761534', 56, 69.95),
('ID_600542', 'Miss Mindy Lockman', '0748348381', 54, 351.77),
('ID_603102', 'Sadie Harvey', '0976958011', 31, 343.60),
('ID_603382', 'Andrew Hettinger II', '0758024094', 172, 297.33),
('ID_603871', 'Bobbie Jacobs', '0348868298', 19, 369.36),
('ID_608114', 'Frederick Rutherford', '0382314025', 140, 312.79),
('ID_609332', 'Isabel Stoltenberg', '0410186337', 148, 457.08),
('ID_609881', 'Max Wilderman V', '0664339466', 160, 489.12),
('ID_610597', 'Mack Herzog', '0227965805', 49, 318.51),
('ID_611611', 'Mr. Kelley Murazik', '0527423514', 160, 178.07),
('ID_613015', 'Jake Wuckert', '0107456991', 115, 40.85),
('ID_613461', 'Carlton Schinner', '0317315904', 150, 368.87),
('ID_617693', 'Brent Little', '0421511412', 25, 366.54),
('ID_618134', 'Manuel Murphy', '0465014813', 62, 127.40),
('ID_618577', 'Jennifer Legros', '0796420392', 82, 440.43),
('ID_621168', 'Bradford Hegmann II', '0359066697', 107, 414.36),
('ID_621552', 'Clyde Upton', '0089039475', 169, 1.62),
('ID_626389', 'Franklin Hayes', '0371271976', 99, 245.30),
('ID_631326', 'Ms. Brandi Haag', '0009434102', 33, 78.16),
('ID_633340', 'Mrs. Cecelia Kirlin', '0834317110', 51, 39.11),
('ID_635080', 'Sadie Zieme I', '0121369442', 43, 417.33),
('ID_635956', 'Francis Leffler Jr.', '0342964279', 93, 285.96),
('ID_638627', 'Mr. Tonya Halvorson', '0974960022', 8, 86.02),
('ID_640177', 'Clayton Pfannerstill', '0468382716', 86, 97.98),
('ID_640683', 'Mrs. Percy Larson I', '0156446071', 107, 323.30),
('ID_641420', 'Leah Schoen', '0638558907', 87, 199.08),
('ID_645206', 'Ellis Reynolds', '0762028889', 145, 441.64),
('ID_647564', 'Angelica Wisoky DVM', '0116801941', 84, 316.03),
('ID_650264', 'Mitchell Cronin', '0496807493', 20, 344.17),
('ID_652322', 'Wm Osinski', '0938157040', 120, 490.42),
('ID_656605', 'Charles O\'Reilly', '0361690628', 15, 246.28),
('ID_661082', 'Jo Dare', '0453663634', 49, 2.26),
('ID_663109', 'Esther Emmerich', '0835371111', 12, 300.83),
('ID_663595', 'Rickey Lynch', '0431062645', 166, 265.12),
('ID_664711', 'Willard Jenkins', '0809068853', 124, 73.15),
('ID_665352', 'Francisco Fritsch', '0324855704', 7, 307.34),
('ID_668249', 'Zachary Hirthe', '0233020302', 172, 50.46),
('ID_671926', 'Tracy Russel', '0611019522', 93, 32.38),
('ID_676289', 'Jim Robel', '0934488509', 146, 465.22),
('ID_679924', 'Dora Schroeder V', '0729634710', 58, 144.80),
('ID_680490', 'Tammy Hettinger', '0337074621', 154, 478.83),
('ID_682810', 'Antonia Lockman', '0549779900', 58, 300.84),
('ID_686915', 'Margaret Jakubowski Jr.', '0452532431', 187, 380.35),
('ID_687523', 'Angela Langworth', '0752921938', 16, 388.00),
('ID_690730', 'Miss Shawn Murazik', '0248542562', 168, 330.77),
('ID_691503', 'Van Crooks', '0709285819', 172, 60.64),
('ID_692518', 'Grant Toy', '0707194865', 107, 403.63),
('ID_692934', 'Johanna Dicki', '0922337034', 29, 100.41),
('ID_701736', 'Jerry Rosenbaum', '0522834503', 90, 10.92),
('ID_702324', 'Dwight Morar IV', '0115514969', 110, 336.27),
('ID_703577', 'Dr. Kelley Witting', '0718817266', 54, 98.04),
('ID_703719', 'Jeanette Robel', '0621985615', 4, 266.35),
('ID_705196', 'Seth Kihn', '0099153884', 35, 177.36),
('ID_705444', 'Merle Reichert', '0446789713', 176, 93.43),
('ID_706913', 'Roberto Weimann', '0546132125', 80, 334.33),
('ID_707433', 'Ms. Elias Sipes', '0782252615', 57, 296.66),
('ID_708529', 'Celia Ziemann', '0330157661', 30, 373.17),
('ID_710625', 'Miss Travis Hand', '0010963316', 121, 286.22),
('ID_713189', 'Dr. Samantha Nitzsche', '0335280081', 183, 376.70),
('ID_713537', 'Lindsay Spinka', '0954797423', 44, 423.91),
('ID_715885', 'Jeanette Schoen', '0033524626', 98, 342.40),
('ID_717573', 'Max Smith', '0167988623', 146, 117.79),
('ID_718158', 'Omar Gulgowski', '0573990370', 192, 322.79),
('ID_718447', 'Christine Roberts', '0428276516', 188, 414.39),
('ID_718969', 'Greg Wehner', '0531978445', 13, 409.94),
('ID_719690', 'Timothy Bauch', '0869884443', 39, 16.26),
('ID_724557', 'Katherine Schneider', '0519300087', 132, 471.83),
('ID_725186', 'Ms. Johnnie Leuschke I', '0019839380', 1, 463.01),
('ID_725851', 'Mrs. Sandra Gerlach', '0832083892', 29, 194.05),
('ID_726395', 'Patti Hintz', '0578288562', 96, 443.96),
('ID_727904', 'Jaime Adams', '0123393054', 157, 19.30),
('ID_729772', 'Jackie Daugherty', '0335951140', 193, 216.24),
('ID_731552', 'Melody Rodriguez', '0617746994', 187, 414.51),
('ID_731564', 'Stewart Fisher', '0363431781', 4, 459.78),
('ID_731966', 'Melvin Simonis', '0777333092', 92, 198.28),
('ID_732089', 'Garrett Dach', '0623752967', 164, 216.27),
('ID_733024', 'Jenna Grant', '0818372679', 192, 103.39),
('ID_733082', 'Jackie DuBuque', '0667624154', 139, 472.12),
('ID_734343', 'Lance Ondricka', '0323578025', 135, 285.92),
('ID_736203', 'Jeanne Quitzon', '0603119017', 70, 254.69),
('ID_737231', 'Terry Schneider V', '0189259623', 46, 393.75),
('ID_737356', 'Gloria Franecki', '0012572580', 65, 325.20),
('ID_739268', 'Ronnie Blanda', '0291681732', 130, 233.03),
('ID_740281', 'Clinton Toy', '0592243027', 96, 462.83),
('ID_741050', 'Allison Cremin', '0187579721', 188, 91.63),
('ID_741379', 'Ms. Johnnie Cole', '0778162278', 45, 178.61),
('ID_744067', 'Arlene Stoltenberg', '0508924295', 120, 170.81),
('ID_745784', 'Fernando Funk', '0000208457', 158, 141.66),
('ID_749196', 'Blake Keeling MD', '0123944699', 144, 354.78),
('ID_750256', 'Leonard Streich', '0273775058', 183, 94.40),
('ID_750764', 'Nancy Waelchi', '0675420942', 76, 234.53),
('ID_751196', 'Dr. Elizabeth Willms', '0403021519', 87, 424.26),
('ID_754114', 'Bert Becker', '0273903280', 50, 244.18),
('ID_754539', 'Natalie Mayert I', '0124473088', 76, 251.90),
('ID_756941', 'Opal Moore', '0823566757', 98, 32.91),
('ID_758952', 'Courtney Weber', '0380064137', 174, 393.40),
('ID_760097', 'Deborah Keeling', '0295376681', 54, 430.50),
('ID_761140', 'Dr. Carl Reinger', '0235096772', 119, 287.70),
('ID_761836', 'Ernestine Kris', '0653974778', 4, 285.29),
('ID_766359', 'Debra Sporer', '0945722340', 114, 13.92),
('ID_767935', 'Mrs. Simon Schmeler', '0621556427', 53, 24.33),
('ID_770438', 'Martin Weber', '0237806831', 197, 469.58),
('ID_772549', 'Myra Strosin', '0315915053', 82, 352.84),
('ID_773384', 'Mrs. Ernest Gleason', '0762255409', 168, 109.82),
('ID_775383', 'Kim Greenholt', '0396839541', 37, 134.22),
('ID_777882', 'Ella Welch', '0798234526', 76, 261.32),
('ID_779642', 'Marc Kling MD', '0293362501', 114, 393.92),
('ID_782318', 'Yvette Stroman', '0230983016', 9, 56.05),
('ID_787294', 'Mr. Jody Wuckert', '0471353045', 9, 321.68),
('ID_787461', 'Iris Buckridge', '0166688042', 123, 134.36),
('ID_789132', 'Freda Stanton', '0270669570', 179, 382.04),
('ID_790827', 'Gene Rogahn', '0516694691', 26, 410.52),
('ID_791334', 'Mr. Marcella Cronin', '0338873070', 127, 41.57),
('ID_795823', 'Jorge Schneider', '0299679310', 26, 430.62),
('ID_797238', 'Carlos Bosco', '0933660424', 12, 182.63),
('ID_797374', 'Arnold Wiza', '0803810737', 69, 443.80),
('ID_797524', 'Marvin Hermiston', '0824345086', 41, 292.14),
('ID_797540', 'Tyler McGlynn', '0780682937', 160, 200.89),
('ID_804047', 'Diana Ledner Sr.', '0145307737', 89, 466.61),
('ID_811168', 'Sheila Bayer', '0732326843', 82, 119.93),
('ID_815995', 'Theresa Greenholt', '0854704310', 81, 388.81),
('ID_816875', 'Allen Cormier', '0737022696', 147, 154.31),
('ID_822723', 'Mr. Emily Steuber', '0819914817', 96, 386.08),
('ID_823708', 'Daryl Barrows', '0681275852', 181, 351.69),
('ID_823980', 'Dr. Carla Yost Sr.', '0460244381', 163, 274.54),
('ID_824345', 'Mrs. Miguel Jacobi', '0117877520', 35, 280.71),
('ID_826839', 'Ginger Lang', '0181472897', 177, 69.40),
('ID_827618', 'Mr. Monique Steuber', '0342209169', 77, 290.04),
('ID_829662', 'Josefina Altenwerth', '0858034868', 121, 428.24),
('ID_831397', 'Rodney Breitenberg IV', '0144258145', 82, 336.03),
('ID_835371', 'Dr. Lorraine Anderson', '0582603788', 179, 186.74),
('ID_835566', 'Dr. Dwight Hauck I', '0798106047', 13, 17.50),
('ID_836568', 'Virgil Fadel', '0795255117', 61, 102.42),
('ID_837613', 'Dora Nitzsche', '0230847159', 41, 448.65),
('ID_839647', 'Mona Beer', '0208368128', 99, 397.09),
('ID_841339', 'Bryant Luettgen', '0818111207', 136, 117.15),
('ID_844221', 'Michelle Stanton', '0097882903', 29, 28.02),
('ID_846755', 'Jaime Turcotte', '0220587141', 147, 301.05),
('ID_848491', 'Anna Jaskolski', '0142461156', 112, 440.25),
('ID_851034', 'Danielle Greenfelder V', '0370682266', 196, 32.43),
('ID_853242', 'Caroline Hermann MD', '0918970819', 195, 498.16),
('ID_854616', 'Billie Kassulke', '0726248371', 187, 443.00),
('ID_855500', 'Lauren Bogan', '0064628545', 137, 118.29),
('ID_856123', 'Miss Daisy Jerde', '0361432687', 200, 159.53),
('ID_857354', 'Lindsay McKenzie', '0799148172', 117, 247.48),
('ID_861654', 'Dawn Hickle', '0006283595', 107, 58.96),
('ID_862197', 'Ginger Moen', '0800803111', 85, 4.29),
('ID_863374', 'Mr. Freda King', '0521114765', 48, 300.85),
('ID_866891', 'Miss May Blanda', '0585044472', 118, 249.20),
('ID_867884', 'Armando Murazik', '0017219006', 166, 291.08),
('ID_877020', 'Della Feeney', '0027363875', 116, 281.68),
('ID_879473', 'Ignacio Torphy', '0422594489', 63, 418.86),
('ID_885890', 'Doug Beatty PhD', '0592202053', 69, 199.39),
('ID_886129', 'Dallas Thompson DDS', '0123421730', 81, 212.54),
('ID_889974', 'Nathan Jast', '0136263581', 196, 359.85),
('ID_893681', 'Lisa VonRueden', '0760157536', 121, 61.89),
('ID_897902', 'Elsa Wisozk', '0342932616', 56, 417.64),
('ID_898675', 'Dr. Joe Cormier', '0526935430', 5, 447.74),
('ID_900283', 'Kristopher Roberts', '0937919601', 197, 439.68),
('ID_900353', 'Rosie Sanford', '0300310679', 42, 315.77),
('ID_900490', 'Kay McCullough', '0274223670', 5, 217.51),
('ID_901506', 'Johnny Spinka', '0589193113', 104, 243.45),
('ID_910971', 'Aubrey Okuneva', '0168677650', 172, 359.70),
('ID_913746', 'Anne Hills', '0538867220', 142, 172.84),
('ID_915232', 'Ms. Hattie Bashirian', '0854414008', 26, 255.63),
('ID_915383', 'Jessica Mann', '0360353620', 91, 376.89),
('ID_915932', 'Carmen Hermiston', '0586304746', 51, 416.12),
('ID_923722', 'Karl Ryan', '0754430797', 172, 98.08),
('ID_925506', 'Dana Treutel V', '0358510291', 53, 412.97),
('ID_925699', 'Lindsey Parisian', '0162691236', 104, 357.54),
('ID_927330', 'Jamie Rowe', '0210980494', 145, 119.26),
('ID_931961', 'Lillian Goldner', '0647839758', 193, 431.96),
('ID_932612', 'Dr. Angelo Cole', '0884799059', 126, 332.32),
('ID_932764', 'Dr. Paula Mraz MD', '0414778810', 5, 339.09),
('ID_933169', 'Kay Ankunding', '0819678248', 80, 58.21),
('ID_935837', 'Trevor Smith', '0674014584', 133, 228.59),
('ID_936075', 'Greg Green', '0933011328', 105, 310.82),
('ID_936241', 'Kim Ledner', '0463144303', 24, 29.34),
('ID_939630', 'Shannon Wilkinson Sr.', '0101723237', 175, 214.62),
('ID_945691', 'Dr. Lana Lebsack', '0325727412', 93, 298.46),
('ID_948502', 'Kristopher Schumm', '0804721380', 45, 186.61),
('ID_949784', 'Miss Rita Mayer', '0448439751', 86, 368.51),
('ID_949978', 'Tamara Stroman IV', '0101175949', 172, 450.77),
('ID_950218', 'Dr. David Denesik', '0700137203', 84, 273.95),
('ID_951761', 'Brett Kovacek', '0559986625', 150, 467.67),
('ID_954242', 'Melissa Keeling', '0517444091', 47, 450.16),
('ID_955820', 'Kari Haley', '0788319928', 17, 231.35),
('ID_955853', 'Justin Brakus', '0103730814', 143, 240.50),
('ID_956194', 'Charlie Waelchi', '0574114242', 191, 189.10),
('ID_959593', 'Dr. Vera Heidenreich', '0330181337', 148, 464.21),
('ID_960078', 'Miss Dominic Lueilwitz', '0988732111', 115, 244.30),
('ID_962029', 'Mr. Dan Orn', '0091098708', 104, 462.90),
('ID_964871', 'Mathew Harvey PhD', '0637925872', 107, 1.58),
('ID_965589', 'Ms. Kristina Herzog', '0295914268', 31, 52.92),
('ID_967116', 'Jamie Jenkins', '0638658701', 83, 343.57),
('ID_971929', 'Neil Pollich', '0557010450', 115, 12.91),
('ID_978457', 'Toni McGlynn', '0960103471', 191, 67.23),
('ID_985359', 'Nicholas Weissnat', '0659703056', 155, 165.93),
('ID_985916', 'Kellie Goodwin', '0606883201', 1, 384.48),
('ID_986142', 'Charlie Keebler', '0718448452', 90, 473.38),
('ID_987256', 'Mrs. Charles Kuhn', '0785733204', 6, 191.62),
('ID_991376', 'Candice Heidenreich', '0184541847', 39, 252.18),
('ID_991817', 'Ms. Veronica Cremin V', '0307584090', 69, 160.66),
('ID_994265', 'Mr. Marc Satterfield MD', '0164054111', 99, 303.81),
('ID_996707', 'Glenn Shanahan', '0696670853', 74, 363.39),
('ID_999037', 'Antoinette Yundt', '0977865483', 184, 235.69),
('ID_999359', 'Alan Wisoky', '0679519321', 73, 138.38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers_booking`
--

CREATE TABLE `customers_booking` (
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `person` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(9) NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
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
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `item_id` varchar(255) NOT NULL,
  `item_name` text NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `local_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menu`
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
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` varchar(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 'ID_000983', '2023-12-21', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_items`
--

CREATE TABLE `room_items` (
  `item_id` int(11) NOT NULL,
  `room_number` int(11) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_condition` varchar(50) DEFAULT NULL,
  `last_checked` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_items`
--

INSERT INTO `room_items` (`item_id`, `room_number`, `item_name`, `quantity`, `item_condition`, `last_checked`) VALUES
(1, 101, 'Microphone', 10, 'Good', '2023-12-20'),
(2, 101, 'Speaker', 5, 'Fair', '2023-12-21'),
(3, 101, 'Monitor', 5, 'Excellent', '2023-12-19'),
(4, 101, 'Amplifier', 3, 'Fair', '2023-12-18'),
(5, 101, 'Lighting System', 4, 'Good', '2023-12-17'),
(6, 102, 'Microphone', 12, 'Excellent', '2023-12-20'),
(7, 102, 'Speaker', 6, 'Good', '2023-12-21'),
(8, 102, 'Monitor', 6, 'Fair', '2023-12-19'),
(9, 102, 'Amplifier', 4, 'Good', '2023-12-18'),
(10, 102, 'Lighting System', 5, 'Excellent', '2023-12-17'),
(11, 103, 'Microphone', 8, 'Good', '2023-12-20'),
(12, 103, 'Speaker', 4, 'Excellent', '2023-12-21'),
(13, 103, 'Monitor', 4, 'Fair', '2023-12-19'),
(14, 103, 'Amplifier', 2, 'Good', '2023-12-18'),
(15, 103, 'Lighting System', 3, 'Excellent', '2023-12-17'),
(16, 104, 'Microphone', 6, 'Fair', '2023-12-20'),
(17, 104, 'Speaker', 3, 'Good', '2023-12-21'),
(18, 104, 'Monitor', 3, 'Excellent', '2023-12-19'),
(19, 104, 'Amplifier', 2, 'Fair', '2023-12-18'),
(20, 104, 'Lighting System', 2, 'Good', '2023-12-17');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`item_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Chỉ mục cho bảng `room_items`
--
ALTER TABLE `room_items`
  ADD PRIMARY KEY (`item_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `room_items`
--
ALTER TABLE `room_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
