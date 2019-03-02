
# Posh Tools
choco install powershell4

# Dev Tools
choco install -y vscode
choco install -y git.install --package-parameters="'/WindowsTerminal /SChannel'"
choco install -y sysinternals
choco install -y SourceCodePro
choco install -y gitkraken
choco install -y notepadplusplus.install
choco install -y poshgit
choco install -y sql-server-management-studio
choco install -y microsoft-build-tools
choco install -y visualstudio2017enterprise
choco install -y visualfsharptools
choco install -y lockhunter
choco install -y redis-desktop-manager
choco install -y logparser
choco install -y fiddler4
choco install -y PhantomJS
choco install -y postman
choco install -y git-credential-winstore
choco install -y scriptcs
choco install -y jre8
choco install -y jdk8
choco install -y nodejs.install
choco install -y wsl-ubuntu-1804
choco install -y python
choco install -y urlrewrite
choco install -y iis-arr
choco install -y sql-server-management-studio
choco install -y pycharm-community

# Git config
cmd /c "git config --global user.name '$windowsUser' & git config --global user.email '$userEmail'"
Write-Host "Before continuing you need to ensure you have created an SSH key and updated your GitHub profile in settings"

git config --global core.sshCommand "'C:\WINDOWS\System32\OpenSSH\ssh.exe'"

# P4Merge setup
choco install -y p4merge
git config --global diff.tool p4merge
git config --global difftool.p4merge.path 'C:\Program Files\Perforce\p4merge.exe'
git config --global merge.tool p4merge
git config --global mergetool.p4merge.path 'C:\Program Files\Perforce\p4merge.exe'

# needed to run dot net core apps in IIS
choco install -y dotnetcore-windowshosting

# Desktop essentials
choco install -y winrar
choco install -y whatsapp
choco install -y office365business
choco install -y slack
choco install -y 7zip.install
choco install -y TeraCopy
choco install -y adobereader
choco install -y vlc
choco install -y dropbox
choco install -y webpi
choco install -y GoogleChrome
choco install -y firefox
choco install -y lastpass
choco install -y markdownpad2
choco install -y dropbox

#--- Tools ---
code --install-extension msjsdiag.debugger-for-chrome

Update-SessionEnvironment #refreshing env due to Git install

# IIS Backup
Import-Module WebAdministration
Backup-WebConfiguration -Name BoxStarterBackup

# Node modules
npm config set python python3
npm install -g live-server

# Taskbar items
Install-ChocolateyPinnedTaskBarItem "$env:localappdata\Google\Chrome\Application\chrome.exe"
Install-ChocolateyPinnedTaskBarItem "$env:windir\explorer.exe"
Install-ChocolateyPinnedTaskBarItem "$env:SystemRoot\system32\WindowsPowerShell\v1.0\powershell.exe"
