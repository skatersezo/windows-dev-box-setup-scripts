
# Posh Tools
choco install powershell4

# Dev Tools
choco install -y vscode
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y sysinternals
choco install -y SourceCodePro
choco install -y gitkraken
choco install notepadplusplus.install
choco install -y poshgit


# Investigating/Testing
choco install logparser
choco install fiddler4
choco install PhantomJS

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