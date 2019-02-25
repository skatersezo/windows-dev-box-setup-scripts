# Description: Boxstarter Script
# Author: Ivan Espinosa
# My dev settings for full stack development
#Requires -RunAsAdministrator

Clear
Write-Host "WARNING! This script is designed to be used on a completely fresh environment / machine without any development tools already installed. You've been warned!"
Write-Host ""
Pause

$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

# Environment defaults
$USERPROFILE = [Environment]::GetEnvironmentVariable("USERPROFILE")
[Environment]::SetEnvironmentVariable("HOME", $USERPROFILE, "User")
[Environment]::SetEnvironmentVariable("HOME", $USERPROFILE, "Process")
$windowsUser = [Environment]::UserName
$userEmail = [Environment]::UserName + "@gmail.com"

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

# Check MSDN license entitlement
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes",""
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No",""
$choices = [System.Management.Automation.Host.ChoiceDescription[]]($yes,$no)
$vsEnterprise = $Host.UI.PromptForChoice("Important!","Does your MSDN license allocation entitle you to VS Enterprise? Check w/HelpDesk if in doubt.",$choices,1)

# Prompt for confirmation in scripts or bypass
choco feature enable -n allowGlobalConfirmation

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";

choco install -y visualstudio2017community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
Update-SessionEnvironment #refreshing env due to Git install

#--- UWP Workload and installing Windows Template Studio ---
choco install -y visualstudio2017-workload-azure
choco install -y visualstudio2017-workload-manageddesktop

#--- reenabling critial items ---
Enable-UAC
# End
choco feature disable -n allowGlobalConfirmation

