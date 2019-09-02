@echo off
:start

REM ***** Set Datae as dateGblobal *****

for /F "tokens=1-4 delims=/ " %%i in ('date /t') do (

    set Day=%%i

    set Month=%%j

    set Year=%%k

    set DateGlobal=%%i-%%j-%%k

)

    for /f "tokens=4-5 delims=[] " %%a in ('ver') do set version=%%a%%b 
    for %%a in (%version%) do set version=%%a 

    if %version% EQU 10.0.18362.329 ( 
       REM Name: "Microsoft Windows 10 1903 Late Aug 2019" 
        set name=Microsoft Windows 10 1903 Late Aug 2019
       REM Family: Windows 10 
        set family=10 
       REM compatible: Yes 
        set permit=Yes 
    )  else if %version% EQU 10.0.18362.295 ( 
       REM Name: "Microsoft Windows 10 1803 Aug 2019" 
        set name=Microsoft Windows 10 1803 Aug 2019
       REM Family: Windows 10 
        set family=10 
       REM compatible: Yes 
        set permit=Yes
    )  else if %version% EQU 10.0.17134 ( 
       REM Name: "Microsoft Windows 10 1803 Apr 2018" 
        set name=Microsoft Windows 10 1803 Apr 2018
       REM Family: Windows 10 
        set family=10 
       REM compatible: Yes 
        set permit=Yes
    )  else if %version% EQU 10.0.18362.175  ( 
       REM Name: "Microsoft Windows 10 1903 may 2019" 
        set name=Microsoft Windows 10 1903 may 2019
       REM Family: Windows 10
        set family=10 
       REM compatible: Yes 
        set permit=Yes
    ) else if %version% EQU 10.0.16299  ( 
       REM Name: "Microsoft Windows 10 Fall Creators Update 1709" 
        set name=Microsoft Windows 10 Fall Creators Update 1709
       REM Family: Windows 10
        set family=10 
       REM compatible: Yes 
        set permit=Yes
    ) else if %version% EQU 10.0.16299  ( 
       REM Name: "Microsoft Windows 10 Fall Creators Update 1709" 
        set name=Microsoft Windows 10 Fall Creators Update 1709
       REM Family: Windows 10
        set family=10 
       REM compatible: Yes 
        set permit=Yes
    )  else if %version% EQU 10.0.18362.175  ( 
       REM Name: "Microsoft Windows 10 1903" 
        set name=Microsoft Windows 10
       REM Family: Windows 10
        set family=10 
       REM compatible: Yes 
        set permit=Yes
    ) else if %version% EQU 6.3.9600 ( 
       REM   Name: "Microsoft Windows 8.1 Update 1" 
        set name=Microsoft Windows 8.1 Update 1 
       REM  amily: Windows 8 
        set family=8 
       REM compatible: Yes 
        set permit=Yes
    )  else if %version% EQU 5.1.2600 ( 
       REM  Name: "Microsoft Windows XP" 
        set name=Microsoft Windows XP 
       REM Family: Windows 5 
        set family=5 
       REM compatible: Not yet tested
        set permit=Yes 
    ) else if %version% EQU 5.2.3790 ( 
       REM Name: "Microsoft Windows XP Professional x64 Edition" 
        set name=Microsoft Windows XP Professional x64 Edition 
       REM Family: Windows 5 
        set family=5 
       REM compatible: Not yet tested
        set permit  =Yes 
    ) else if %version% EQU 6.0.6000 ( 
       REM Name: "Microsoft Windows Vista" 
        set name=Microsoft Windows Vista 
       REM Family: Windows 6 
        set family=6 
       REM compatible: Not yet tested
        set permit=Yes 
    ) else if %version% EQU 6.0.6001 ( 
       REM Name: "Microsoft Windows Vista SP1" 
        set name=Microsoft Windows Vista SP1 
       REM Family: Windows 6 
        set family=6 
       REM  compatible: Not yet tested 
        set permit  =Yes 
    ) else if %version% EQU 6.0.6002 ( 
       REM Name: "Microsoft Windows Vista SP2" 
        set name=Microsoft Windows Vista SP2 
       REM Family: Windows 6 
        set family=6 
       REM            compatible: Not yet tested 
        set permit  =Yes 
    ) else if %version% EQU 6.1.7600 ( 
       REM Name: "Microsoft Windows 7" 
        set name=Microsoft Windows 7 
       REM  Family: Windows 7 
        set family=7 
       REM  compatible: Not yet tested 
        set permit=Yes 
    ) else if %version% EQU 6.1.7601 ( 
       REM  Name: "Microsoft Windows 7 SP1" 
        set name=Microsoft Windows 7 SP1 
       REM  Family: Windows 7 
        set family=7 
       REM  compatible: Not yet tested 
        set permit=Yes 
    ) else if %version% EQU 6.2.9200 ( 
       REM Name: "Microsoft Windows 8" 
        set name=Microsoft Windows 8 
       REM Family: Windows 8 
        set family=8 
       REM compatible: Not yet tested 
        set permit  =Yes 
    ) else if %version% EQU 6.3.9200 ( 
       REM Name: "Microsoft Windows 8.1" 
        set name=Microsoft Windows 8.1 
       REM Family: Windows 8 
        set family=8 
       REM  compatible: Not yet tested 
        set permit=Yes 
    ) else ( 
       REM  Name: "Unknown" 
            set name=Unknown 
       REM compatible: No 
            set permit=No 
        ) 
    ) 

