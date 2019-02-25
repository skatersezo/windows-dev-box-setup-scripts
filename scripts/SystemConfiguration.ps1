
#--- Update Windows ---
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

#--- Setting SSH ---
Write-Host "Now you'll set an SSH password that will be used for the SSH Window agent (Don't leave it blank)"
SSH-Keygen
cat %USERPROFILE%\.ssh\id_rsa.pub | clip
Read-Host "Your public key has been copied to your clipboard, go to paste it in your GitHub account."

#--- Enable remote desktop on the system ---
Enable-RemoteDesktop

#--- Disable Internet Explorer Enhanced Security on the system ---
Disable-InternetExplorerESC

#--- Disable User Access control on the system ---
Disable-UAC

#--- Disable Bing search on the taskar ---
Disable-BingSearch 

#--- Enable Windows Subsystem for Linux on the system ---
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

#--- Allows to run scripts downloaded from the internet rather than only local
try {
    Set-ExecutionPolicy RemoteSigned -Force 
} catch {
}