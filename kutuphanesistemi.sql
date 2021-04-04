-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 04 Nis 2021, 17:35:57
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kutuphanesistemi`
--

DELIMITER $$
--
-- Yordamlar
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDileKitapListele` (IN `_kitap_id` INT)  BEGIN
	SELECT *
    FROM kitap
    WHERE kitap_id=_kitap_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `IDileKitapSil` (`_kitap_id` INT)  BEGIN
	DELETE FROM kitap
    WHERE kitap_id=_kitap_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `IDileUyeListele` (`_uye_id` INT)  BEGIN
	SELECT *
    FROM uye
    WHERE uye_id=_uye_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `IDileUyeSil` (`_uye_id` INT)  BEGIN
	DELETE FROM uye
    WHERE uye_id=_uye_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KitapEkleGuncelle` (IN `_kitap_id` INT, IN `_kitap_ad` VARCHAR(50), IN `_kitap_basimyili` VARCHAR(50), IN `_kitap_yayinevi` VARCHAR(50))  BEGIN
	if _kitap_id=0 then
		insert into kitap(kitap_ad,kitap_basimyili,kitap_yayinevi)
		values (_kitap_ad,_kitap_basimyili,_kitap_yayinevi);
	else
		update kitap
        set
        kitap_ad=_kitap_ad,
        kitap_basimyili=_kitap_basimyili,
        kitap_yayinevi=_kitap_yayinevi
        WHERE kitap_id=_kitap_id;
	END if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TumKitaplariListele` ()  BEGIN
	SELECT *
    FROM kitap;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TumUyeleriListele` ()  BEGIN
	SELECT *
    FROM uye;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UyedenKitapAl` (`_uye_id` INT)  BEGIN
	update uye
    set
    uye_kitapid=null,
    uye_kitapaldigitarih=null
    where
    uye_id=_uye_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UyeEkleGuncelle` (IN `_uye_id` INT, IN `_uye_adsoyad` VARCHAR(50))  BEGIN
	if _uye_id=0 then
		insert into uye(uye_id,uye_adsoyad)
		values (_uye_id,_uye_adsoyad);
    else
		update uye
        set
        uye_adsoyad=_uye_adsoyad
		WHERE uye_id=_uye_id;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UyeyeKitapVer` (`_uye_id` INT, `_kitap_id` INT, `_date` VARCHAR(50))  BEGIN
	update uye
    set
    uye_kitapid=_kitap_id,
    uye_kitapaldigitarih=_date
    where
    uye_id=_uye_id;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_kullaniciadi` varchar(50) NOT NULL,
  `admin_sifre` varchar(50) NOT NULL,
  `admin_adsoyad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_kullaniciadi`, `admin_sifre`, `admin_adsoyad`) VALUES
(1, 'habiboi', '1234', 'Habip Şana'),
(2, 'oytun1', '1111', 'Berkay Oytun Yılmaz');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `kitap_id` int(11) NOT NULL,
  `kitap_ad` varchar(50) NOT NULL,
  `kitap_basimyili` varchar(50) NOT NULL,
  `kitap_yayinevi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`kitap_id`, `kitap_ad`, `kitap_basimyili`, `kitap_yayinevi`) VALUES
(2, 'Rüzgarın Adı', '2007', 'İthaki Yayınları'),
(5, 'Aşk ve Gurur', '2019', 'Can Yayınları'),
(6, 'Hayvan Çiftliği', '2015', 'Can Yayınları');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uye`
--

CREATE TABLE `uye` (
  `uye_id` int(11) NOT NULL,
  `uye_adsoyad` varchar(50) NOT NULL,
  `uye_kitapid` int(11) DEFAULT NULL,
  `uye_kitapaldigitarih` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `uye`
--

INSERT INTO `uye` (`uye_id`, `uye_adsoyad`, `uye_kitapid`, `uye_kitapaldigitarih`) VALUES
(1, 'Onur Okur', NULL, NULL),
(2, 'Sualp Ceylan', NULL, NULL),
(3, 'Mustafa Alpay Serin', NULL, NULL),
(4, 'Oğulcan Ateş', NULL, NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`kitap_id`);

--
-- Tablo için indeksler `uye`
--
ALTER TABLE `uye`
  ADD PRIMARY KEY (`uye_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `kitap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `uye`
--
ALTER TABLE `uye`
  MODIFY `uye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
