--
-- Tabellenstruktur für Tabelle `ic1_danke`
--

CREATE TABLE `ic1_danke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erstid` int(11) NOT NULL,
  `erstname` varchar(30) NOT NULL,
  `bedankerid` int(11) NOT NULL,
  `bedankername` varchar(30) NOT NULL,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='sag Danke by GeCk0 mod by FeTTsack'