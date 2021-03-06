set-executionpolicy remotesigned
choco feature enable -n allowGlobalConfirmation
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

choco feature enable -n allowGlobalConfirmation
# No Reboot
# http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/Orcomp/Boxstarter/master/InstallSoftware.txt

# Runtimes
#==========

# General
#=========

cinst googlechrome
cinst firefox
# cinst greenshot
cinst vlc
cinst f.lux
# cinst keepass.install
# cinst FoxitReader
# cinst kdiff3
cinst dropbox
choco install jre8
choco install adobereader-update
choco install sysinternals
choco install teamviewer
choco install em-client
cinst skype
cinst paint.net
cinst ccleaner
cinst malwarebytes
cinst avastfreeantivirus
choco install adobereader

# cinst filezilla
# cinst zoom
# cinst putty.install
# cinst screentogif

cinst microsoft-teams
cinst treesizefree
cinst processhacker

# http://www.tweaking.com/content/page/simple_system_tweaker.html
cinst simplesystemtweaker

cinst itunes

# Dev tools
#===========

# Git will install credentials manager as well
# https://github.com/Microsoft/Git-Credential-Manager-for-Windows/
# cinst git.install
# 
# cinst vscode
# cinst vscode-csharp
# cinst vscode-powershell
# cinst vscode-icons
# cinst vscode-gitlens
# cinst vscode-codespellchecker
# cinst vscode-markdownlint

cinst notepadplusplus.install

# Set notepad2 as the default notepad editor.
cinst notepad2-mod
cinst 7zip.install

# Fix SSH-Agent error by adding the bin directory to the `Path` environment variable
$env:PSModulePath = $env:PSModulePath + ";C:\Program Files (x86)\Git\bin"

# Tweaks
#========

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles)\Google\Chrome\Application\chrome.exe"

