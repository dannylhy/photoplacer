-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: db.cip.gatech.edu
-- Generation Time: Oct 21, 2013 at 10:42 PM
-- Server version: 5.5.15-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CONTRIB_planb`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations_gtplaces`
--

CREATE TABLE IF NOT EXISTS `locations_gtplaces` (
  `b_id` varchar(10) COLLATE ascii_bin NOT NULL,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `address` varchar(1024) COLLATE ascii_bin NOT NULL,
  `image_url` varchar(1024) COLLATE ascii_bin NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`b_id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Locations pulled from GTplaces api';

--
-- Dumping data for table `locations_gtplaces`
--

INSERT INTO `locations_gtplaces` (`b_id`, `name`, `address`, `image_url`, `latitude`, `longitude`) VALUES
('002', 'Skiles, William Vernon Classroom Building', '686 Cherry St', 'http://maps.gatech.edu/bldgimg/skiles.gif', 33.773598, -84.396294),
('003', 'Robert, L.W. Alumni House', '190 North Avenue', 'http://maps.gatech.edu/bldgimg/afhouse.gif', 33.771008, -84.393547),
('006', 'Smith, John M. Residence Hall', '630 Williams St', 'http://maps.gatech.edu/bldgimg/smith.gif', 33.771713, -84.391327),
('007', 'Brown, Julius Residence Hall', '625 Techwood Dr', 'http://maps.gatech.edu/bldgimg/brown.gif', 33.771702, -84.391861),
('008', 'Peters, Richard Park Parking Deck', '749 Fowler St', 'http://maps.gatech.edu/bldgimg/peterspark.gif', 33.774937, -84.393555),
('009', 'Burge, Flippen D. Parking Deck', '200 North Avenue', 'http://maps.gatech.edu/bldgimg/burgedeck.gif', 33.770969, -84.393921),
('010', 'Howell, Clark Residence Hall', '640 Williams St', 'http://maps.gatech.edu/bldgimg/howell.gif', 33.772114, -84.391068),
('011', 'Harris, Nathanial E. Residence Hall', '633 Techwood Dr', 'http://maps.gatech.edu/bldgimg/harris.gif', 33.772064, -84.391708),
('012', 'Brittain, Marion L.  Dining Hall', '649 Techwood Dr', 'http://maps.gatech.edu/bldgimg/brittain.gif', 33.772446, -84.391335),
('013', 'Cloudman, Josiah Residence Hall', '661 Techwood Dr', 'http://maps.gatech.edu/bldgimg/cloudman.gif', 33.772785, -84.391647),
('014', 'Harrison, George W. Jr. Residence Hall', '660 Williams St', 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.772736, -84.391045),
('015', 'Towers, Donigan D. Residence Hall', '112 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/towers.gif', 33.773396, -84.390999),
('016', 'Glenn, William H. Residence Hall', '118 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/glenn.gif', 33.773411, -84.39164),
('017', 'Dodd, Bobby Stadium at Grant Field', '155 North Avenue', 'http://maps.gatech.edu/bldgimg/bdodd.gif', 33.772644, -84.393036),
('017A', 'GEORGIA TECH YELLOW JACKET TICKET OFFICE', 'FOOTBALL STADIUM UNDER NORTH STANDS', 'http://maps.gatech.edu/bldgimg/ticketoffice.gif', 33.773815, -84.392517),
('017B', 'JC SHAW SPORTS COMPLEX', 'CORNER OF BOBBY DODD WAY & TECHWOOD', 'http://maps.gatech.edu/bldgimg/atheltic.gif', 33.77367, -84.392258),
('018', 'Edge, Arthur B. Intercollegiate Athletic Center', '150 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/edge.gif', 33.773464, -84.39238),
('018A', 'Rice, Homer Center for Sports Performance', '154 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/rice.gif', 33.773731, -84.392517),
('020', 'WREK Transmitter and Tower', '850 Curran St', 'http://maps.gatech.edu/bldgimg/rice.gif', 33.778244, -84.406288),
('022', 'Daniel, J.L. Laboratory', '200 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/daniel.gif', 33.773716, -84.393974),
('023A', 'Army Office', '220 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/armyrotc.gif', 33.773762, -84.394539),
('024', 'Smith, David M.', '685 Cherry St', 'http://maps.gatech.edu/bldgimg/dmsmith.gif', 33.773598, -84.395157),
('025', 'Chapin, Lloyd W.', '681 Cherry St', 'http://maps.gatech.edu/bldgimg/chapin.gif', 33.773262, -84.395248),
('026', 'Holland, Archibald D. (Heating and Cooling)', '680 Power Plant ', 'http://maps.gatech.edu/bldgimg/heat.gif', 33.773254, -84.3946),
('029A', 'Hall, Lyman', '221 Uncle Heinie', 'http://maps.gatech.edu/bldgimg/lyman.gif', 33.772926, -84.394157),
('029B', 'Emerson, William Henry', '221 Uncle Heinie', 'http://maps.gatech.edu/bldgimg/lyman.gif', 33.773129, -84.393944),
('030', 'French, Aaron', '237 Uncle Heinie', 'http://maps.gatech.edu/bldgimg/afrench.gif', 33.772888, -84.394531),
('031', 'Moore, Bill Student Success Center', '219 Uncle Heinie', 'http://maps.gatech.edu/bldgimg/moores.gif', 33.77243, -84.39402),
('032', 'Facilities', '955 Fowler St', 'http://maps.gatech.edu/bldgimg/hrb.gif', 33.779907, -84.393173),
('033', 'O''Keefe, Daniel C.', '151 Sixth Street', 'http://maps.gatech.edu/bldgimg/okeefe.gif', 33.77895, -84.392128),
('033A', 'O''Keefe Gym', '151 Sixth Street', 'http://maps.gatech.edu/bldgimg/ogym.gif', 33.779346, -84.391563),
('033B', 'Womens Softball Locker Room', '151 Sixth Street', 'http://maps.gatech.edu/bldgimg/okeefe.gif', 33.779312, -84.392471),
('035', 'Evans, Lettie Pate Whitehead Administration', '225 North Avenue', 'http://maps.gatech.edu/bldgimg/okeefe.gif', 33.772457, -84.394699),
('036', 'Carnegie, Andrew', '223 Uncle Heinie', 'http://maps.gatech.edu/bldgimg/okeefe.gif', 33.772446, -84.394264),
('038', 'Savant, Domenico P.', '631 Cherry St', 'http://maps.gatech.edu/bldgimg/savant.gif', 33.77211, -84.395302),
('039', 'Swann, Janie Austell', '613 Cherry St', 'http://maps.gatech.edu/bldgimg/swann.gif', 33.771702, -84.395325),
('040', 'Guggenheim, Daniel F.', '265 North Avenue', 'http://maps.gatech.edu/bldgimg/guggheim.gif', 33.77161, -84.395828),
('041', 'Engineering Science and Mechanics', '620 Cherry St', 'http://maps.gatech.edu/bldgimg/esm.gif', 33.77206, -84.395767),
('042', 'Student Center Parking Booth', '355 Ferst Drive', 'http://maps.gatech.edu/bldgimg/ferstParking.gif', 33.773567, -84.399277),
('045', 'Coon, John Saylor', '654 Cherry St', 'http://maps.gatech.edu/bldgimg/coon.gif', 33.772823, -84.395912),
('046', 'Beringause, Gary F.', '879 Hemphill Ave', 'http://maps.gatech.edu/bldgimg/police.gif', 33.778908, -84.401428),
('047', 'Wardlaw, William C. Jr. Center', '177 North Avenue', 'http://maps.gatech.edu/bldgimg/wardlaw.gif', 33.771679, -84.392815),
('050', 'Computing (COC)', '801 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/coc.gif', 33.77734, -84.39727),
('051', 'Hinman, Thomas P. Research', '723 Cherry St', 'http://maps.gatech.edu/bldgimg/hinman.gif', 33.774612, -84.395058),
('051D', 'Rich Computer Center', '258 Fourth St', 'http://maps.gatech.edu/bldgimg/oit-rich.gif', 33.775196, -84.395081),
('052', 'Graduate Living Center', '301 Tenth Street', 'http://maps.gatech.edu/bldgimg/glc.gif', 33.782387, -84.396622),
('054', 'Student Center Parking Deck', '391 Ferst Drive', 'http://maps.gatech.edu/bldgimg/clydeck.gif', 33.774242, -84.400589),
('055', 'Instructional Center', '759 Ferst Drive', 'http://maps.gatech.edu/bldgimg/ic.gif', 33.775402, -84.401344),
('056', 'Groseclose, Colonel Frank F.', '765 Ferst Drive', 'http://maps.gatech.edu/bldgimg/groseclose.gif', 33.775661, -84.401695),
('057', 'ISYE Annex', '755 Ferst Drive', 'http://maps.gatech.edu/bldgimg/man.gif', 33.775261, -84.401848),
('058', 'Civil Engineering (Old)', '221 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/oldce.gif', 33.774227, -84.394653),
('059', 'Hall, Stephen C.', '215 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/nrotcarm.gif', 33.77412, -84.394142),
('060A', 'Caddell, Joyce K. & John A. Architecture Annex', '280 Ferst Drive', 'http://maps.gatech.edu/bldgimg/buildcon.gif', 33.776707, -84.396889),
('061', '430 Tenth Street (North)', '430 Tenth Street', 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.781094, -84.401474),
('061A', '430 Tenth Street (South)', '430 Tenth Street', 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.780357, -84.401474),
('064', 'Nelson, Kurt S. (West), Carolyn & Earl Shell (North) UG Liv Ctr', '580 Turner Place', 'http://maps.gatech.edu/bldgimg/ulc.gif', 33.778435, -84.405266),
('065', 'Maulding, Jeanette & William Residence Hall', '501 Sixth Street', 'http://maps.gatech.edu/bldgimg/6thst.gif', 33.777534, -84.404839),
('066', 'Emerson, Cherry L.', '310 Ferst Drive', 'http://maps.gatech.edu/bldgimg/cherryem.gif', 33.777962, -84.39724),
('067', 'Facilities Garage/Warehouse', '947 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/cherryem.gif', 33.78056, -84.397507),
('067A', 'Facilities Operations Storage', '947 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/cherryem.gif', 33.78088, -84.397141),
('070', 'TENTH & HOME', '251 TENTH ST NW', 'http://maps.gatech.edu/bldgimg/tenthandhome.gif', 33.781815, -84.395378),
('071', 'President''s House', '292 Tenth Street', 'http://maps.gatech.edu/bldgimg/tenthandhome.gif', 33.780918, -84.395721),
('071A', 'President''s House - Grounds', '294 Tenth Street', 'http://maps.gatech.edu/bldgimg/tenthandhome.gif', 33.781071, -84.396324),
('073', 'McCamish Pavilion', '965 Fowler St', 'http://maps.gatech.edu/bldgimg/colis.gif', 33.78054, -84.392776),
('073A', 'Luck, James K. Jr.', '175 Eighth St', 'http://maps.gatech.edu/bldgimg/luck.gif', 33.780251, -84.39222),
('073B', 'Zelnak, Judy & Steve Basketball Practice Facility', '177 Eighth St', 'http://maps.gatech.edu/bldgimg/luck.gif', 33.779839, -84.392273),
('073S', 'FACILITIES', '', 'http://maps.gatech.edu/bldgimg/wrekradio.gif', 33.773441, -84.397728),
('074', 'Bradley, W.C. & Sarah', '224 Uncle Heinie', 'http://maps.gatech.edu/bldgimg/juniors.gif', 33.772598, -84.394516),
('075', 'Architecture (West)', '247 Fourth St', 'http://maps.gatech.edu/bldgimg/coaw.gif', 33.776073, -84.396065),
('076', 'Architecture (East)', '245 Fourth St', 'http://maps.gatech.edu/bldgimg/arch.gif', 33.775932, -84.39537),
('077', 'Gilbert, Judge S. Price Memorial Library', '704 Cherry St', 'http://maps.gatech.edu/bldgimg/library.gif', 33.774315, -84.395805),
('081', 'Howey, Joseph H.', '800 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/physics.gif', 33.777393, -84.398453),
('083C', 'Storeroom Annex', '915 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/physics.gif', 33.780766, -84.396851),
('084', 'Weber, Paul Space Science & Technology (SST1)', '281 Ferst Drive', 'http://maps.gatech.edu/bldgimg/sst.gif', 33.772911, -84.396675),
('085', 'Van Leer, Blake R.', '777 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/vanleer.gif', 33.775806, -84.397217),
('086', 'Bunger-Henry', '778 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.775616, -84.398338),
('090', 'Field, Floyd Residence Hall', '711 Techwood Dr', 'http://maps.gatech.edu/bldgimg/field.gif', 33.774239, -84.391663),
('091', 'Matheson, Kenneth G. Residence Hall', '715 Techwood Dr', 'http://maps.gatech.edu/bldgimg/matheson.gif', 33.774502, -84.391594),
('092', 'Perry, William G. Residence Hall', '715 Techwood Dr', 'http://maps.gatech.edu/bldgimg/perry.gif', 33.774479, -84.39109),
('093', 'Hanson, Major John Residence Hall', '109 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/hanson.gif', 33.77422, -84.390953),
('094', 'Hopkins, Issac S. Residence Hall', '115 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/hopkins.gif', 33.774052, -84.391312),
('095', 'Pettit, Joseph M. Microelectronics Research', '791 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/mirc.gif', 33.776608, -84.397362),
('098', 'Weber, Paul Space Science & Technology (SST3)', '275 Ferst Drive', 'http://maps.gatech.edu/bldgimg/sst.gif', 33.77264, -84.396332),
('099', 'Baker, Harry L.', '925 Dalney St', 'http://maps.gatech.edu/bldgimg/baker.gif', 33.780006, -84.399628),
('100', 'Crosland, Dorothy M. Tower', '241 Bobby Dodd W', 'http://maps.gatech.edu/bldgimg/croslandtower.gif', 33.774189, -84.395271),
('101', 'Knight, Montgomery Aerospace Engineering (SST2)', '270 Ferst Drive', 'http://maps.gatech.edu/bldgimg/knight.gif', 33.771969, -84.396141),
('103', 'Boggs, Gilbert Hillhouse', '770 State Street', 'http://maps.gatech.edu/bldgimg/boggs.gif', 33.775448, -84.399803),
('104', 'Wenn, Fred B. Student Center', '351 Ferst Drive', 'http://maps.gatech.edu/bldgimg/studcen.gif', 33.774155, -84.398834),
('105', 'Commander, Robert C. Commons', '873 McMillan St', 'http://maps.gatech.edu/bldgimg/comm.gif', 33.778854, -84.403984),
('106', 'Fulmer, Herman K. Residence Hall', '871 McMillan St', 'http://maps.gatech.edu/bldgimg/fulmer.gif', 33.778633, -84.403938),
('107', 'Hefner, Ralph A. Residence Hall', '510 Eighth St', 'http://maps.gatech.edu/bldgimg/hefner.gif', 33.779156, -84.403984),
('108', 'Armstrong, Arthur H. Residence Hall', '498 Eighth St', 'http://maps.gatech.edu/bldgimg/armstrong.gif', 33.779137, -84.403625),
('109', 'Caldwell, Hugh H. Residence Hall', '521 Turner Place', 'http://maps.gatech.edu/bldgimg/caldwell.gif', 33.778934, -84.404472),
('110', 'Folk, Edwin H. Residence Hall', '531 Turner Place', 'http://maps.gatech.edu/bldgimg/folk.gif', 33.778946, -84.404884),
('111', 'Mason, Jesse ', '790 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/mason.gif', 33.776653, -84.398613),
('114', 'Stamps, Penny & Roe Student Center Commons', '301 Ferst Drive', 'http://maps.gatech.edu/bldgimg/houston.gif', 33.773663, -84.398193),
('114A', 'Stamps Addition', '301 Ferst Drive', 'http://maps.gatech.edu/bldgimg/houston.gif', 33.773426, -84.398003),
('115', 'Couch, J. Allen', '840 McMillan St', 'http://maps.gatech.edu/bldgimg/couch.gif', 33.778244, -84.404564),
('116', 'Woodruff, Irene & George Residence Hall', '890 Curran St', 'http://maps.gatech.edu/bldgimg/woody.gif', 33.779102, -84.406723),
('117', 'Freeman, Y. Frank Jr. Residence Hall', '835 McMillan St', 'http://maps.gatech.edu/bldgimg/freeman.gif', 33.777531, -84.404015),
('118', 'Montag, Harold E. Residence Hall', '845 McMillan St', 'http://maps.gatech.edu/bldgimg/montag.gif', 33.777828, -84.403992),
('119', 'Fitten, Louise M. Residence Hall', '855 McMillan St', 'http://maps.gatech.edu/bldgimg/fitten.gif', 33.778217, -84.403778),
('120', '401 Ferst Drive N.W.', '401 Ferst Drive', 'http://maps.gatech.edu/bldgimg/fitten.gif', 33.778625, -84.400543),
('123', 'Smithgall, Charles A. Jr. Student Services', '353 Ferst Drive', 'http://maps.gatech.edu/bldgimg/studserv.gif', 33.774368, -84.399567),
('124', 'Ferst, Robert Center for The Arts', '349 Ferst Drive', 'http://maps.gatech.edu/bldgimg/theater.gif', 33.775101, -84.399284),
('125', 'Southern Regional Education Board', '580 Tenth Street', 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.781143, -84.406647),
('126', 'Callaway, Fuller E. Jr. Manufacturing Research Center', '775 Ferst Drive', 'http://maps.gatech.edu/bldgimg/mrc1.gif', 33.777645, -84.401352),
('128', '490 Tenth Street', '490 Tenth Street', 'http://maps.gatech.edu/bldgimg/crt.gif', 33.781239, -84.403366),
('129', 'Institute of Paper Science and Technology', '500 Tenth Street', 'http://maps.gatech.edu/bldgimg/ipst.gif', 33.780987, -84.404617),
('130', 'Eighth Street Apartments', '555 Eighth St', 'http://maps.gatech.edu/bldgimg/8thst.gif', 33.780125, -84.40519),
('131', 'Crecine, John Patrick Residence Hall', '900 Hemphill Ave', 'http://maps.gatech.edu/bldgimg/hemphill.gif', 33.780109, -84.403648),
('132', 'Center Street Apartments', '939 Hemphill Ave', 'http://maps.gatech.edu/bldgimg/center.gif', 33.780083, -84.402023),
('134', 'Stein, Jack C. House - Fourth Street Apartments', '733 Techwood Dr', 'http://maps.gatech.edu/bldgimg/4thstb.gif', 33.775078, -84.391609),
('135', 'Manufacturing Related Disciplines Complex', '801 Ferst Drive', 'http://maps.gatech.edu/bldgimg/mrdc1.gif', 33.777008, -84.400505),
('136', 'NARA Tech Way Bldg', '505 Tech Way', 'http://maps.gatech.edu/bldgimg/mrdc1.gif', 33.770992, -84.402733),
('137', '781 Marietta Street N.W.', '781 Marietta St', 'http://maps.gatech.edu/bldgimg/haber.gif', 33.773983, -84.40435),
('138', '811 Marietta Street N.W.', '811 Marietta St', 'http://maps.gatech.edu/bldgimg/ppc.gif', 33.774742, -84.405533),
('139', 'Curran Street Parking Deck', '875 Curran St', 'http://maps.gatech.edu/bldgimg/curran.gif', 33.779194, -84.405579),
('140', 'Aquatic Center', '750 Ferst Dr', 'http://maps.gatech.edu/bldgimg/aquatic.gif', 33.775578, -84.404396),
('141', 'Georgia Tech Research Institute', '250 14th Street', 'http://maps.gatech.edu/bldgimg/gcatt.gif', 33.785805, -84.394913),
('141B', '14th Street Parking Deck', '250 14th Street', 'http://maps.gatech.edu/bldgimg/gcatt.gif', 33.785191, -84.395294),
('142', 'Human Resources', '500 Tech Parkway', 'http://maps.gatech.edu/bldgimg/ecrc.gif', 33.773369, -84.402679),
('144', 'Love, J. Erskine Jr.  Manufacturing', '771 Ferst Drive', 'http://maps.gatech.edu/bldgimg/mrdc2.gif', 33.776577, -84.401741),
('145', 'Allen, Lamar Sustainable Education', '788 Atlantic Dr', 'http://maps.gatech.edu/bldgimg/suse.gif', 33.776215, -84.398849),
('146', 'Petit, Parker H. Biotechnology', '315 Ferst Drive', 'http://maps.gatech.edu/bldgimg/bio.gif', 33.779007, -84.397324),
('147', 'Ford Environmental Science & Technology', '311 Ferst Dr', 'http://maps.gatech.edu/bldgimg/ford.gif', 33.778843, -84.396011),
('148', 'North Campus Parking Deck', '352 Peachtree Pl', 'http://maps.gatech.edu/bldgimg/nparkdeck.gif', 33.780132, -84.398499),
('149', 'NARA Structures Lab', '625 Lambert St', 'http://maps.gatech.edu/bldgimg/nparkdeck.gif', 33.771015, -84.404137),
('151', 'Zinn, Ben T. Laboratory', '636 Strong St', 'http://maps.gatech.edu/bldgimg/nparkdeck.gif', 33.770397, -84.402603),
('152', 'Broadband Institute Residential Laboratory', '479 Tenth Street', 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.781715, -84.402954),
('153', 'Klaus, Christopher W. Advanced Computing', '266 Ferst Dr', 'http://maps.gatech.edu/bldgimg/klaus.gif', 33.777195, -84.396164),
('155', 'Research Administration', '505 Tenth St', 'http://maps.gatech.edu/bldgimg/sponsoredprograms.gif', 33.7817, -84.403992),
('155B', 'Research Administration Addition', '505 Tenth St', 'http://maps.gatech.edu/bldgimg/sponsoredprograms.gif', 33.781715, -84.403671),
('156', '845 Marietta Street N.W.', '845 Marietta St', 'http://maps.gatech.edu/bldgimg/oitmariettast.gif', 33.775909, -84.406487),
('158', 'Digital Fabrication Lab', '676 Marietta St', 'http://maps.gatech.edu/bldgimg/advancedwood.gif', 33.771637, -84.401459),
('158A', 'GTRI Machine Shop', '676 Marietta St', 'http://maps.gatech.edu/bldgimg/advancedwood.gif', 33.771782, -84.40197),
('159', 'Food Processing Technology Research', '640 Strong St', 'http://maps.gatech.edu/bldgimg/advancedwood.gif', 33.770432, -84.403816),
('160', 'Campus Recreation Center', '750 Ferst Dr', 'http://maps.gatech.edu/bldgimg/crc.gif', 33.775597, -84.403542),
('162', 'CRC Parking Deck', '750 Ferst Dr', 'http://maps.gatech.edu/bldgimg/crc.gif', 33.77618, -84.403908),
('163', '645 Northside Drive', '645 Northside Dr', 'http://maps.gatech.edu/bldgimg/crc.gif', 33.77182, -84.406105),
('164', 'Business Services', '711 Marietta St', 'http://maps.gatech.edu/bldgimg/crc.gif', 33.772877, -84.401512),
('165', 'Whitaker, U.A. Biomedical Engineering', '313 Ferst Dr', 'http://maps.gatech.edu/bldgimg/whitaker.gif', 33.778492, -84.396896),
('166', 'Clough Undergraduate Learning Commons', '266 Fourth St', 'http://maps.gatech.edu/bldgimg/whitaker.gif', 33.774727, -84.396454),
('167', 'Robinson, Glen  P. (East) Molecular Science & Engineering', '901 Atlantic Dr.', 'http://maps.gatech.edu/bldgimg/whitaker.gif', 33.779724, -84.396759),
('168', 'Chandler, Russ Stadium', '255 Ferst Drive', 'http://maps.gatech.edu/bldgimg/chandler.gif', 33.777325, -84.395248),
('169', 'Ethel Street Warehouse', '650 Ethel St', 'http://maps.gatech.edu/bldgimg/chandler.gif', 33.784077, -84.408379),
('170', 'Global Learning Center', '84 Fifth St', 'http://maps.gatech.edu/bldgimg/globallc.gif', 33.776363, -84.389992),
('171', 'Hotel Retail Space', '800 Spring St', 'http://maps.gatech.edu/bldgimg/hotel.gif', 33.776337, -84.389313),
('172', 'College of Business', '800 W Peachtree', 'http://maps.gatech.edu/bldgimg/barnesnnoble.gif', 33.776081, -84.387604),
('173', 'Economic Development', '760 Spring St', 'http://maps.gatech.edu/bldgimg/econdev.gif', 33.775513, -84.389091),
('174', 'Technology Square Parking Deck', '770 Spring St', 'http://maps.gatech.edu/bldgimg/techsqpark.gif', 33.775593, -84.38958),
('175', 'Technology Square Research', '85 Fifth St', 'http://maps.gatech.edu/bldgimg/techsqresearch.gif', 33.7775, -84.390121),
('176', 'Centergy One', '75 Fifth St', 'http://maps.gatech.edu/bldgimg/atdc.gif', 33.777355, -84.389336),
('177', 'Whitehead, Joseph B. Student Health Center', '740 Ferst Dr', 'http://maps.gatech.edu/bldgimg/health.gif', 33.774837, -84.403168),
('178', '828 West Peachtree Street', '828 W Ptree', 'http://maps.gatech.edu/bldgimg/health.gif', 33.777077, -84.387718),
('179', '830 West Peachtree Street', '830 W Ptree', 'http://maps.gatech.edu/bldgimg/health.gif', 33.777382, -84.387733),
('180', 'Family Apartments', '251 Tenth St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.782234, -84.395416),
('181', 'Marcus Nanotechnology', '345 Ferst Dr Nw', 'http://maps.gatech.edu/bldgimg/health.gif', 33.778751, -84.398636),
('182', 'Family Apartments Parking Deck', '251 Tenth St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.782154, -84.39502),
('184', '831 Marietta Street N.W.', '831 Marietta St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.775276, -84.405914),
('185', 'Strong Street Gatehouse', '637 Strong St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.770344, -84.403214),
('186', '755 Marietta Street N.W.', '755 Marietta St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.773617, -84.403488),
('187', '793 Marietta Street N.W.', '793 Marietta St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.774368, -84.404747),
('189', 'NARA Substation Control House', '665 Northside Dr', 'http://maps.gatech.edu/bldgimg/health.gif', 33.772282, -84.407303),
('190', 'North Avenue Apartments South Parking Deck', '120 North Ave', 'http://maps.gatech.edu/bldgimg/health.gif', 33.768639, -84.391335),
('191', 'North Avenue Apartments', '120 North Ave', 'http://maps.gatech.edu/bldgimg/health.gif', 33.770054, -84.391396),
('191A', 'North Avenue Dining Hall', '', 'http://maps.gatech.edu/bldgimg/ceismc.gif', 33.771091, -84.391617),
('196', 'Mewborn, Shirley Clements Softball Stadium', '935 Fowler St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.779335, -84.393295),
('198', 'Academy of Medicine', '875 W Ptree', 'http://maps.gatech.edu/bldgimg/health.gif', 33.778355, -84.386703),
('199', 'Carbon-Neutral Energy Solutions Laboratory', '495 Tech Way Nw', 'http://maps.gatech.edu/bldgimg/health.gif', 33.770916, -84.401772),
('200', 'Brock, Mary R. & John F. Football Practice Facility', '237 Cherry St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.778851, -84.39492),
('201', 'Challenge Course Pavilion', '816 Ferst Dr', 'http://maps.gatech.edu/bldgimg/health.gif', 33.778545, -84.402344),
('203', 'Byers Tennis Complex', '960 Fowler St', 'http://maps.gatech.edu/bldgimg/health.gif', 33.781109, -84.393929),
('300', 'ALPHA EPSILON PI', '714 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/aep.gif', 33.77409, -84.392342),
('302', 'ALPHA TAU OMEGA', '205 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/ato.gif', 33.776173, -84.394073),
('303', 'BETA THETA PI', '764 FOWLER ST NW', 'http://maps.gatech.edu/bldgimg/btp.gif', 33.775547, -84.394348),
('304', 'CHI PHI', '720 FOWLER ST NW', 'http://maps.gatech.edu/bldgimg/chiphi.gif', 33.774361, -84.394081),
('305', 'CHI PSI', '150 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/chipsi.gif', 33.775219, -84.392494),
('307', 'DELTA SIGMA PHI', '', 'http://maps.gatech.edu/bldgimg/dsphi.gif', 33.775833, -84.392555),
('308', 'DELTA TAU DELTA', '227 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/dtd.gif', 33.775925, -84.394768),
('309', 'DELTA UPSILON', '154 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/du.gif', 33.776733, -84.392265),
('310', 'KAPPA ALPHA', '801 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/ka-house.gif', 33.776516, -84.391823),
('311', 'KAPPA SIGMA', '182 SIXTH ST NW', 'http://maps.gatech.edu/bldgimg/ks.gif', 33.77795, -84.393311),
('312', 'LAMBDA CHI ALPHA', '792 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/lca.gif', 33.776314, -84.392265),
('313', 'ALPHA PHI', '', 'http://maps.gatech.edu/bldgimg/ceismc.gif', 33.777115, -84.392822),
('314', 'PHI DELTA THETA', '734 FOWLER ST NW', 'http://maps.gatech.edu/bldgimg/pdt.gif', 33.774639, -84.39418),
('315', 'PHI GAMMA DELTA', '841 FOWLER ST NW', 'http://maps.gatech.edu/bldgimg/figi.gif', 33.777657, -84.393356),
('316', 'PHI KAPPA SIGMA', '783 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/pks.gif', 33.7761, -84.39183),
('317', 'PHI KAPPA TAU', '175 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/pktau.gif', 33.776035, -84.393036),
('318', 'PHI KAPPA THETA', '800 FOWLER ST NW', 'http://maps.gatech.edu/bldgimg/pkt.gif', 33.776672, -84.393829),
('319', 'PHI SIGMA KAPPA', '825 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/psk.gif', 33.777142, -84.391899),
('320', 'PI KAPPA ALPHA', '260 FERST DR NW', 'http://maps.gatech.edu/bldgimg/pka.gif', 33.776749, -84.395248),
('321', 'PSI UPSILON', '831 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/psiu.gif', 33.777557, -84.391815),
('322', 'ALPHA XI DELTA', '847 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/psiu.gif', 33.777863, -84.39183),
('323', 'SIGMA ALPHA EPSILON', '221 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/sae.gif', 33.776047, -84.394501),
('324', 'SIGMA CHI', '770 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/schi.gif', 33.775623, -84.392242),
('325', 'SIGMA NU', '750 FOWLER ST NW', 'http://maps.gatech.edu/bldgimg/sn.gif', 33.775082, -84.394241),
('326', 'SIGMA PHI EPSILON', '190 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/sigep.gif', 33.776718, -84.393364),
('327', 'TAU KAPPA EPSILON', '159 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/tke.gif', 33.777122, -84.392365),
('328', 'THETA CHI', '840 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/tc.gif', 33.777592, -84.392326),
('329A', 'THETA XI', '777 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/tx.gif', 33.775814, -84.391701),
('331', 'ALPHA CHI OMEGA', '741 BRITTAIN DR NW', 'http://maps.gatech.edu/bldgimg/alphachiomega.gif', 33.774906, -84.392906),
('332', 'CHRISTIAN CAMPUS FELLOWSHIP', '767 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.775608, -84.391708),
('333', 'ALPHA GAMMA DELTA', '177 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/agd.gif', 33.777149, -84.393051),
('334', 'ALPHA DELTI PI', '729 BRITTAIN DR NW', 'http://maps.gatech.edu/bldgimg/adp.gif', 33.774513, -84.39283),
('335', 'DELTA CHI', '170 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/adp.gif', 33.776711, -84.392891),
('336', 'PI KAPPH PHI', '220 FERST DR NW', 'http://maps.gatech.edu/bldgimg/pikappaphi.gif', 33.776707, -84.394295),
('337', 'ALPHA DELTA CHI', '162 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/deltachi.gif', 33.775394, -84.3927),
('338', 'ZETA TAU ALPHA', '189 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/zta.gif', 33.777161, -84.393364),
('339', 'BAPTIST COLLEGIATE MINISTRY', '740 TECHWOOD DR NW', 'http://maps.gatech.edu/bldgimg/bsu.gif', 33.774769, -84.392242),
('340', 'COUCH PARK', '814 FERST DRIVE', 'http://maps.gatech.edu/bldgimg/burger.gif', 33.777649, -84.403053),
('341', 'CATHOLIC CENTER', '172 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/catholic.gif', 33.775448, -84.392982),
('342', 'GEORGE GRIFFIN TRACK', '930 FOWLER STREET', 'http://maps.gatech.edu/bldgimg/griftrk.gif', 33.779694, -84.394814),
('343', 'LUTHERAN CENTER', '182 FIFTH ST NW', 'http://maps.gatech.edu/bldgimg/luth.gif', 33.776703, -84.39312),
('344', 'WESLEY FOUNDATION', '189 FOURTH ST NW', 'http://maps.gatech.edu/bldgimg/wesley.gif', 33.776112, -84.393326),
('345', 'VERNON D. AND HOWARD D. CRAWFORD POOL', '', 'http://maps.gatech.edu/bldgimg/crawford.gif', 33.775112, -84.40387),
('346', 'WESTMINSTER CHRISTIAN FELLOWSHIP', '724 TECHWOOD DR', 'http://maps.gatech.edu/bldgimg/westcf.gif', 33.77446, -84.392296),
('347', 'ALEXANDER ROSE BOWL FIELD', '237 CHERRY STREET', 'http://maps.gatech.edu/bldgimg/rosebowl.gif', 33.778816, -84.394203),
('348', 'E. ROE STAMPS FIELD', '0', 'http://maps.gatech.edu/bldgimg/sacfields.gif', 33.776802, -84.403885),
('349', 'ALUMNI PARK', 'SIXTH STREET', 'http://maps.gatech.edu/bldgimg/alumnipark.gif', 33.776955, -84.404892),
('350', 'KESSLER CAMPANILE', 'FERST DRIVE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.774292, -84.398201),
('351', 'AMPHITHEATER', 'FERST DRIVE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.775143, -84.398743),
('352', 'HARRISON SQUARE', '675 CHERRY STREET', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.772957, -84.395302),
('353', 'CALLAWAY PLAZA', '154 BOBBY DODD WAY', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.773808, -84.392914),
('354', 'PAUL MAYER MEMORIAL GARDENS', '684 CHERRY STREET', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.773415, -84.395706),
('355', 'GRANT FIELD', '157 NORTH AVENUE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.772373, -84.392998),
('358', 'TECH GREEN', '725 ATLANTIC DRIVE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.774689, -84.397331),
('359', 'TECH WALKWAY', '725 ATLANTIC DRIVE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.773972, -84.397079),
('362', 'PHI MU', '240 FIFTH ST', 'http://maps.gatech.edu/bldgimg/ceismc.gif', 33.776726, -84.394836),
('366', 'AQUITY BRAND PLAZA', '800 W. PEACHTREE STREET', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.776535, -84.38752),
('367', 'CHALLENGE COURSE', '816 FERST DRIVE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.778393, -84.401741),
('370', 'FRED L. "BUD" SUDDATH COURTYARD', '315 FERST DRIVE', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.778862, -84.39756),
('374', 'ALEXANDER MEMORIAL COURTYARD', '965 FOWLER STREET', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.780258, -84.393242),
('379', 'LECRAW PLAZA', '266 FOURTH STREET', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.774563, -84.396736),
('380', 'GT GOLF PRACTICE FACILITY', '', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.787357, -84.403419),
('385', 'JOHNNY GRESHAM PLAZA BRIDGE', 'FIFTH STREET', 'http://maps.gatech.edu/bldgimg/shaft.gif', 33.776875, -84.390991),
('720', 'Heffernan, Paul H. House', '166 Fifth Street', 'http://maps.gatech.edu/bldgimg/heff.gif', 33.776676, -84.392654),
('780', 'Technology Enterprise Park II', '380A North Ave', 'http://maps.gatech.edu/bldgimg/heff.gif', 33.769485, -84.399948),
('790', 'Centennial Research Building', '400 Tenth Street', 'http://maps.gatech.edu/bldgimg/crb.gif', 33.781002, -84.400452),
('791', 'Landon, R. Kirk Learning Center', '1015 Tumlin St', 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.782467, -84.400284),
('826', '756 West Peachtreet Street', '756 W Peachtree', 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.775234, -84.387611),
('850', '575 Fourteenth St', '575 14th Street', 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.78677, -84.406197),
('854', 'CEISMC', '866 W PEACHTREE NW', 'http://maps.gatech.edu/bldgimg/ceismc.gif', 33.775669, -84.389084);

-- --------------------------------------------------------

--
-- Table structure for table `locations_zoomin`
--

CREATE TABLE IF NOT EXISTS `locations_zoomin` (
  `LID_2` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Zoomed in location ID',
  `LID_1` int(10) unsigned NOT NULL COMMENT 'Zoomed out location ID',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `photocount` int(11) NOT NULL COMMENT 'Photo count',
  PRIMARY KEY (`LID_2`),
  KEY `LID_1` (`LID_1`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Info about locations when zoomed in' AUTO_INCREMENT=115 ;

--
-- Dumping data for table `locations_zoomin`
--

INSERT INTO `locations_zoomin` (`LID_2`, `LID_1`, `latitude`, `longitude`, `photocount`) VALUES
(1, 1, 33.775429, -84.4012832, 71),
(2, 1, 33.7754714, -84.4013838, 73),
(3, 1, 33.775299, -84.401443, 0),
(4, 1, 33.775376, -84.4013752, 57),
(5, 1, 33.7755786, -84.4012894, 68),
(6, 1, 33.7754852, -84.4011488, 17),
(7, 1, 33.7753042, -84.4013698, 74),
(8, 2, 33.7789186, -84.3949892, 93),
(9, 2, 33.7788068, -84.3951192, 80),
(10, 2, 33.7789682, -84.3950846, 41),
(11, 2, 33.7786874, -84.3949512, 19),
(12, 2, 33.7789896, -84.3947314, 39),
(13, 2, 33.7787186, -84.3949742, 67),
(14, 2, 33.7789166, -84.3949422, 64),
(15, 2, 33.7789576, -84.3947514, 43),
(16, 3, 33.7825352, -84.4004636, 91),
(17, 3, 33.782445, -84.4003076, 21),
(18, 3, 33.782314, -84.4001546, 18),
(19, 3, 33.7825398, -84.4002106, 83),
(20, 3, 33.7826412, -84.4003246, 64),
(21, 3, 33.7823562, -84.4004, 33),
(22, 3, 33.7826262, -84.400169, 73),
(23, 4, 33.7787404, -84.4038882, 42),
(24, 4, 33.7788956, -84.4040524, 59),
(25, 4, 33.778755, -84.403907, 3),
(26, 4, 33.7787044, -84.4040446, 14),
(27, 4, 33.778773, -84.4038236, 44),
(28, 4, 33.7789876, -84.4039278, 57),
(29, 5, 33.7728346, -84.3911046, 50),
(30, 5, 33.7726792, -84.39095, 87),
(31, 5, 33.7726438, -84.390932, 21),
(32, 5, 33.7729298, -84.39092, 57),
(33, 5, 33.7728112, -84.3909666, 91),
(34, 5, 33.7728234, -84.3909062, 37),
(35, 5, 33.7725866, -84.3909752, 68),
(36, 5, 33.7726174, -84.391101, 36),
(37, 5, 33.7728998, -84.3911278, 11),
(38, 5, 33.7726816, -84.3910062, 10),
(39, 6, 33.7733284, -84.3909754, 86),
(40, 6, 33.7735292, -84.3908872, 4),
(41, 6, 33.7735302, -84.3910594, 9),
(42, 6, 33.773494, -84.391041, 93),
(43, 6, 33.7734534, -84.3910736, 75),
(44, 6, 33.7735032, -84.3911664, 62),
(45, 6, 33.773495, -84.3911052, 4),
(46, 6, 33.7733368, -84.391141, 52),
(47, 6, 33.7733316, -84.3909448, 9),
(48, 6, 33.7735134, -84.3907992, 92),
(49, 7, 33.775438, -84.3917478, 16),
(50, 7, 33.7757924, -84.3917956, 9),
(51, 7, 33.775635, -84.3917708, 39),
(52, 7, 33.7757104, -84.391728, 37),
(53, 7, 33.7755264, -84.391853, 26),
(54, 7, 33.7755244, -84.3917516, 4),
(55, 7, 33.7755506, -84.3915112, 22),
(56, 8, 33.773531, -84.3922002, 98),
(57, 8, 33.7737634, -84.3924518, 62),
(58, 8, 33.7737764, -84.392157, 81),
(59, 8, 33.7738154, -84.3924246, 4),
(60, 8, 33.7737762, -84.392377, 78),
(61, 9, 33.7803586, -84.3921026, 24),
(62, 9, 33.780107, -84.3920376, 31),
(63, 9, 33.7802794, -84.3921586, 51),
(64, 9, 33.780346, -84.3921942, 86),
(65, 9, 33.7804344, -84.3923278, 70),
(66, 9, 33.7800604, -84.3922428, 98),
(67, 9, 33.7801688, -84.3920484, 59),
(68, 9, 33.7801674, -84.39234, 69),
(69, 10, 33.7768986, -84.3967964, 92),
(70, 10, 33.7769024, -84.3970454, 35),
(71, 10, 33.776818, -84.3970548, 63),
(72, 10, 33.776872, -84.3970256, 56),
(73, 10, 33.7765174, -84.3970044, 67),
(74, 11, 33.7815588, -84.4027562, 40),
(75, 11, 33.781818, -84.4031016, 35),
(76, 11, 33.7818806, -84.40284, 70),
(77, 11, 33.7815536, -84.403061, 28),
(78, 11, 33.7818978, -84.4028054, 31),
(79, 11, 33.7815586, -84.4030588, 21),
(80, 12, 33.7801776, -84.4021588, 59),
(81, 12, 33.7801336, -84.4019456, 42),
(82, 12, 33.7801708, -84.4019162, 100),
(83, 12, 33.7801716, -84.4019142, 80),
(84, 12, 33.7802464, -84.4022164, 4),
(85, 12, 33.780158, -84.4019924, 75),
(86, 12, 33.7801908, -84.4021918, 75),
(87, 12, 33.780214, -84.4019144, 83),
(88, 13, 33.7809964, -84.40645, 47),
(89, 13, 33.7810924, -84.406758, 43),
(90, 13, 33.781105, -84.4064986, 58),
(91, 13, 33.7810274, -84.4066122, 35),
(92, 13, 33.7812936, -84.4065396, 82),
(93, 13, 33.7812052, -84.406803, 3),
(94, 14, 33.775698, -84.3985254, 3),
(95, 14, 33.7754776, -84.3985146, 59),
(96, 14, 33.7757808, -84.3985134, 42),
(97, 14, 33.775785, -84.3985174, 64),
(98, 14, 33.7756902, -84.3984572, 16),
(99, 14, 33.7757512, -84.3981512, 26),
(100, 14, 33.7755216, -84.3984194, 14),
(101, 15, 33.7804654, -84.4016598, 36),
(102, 15, 33.7803254, -84.4013934, 91),
(103, 15, 33.7804172, -84.4015142, 77),
(104, 15, 33.780246, -84.4014396, 66),
(105, 15, 33.7804116, -84.401514, 24),
(106, 15, 33.780181, -84.4015258, 0),
(107, 15, 33.7805528, -84.4013804, 2),
(108, 15, 33.7804486, -84.4015232, 79),
(109, 15, 33.7801572, -84.401509, 4),
(110, 15, 33.7803018, -84.4015238, 57),
(111, 15, 33.7802426, -84.4013074, 100),
(112, 15, 33.7803018, -84.401658, 62),
(113, 15, 33.7804964, -84.4012972, 23),
(114, 15, 33.7803044, -84.4013258, 93);

-- --------------------------------------------------------

--
-- Table structure for table `locations_zoomout`
--

CREATE TABLE IF NOT EXISTS `locations_zoomout` (
  `LID_1` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index of zoomed out locations',
  `latitude` double NOT NULL COMMENT 'Latitude of location',
  `longitude` double NOT NULL COMMENT 'Longitude of location',
  `photocount` int(11) NOT NULL COMMENT 'Number of photos at this location',
  PRIMARY KEY (`LID_1`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='The high level location information' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `locations_zoomout`
--

INSERT INTO `locations_zoomout` (`LID_1`, `latitude`, `longitude`, `photocount`) VALUES
(1, 33.775402, -84.401344, 360),
(2, 33.778851, -84.39492, 446),
(3, 33.782467, -84.400284, 383),
(4, 33.778854, -84.403984, 219),
(5, 33.772736, -84.391045, 468),
(6, 33.773396, -84.390999, 486),
(7, 33.775608, -84.391708, 153),
(8, 33.77367, -84.392258, 323),
(9, 33.780251, -84.39222, 488),
(10, 33.776707, -84.396889, 313),
(11, 33.781715, -84.402954, 225),
(12, 33.780083, -84.402023, 518),
(13, 33.781143, -84.406647, 268),
(14, 33.775616, -84.398338, 224),
(15, 33.780357, -84.401474, 714);

-- --------------------------------------------------------

--
-- Table structure for table `location_photo_link`
--

CREATE TABLE IF NOT EXISTS `location_photo_link` (
  `LID_1` int(10) unsigned NOT NULL,
  `LID_2` int(10) unsigned NOT NULL,
  `PH_ID` int(10) unsigned NOT NULL,
  KEY `LID_1` (`LID_1`),
  KEY `LID_2` (`LID_2`),
  KEY `PH_ID` (`PH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Links photos to a zoomed location';

--
-- Dumping data for table `location_photo_link`
--

INSERT INTO `location_photo_link` (`LID_1`, `LID_2`, `PH_ID`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(2, 8, 8),
(2, 9, 9),
(2, 10, 10),
(2, 11, 11),
(2, 12, 12),
(2, 13, 13),
(2, 14, 14),
(2, 15, 15),
(3, 16, 16),
(3, 17, 17),
(3, 18, 18),
(3, 19, 19),
(3, 20, 20),
(3, 21, 21),
(3, 22, 22),
(4, 23, 23),
(4, 24, 24),
(4, 25, 25),
(4, 26, 26),
(4, 27, 27),
(4, 28, 28),
(5, 29, 29),
(5, 30, 30),
(5, 31, 31),
(5, 32, 32),
(5, 33, 33),
(5, 34, 34),
(5, 35, 35),
(5, 36, 36),
(5, 37, 37),
(5, 38, 38),
(6, 39, 39),
(6, 40, 40),
(6, 41, 41),
(6, 42, 42),
(6, 43, 43),
(6, 44, 44),
(6, 45, 45),
(6, 46, 46),
(6, 47, 47),
(6, 48, 48),
(7, 49, 49),
(7, 50, 50),
(7, 51, 51),
(7, 52, 52),
(7, 53, 53),
(7, 54, 54),
(7, 55, 55),
(8, 56, 56),
(8, 57, 57),
(8, 58, 58),
(8, 59, 59),
(8, 60, 60),
(9, 61, 61),
(9, 62, 62),
(9, 63, 63),
(9, 64, 64),
(9, 65, 65),
(9, 66, 66),
(9, 67, 67),
(9, 68, 68),
(10, 69, 69),
(10, 70, 70),
(10, 71, 71),
(10, 72, 72),
(10, 73, 73),
(11, 74, 74),
(11, 75, 75),
(11, 76, 76),
(11, 77, 77),
(11, 78, 78),
(11, 79, 79),
(12, 80, 80),
(12, 81, 81),
(12, 82, 82),
(12, 83, 83),
(12, 84, 84),
(12, 85, 85),
(12, 86, 86),
(12, 87, 87),
(13, 88, 88),
(13, 89, 89),
(13, 90, 90),
(13, 91, 91),
(13, 92, 92),
(13, 93, 93),
(14, 94, 94),
(14, 95, 95),
(14, 96, 96),
(14, 97, 97),
(14, 98, 98),
(14, 99, 99),
(14, 100, 100),
(15, 101, 101),
(15, 102, 102),
(15, 103, 103),
(15, 104, 104),
(15, 105, 105),
(15, 106, 106),
(15, 107, 107),
(15, 108, 108),
(15, 109, 109),
(15, 110, 110),
(15, 111, 111),
(15, 112, 112),
(15, 113, 113),
(15, 114, 114);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `PH_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Photo ID',
  `url` varchar(4096) COLLATE ascii_bin NOT NULL COMMENT 'URL of the image',
  `latitude` double NOT NULL COMMENT 'latitude',
  `longitude` double NOT NULL COMMENT 'longitude',
  `altitude` double DEFAULT NULL COMMENT 'altitude in feet',
  `direction` double unsigned DEFAULT NULL COMMENT 'Direction of the photo in degrees',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp taken',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0',
  `UID` int(11) unsigned DEFAULT NULL COMMENT 'User associated with the photo',
  PRIMARY KEY (`PH_ID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Photo info' AUTO_INCREMENT=115 ;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`PH_ID`, `url`, `latitude`, `longitude`, `altitude`, `direction`, `timestamp`, `popularity`, `UID`) VALUES
(1, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.775429, -84.4012832, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(2, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.7754714, -84.4013838, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(3, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.775299, -84.401443, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(4, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.775376, -84.4013752, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(5, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.7755786, -84.4012894, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(6, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.7754852, -84.4011488, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(7, 'http://maps.gatech.edu/bldgimg/ic.gif', 33.7753042, -84.4013698, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(8, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7789186, -84.3949892, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(9, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7788068, -84.3951192, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(10, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7789682, -84.3950846, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(11, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7786874, -84.3949512, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(12, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7789896, -84.3947314, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(13, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7787186, -84.3949742, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(14, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7789166, -84.3949422, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(15, 'http://maps.gatech.edu/bldgimg/health.gif', 33.7789576, -84.3947514, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(16, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.7825352, -84.4004636, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(17, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.782445, -84.4003076, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(18, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.782314, -84.4001546, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(19, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.7825398, -84.4002106, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(20, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.7826412, -84.4003246, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(21, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.7823562, -84.4004, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(22, 'http://maps.gatech.edu/bldgimg/childcare.gif', 33.7826262, -84.400169, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(23, 'http://maps.gatech.edu/bldgimg/comm.gif', 33.7787404, -84.4038882, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(24, 'http://maps.gatech.edu/bldgimg/comm.gif', 33.7788956, -84.4040524, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(25, 'http://maps.gatech.edu/bldgimg/comm.gif', 33.778755, -84.403907, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(26, 'http://maps.gatech.edu/bldgimg/comm.gif', 33.7787044, -84.4040446, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(27, 'http://maps.gatech.edu/bldgimg/comm.gif', 33.778773, -84.4038236, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(28, 'http://maps.gatech.edu/bldgimg/comm.gif', 33.7789876, -84.4039278, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(29, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7728346, -84.3911046, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(30, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7726792, -84.39095, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(31, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7726438, -84.390932, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(32, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7729298, -84.39092, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(33, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7728112, -84.3909666, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(34, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7728234, -84.3909062, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(35, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7725866, -84.3909752, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(36, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7726174, -84.391101, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(37, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7728998, -84.3911278, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(38, 'http://maps.gatech.edu/bldgimg/harrison.gif', 33.7726816, -84.3910062, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(39, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7733284, -84.3909754, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(40, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7735292, -84.3908872, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(41, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7735302, -84.3910594, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(42, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.773494, -84.391041, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(43, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7734534, -84.3910736, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(44, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7735032, -84.3911664, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(45, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.773495, -84.3911052, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(46, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7733368, -84.391141, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(47, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7733316, -84.3909448, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(48, 'http://maps.gatech.edu/bldgimg/towers.gif', 33.7735134, -84.3907992, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(49, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.775438, -84.3917478, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(50, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.7757924, -84.3917956, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(51, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.775635, -84.3917708, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(52, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.7757104, -84.391728, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(53, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.7755264, -84.391853, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(54, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.7755244, -84.3917516, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(55, 'http://maps.gatech.edu/bldgimg/ccf.gif', 33.7755506, -84.3915112, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(56, 'http://maps.gatech.edu/bldgimg/atheltic.gif', 33.773531, -84.3922002, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(57, 'http://maps.gatech.edu/bldgimg/atheltic.gif', 33.7737634, -84.3924518, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(58, 'http://maps.gatech.edu/bldgimg/atheltic.gif', 33.7737764, -84.392157, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(59, 'http://maps.gatech.edu/bldgimg/atheltic.gif', 33.7738154, -84.3924246, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(60, 'http://maps.gatech.edu/bldgimg/atheltic.gif', 33.7737762, -84.392377, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(61, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.7803586, -84.3921026, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(62, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.780107, -84.3920376, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(63, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.7802794, -84.3921586, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(64, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.780346, -84.3921942, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(65, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.7804344, -84.3923278, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(66, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.7800604, -84.3922428, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(67, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.7801688, -84.3920484, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(68, 'http://maps.gatech.edu/bldgimg/luck.gif', 33.7801674, -84.39234, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(69, 'http://maps.gatech.edu/bldgimg/buildcon.gif', 33.7768986, -84.3967964, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(70, 'http://maps.gatech.edu/bldgimg/buildcon.gif', 33.7769024, -84.3970454, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(71, 'http://maps.gatech.edu/bldgimg/buildcon.gif', 33.776818, -84.3970548, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(72, 'http://maps.gatech.edu/bldgimg/buildcon.gif', 33.776872, -84.3970256, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(73, 'http://maps.gatech.edu/bldgimg/buildcon.gif', 33.7765174, -84.3970044, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(74, 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.7815588, -84.4027562, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(75, 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.781818, -84.4031016, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(76, 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.7818806, -84.40284, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(77, 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.7815536, -84.403061, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(78, 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.7818978, -84.4028054, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(79, 'http://maps.gatech.edu/bldgimg/awarehome.gif', 33.7815586, -84.4030588, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(80, 'http://maps.gatech.edu/bldgimg/center.gif', 33.7801776, -84.4021588, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(81, 'http://maps.gatech.edu/bldgimg/center.gif', 33.7801336, -84.4019456, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(82, 'http://maps.gatech.edu/bldgimg/center.gif', 33.7801708, -84.4019162, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(83, 'http://maps.gatech.edu/bldgimg/center.gif', 33.7801716, -84.4019142, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(84, 'http://maps.gatech.edu/bldgimg/center.gif', 33.7802464, -84.4022164, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(85, 'http://maps.gatech.edu/bldgimg/center.gif', 33.780158, -84.4019924, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(86, 'http://maps.gatech.edu/bldgimg/center.gif', 33.7801908, -84.4021918, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(87, 'http://maps.gatech.edu/bldgimg/center.gif', 33.780214, -84.4019144, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(88, 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.7809964, -84.40645, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(89, 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.7810924, -84.406758, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(90, 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.781105, -84.4064986, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(91, 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.7810274, -84.4066122, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(92, 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.7812936, -84.4065396, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(93, 'http://maps.gatech.edu/bldgimg/sreb.gif', 33.7812052, -84.406803, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(94, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.775698, -84.3985254, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(95, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.7754776, -84.3985146, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(96, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.7757808, -84.3985134, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(97, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.775785, -84.3985174, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(98, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.7756902, -84.3984572, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(99, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.7757512, -84.3981512, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(100, 'http://maps.gatech.edu/bldgimg/bunger.gif', 33.7755216, -84.3984194, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(101, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7804654, -84.4016598, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(102, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7803254, -84.4013934, NULL, NULL, '0000-00-00 00:00:00', 0, 5),
(103, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7804172, -84.4015142, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(104, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.780246, -84.4014396, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(105, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7804116, -84.401514, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(106, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.780181, -84.4015258, NULL, NULL, '0000-00-00 00:00:00', 0, 4),
(107, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7805528, -84.4013804, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(108, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7804486, -84.4015232, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(109, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7801572, -84.401509, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(110, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7803018, -84.4015238, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(111, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7802426, -84.4013074, NULL, NULL, '0000-00-00 00:00:00', 0, 1),
(112, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7803018, -84.401658, NULL, NULL, '0000-00-00 00:00:00', 0, 2),
(113, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7804964, -84.4012972, NULL, NULL, '0000-00-00 00:00:00', 0, 3),
(114, 'http://maps.gatech.edu/bldgimg/atdn.gif', 33.7803044, -84.4013258, NULL, NULL, '0000-00-00 00:00:00', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `photo_tag_link`
--

CREATE TABLE IF NOT EXISTS `photo_tag_link` (
  `PH_ID` int(11) unsigned NOT NULL,
  `TAG_ID` int(11) unsigned NOT NULL,
  KEY `PH_ID` (`PH_ID`),
  KEY `TAG_ID` (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Links photos to tags';

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `TAG_ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID of tag',
  `text` varchar(255) COLLATE ascii_bin NOT NULL COMMENT 'Tag Text',
  PRIMARY KEY (`TAG_ID`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Tags for photos' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`TAG_ID`, `text`) VALUES
(2, 'Building'),
(1, 'Klaus'),
(7, 'Trees'),
(33, 'great');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index of user. Used in other tables',
  `username` varchar(255) COLLATE ascii_bin NOT NULL COMMENT 'Username, as per GT login',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Storage of username to UID mappings' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `username`) VALUES
(1, 'dlee399'),
(2, 'gpburdell'),
(3, 'ronaldmcdonald'),
(4, 'oldmacdonald'),
(5, 'hadafarm');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `WID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `UID` int(11) unsigned NOT NULL COMMENT 'User that created this entry',
  `PH_ID` int(11) unsigned NOT NULL COMMENT 'Photo associated with that wishlist entry',
  PRIMARY KEY (`WID`),
  KEY `UID` (`UID`),
  KEY `PH_ID` (`PH_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Links users to wishlisted photos' AUTO_INCREMENT=9 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `locations_zoomin`
--
ALTER TABLE `locations_zoomin`
  ADD CONSTRAINT `locations_zoomin_ibfk_2` FOREIGN KEY (`LID_1`) REFERENCES `locations_zoomout` (`LID_1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `location_photo_link`
--
ALTER TABLE `location_photo_link`
  ADD CONSTRAINT `location_photo_link_ibfk_6` FOREIGN KEY (`PH_ID`) REFERENCES `photos` (`PH_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_photo_link_ibfk_4` FOREIGN KEY (`LID_1`) REFERENCES `locations_zoomout` (`LID_1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_photo_link_ibfk_5` FOREIGN KEY (`LID_2`) REFERENCES `locations_zoomin` (`LID_2`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`);

--
-- Constraints for table `photo_tag_link`
--
ALTER TABLE `photo_tag_link`
  ADD CONSTRAINT `photo_tag_link_ibfk_4` FOREIGN KEY (`TAG_ID`) REFERENCES `tags` (`TAG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `photo_tag_link_ibfk_3` FOREIGN KEY (`PH_ID`) REFERENCES `photos` (`PH_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_4` FOREIGN KEY (`PH_ID`) REFERENCES `photos` (`PH_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_3` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
