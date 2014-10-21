<?php 
#   Copyright by Manuel Staechele
#   Support www.ilch.de


defined ('main') or die ( 'no direct access' );

function getmods ($fid) {
  
        $erg = db_query("SELECT b.id,b.name FROM prefix_forummods a LEFT JOIN prefix_user b ON b.id = a.uid WHERE a.fid = ".$fid);
        if ( db_num_rows($erg) > 0 ) {
          $mods = '<br /><u>Moderators:</u> ';
          while($row = db_fetch_assoc($erg) ) {
                  $mods .= '<a class="smalfont" href="index.php?user-details-'.$row['id'].'">'.$row['name'].'</a>, ';
          }
                $mods = substr ( $mods , 0 , -2 );
                return ($mods);
        } else {
          return ('');
        }
}

function forum_farbname ($name) {
$erg = db_query("SELECT id FROM prefix_user WHERE name = BINARY '".$name."'");
if (db_num_rows($erg) > 0) 
  {
  $recht = @db_result(db_query("SELECT recht FROM prefix_user WHERE name = BINARY '".$name."'"),0);
  if     ($recht == '-9') { return ('<span class="Recht-9">'.$name.'</span>'); } // Admin
  elseif ($recht == '-8') { return ('<span class="Recht-8">'.$name.'</span>'); } // CoAdmin
  elseif ($recht == '-7') { return ('<span class="Recht-7">'.$name.'</span>'); } // SiteAdmin
  elseif ($recht == '-6') { return ('<span class="Recht-6">'.$name.'</span>'); } // Leader
  elseif ($recht == '-5') { return ('<span class="Recht-5">'.$name.'</span>'); } // Co-Leader
  elseif ($recht == '-4') { return ('<span class="Recht-4">'.$name.'</span>'); } // Member
  elseif ($recht == '-3') { return ('<span class="Recht-3">'.$name.'</span>'); } // Trialmember
  elseif ($recht == '-2') { return ('<span class="Recht-2">'.$name.'</span>'); } // SuperUser
  elseif ($recht == '-1') { return ('<span class="Recht-1">'.$name.'</span>'); } // User
  else { return ('<span class="Recht-0">'.$name.'</span>'); } // Gast
  }
  else
  { 
  return ('<span style="color:#C0C0C0">'.$name.'</span>'); // Gast
  }
} 


function forum_get_ordner ( $ftime, $id, $fid =0 ) {
  if ( $ftime >= $_SESSION['lastlogin'] ) {
    if ( $fid == 0 ) {
      $anzOpenTopics = db_result(db_query("SELECT COUNT(*) FROM prefix_topics LEFT JOIN prefix_posts ON prefix_posts.id = prefix_topics.last_post_id WHERE prefix_topics.fid = ".$id." AND prefix_posts.time >= ".$_SESSION['lastlogin'] ),0); 
      if ( (($anzOpenTopics > 0 ) AND !isset($_SESSION['forumSEE'][$id]))
        OR $anzOpenTopics > count($_SESSION['forumSEE'][$id])
        OR max ( $_SESSION['forumSEE'][$id] ) <= ( $ftime - 4 ) 
      ) {
        return ( 'nord' );
      } else {
        return ( 'ord' );
      }
    } else {
      if ( isset ($_SESSION['forumSEE'][$fid][$id]) AND $ftime <= $_SESSION['forumSEE'][$fid][$id] ) {
        return ( 'ord' );
      } else {
        return ( 'nord' );
      }
    }
  } else {
          return ('ord');
        }
}

function check_for_pm_popup () {
  # opt_pm_popup
  if (1 == db_result(db_query("SELECT COUNT(*) FROM prefix_user where id = ".$_SESSION['authid']." AND opt_pm_popup = 1"),0,0) AND 1 <= db_result(db_query("SELECT COUNT(*) FROM prefix_pm WHERE gelesen = 0 AND status < 1 AND eid = ".$_SESSION['authid'] ),0) ) {
    $x = <<< html
    <script language="JavaScript" type="text/javascript"><!--
    function closeNewPMdivID () { document.getElementById("newPMdivID").style.display = "none"; }
    //--></script>
    <div id="newPMdivID" style="position:absolute; top:200px; left:300px; display:inline; width:200px;">
    <table width="100%" class="border" border="0" cellspacing="1" cellpadding="4">
      <tr>
        <td class="Cdark" align="left">
        <a href="javascript:closeNewPMdivID()"><img style="float:right; border: 0" src="include/images/icons/del.gif" alt="schliessen" title="schliessen"></a>
        <b>neue private Nachricht</b>
        bitte deinen <a href="?forum-privmsg">Posteingang</a> kontrolieren. 
        Damit dieses Fenster dauerhaft verschwindet musst du alle neuen Nachrichten
        lesen, oder die Option in deinem <a href="?user-profil">Profil</a> abschalten.
        </td>
      </tr>
    </table>
    </div>
html;
    return ($x);
  }
}

function forum_user_is_mod ($fid) {
  if (is_siteadmin()) { return (true); }
  
  if (1 == db_result(db_query("SELECT COUNT(*) FROM prefix_forummods WHERE uid = ".$_SESSION['authid']." AND fid = ".$fid),0)) {
    return (true);
  }
  return (false);
}


function check_forum_failure($ar) {

  if ( array_key_exists(0,$ar) ) {
    $hmenu  = '<a class="smalfont" href="?forum">Forum</a><b> &raquo; </b> Fehler aufgetreten';
    $title  = 'Forum : Fehler aufgetreten';
    $design = new design ( $title , $hmenu );
          $design->header();
          echo '<b>Es ist/sind folgende(r) Fehler aufgetreten</b><br />';
          foreach($ar as $v) {
            echo $v.'<br />';
          }
    echo '<br /><a href="javascript:history.back(-1)">zur&uuml;ck</a>';
                $design->footer();
          exit();
        }
  
  return (true);
}
?>