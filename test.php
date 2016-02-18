<?php
$url = "http://core-starad24.webreliever.co.uk/img/user@3x.png";
$header_response = get_headers($url, 1);
if ( strpos( $header_response[0], "404" ) !== false )
{
  // FILE DOES NOT EXIST
  echo 'ok';
} 
else 
{
  // FILE EXISTS!!
   echo 'okssssssss';
}