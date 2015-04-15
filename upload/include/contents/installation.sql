-----------------------------------------------------------------------------------------
-- Tabellenstruktur für die Dankesfunktion
--
CREATE TABLE IF NOT EXISTS `prefix_danke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erstid` int(11) NOT NULL,
  `erstname` varchar(30) NOT NULL,
  `bedankerid` int(11) NOT NULL,
  `bedankername` varchar(30) NOT NULL,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='sag Danke by GeCk0';

-----------------------------------------------------------------------------------------
-- Tabellenstruktur für das erweiterte Recht.
--
CREATE TABLE IF NOT EXISTS `prefix_forumrecht` (
  `recht_pk` int(11) NOT NULL AUTO_INCREMENT,
  `recht_fkforum` int(11) NOT NULL,
  `recht_fkrecht` int(11) NOT NULL,
  `recht_bearbeiten` int(11) NOT NULL,
  PRIMARY KEY (`recht_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

ALTER TABLE `prefix_forums`
ADD COLUMN `erwrecht` tinyint(1) NOT NULL AFTER `besch`;

-----------------------------------------------------------------------------------------
-- Tabellenstruktur für die Votefunktion im Forum
--
CREATE TABLE IF NOT EXISTS prefix_posts_poll (
	`post_id` MEDIUMINT( 9 ) DEFAULT 0 NOT NULL ,
	`voters` TEXT NOT NULL ,
	`results` TEXT NOT NULL,
	`pp_pk` mediumint(11) DEFAULT null not null AUTO_INCREMENT,
	PRIMARY KEY (`pp_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Umfrage by Mairu';

-----------------------------------------------------------------------------------------
-- Tabellenstruktur für BBCode
--
CREATE TABLE IF NOT EXISTS `prefix_bbcode_badword` (
  `fnBadwordNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fcBadPatter` varchar(70) NOT NULL DEFAULT '',
  `fcBadReplace` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`fnBadwordNr`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `prefix_bbcode_badword` (`fcBadPatter`,`fcBadReplace`) VALUES ('Idiot', '*peep*');
INSERT INTO `prefix_bbcode_badword` (`fcBadPatter`,`fcBadReplace`) VALUES ('Arschloch', '*peep*');

DROP TABLE IF EXISTS `prefix_bbcode_buttons`;
CREATE TABLE IF NOT EXISTS `prefix_bbcode_buttons` (
  `fnButtonNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fnFormatB` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `fnFormatI` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatU` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatS` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatEmph` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatColor` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatSize` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatUrl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatUrlAuto` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatEmail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatLeft` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatCenter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatRight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatSmilies` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatList` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatKtext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatImg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatScreen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatVideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatPhp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatCss` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatHtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatCode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatQuote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatCountdown` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatFlash` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatBlock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fnFormatImgUpl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fnButtonNr`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `prefix_bbcode_buttons` (`fnButtonNr`, `fnFormatB`, `fnFormatI`, `fnFormatU`, `fnFormatS`, `fnFormatEmph`, `fnFormatColor`, `fnFormatSize`, `fnFormatUrl`, `fnFormatUrlAuto`, `fnFormatEmail`, `fnFormatLeft`, `fnFormatCenter`, `fnFormatRight`, `fnFormatBlock`, `fnFormatSmilies`, `fnFormatList`, `fnFormatKtext`, `fnFormatImg`, `fnFormatImgUpl`, `fnFormatScreen`, `fnFormatVideo`, `fnFormatPhp`, `fnFormatCss`, `fnFormatHtml`, `fnFormatCode`, `fnFormatQuote`, `fnFormatCountdown`) 
VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

DROP TABLE IF EXISTS `prefix_bbcode_config`;
CREATE TABLE `prefix_bbcode_config` (
  `fnConfigNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fnYoutubeBreite` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnYoutubeHoehe` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fcYoutubeHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  `fnGoogleBreite` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnGoogleHoehe` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fcGoogleHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  `fnMyvideoBreite` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnMyvideoHoehe` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fcMyvideoHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  `fnSizeMax` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `fnImgMaxBreite` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnImgMaxHoehe` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnScreenMaxBreite` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnScreenMaxHoehe` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnUrlMaxLaenge` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnWortMaxLaenge` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnFlashBreite` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fnFlashHoehe` smallint(3) unsigned NOT NULL DEFAULT '0',
  `fcFlashHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`fnConfigNr`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `prefix_bbcode_config` (`fnConfigNr`, `fnYoutubeBreite`, `fnYoutubeHoehe`, `fcYoutubeHintergrundfarbe`, `fnGoogleBreite`, `fnGoogleHoehe`, `fcGoogleHintergrundfarbe`, `fnMyvideoBreite`, `fnMyvideoHoehe`, `fcMyvideoHintergrundfarbe`, `fnSizeMax`, `fnImgMaxBreite`, `fnImgMaxHoehe`, `fnScreenMaxBreite`, `fnScreenMaxHoehe`, `fnUrlMaxLaenge`, `fnWortMaxLaenge`, `fnFlashBreite`, `fnFlashHoehe`, `fcFlashHintergrundfarbe`) 
VALUES (1, 425, 350, '#000000', 400, 326, '#ffffff', 470, 406, '#ffffff', 20, 500, 500, 150, 150, 60, 70, 400, 300, '#ffffff');

DROP TABLE IF EXISTS `prefix_bbcode_design`;
CREATE TABLE `prefix_bbcode_design` (
  `fnDesignNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fcQuoteRandFarbe` varchar(7) NOT NULL DEFAULT '',
  `fcQuoteTabelleBreite` varchar(7) NOT NULL DEFAULT '',
  `fcQuoteSchriftfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcQuoteHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcQuoteHintergrundfarbeIT` varchar(7) NOT NULL DEFAULT '',
  `fcQuoteSchriftformatIT` varchar(6) NOT NULL DEFAULT '',
  `fcQuoteSchriftfarbeIT` varchar(7) NOT NULL DEFAULT '',
  `fcBlockRandFarbe` varchar(7) NOT NULL DEFAULT '',
  `fcBlockTabelleBreite` varchar(7) NOT NULL DEFAULT '',
  `fcBlockSchriftfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcBlockHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcBlockHintergrundfarbeIT` varchar(7) NOT NULL DEFAULT '',
  `fcBlockSchriftfarbeIT` varchar(7) NOT NULL DEFAULT '',
  `fcKtextRandFarbe` varchar(7) NOT NULL DEFAULT '',
  `fcKtextTabelleBreite` varchar(7) NOT NULL DEFAULT '',
  `fcKtextRandFormat` varchar(6) NOT NULL DEFAULT '',
  `fcEmphHintergrundfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcEmphSchriftfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcCountdownRandFarbe` varchar(7) NOT NULL DEFAULT '',
  `fcCountdownTabelleBreite` varchar(7) NOT NULL DEFAULT '',
  `fcCountdownSchriftfarbe` varchar(7) NOT NULL DEFAULT '',
  `fcCountdownSchriftformat` varchar(7) NOT NULL DEFAULT '',
  `fnCountdownSchriftsize` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fnDesignNr`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `prefix_bbcode_design` (`fnDesignNr`, `fcQuoteRandFarbe`, `fcQuoteTabelleBreite`, `fcQuoteSchriftfarbe`, `fcQuoteHintergrundfarbe`, `fcQuoteHintergrundfarbeIT`, `fcQuoteSchriftformatIT`, `fcQuoteSchriftfarbeIT`, `fcBlockRandFarbe`, `fcBlockTabelleBreite`, `fcBlockSchriftfarbe`, `fcBlockHintergrundfarbe`, `fcBlockHintergrundfarbeIT`, `fcBlockSchriftfarbeIT`, `fcKtextRandFarbe`, `fcKtextTabelleBreite`, `fcKtextRandFormat`, `fcEmphHintergrundfarbe`, `fcEmphSchriftfarbe`, `fcCountdownRandFarbe`, `fcCountdownTabelleBreite`, `fcCountdownSchriftfarbe`, `fcCountdownSchriftformat`, `fnCountdownSchriftsize`) 
VALUES (1, '#f6e79d', '320', '#666666', '#f6e79d', '#faf7e8', 'italic', '#666666', '#f6e79d', '350', '#666666', '#f6e79d', '#faf7e8', '#FF0000', '#000000', '90%', 'dotted', '#ffd500', '#000000', '#FF0000', '90%', '#FF0000', 'bold', 10)



-----------------------------------------------------------------------------------------
-- Tabellenstruktur für die Modulerweiterung
--
INSERT INTO `prefix_modules` (`id` ,`url` ,`name` ,`gshow` ,`ashow` ,`fright`) 
VALUES (NULL , 'bbcode', 'BBCode 2.0', '1', '1', '0');