$ie = New-Object -ComObject InternetExplorer.Application;
$ie.Navigate('http://www.geographycollector.com');
Start-Sleep -s 30;



$ie.quit();
