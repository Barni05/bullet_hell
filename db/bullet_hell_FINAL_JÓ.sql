-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jan 30. 12:14
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `bullet_hell`
--
CREATE DATABASE IF NOT EXISTS `bullet_hell` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bullet_hell`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `maps`
--

INSERT INTO `maps` (`id`, `name`, `file_name`, `description`, `music_pack_id`) VALUES
(1, 'Slaughterhouse', '', 'This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.', 3),
(2, 'Riot', '', 'Someone\'s had enough. That someone had a loud voice. This voice was used to destroy things. Now you\'ve had enough.', 1),
(3, 'Palace of the Setting Sun', '', 'I live by the sword, you die by my sword.', 2),
(100, 'Limitless', '', 'Every weapon deserves a chance to shine. Even if they are trash. But you never know.', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_assets`
--

CREATE TABLE `map_assets` (
  `asset_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map_weapons`
--

CREATE TABLE `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `map_weapons`
--

INSERT INTO `map_weapons` (`map_id`, `weapon_id`) VALUES
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `music_packs`
--

CREATE TABLE `music_packs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `music_packs`
--

INSERT INTO `music_packs` (`id`, `name`, `anthem`, `main_menu_theme1`, `main_menu_theme2`, `description`) VALUES
(1, 'Dusqk', 'relative path', 'relative path', 'relative path', 'Floaty, angelic voices and electric beats assist you in your fight with your opponent.\nby Dusqk'),
(2, 'CRT_HEAD1', 'relative path', 'relative path', 'relative path', 'Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head1'),
(3, 'CRT_HEAD2', 'night ops', 'electrosphere', 'mecha grey', 'Imagine a russian bloke on crack. This figure plays his favorite music while you disfigure your enemy.\nby crt_head2'),
(4, 'avest', 'avest', 'avest', 'avest', 'You are about to fight the most important battle of your life!'),
(5, 'Mute City', 'Mute City', 'Mute City', 'Mute City', 'Being the last one standing is not so easy. Knowing your opponent as well as yourself is where the victory lies.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `players`
--

CREATE TABLE `players` (
  `username` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `winrate` double NOT NULL,
  `all_games_played` int(11) DEFAULT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `most_used_music_id` int(11) DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL,
  `active_skin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `players`
--

INSERT INTO `players` (`username`, `points`, `winrate`, `all_games_played`, `kills`, `deaths`, `most_used_music_id`, `music_pack_id`, `active_skin_id`) VALUES
('batyu', 21, 45, 12, 7, 3, 1, 1, 1),
('batyuzo', 0, 0, NULL, 0, 0, NULL, NULL, 1),
('gembarnus', 0, 0, NULL, 0, 0, NULL, NULL, 1),
('gizmo', 0, 0, 0, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_login`
--

CREATE TABLE `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `player_login`
--

INSERT INTO `player_login` (`username`, `password`) VALUES
('batyu', 'batyucsakbatyu'),
('batyuzo', 'batyuzik'),
('gembarnus', 'gembarnus'),
('gizmo', 'gizmo');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skins`
--

CREATE TABLE `player_skins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `player_skins`
--

INSERT INTO `player_skins` (`id`, `name`, `file_name`, `description`) VALUES
(1, 'Knight', 'knight path', 'The most common soldier'),
(2, 'Rogue', 'rogue path', 'Beheaded his own master. Imagine what he can do to you...'),
(3, 'Samurai', 'samurai path', 'Bound by loyalty, but not by law. Beware!'),
(4, 'Entity', 'entity path', 'Zero identity, defined only by its boundaries.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `player_skin_inventory`
--

CREATE TABLE `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `player_skin_inventory`
--

INSERT INTO `player_skin_inventory` (`player_id`, `skin_id`) VALUES
('gembarnus', 1),
('gembarnus', 2),
('gembarnus', 3),
('gembarnus', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rarities`
--

CREATE TABLE `rarities` (
  `id` int(11) NOT NULL,
  `rarity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rarities`
--

INSERT INTO `rarities` (`id`, `rarity`) VALUES
(1, 'Common'),
(2, 'Rare'),
(3, 'Unique');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `weapons`
--

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `damage` int(11) NOT NULL,
  `fire_rate` float NOT NULL,
  `semi_auto` tinyint(1) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `projectile_speed` float DEFAULT NULL,
  `mag` int(11) DEFAULT NULL,
  `description` text DEFAULT 'A deadly weapon',
  `devinfo` text DEFAULT 'FIRE:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `weapons`
--

INSERT INTO `weapons` (`id`, `name`, `file_name`, `damage`, `fire_rate`, `semi_auto`, `rarity_id`, `projectile_speed`, `mag`, `description`, `devinfo`) VALUES
(11, 'Scythe', 'weapons/def_scythe_ink.png', 100, 1, 1, 3, NULL, NULL, 'A lethal and cool-looking weapon wielded by Death itself', 'FIRE: melee attack\nALTFIRE: take away enemy weapon\nUNEQUIP: default'),
(12, 'Nailgun', 'weapons/def_nailgun1.png', 20, 3, 2, 2, 0.8, 13, 'Safety instructions would suggest you NOT to pin coworkers to a wall...', 'FIRE: shoot (gravity)\nALTFIRE: -\nUNEQUIP: default'),
(13, 'Cleaver', 'weapons/def_cleaver_ink1.png', 70, 0.8, 1, 1, 0.4, NULL, 'Chop things up with this very nuanced instrument of destruction. Don\'t cut your finger.', 'FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),
(14, 'Chainsaw', 'weapons/def_chainsaw_ink1.png', 3, 20, 2, 2, NULL, 200, 'Ever heard of Mick Gordon? The Doom Slayer? Hell, maybe?', 'FIRE: rev, damage on\nALTFIRE: -\nUNEQUIP: default'),
(15, 'Taser', 'weapons/taser1.png', 50, 1, 1, 1, NULL, NULL, 'Some crackhead clunker cranked the crap out of this cruel (but previously non-lethal) critter.', 'FIRE: check triggerbox in front of muzzle\nALTFIRE: -\nUNEQUIP: default'),
(16, 'Knife', 'weapons/def_knife_ink.png', 50, 1.5, 3, 1, 0.4, NULL, 'If the glove don\'t fit, stop wearing them and continue stabbing', 'FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default'),
(21, 'The Power of Words', 'weapons/def_hatespeech.png', 10, 30, 2, 3, 343, 90, 'SPREAD AWARENESS IN A CONE', 'FIRE: check triggerbox in front of muzzle\nALFTIRE: -\nUNEQUIP: default'),
(22, 'Pistol', 'weapons/def_pistol1.png', 35, 3, 1, 1, 1, 12, '9 millimeters is a LOT.', 'FIRE: shoot particle\nALTFIRE: -\nUNEQUIP: default'),
(23, 'Shotgun', 'weapons/def_shotgun.png', 15, 0.75, 1, 2, 0.85, 7, 'If you get the general direction right, you\'ll have no problems with this one', 'FIRE: shoot particles(7)\nALTFIRE: -\nUNEQUIP: default'),
(24, 'Pressure!', 'no_photo.jpg', 7, 4, 1, 2, 0.85, 2, 'You already massacred a perfectly good metal tube, so everyone knows you have the resolve', 'FIRE: shoot particles(15)\nALTFIRE: -\nUNEQUIP: default'),
(31, 'Wrath of Nobunaga', 'no_photo.jpg', 400, 1, 1, 3, 0.8, 1, 'The legendary daimyo left you a present. He will smile upon you if you put it to good use!', 'FIRE: shoot particle (3 ricochet, every bounce halves damage)\nALTFIRE: -\nUNEQUIP: default'),
(32, 'Bow', 'no_photo.jpg', 70, 0.3, 1, 2, 0.6, 1, 'Ranged weapon against pointy sticks, who would win?', 'FIRE: shoot particle (gravity)\nALTFIRE: refill\nUNEQUIP: default'),
(33, 'Kunai', 'weapons/def_kunai_ink.png', 40, 1, 1, 1, 0.6, NULL, 'If your arms aren\'t long enough... damn that\'s a straight line...', 'FIRE: melee attack\nALTFIRE: throw\nUNEQUIP: default'),
(34, 'Dagger', 'no_photo.jpg', 50, 1.5, 3, 1, NULL, NULL, 'If all else fails...', 'FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),
(35, 'Katana', 'no_photo.jpg', 75, 1, 3, 2, NULL, NULL, 'Craftsmanship and lethality meet in your hands.', 'FIRE: melee attack\nALTFIRE: stab\nUNEQUIP: default'),
(36, 'Spear', 'no_photo.jpg', 50, 0.6, 3, 1, 0.4, NULL, 'Poke fun at the idiots trying to reach you with a knife', 'FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_pack_id` (`music_pack_id`);

--
-- A tábla indexei `map_assets`
--
ALTER TABLE `map_assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `map_id` (`map_id`);

--
-- A tábla indexei `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD PRIMARY KEY (`map_id`,`weapon_id`),
  ADD KEY `weapon_id` (`weapon_id`);

--
-- A tábla indexei `music_packs`
--
ALTER TABLE `music_packs`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`username`),
  ADD KEY `most_used_music_id` (`most_used_music_id`),
  ADD KEY `music_pack_id` (`music_pack_id`),
  ADD KEY `fk_players_player_skins` (`active_skin_id`);

--
-- A tábla indexei `player_login`
--
ALTER TABLE `player_login`
  ADD PRIMARY KEY (`username`);

--
-- A tábla indexei `player_skins`
--
ALTER TABLE `player_skins`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD PRIMARY KEY (`player_id`,`skin_id`),
  ADD KEY `skin_id` (`skin_id`);

--
-- A tábla indexei `rarities`
--
ALTER TABLE `rarities`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rarity_id` (`rarity_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT a táblához `map_assets`
--
ALTER TABLE `map_assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `music_packs`
--
ALTER TABLE `music_packs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `player_skins`
--
ALTER TABLE `player_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `rarities`
--
ALTER TABLE `rarities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `map_assets`
--
ALTER TABLE `map_assets`
  ADD CONSTRAINT `map_assets_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD CONSTRAINT `map_weapons_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `map_weapons_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `fk_players_player_skins` FOREIGN KEY (`active_skin_id`) REFERENCES `player_skins` (`id`),
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`most_used_music_id`) REFERENCES `music_packs` (`id`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`);

--
-- Megkötések a táblához `player_login`
--
ALTER TABLE `player_login`
  ADD CONSTRAINT `player_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD CONSTRAINT `player_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
