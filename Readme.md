# Windows Auto Unattended + Chocolatey + packages Install


These files allow for the Auto Unattnded install of Windows 10 with out user interaction. This will also install software using chocolatey for Windows.

<b>NOTES:</b>
* An Internet Connection is required during installation.
* The autounattend.xml file only supports MDR installations. For UEFI, you will
  need to modify it. You will have to add "EFI" partitions.
* The provided autounattend.xml file is intended for a PC with only one HDD/SSD.
  If you intend to use it with more than one hard drive, then you will have to
  first see what's your disk layout before the installation: take note of the
  disk numbers and then modify the "DiskID" sections. A usefull tool for doing
  this is "diskpart", which can be used before the installation process begins;
  just press "SHIFT + F10 and then type "diskpart" on the console. On the GUI
  from the installation itself, you will also see this.

  You may also set "WillShowUI" inside: "DiskConfiguration" and "ImageInstall"
  to "Always" to troubleshoot your installation, then you can set "DiskID" to
  the right value. On my case this was useful sometimes.

  I will really advice you to unplug other HDD/SSDs at first and do the
  installation. It is much easier this way.
* RAID can be a problem. It can be that Windows don't recognize the disks
  during the installation. So, if you can, try to use AHCI. If not, then look
  for the RAID drivers and save them to the "Drivers" and "Drivers/WinPE" paths
  from your USB; if they don't exist, then create them. Another thing to
  consider here is the HDD/SSD layout. You may have to use the diskpart tool to
  install Windows on the corrent media.

## Installation

1. Download the Windows 10 ISO using the Media Creation Tool:
   http://go.microsoft.com/fwlink/?LinkId=691209
2. Use Rufus to Create a bootable USB Media - https://rufus.akeo.ie/
3. Copy the files to the root of the USB Device.
4. Modify chocolatey-apps.cmd according to your needs. A list of chocolatey
   packages can be found here: https://chocolatey.org/packages
5. Save the network or any other drivers that you need to the paths:
   Drivers, Drivers/WinPE inside your memory sticks. If those paths don't exist,
   then create them.
6. Form the Autounattend.xml file, you may have to custom this settings to your
   own:
   ```
   <SetupUILanguage>
    <UILanguage>en-US</UILanguage>
   </SetupUILanguage>
   <InputLocale>0807:00000807</InputLocale>
   <UILanguage>en-US</UILanguage>
   <UserLocale>de-CH</UserLocale>		
   <SystemLocale>en-US</SystemLocale>
   ```
   
   Input locales can be found here:
   https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-input-locales-for-windows-language-packs?view=windows-11
7. Change the following fields from the Autounattend.xml by your own:
   * "moe" -> User that you want to setup during the installation. It will be and administrator, for example: "myAdmin"
   * "Comprofix" -> Replace it by your company. This field is optional and can be deleted
   * If need to have two or more admin accounts, then add them on the "UserAccounts" section, for example:
   ```
    <UserAccounts>
      <LocalAccounts>
        <LocalAccount wcm:action="add">
          <Password>
            <Value></Value>
            <PlainText>true</PlainText>
          </Password>
          <Description></Description>
          <DisplayName>Org. Admin</DisplayName>
          <Group>Administrators</Group>
          <Name>myAdmin</Name>
        </LocalAccount>
        <LocalAccount wcm:action="add">
          <Password>
            <Value></Value>
            <PlainText>true</PlainText>
          </Password>
          <Description></Description>
          <DisplayName>Local Admin</DisplayName>
          <Group>Administrators</Group>
          <Name>userAdmin</Name>
        </LocalAccount>
      </LocalAccounts>
    </UserAccounts>
    ```
    This creates two accounts: "myAdmin" and "UserAdmin" with an empty password.
    You will need to edit the changeAdminPassword.ps1 and add "UserAdmin" to it.
    This will change the passwords for both accounts.
    
    Please note that if you want to change "moe" account by your own, then you
    will have to search it on the autounattend.xml file the following fields:
    * **&lt;Username>moe&lt;/Username>** -> on the &lt;AutoLogon> section
    * Under **&lt;UserAccounts>** change the account data, for example: "myAdmin"
8. Connect the PC to the network and make sure that it will get an ip address:
   you either setup a dynamic IP or added the MAC address to the DHCP server.
   One thing I do is to work with USB to Ethernet adapter, then I pack the
   network drive on the stick. This works pretty well.
9. Boot the computer and watch the magic happen.

## Files

* autounattend.xml - Windows Answer File. Update the <Key> element with you required key for auto activation.
* chocolatey.ps1 - Installation and setup of chocolatey.
* chocolatey-apps.cmd - Installation of Apps with chocolatey. Update this file with you applications. A great selection of apps has already been included to get you going. Browse the chocolatey website for more - https://chocolatey.org/packages
* disableWindowsUpdates.ps1 - Will Disable Windows Updates.
* enable-rdp.ps1 - Enables RDP.
* enableUAC.ps1 - Enables UAC and the end of installation so some applications will run.
* fixnetwork.ps1 - Sets the network Location.
* microsoft-updates.bat - Configures Windows Updates.
* remoteOneDrive.ps1 - Disables One Drive from Starting on Boot.
* win-updates.ps1 - Checks and install any that are available.
* changeAdminPassword.ps1 - Changes admin passwords. You can define a second admin if you want
* disableAutologon.ps1 - Disables the autologon set by the Windows setup
* Update Chocolatey packages.xml - Automatic Windows task to update chocolatey packages every Monday at 08:00. If it isn't possible at that time, the task will be autorestarted every two hours 10 times.
* installChocolateyTask.ps1 - Imports the "Update Chocolatey packages.xml" file into the Windows task scheduler.