@ECHO OFF
REM Test If script has Admin Priviledges/is elevated
net session > NUL
IF %ERRORLEVEL% EQU 0 (
    set adminp= Admin True
) ELSE (
    set adminp= Admin False Some options will not work
  
)
cls

echo ******************
echo *  %DateGlobal%    *
echo ******************
echo.
echo  *******************************************************************************************************************
echo    Version 0.6 Beta Version 				  					            
echo    No warranty offered or implied 								                    
echo    GNU General Public License v2.0 
echo    Any issues bugs or faults please contact me https://linkedin.com/in/rcwadsworth                                                                
echo    You use at your own risk. This is a beta version only windows 10 is supported
echo.                               
echo  *******************************************************************************************************************
echo.

:MENU
echo.
echo	   Is this script compatible with my version of windows? A) %permit%
echo.
echo	   Admin Status = %adminp%
echo.
echo       %name% - %version% 
echo.
echo       1. Manually run Windows Update (Win 10 Only)
echo       2. Rename Software distribution Folder and create new folder. This is not a full reset.
echo       3. Full reset of windows update
echo       4. Scan for File corruption 
echo       5. Move Windows updates to another disk
echo       6. Open WinUpdate log file
echo       7. Show system information 
echo       8. Quit

echo.
set choice=
set /p choice=      Enter option or press 8 to Quit. Your entered choice is =
echo.
	if not '%choice%'=='' set choice=%choice:~0,1%
	if '%choice%'=='1' goto windowsupdate
	if '%choice%'=='2' goto SDFold
	if '%choice%'=='3' goto resetwindowsupdate
	if '%choice%'=='4' goto sfc_scan
	if '%choice%'=='5' goto MlinkMove
	if '%choice%'=='6' goto win_ex
	if '%choice%'=='7' goto showinfo
	if '%choice%'=='8' goto End
	if '%choice%'=='0' goto cmd

echo.
echo.
echo "%choice%" is not a valid option - try again
echo.
pause
goto start

:windowsupdate
REM call "C:\Users\rcwad\OneDrive\Desktop\update menu\windowsupdate.bat"
explorer ms-settings:windowsupdate 
cls
goto start

:SDFold
cls
echo
echo making sure Windows update service has been stopped
net stop "Windows Update"
echo Canceling the Windows Update process. 
taskkill /im wuauclt.exe /f	

ren C:\Windows\softwaredistribution softwaredistribution_%DateGlobal%

net start "windows update"

pause
cls
goto start

:resetwindowsupdate
cls
:resetwindows

REM ***** Set Datae as dateGblobal *****

cls
echo ******************
echo *  %DateGlobal%    *
echo ******************

Echo You are about to fully reset windows update history will be backed up to softwaredistribution.bak
pause

REM ****** Stopping the Windows Update services ******
echo Stopping the Windows Update services. 
net stop bits 
 
echo Stopping the Windows Update services. 
net stop wuauserv 
 
