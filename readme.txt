

Ilchbb Forenmod 1.2 f�r das IlchClan CMS:
"""""""""""""""""""""""""""""

Beschreibung:
-------------
ilchbb l�sst das Forum von IlchClan CMS
wie ein normales BB-Forum aussehen.
- Es gibt Buttons f�r PM, Email und Webpage.
- Eine Distanzierung unter jeden Beitrag.
- Usergruppen k�nnen Farblich angepasst werden.


Entwickelt
----------
� von IRVD alias Malte Wiatrowski
�� "http://www.facebook.com/cux.irvd"


� Grundger�st von Locutus aka Matthias Schlich und HeX
� Nutzt Teile von :
-- Benjamin Rau's "Forum mit Zusatzfunktionen (0.1)" 
-- der Petzfunktion von Mairu
-- Distanzierung von maretz.eu


Vorraussetzungen:
-------------
� Eine Vorraussetzng ist der die aktuelle Version vom BBCode Modul. Diese kann man bei mairu.ilch.de runterladen. 
Habe in selben Ordner wie die Readme eine Verkn�pfung hinzugef�gt die direkt zum Download f�hrt.


Downloadlink: http://mairu.ilch.de/index.php?downloads-show-34




Installation:
-------------
� Backup machen
� alle Dateien im Ordner upload, in ihrer Ordnerstrucktur hochladen



Bearbeitung der Userfaben:
---------------------------

Im include/includes/css/forum  Ordner befindet sich eine userfarben.css in dieser CSS Datei sind Befehle f�r Admin bis User, bennant nach Recht-9 bis Recht -1!

Recht-9 = Admin
Recht-8 = CoAdmin
usw.

Im Extra Ordner befindet sich noch eine Grafik Namens "Grundrechte" dort kann man genau erkennen welche CSS Klasse zu welchen Rang geh�rt.


Die Legende unten im Forum kann man bei Bedarf in folgenden Datein bearbeiten:

- include/templates/forum/show_forum.htm
- include/templates/forum/show_cat.htm
- include/templates/forum/showtopic.htm


Sonstige Infos:
-------------

� R�nge werden nicht �ber den Admin Bereich gesteuert!
Von Zeile 103 - 134 in der include/contents/forum/show_posts.php kann man die R�nge nach belieben ver�ndern.


Haftungsausschluss:
-------------------
Wir �bernehmen keine Haftung f�r Sch�den, die durch dieses Script entstehen.
Benutzung ausschlie�lich AUF EIGENE GEFAHR.


Fehler bitte im Forum von http://www.ilch.de posten!


---------------------

Malte Wiatrowski bekam von Matthias Schlich die Erlaubnis seine Modifikation zum Download anzubieten.