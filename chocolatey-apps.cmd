@ECHO OFF

SET CI=%systemdrive%\ProgramData\Chocolatey\choco.exe install --yes
@REM comment/uncomment the packages according to your needs, then run it as
@REM Administrator. If you don't find a package here, then look the chocolatey
@REM repository: https://community.chocolatey.org/packages

@REM Please also note that after the initial setup, you can use the chocolatey
@REM GUI to install packages without accessing the command line

@REM Best package ever. A GUI to install chocolatey packages
%CI% chocolateygui

@REM System Updates, choose the one for your PC
@REM %CI% dellcommandupdate
@REM %CI% hpsupportassistant
@REM %CI% lenovo-thinkvantage-system-update

%CI% 7zip-zstd
@REM %CI% adobereader

@REM %CI% anaconda3
@REM %CI% angryip
@REM %CI% audacity
@REM %CI% audacity-lame
@REM %CI% arduino
@REM %CI% autohotkey
@REM %CI% autoit
@REM %CI% backupper-standard
@REM %CI% blender
@REM %CI% brave
@REM %CI% ccleaner

@REM Not developed anymore. Don't install on Windows 11
@REM %CI% classic-shell

@REM %CI% cura-new

%CI% cpu-z
%CI% crystaldiskinfo.install
%CI% crystaldiskmark

@REM %CI% cygwin
@REM %CI% digikam

%CI% dotnetcore-desktopruntime
%CI% drawio

@REM %CI% dwgtrueview
@REM %CI% filezilla
@REM %CI% firefox
@REM %CI% freecad
@REM %CI% fsresizer.install
@REM %CI% gimp
@REM %CI% git
@REM %CI% git-credential-manager-for-windows

%CI% googlechrome

@REM %CI% googledrive
@REM %CI% gpg4win

%CI% gpu-z

%CI% hdtune
@REM %CI% hfsexplorer
@REM %CI% hxd
@REM %CI% imgburn
@REM %CI% inkscape
@REM %CI% irfanview
@REM %CI% itunes
@REM %CI% k-litecodecpackmega
@REM %CI% kdenlive

@REM Good password manager. Useful for OTP
@REM %CI% keepassxc

@REM %CI% lame
@REM %CI% libreoffice-fresh
@REM %CI% logitech-presentation

@REM %CI% mediainfo
@REM %CI% mendeley
@REM %CI% meshlab
@REM %CI% meshmixer
%CI% microsoft-teams.install
@REM %CI% miktex
@REM %CI% mobaxterm
@REM %CI% musescore

%CI% notepadplusplus.install

@REM %CI% numpy
@REM %CI% obs-studio
@REM %CI% droidcam-obs-plugin
%CI% office365business
%CI% onedrive
@REM %CI% openscad.install
@REM %CI% openwebstart
@REM %CI% opera

@REM There is still an issue with Paint.Net:
@REM https://github.com/chocolatey-community/chocolatey-packages/issues/2203
%CI% paint.net
@REM 
@REM Alternatively, you can install the portable version. Please note that
@REM version 5.0.2 has a problem: it takes long to close, so, make sure
@REM that the installed version is higher or equal to 5.0.3
@REM %CI% paint.net.portable

@REM %CI% partitionwizard
@REM %CI% patch-my-pc
@REM %CI% patchcleaner
@REM %CI% prusaslicer
@REM %CI% puredata
@REM %CI% putty
@REM %CI% pycharm-community
@REM %CI% python
%CI% recuva
@REM The R Project for Statistical Computing
@REM %CI% r
@REM %CI% r.studio
@REM %CI% rufus
@REM %CI% rustdesk
@REM %CI% samsung-magician
@REM %CI% sharex
@REM %CI% sizer
@REM %CI% skype
@REM %CI% slack
@REM %CI% speedfan
@REM %CI% splashtop-client-personal
@REM %CI% subtitleedit
@REM %CI% teracopy
@REM %CI% texniccenter
@REM %CI% texmaker
@REM %CI% texstudio
@REM %CI% thunderbird
@REM %CI% tightvnc
@REM %CI% unity
@REM %CI% unity-docs

%CI% vcredist2010
%CI% vcredist2012
%CI% vcredist2013
%CI% vcredist140

@REM %CI% vim
@REM %CI% virtualbox
@REM %CI% virtualbox-guest-additions-guest.install
@REM %CI% virtualmidisynth
@REM %CI% visualstudio2022buildtools
@REM %CI% visualstudio2022community

%CI% vlc

@REM %CI% vnc-connect
@REM %CI% vnc-viewer
%CI% whatishang
%CI% windirstat
@REM %CI% winmerge
@REM %CI% winscp
@REM %CI% xsplit-broadcaster
@REM %CI% zoom
@REM %CI% zoom-outlook