echo Stopping the Windows Update services. 
net stop appidsvc 
 
echo Stopping the Windows Update services. 
net stop cryptsvc 
 
echo Canceling the Windows Update process. 
	taskkill /im wuauclt.exe /f 

echo off

REM ****** Checking the services status ******
echo Checking the services status. 
 
    sc query bits | findstr /I /C:"STOPPED" 
    if %errorlevel% NEQ 0 ( 
        echo.    Failed to stop the BITS service. 
        echo. 
        echo.Press any key to continue . . . 
        pause>nul 
        goto :start
    ) 
 
echo Checking the services status. 
 
    sc query wuauserv | findstr /I /C:"STOPPED" 
    if %errorlevel% NEQ 0 ( 
        echo.    Failed to stop the Windows Update service. 
        echo. 
        echo.Press any key to continue . . . 
        pause>nul 
        goto :start
    ) 

echo Checking the services status. 
 
    sc query appidsvc | findstr /I /C:"STOPPED" 
    if %errorlevel% NEQ 0 ( 
        sc query appidsvc | findstr /I /C:"OpenService FAILED 1060" 
        if %errorlevel% NEQ 0 ( 
            echo.    Failed to stop the Application Identity service. 
            echo. 
            echo.Press any key to continue . . . 
            pause>nul 
            if %family% NEQ 6 goto :start
        ) 
    ) 
 
echo Checking the services status. 
 
    sc query cryptsvc | findstr /I /C:"STOPPED" 
    if %errorlevel% NEQ 0 ( 
        echo    Failed to stop the Cryptographic Services service. 
        echo
        echo Press any key to continue . . . 
        pause>nul 
        goto :start
    ) 
echo off
REM ***** Delete the qmgr*.dat files *****
 echo Deleting the qmgr*.dat files. 
 
    del /s /q /f "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat" 
    del /s /q /f "%ALLUSERSPROFILE%\Microsoft\Network\Downloader\qmgr*.dat" 
 
REM ******Renaming the softare distribution folders backup copies ******
    echo Deleting the old software distribution backup copies. 
 
    cd /d %SYSTEMROOT% 
 
    if exist "%SYSTEMROOT%\winsxs\pending.xml.bak" ( 
        del /s /q /f "%SYSTEMROOT%\winsxs\pending.xml.bak" 
    ) 
    if exist "%SYSTEMROOT%\SoftwareDistribution.bak" ( 
        rmdir /s /q "%SYSTEMROOT%\SoftwareDistribution.bak" 
    ) 
    if exist "%SYSTEMROOT%\system32\Catroot2.bak" ( 
        rmdir /s /q "%SYSTEMROOT%\system32\Catroot2.bak" 
    ) 
    if exist "%SYSTEMROOT%\WindowsUpdate.log.bak" ( 
        del /s /q /f "%SYSTEMROOT%\WindowsUpdate.log.bak" 
    ) 
echo off
echo Renaming the software distribution folders. 
 
    if exist "%SYSTEMROOT%\winsxs\pending.xml" ( 
        takeown /f "%SYSTEMROOT%\winsxs\pending.xml" 
        attrib -r -s -h /s /d "%SYSTEMROOT%\winsxs\pending.xml" 
        ren "%SYSTEMROOT%\winsxs\pending.xml" pending.xml.bak 
    ) 
    if exist "%SYSTEMROOT%\SoftwareDistribution" ( 
        attrib -r -s -h /s /d "%SYSTEMROOT%\SoftwareDistribution" 
        ren "%SYSTEMROOT%\SoftwareDistribution" SoftwareDistribution.bak_%DateGlobal%
        if exist "%SYSTEMROOT%\SoftwareDistribution" ( 
	echo
	echo    Failed to rename the SoftwareDistribution folder. 
	echo
	pause
   	goto :start
        ) 
    ) 
    if exist "%SYSTEMROOT%\system32\Catroot2" ( 
        attrib -r -s -h /s /d "%SYSTEMROOT%\system32\Catroot2" 
        ren "%SYSTEMROOT%\system32\Catroot2" Catroot2.bak 
    ) 
    if exist "%SYSTEMROOT%\WindowsUpdate.log" ( 
        attrib -r -s -h /s /d "%SYSTEMROOT%\WindowsUpdate.log" 
        ren "%SYSTEMROOT%\WindowsUpdate.log" WindowsUpdate.log.bak 
    ) 

