<?php

if (isset($_GET['xml'])) {

    $fp = fopen("./logjs.txt", "a");

    $date = date('l jS \of F Y h:i:s A');
    $post = $_GET['xml'];
    $text = "$date\t$post\n";
	$text .= "\n" . str_repeat("=", 22) . "\n";

    fputs($fp, $text);
    fclose($fp);
}

?>
