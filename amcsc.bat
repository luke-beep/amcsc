@echo off
set /p folderlocation="Enter the file location where you want to create a folder: "
set /p foldername="Enter the name of the folder you want to create: "
md "%folderlocation%%foldername%"
cd "%folderlocation%%foldername%"

@echo off
set /p memvalue="Enter the memory value: "
echo java -Xmx%memvalue%M -Xms%memvalue%M -jar server.jar nogui > start.bat

@echo off
> "eula.txt" (
    echo #By changing the setting below to TRUE you are indicating your agreement to our EULA ^(https://aka.ms/MinecraftEULA%5E).
    echo #Sat May 20 20:59:03 GMT 2023
    echo eula=true
)

:download
echo Do you accept the minecraft eula:
echo Yes [1]
echo No [2]
set /p option=

@echo off
setlocal enabledelayedexpansion

if !option!==1 (
    set /p version=Enter new version number: 
    echo Version: !version!
    set url=https://serverjars.com/api/fetchJar/vanilla/vanilla/!version!
    echo URL: !url!
    powershell -Command "(New-Object Net.WebClient).DownloadFile('!url!', 'server.jar')"
    powershell -Command "Invoke-WebRequest !url! -OutFile server.jar"
    START "" start.bat
    exit
)
if %option%==2 (
    exit
)

if exist "%folderlocation%%foldername%" (
echo The folder "%foldername%" was created successfully at "%folderlocation%".
) else (
echo There was a problem creating the folder.
)
