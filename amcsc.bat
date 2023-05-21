@echo off
setlocal enabledelayedexpansion

set /p folderlocation="Enter the file location where you want to create a folder: "
set /p foldername="Enter the name of the folder you want to create: "
md "!folderlocation!\!foldername!"
cd "!folderlocation!\!foldername!"

set /p memvalue="Enter the memory value: "

> "eula.txt" (
    echo #By changing the setting below to TRUE you are indicating your agreement to our EULA ^(https://aka.ms/MinecraftEULA^).
    echo #Sat May 20 20:59:03 GMT 2023
    echo eula=true
)

echo The following server launchers are available:
echo 1. Vanilla (1.19.4 - 1.7.4)
echo 2. Mohist (1.19.4 - 1.7.10)
echo 3. Fabric (1.19.4 - 1.14)
echo 4. Forge | WIP (1.19.4 - 1.7.10)
echo 5. Catserver | WIP
echo 6. Waterfall | WIP
echo 7. Bungeecord | WIP
echo 8. Velocity | WIP
echo 9. Paper | WIP
echo 10. Purpur | WIP
echo 11. Sponge | WIP
set /p launcher=What server launcher do you want to install? Pick between 1 - 11.

if !launcher! == 1 (
    echo java -Xmx!memvalue!M -Xms!memvalue!M -jar server.jar nogui > start.bat
    echo You have chosen Vanilla.
    echo The following versions are available:
    set "vanillaversions=1.19.4 1.19.3 1.19.2 1.19.1 1.19 1.18.2 1.18.1 1.18 1.17.2 1.17.1 1.17 1.16.5 1.16.4 1.16.3 1.16.2 1.16.1 1.16 1.15.2 1.15.1 1.15 1.14.4 1.14.3 1.14.2 1.14.1 1.14 1.13.2 1.13.1 1.13 1.12.2 1.12.1 1.12 1.11.2 1.11.1 1.11 1.10.2 1.10.1 1.10 1.9.4 1.9.3 1.9.2 1.9.1 1.9 1.8.9 1.8.8 1.8.7 1.8.6 1.8.5 1.8.4 1.8.3 1.8.2 1.8.1 1.8 1.7.10 1.7.9 1.7.8 1.7.7 1.7.6 1.7.5 1.7.4"
    for %%v in (!vanillaversions!) do (
        echo %%v
    )
    set /p vanillaversion=What version do you want to install?
    set vanillaurl=https://serverjars.com/api/fetchJar/vanilla/vanilla/!vanillaversion!
    powershell -Command "(New-Object Net.WebClient).DownloadFile('!vanillaurl!', 'server.jar')"
    powershell -Command "Invoke-WebRequest !vanillaurl! -OutFile server.jar"
    START "" start.bat
    exit
)

if !launcher! == 2 (
    echo java -Xmx!memvalue!M -Xms!memvalue!M -jar server.jar nogui > start.bat
    echo You have chosen Mohist.
    echo The following versions are available:
    set "mohistversions=1.19.4 1.18.2 1.16.5 1.12.2 1.7.10"
    for %%v in (!mohistversions!) do (
        echo %%v
    )
    set /p mohistversion=What version do you want to install?
    set mohisturl=https://serverjars.com/api/fetchJar/modded/mohist/!mohistversion!
    powershell -Command "(New-Object Net.WebClient).DownloadFile('!mohisturl!', 'server.jar')"
    powershell -Command "Invoke-WebRequest !mohisturl! -OutFile server.jar"
    START "" start.bat
    exit
)

if !launcher! == 3 (
    echo java -Xmx!memvalue!M -Xms!memvalue!M -jar server.jar nogui > start.bat
    echo You have chosen Fabric.
    echo The following versions are available:
    set "fabricversions=1.19.4 1.19.3 1.19.2 1.19.1 1.19 1.18.2 1.18.1 1.18 1.17.2 1.17.1 1.17 1.16.5 1.16.4 1.16.3 1.16.2 1.16.1 1.16 1.15.2 1.15.1 1.15 1.14.4 1.14.3 1.14.2 1.14.1 1.14"
    for %%v in (!fabricversions!) do (
        echo %%v
    )
    set /p fabricversion=What version do you want to install?
    set fabricurl=https://serverjars.com/api/fetchJar/modded/fabric/!fabricversion!
    powershell -Command "(New-Object Net.WebClient).DownloadFile('!fabricurl!', 'server.jar')"
    powershell -Command "Invoke-WebRequest !fabricurl! -OutFile server.jar"
    START "" start.bat
    exit
)

if !launcher! == 4 (
    echo java -Xmx!memvalue!M -Xms!memvalue!M -jar server.jar nogui --installServer > start.bat
    echo You have chosen Forge.
    echo The following versions are available:
    set "forgeversions=1.19.4 1.19.3 1.19.2 1.19.1 1.19 1.18.2 1.18.1 1.18 1.17.1 1.16.5 1.16.4 1.16.3 1.16.2 1.16.1 1.15.2 1.15.1 1.15 1.14.4 1.14.3 1.14.2 1.13.2 1.12.2 1.12.1 1.12 1.11.2 1.11 1.10.2 1.10 1.9.4 1.9 1.8.9 1.8.8 1.8 1.7.10"
    for %%v in (!forgeversions!) do (
        echo %%v
    )
    set /p forgeversion=What version do you want to install?
    set forgeurl=https://serverjars.com/api/fetchJar/modded/forge/!forgeversion!
    powershell -Command "(New-Object Net.WebClient).DownloadFile('!forgeurl!', 'server.jar')"
    powershell -Command "Invoke-WebRequest !forgeurl! -OutFile server.jar"
    START "" start.bat
    exit
)


if exist "!folderlocation!\!foldername!" (
echo The folder "!foldername!" was created successfully at "!folderlocation!".
) else (
echo There was a problem creating the folder.
)

pause
