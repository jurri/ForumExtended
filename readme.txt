

Ilchbb Forenmod 1.6 für das IlchClan CMS:
"""""""""""""""""""""""""""""

Beschreibung:
-------------
ilchbb lässt das Forum von IlchClan CMS
wie ein normales BB-Forum aussehen.
- Es gibt Buttons für PM, Email und Webpage.
- Eine Distanzierung unter jeden Beitrag.
- Usergruppen können Farblich angepasst werden.
- Bedanken für eine Post möglich
- Bugfix bei der Moderation der Foren
- Foren werden der Übersichtlichkeit zusammengeklapt.
- bbcode und CKEditor zur auswahl.
- Forumumfrage erstellt und erweitert.
- Erweiterte Rechtevergabe im Adminbereich. (man kann gezielt nur einer Gruppe das Recht geben das Forum zu sehen oder mehreren verschiedenen.)



Entwickelt
----------
° Weiterentwicklung durch FeTTsack
	--> http://fettsack.de.vc

° von IRVD alias Malte Wiatrowski
	»» "http://www.facebook.com/cux.irvd"
° Grundgerüst von Locutus aka Matthias Schlich und HeX
° Nutzt Teile von :
-- Benjamin Rau's "Forum mit Zusatzfunktionen (0.1)" 
-- der Petzfunktion von Mairu
-- Distanzierung von maretz.eu


Vorraussetzungen:
-------------
° Eine Vorraussetzng ist der die aktuelle Version vom BBCode Modul. Diese kann man bei mairu.ilch.de runterladen. 
Habe in selben Ordner wie die Readme eine Verknüpfung hinzugefügt die direkt zum Download führt.


Downloadlink: http://mairu.ilch.de/index.php?downloads-show-34




Installation:
-------------
° Backup machen
° alle Dateien im Ordner upload, in ihrer Ordnerstrucktur hochladen
° Installation als Admin ausführen
	bsp: http://www.meine-hp.de/index.php?installation
° Ihr müsst noch in eurer design.htm die aktuelle jquery im header einbinden:
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>



Bearbeitung der Userfaben:
---------------------------

Im include/includes/css/forum  Ordner befindet sich eine userfarben.css in dieser CSS Datei sind Befehle für Admin bis User, bennant nach Recht-9 bis Recht -1!

Recht-9 = Admin
Recht-8 = CoAdmin
usw.

Im Extra Ordner befindet sich noch eine Grafik Namens "Grundrechte" dort kann man genau erkennen welche CSS Klasse zu welchen Rang gehört.


Die Legende unten im Forum kann man bei Bedarf in folgenden Datein bearbeiten:

- include/templates/forum/show_forum.htm
- include/templates/forum/show_cat.htm
- include/templates/forum/showtopic.htm


Sonstige Infos:
-------------

° Ränge werden nicht über den Admin Bereich gesteuert!
Von Zeile 103 - 134 in der include/contents/forum/show_posts.php kann man die Ränge nach belieben verändern.


Haftungsausschluss:
-------------------
Wir übernehmen keine Haftung für Schäden, die durch dieses Script entstehen.
Benutzung ausschließlich AUF EIGENE GEFAHR.


Fehler bitte im Forum von http://www.ilch.de posten!


---------------------

Malte Wiatrowski bekam von Matthias Schlich die Erlaubnis seine Modifikation zum Download anzubieten.
