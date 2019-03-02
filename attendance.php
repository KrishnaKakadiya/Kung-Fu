<?php
   $dbhost = 'localhost';
   $dbuser = 'root';
   $dbpass = '';
   $conn = mysql_connect($dbhost, $dbuser, $dbpass);
   
   if(! $conn ) {
      die('Could not connect: ' . mysql_error());
   }
   
   $sql = 'INSERT INTO attendance '.
      '(stud_num,day, level, time, attend) '.
      'VALUES ( "4", "Monday", "Intermediate", "4 PM", "Present" )';
      
   mysql_select_db('kungfu');
   $retval = mysql_query( $sql, $conn );
   
   if(! $retval ) {
      die('Could not enter data: ' . mysql_error());
   }
   
   header('Location: memberpage.php');
   
   mysql_close($conn);
?>