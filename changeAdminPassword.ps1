#changeAdminPassword by Josef Meile
#Here two passwords will be changed: the one from the current user and then the
#one from the secon admin

#Second admin. If you have something here, then make sure to add this account in
#the autounattend.xml file
$SecondAdmin = ""

#Minimal password length
$PasswordLength = 12

#Since you are not in a domain, the standard local GPOs from Microsoft doesn't:
#include password complexity, so, we use this to check that the first admin
#passwords are complex enough
Function Check-Password-Complexity ($password) {
  #Given by ChatGPT :-)
  $regex = "^(?=.*[A-Z])(?=.*[#\-\+\./:=\?!$\@\[\]\{\}])(?=.*[0-9])(?=.*[a-z]).{$PasswordLength}$"
  if ($password -match $regex) {
    return $true
  }
  if ($password.Length -lt $PasswordLength) {
    Write-Warning "Password must be at least $PasswordLength characters long"
  }
  if (!($password -match "[A-Z]")) {
    Write-Warning "Password must contain at least one uppercase letter"
  }
  if (!($password -match "[#\-\+\./:=\?!$\@\[\]\{\}]")) {
    Write-Warning "Password must contain at least one special character (# , - + . / : = ? ! $ @ [ ] { })"
  }
  if (!($password -match "[0-9]")) {
    Write-Warning "Password must contain at least one numeral (0-9)"
  }
  if (!($password -match "[a-z]")) {
    Write-Warning "Password must contain at least one lowercase letter"
  }
  Write-Host ""
  return $false
}

#Changes the initial empty password of the admin users
Function Change-Password ($User) {
  Write-Host -ForeGroundColor Green "Please set a new password for the user: $User"
  Write-Host ""
  Write-Warning "Password must meet complexity requirements: 
  `nAt least one upper case English letter [A-Z]`nAt least one lower case English letter [a-z]`nAt least one digit [0-9]`nAt least one special character # , - + . / : = ? ! $ @ [ ] { }`nMinimum $PasswordLength in length."
  Write-Host ""
  do {
    $NewPwd1 = Read-Host -Prompt "Please enter your new password" -AsSecureString
    $NewPwd2 = Read-Host -Prompt "Please re-enter your new password" -AsSecureString
    
    $NewPwd1Txt = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($NewPwd1))
    $NewPwd2Txt = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($NewPwd2))
    
    if ($NewPwd1Txt -ne $NewPwd2Txt) {
      Write-Warning "Passwords don't match. Please try again"
    } else {
      if (!(Check-Password-Complexity($NewPwd1Txt))) {
        $NewPwd1Txt = "1"
        $NewPwd2Txt = "2"
      }
    }
  } until ($NewPwd1Txt -eq $NewPwd2Txt)
  $UserAccount = Get-LocalUser -Name $User
  $UserAccount | Set-LocalUser -Password $NewPwd1 -PasswordNeverExpires $true
  Write-Host -ForeGroundColor Green "The password was changed!"
  Write-Host ""
}

$CurrentUser = $Env:USERNAME
Change-Password $CurrentUser
if ($SecondAdmin -ne "") {
  Change-Password $SecondAdmin
}
sleep 5