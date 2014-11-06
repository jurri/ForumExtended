<?php
defined ('main') or die ( 'no direct access' );
/* Funktions-Datei f�r das Danke-Modul
 * erstellt von GeCk0 -> http://gecko.ilch.de
 * Basierend auf ilch 1.1 o
 */
defined ('main') or die ( 'no direct access' );
$title = $allgAr['title'].' :: Danke :o)';
$hmenu = 'Danke';
$design = new design ( $title , $hmenu );
$design->header();

// Bei dem link der �bertragen wird, ist ein fake unm�glich !!! Auch wenn er ewig lang ist... wayne... !! :D
$get_pid 			= 	escape($menu->get(1), 'integer');	// Post-ID
$get_rand 			= 	escape($menu->get(2), 'integer');	// Random-ID
$get_tid 			= 	escape($menu->get(3), 'integer');	// Thread-ID
$get_erstid			= 	escape($menu->get(4), 'integer'); 	// ersteller der auch eine pn bekommt (uid)
$get_erstname		= 	get_n ($get_erstid);
$get_bedanker_id 	= 	escape($menu->get(5), 'integer'); 	// bedanker ID von dem die PN kommt
$get_bedanker_name 	= 	escape($menu->get(6), 'string'); 	// bedanker NAME von dem die PN kommt


// pr�fen ob variablen leer sind

if (empty($get_pid) or 
	empty($get_rand) or 
	empty($get_tid) or 
	empty($get_erstid) or 
	empty($get_bedanker_id) ){
		wd('index.php?forum-showposts-'.$get_tid.'#'.$get_pid, 'Ooops, da lief was schief. Versuche es bitte noch einmal', 3);
		unset($_SESSION['thx_rand']);
		$design->footer();
}
// Pr�fen ob dieser User sich f�r diesen post bereits bedankte
$check_pthx_qry = db_count_query("SELECT COUNT(id) FROM `prefix_danke` WHERE pid = ".$get_pid." AND bedankerid = ".$_SESSION['authid']."");
if ($check_pthx_qry >= 1) {
	wd('index.php?forum-showposts-'.$get_tid.'#'.$get_pid, 'Du hast dich bereits bei '.get_n($get_erstid).' f&uuml;r diesen Post bedankt', 3);
	unset($_SESSION['thx_rand']);
	$design->footer();
}

// Wenn RandomZahl nicht passt -> Betrugsversuch und so ^^ FEHLER
if ($get_rand != $_SESSION['thx_rand'][$get_pid]) {
	// fehler ausspucken und zur�ck zum post leiten
	wd('index.php?forum-showposts-'.$get_tid.'#'.$get_pid, 'Betrugsversuch oder zuvor in neuem Fenster/Tab ge&ouml;ffnet', 10);
	unset($_SESSION['thx_rand']);
	$design->footer();
} 
// Alle Angaben ok
	else {
		// Datenbank-Eintrag ausf�hren
		$insert_thx = db_query("INSERT INTO `prefix_danke` 
				(
					erstid, erstname, bedankerid, bedankername, tid, pid
				) 
				VALUES
				(
					".$get_erstid.", '".$get_erstname."', ".$get_bedanker_id.",'".$get_bedanker_name."', ".$get_tid.", '".$get_pid."'
				)");
		
		if($insert_thx) {
			// alles ok
				wd('index.php?forum-showposts-'.$get_tid.'#'.$get_pid, 'Danke f�r deine Danksagung :o)', 2);
				unset($_SESSION['thx_rand']);
				$design->footer();
		} else {
			// unbekannter sql fehler
				wd('index.php?forum-showposts-'.$get_tid.'#'.$get_pid, 'Fehler: Das h&auml;tte nicht passieren d&uuml;rfen. Bitte wende dich an den Admin', 2);
				unset($_SESSION['thx_rand']);
				$design->footer();
		}
		/*PN Versenden
		 * ($sid,$eid,$betreff,$text,[$status])
				$sid = Userid des Senders
				$eid = Userid des Empf�ngers
				$betreff = Betreff der eMail
				$text = Text/Body der eMail
				$status = Status �ber Zustand (gelesen/gel�scht)
				-1	Posteingang des Emp�ngers/gel�scht beim Sender
				0	Posteingang des Emp�ngers/Postausgang beim Sender (Standard)
				1	gel�scht beim Emp�nger/Postausgang beim Sender
		 */
		sendpm($_SESSION['authid'], $get_erstid, 'Danksagung', $get_bedanker_name.' bedankte sich f�r [url='.$_SERVER['HTTP_HOST'].'/index.php?forum-showposts-'.$get_tid.'#'.$get_pid.']deinen Beitrag[/url]', -1);
		unset($_SESSION['thx_rand']);
}

?>
