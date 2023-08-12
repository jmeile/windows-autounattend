# Enables OneDrive synchronization]

Write-Host "Enabling OneDrive synchronization"
sleep 10

#Killing running Processes
taskkill /f /im OneDrive.exe

#Adding Registry Entries to Disable OneDrive from starting

#Comment from Josef Meile: This was set to 1, but we actually need it, so, it
#is not set to 0

reg add HKLM\Software\Policies\Microsoft\Windows\OneDrive
reg add HKLM\Software\Policies\Microsoft\Windows\OneDrive /v DisableFileSyncNGSC /t REG_DWORD /d 0

sleep 5
