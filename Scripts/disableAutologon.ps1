#disableAutologon by Josef Meile
#During Windows installation, an autologon will be set to automatically installation
#chocolatey applications. This is really needed for apps that require a GUI, for
#example: paint.net. After all this is done, the autologon will be disabled

#Pretty important to disable the autologon set by the installation. You don't:
#really want this with a user that has admin rights
Function Disable-Autologon {
  $RegKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
  ForEach ($subkey in "AutoAdminLogon", "DefaultPassword")
  {
    if (Get-ItemProperty -Name $subkey -path $RegKey -ErrorAction SilentlyContinue)
    {
      Remove-ItemProperty -Path $RegKey -Name $subkey
    }
  }
}

Disable-Autologon
sleep 5