REM ****** Make sure all BITS DLL files and the Windows Update files are registered ******
echo Reregister the BITS files and the Windows Update files. 
 
    cd /d %SYSTEMROOT%\system32 
    regsvr32.exe /s atl.dll 
    regsvr32.exe /s urlmon.dll 
    regsvr32.exe /s mshtml.dll 
    regsvr32.exe /s shdocvw.dll 
    regsvr32.exe /s browseui.dll 
    regsvr32.exe /s jscript.dll 
    regsvr32.exe /s vbscript.dll 
    regsvr32.exe /s scrrun.dll 
    regsvr32.exe /s msxml.dll 
    regsvr32.exe /s msxml3.dll 
    regsvr32.exe /s msxml6.dll 
    regsvr32.exe /s actxprxy.dll 
    regsvr32.exe /s softpub.dll 
    regsvr32.exe /s wintrust.dll 
    regsvr32.exe /s dssenh.dll 
    regsvr32.exe /s rsaenh.dll 
    regsvr32.exe /s gpkcsp.dll 
    regsvr32.exe /s sccbase.dll 
    regsvr32.exe /s slbcsp.dll 
    regsvr32.exe /s cryptdlg.dll 
    regsvr32.exe /s oleaut32.dll 
    regsvr32.exe /s ole32.dll 
    regsvr32.exe /s shell32.dll 
    regsvr32.exe /s initpki.dll 
    regsvr32.exe /s wuapi.dll 
    regsvr32.exe /s wuaueng.dll 
    regsvr32.exe /s wuaueng1.dll 
    regsvr32.exe /s wucltui.dll 
    regsvr32.exe /s wups.dll 
    regsvr32.exe /s wups2.dll 
    regsvr32.exe /s wuweb.dll 
    regsvr32.exe /s qmgr.dll 
    regsvr32.exe /s qmgrprxy.dll 
    regsvr32.exe /s wucltux.dll 
    regsvr32.exe /s muweb.dll 
    regsvr32.exe /s wuwebv.dll 
 
REM ***** Reset Winsock ***** 
    echo Resetting Winsock. 
    netsh winsock reset 
 
REM ****  Resetting WinHTTP Proxy ***** 
    echo Resetting WinHTTP Proxy. 
 
    if %family% EQU 5 ( 
        proxycfg.exe -d 
    ) else ( 
        netsh winhttp reset proxy 
    ) 
 
REM *****  Make sure the services are set to automatic  *****  
    echo Resetting the services as automatics. 
    sc.exe config wuauserv start= demand
    sc.exe config bits start= delayed-auto 
    sc.exe config cryptsvc start= auto 
    sc.exe config TrustedInstaller start= demand 
 
REM ***** Starting the Windows Update services ***** 
    echo Starting the Windows Update services. 
    net start bits 
 
    echo Starting the Windows Update services. 
    net start wuauserv 
 
    echo Starting the Windows Update services. 
    net start appidsvc 
 
    echo Starting the Windows Update services. 
    net start cryptsvc 
 
REM ***** End process ***** 
    echo The operation completed successfully check for errors. 

pause
goto start

cls
goto start

:sfc_scan
cls
echo Running Sytem file checker
sfc /scannow
pause
goto start

:mlinkmove
echo off
cls
REM ****** Stopping the Windows Update services ******

echo Stopping the Windows Update services. 
net stop wuauserv 
 
echo Canceling the Windows Update process. 
	taskkill /im wuauclt.exe /f 

rmdir /s /q C:\Windows\softwaredistribution
set NUP=
set /P NUP=Enter full path to new update destination example d:\NewDirectoryNewFolder: %=%
mkdir %NUP%
mklink /j c:\windows\softwaredistribution %NUP%
echo %NUP%
net start wuauserv 
goto start

:win_ex
notepad C:\Windows\softwaredistribution\ReportingEvents.log

goto start

:showinfo
cls
systeminfo
pause
goto start

:cmd
cmd

:end

exit /b
