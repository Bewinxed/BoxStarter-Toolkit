if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

set-executionpolicy remotesigned

powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath %ProgramFiles%\KMSpico\
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath %WinDir%\SECOH-QAD.exe
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath %WinDir%\SECOH-QAD.dll