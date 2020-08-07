# enable wsl
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# enable virtualization
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# set wsl 2
wsl --set-default-version 2

cd /
mkdir temp_ubuntu
cd temp_ubuntu

# download Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing

# install wsl ubuntu
Add-AppxPackage .\Ubuntu.appx
