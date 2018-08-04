if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Import-Module ServerManager

netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

Get-WindowsFeature FS-SMB1
Enable-WindowsOptionalFeature -Online -FeatureName smb1protocol
Get-SmbServerConfiguration | Select EnableSMB2Protocol
Set-SmbServerConfiguration –EnableSMB2Protocol $true

Set-ItemProperty -Path "Registry::HKLM\System\CurrentControlSet\Services\fdPHost" -Name "DelayedAutostart" -Value 1 -Type DWORD
Set-ItemProperty -Path "Registry::HKLM\System\CurrentControlSet\Services\FDResPub" -Name "DelayedAutostart" -Value 1 -Type DWORD

Set-Service –Name fdPHost –StartupType Automatic
Set-Service –Name FDResPub –StartupType Automatic

Net start fdPHost 
Net start FDResPub

pause