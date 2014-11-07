--
-- Tabellenstruktur für Tabelle `ic1_danke`
--

CREATE TABLE `prefix_danke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erstid` int(11) NOT NULL,
  `erstname` varchar(30) NOT NULL,
  `bedankerid` int(11) NOT NULL,
  `bedankername` varchar(30) NOT NULL,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='sag Danke by GeCk0';

CREATE TABLE `prefix_forumrecht` (
  `recht_pk` int(11) NOT NULL AUTO_INCREMENT,
  `recht_fkforum` int(11) NOT NULL,
  `recht_fkrecht` int(11) NOT NULL,
  `recht_bearbeiten` int(11) NOT NULL,
  PRIMARY KEY (`recht_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

ALTER TABLE `prefix_forums`
ADD COLUMN `erwrecht` tinyint(1) NOT NULL AFTER `besch`;