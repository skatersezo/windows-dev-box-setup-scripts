
# Posh Tools
choco install powershell4

# Dev Tools
choco install -y vscode
choco install -y git.install --package-parameters="'/WindowsTerminal /SChannel'"
choco install -y sysinternals
choco install -y SourceCodePro
choco install -y gitkraken
choco install notepadplusplus.install
choco install -y poshgit
choco install sql-server-management-studio
choco install microsoft-build-tools
choco install visualfsharptools

choco install lockhunter
choco install redis-desktop-manager
choco install docker-cli


choco install -y visualstudio2017community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
Update-SessionEnvironment #refreshing env due to Git install

# needed to run dot net core apps in IIS
choco install dotnetcore-windowshosting

# IIS configuration
Import-Module WebAdministration
Backup-WebConfiguration -Name BoxStarterBackup



# P4Merge setup
choco install p4merge
git config --global diff.tool p4merge
git config --global difftool.p4merge.path 'C:\Program Files\Perforce\p4merge.exe'
git config --global merge.tool p4merge
git config --global mergetool.p4merge.path 'C:\Program Files\Perforce\p4merge.exe'

# Git config
cmd /c "git config --global user.name '$windowsUser' & git config --global user.email '$userEmail'"
Write-Host "Before continuing you need to ensure you have created an SSH key and updated your GitHub profile in settings"

git config --global core.sshCommand "'C:\WINDOWS\System32\OpenSSH\ssh.exe'"

# Get-Process ssh-agent -ErrorAction SilentlyContinue | Stop-Process | Out-Null
# $sshAgent = ssh-agent
# $sshPid = [regex]::match($sshAgent, 'SSH_AGENT_PID=(\d+);').Groups[1].Value
# $sshSock = [regex]::match($sshAgent, 'SSH_AUTH_SOCK=([A-Za-z0-9./-]+);').Groups[1].Value
# [Environment]::SetEnvironmentVariable("SSH_AGENT_PID", $sshPid, "Process")
# [Environment]::SetEnvironmentVariable("SSH_AUTH_SOCK", $sshSock, "Process")
#$sshAdd = "ssh-add " + $homeSSHPath
#iex $sshAdd
ssh-add


#--- Tools ---
#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2017Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
# visualstudio2017community
# visualstudio2017professional
# visualstudio2017enterprise

# Communication tools
choco install slack

# IIS Modules
choco install urlrewrite
choco install iis-arr

# Investigating/Testing
choco install logparser
choco install fiddler4
choco install PhantomJS
choco install postman

# Productivity
choco install GoogleChrome
choco install lastpass
choco install markdownpad2

# Utilities
choco install -y 7zip.install
choco install TeraCopy
choco install adobereader
choco install vlc
choco install dropbox
choco install webpi

# Platforms
choco install jre8
choco install jdk8
choco install nodejs.install
choco install -y python

# Node modules
npm config set python python3
npm install -g grunt-cli bower
npm install -g live-server

# Windows Updates
Install-WindowsUpdate -AcceptEula

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$env:localappdata\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\explorer.exe"
Install-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"

# VSIS Packages
Install-ChocolateyVsixPackage PowerShellTools http://visualstudiogallery.msdn.microsoft.com/c9eb3ba8-0c59-4944-9a62-6eee37294597/file/112013/6/PowerShellTools.vsix

# Filesystem
New-Item -Path C:\ -Name Temp -ItemType Directory