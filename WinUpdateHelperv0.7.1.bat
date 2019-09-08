@echo off

set workstationmode=Local Workstation
rem check for temp directory if temp does not exist make it.

	set LUP=C:\WUH
	if exist "c:\WUH" ( 
        goto start
   	 ) else mkdir c:\WUH
:start

REM ***** Set Datae as dateGblobal *****

for /F "tokens=1-4 delims=/ " %%i in ('date /t') do (

    set Day=%%i

    set Month=%%j

    set Year=%%k

    set DateGlobal=%%i-%%j-%%k

)


REM Check opertating system by build number


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

REM Check if admin


@ECHO OFF
REM Test If script has Admin Priviledges/is elevated
net session > NUL
IF %ERRORLEVEL% EQU 0 (
    set adminp= OK Running as admin
) ELSE (
    set adminp= Not running as admin 
  
)
color 17
REM setup the menu

cls
title Windows Update Helper

echo.
echo  **    **     **  **    ** **     **   ****************	
echo  **    **     **  **    ** **     **   *  %DateGlobal%  *	
echo  **    **     **  **    ** *********   ****************
echo  **    **     **  **    ** *********   BETA 0.7.1 
echo   *****   *****   **    ** **     **  %adminp% Mode - %workstationmode%
echo    ***     ***     ******  **     **   Logs goto %LUP%   
echo  -----------------------------------   Windows family: %family%

:MENU
echo off
echo.
echo	   Is  %name% %version%compatible with this tool? A) %permit%
echo.	  
echo       1. Manually run Windows Update for Vista, 7, 8, 10
echo       2. Rename Software distribution Folder and create new folder. This is not a full reset.
echo       3. Full reset of windows update
echo       4. Scan for File corruption 
echo       5. Move Windows updates to another disk
echo       6. Open WinUpdate log file
echo       7. Show system information 
echo       8. Run DISM Check
echo       9. Set log file directory
echo      10. Run DISM Restore
echo      11. Show installed updates
echo      12. Remote Execution Menu
echo      97. Features to be added 
echo      98. Show licence 
echo      99. Quit

echo.
set choice=
set /p choice=      Enter option or press 99 to Quit. Your entered choice is =
echo.
	if not '%choice%'=='' set choice=%choice:~0,2%
	if '%choice%'=='0' goto cmd
	if '%choice%'=='1' goto windowsupdate
	if '%choice%'=='2' goto SDFold
	if '%choice%'=='3' goto resetwindowsupdate
	if '%choice%'=='4' goto sfc_scan
	if '%choice%'=='5' goto MlinkMove
	if '%choice%'=='6' goto win_ex
	if '%choice%'=='7' goto showinfo
	if '%choice%'=='8' goto dismc
	if '%choice%'=='9' goto log 
	if '%choice%'=='10' goto dismR
	if '%choice%'=='11' goto winv7810	
	if '%choice%'=='97' goto newops
	if '%choice%'=='98' goto licence
	if '%choice%'=='99' goto End
echo.
echo.
echo "%choice%" is not a valid option - try again
echo.
pause
goto start


:windowsupdate
REM call "C:\Users\rcwad\OneDrive\Desktop\update menu\windowsupdate.bat"
control /name Microsoft.WindowsUpdate
goto start
cls
goto start

REM rename old folder option 2

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

REM full reset script 

:resetwindowsupdate
cls

REM ***** Set Datae as dateGblobal *****

cls
echo ******************
echo *  %DateGlobal%    *
echo ******************

Echo You are about to fully reset windows update history will be backed up to softwaredistribution.bak
pause

REM ****** Stopping the Windows Update services ******
	echo Stopping the Windows Update services. 
	net stop bits >> %LUP%\WindowsUpdatelog%dateglobal%.log
	 
	echo Stopping the Windows Update services. 
	net stop wuauserv >> %LUP%\WindowsUpdatelog%dateglobal%.log
 
	echo Stopping the Windows Update services. 
	net stop appidsvc >> %LUP%\WindowsUpdatelog%dateglobal%.log
 
	echo Stopping the Windows Update services. 
	net stop cryptsvc >> %LUP%\WindowsUpdatelog%dateglobal%.log
 
	echo Canceling the Windows Update process. 
	taskkill /im wuauclt.exe /f >> %LUP%\WindowsUpdatelog%dateglobal%.log

echo off

REM ****** Checking the services status ******
	echo Checking the services status. 
 
    	sc query bits | findstr /I /C:"STOPPED" 
   	 if %errorlevel% NEQ 0 ( 
        echo.    Failed to stop the BITS service. >> %LUP%\WindowsUpdatelog%dateglobal%.log
        echo. 
        echo.Press any key to continue . . . 
        pause>nul 
        goto :start
    ) 
 
echo Checking the services status. 
 
   	sc query wuauserv | findstr /I /C:"STOPPED" 
   	if %errorlevel% NEQ 0 ( 
        echo.    Failed to stop the Windows Update service. >> %LUP%\WindowsUpdatelog%dateglobal%.log
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
        echo.    Failed to stop the Application Identity service. >> %LUP%\WindowsUpdatelog%dateglobal%.log
        echo. 
        echo.Press any key to continue . . . 
        pause>nul 
        if %family% NEQ 6 goto :start
        ) 
    ) 
 
echo Checking the services status. 
 
    	sc query cryptsvc | findstr /I /C:"STOPPED" 
    	if %errorlevel% NEQ 0 ( 
        echo    Failed to stop the Cryptographic Services service. >> %LUP%\WindowsUpdatelog%dateglobal%.log
        echo
        echo Press any key to continue . . . 
        pause>nul 
        goto :start
    ) 
echo off
REM ***** Delete the qmgr*.dat files *****
 echo Deleting the qmgr*.dat files. 
 
    del /s /q /f "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat" >> %LUP%\WindowsUpdatelog%dateglobal%.log
    del /s /q /f "%ALLUSERSPROFILE%\Microsoft\Network\Downloader\qmgr*.dat" >> %LUP%\WindowsUpdatelog%dateglobal%.log
 
REM ******Renaming the softare distribution folders backup copies ******
    echo Deleting the old software distribution backup copies. >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
    cd /d %SYSTEMROOT% 
 
    if exist "%SYSTEMROOT%\winsxs\pending.xml.bak" ( 
        del /s /q /f "%SYSTEMROOT%\winsxs\pending.xml.bak" >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 
    if exist "%SYSTEMROOT%\SoftwareDistribution.bak" ( 
        rmdir /s /q "%SYSTEMROOT%\SoftwareDistribution.bak" >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 
    if exist "%SYSTEMROOT%\system32\Catroot2.bak" ( 
        rmdir /s /q "%SYSTEMROOT%\system32\Catroot2.bak" >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 
    if exist "%SYSTEMROOT%\WindowsUpdate.log.bak" ( 
        del /s /q /f "%SYSTEMROOT%\WindowsUpdate.log.bak" >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 
echo off
echo Renaming the software distribution folders. >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
    if exist "%SYSTEMROOT%\winsxs\pending.xml" ( 
        takeown /f "%SYSTEMROOT%\winsxs\pending.xml" 
        attrib -r -s -h /s /d "%SYSTEMROOT%\winsxs\pending.xml" 
        ren "%SYSTEMROOT%\winsxs\pending.xml" pending.xml.bak >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 
    if exist "%SYSTEMROOT%\SoftwareDistribution" ( 
        attrib -r -s -h /s /d "%SYSTEMROOT%\SoftwareDistribution" 
        ren "%SYSTEMROOT%\SoftwareDistribution" SoftwareDistribution.bak_%DateGlobal%
        if exist "%SYSTEMROOT%\SoftwareDistribution" ( 
	echo
	echo    Failed to rename the SoftwareDistribution folder. >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
	echo
	pause
   	goto :start
        ) 
    ) 
    if exist "%SYSTEMROOT%\system32\Catroot2" ( 
        attrib -r -s -h /s /d "%SYSTEMROOT%\system32\Catroot2" 
        ren "%SYSTEMROOT%\system32\Catroot2" Catroot2.bak >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 
    if exist "%SYSTEMROOT%\WindowsUpdate.log" ( 
        attrib -r -s -h /s /d "%SYSTEMROOT%\WindowsUpdate.log" 
        ren "%SYSTEMROOT%\WindowsUpdate.log" WindowsUpdate.log.bak >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    ) 

REM ****** Make sure all BITS DLL files and the Windows Update files are registered ******
	echo Reregister the BITS files and the Windows Update files. 
 
   	cd /d %SYSTEMROOT%\system32 
   	regsvr32.exe /s atl.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s urlmon.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s mshtml.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s shdocvw.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s browseui.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s jscript.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
  	regsvr32.exe /s vbscript.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s scrrun.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s msxml.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s msxml3.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s msxml6.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s actxprxy.dll >>%LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s softpub.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wintrust.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s dssenh.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s rsaenh.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s gpkcsp.dll > >%LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s sccbase.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s slbcsp.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s cryptdlg.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
  	regsvr32.exe /s oleaut32.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s ole32.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	regsvr32.exe /s shell32.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s initpki.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
  	regsvr32.exe /s wuapi.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wuaueng.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wuaueng1.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wucltui.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wups.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wups2.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wuweb.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s qmgr.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s qmgrprxy.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wucltux.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s muweb.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	regsvr32.exe /s wuwebv.dll >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log

REM ***** Reset Winsock ***** 
    	echo Resetting Winsock. 
    	netsh winsock reset >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
REM ****  Resetting WinHTTP Proxy ***** 
   	 echo Resetting WinHTTP Proxy. >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
    	if %family% EQU 5 ( 
        proxycfg.exe -d 
   	 ) else ( 
        netsh winhttp reset proxy >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	 ) 
 
REM *****  Make sure the services are set to automatic  *****  
    	echo Resetting the services as automatics. >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	sc.exe config wuauserv start= demand >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	sc.exe config bits start= delayed-auto >>%LUP%\FR_WindowsUpdatelog%dateglobal%.log
   	sc.exe config cryptsvc start= auto >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
    	sc.exe config TrustedInstaller start= demand >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 	
REM ***** Starting the Windows Update services ***** 
    	echo Starting the Windows Update services. 
    	net start bits >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
    	echo Starting the Windows Update services. 
    	net start wuauserv >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
    	echo Starting the Windows Update services. 
   	 net start appidsvc >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
   	 echo Starting the Windows Update services. 
    	net start cryptsvc >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log
 
REM ***** End process ***** 
    	echo The operation completed successfully check for errors. >> %LUP%\FR_WindowsUpdatelog%dateglobal%.log

	pause

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
	net stop wuauserv >> %LUP%\mlinkWindowsUpdatelog%dateglobal%.log
 
	echo Canceling the Windows Update process. 
	taskkill /im wuauclt.exe /f >> %LUP%\mlinkWindowsUpdatelog%dateglobal%.log

	
	set NUP=
	set /P NUP=Enter full path to new update destination example d:\NewDirectoryNewFolder: %=%
	mkdir %NUP%
	xcopy c:\windows\softwaredistribution\*.* %NUP% >> %LUP%\mlinkWindowsUpdatelog%dateglobal%.log
	echo Copy Complete. Upades moved to echo %NUP%
	pause
	mklink /j c:\windows\softwaredistribution %NUP% >> %LUP%\mlinkWindowsUpdatelog%dateglobal%.log
	echo %NUP% >> %LUP%\mlinkWindowsUpdatelog%dateglobal%.log
	rmdir /s /q C:\Windows\softwaredistribution
	net start wuauserv 
	goto start

:win_ex
	call notepad C:\Windows\softwaredistribution\ReportingEvents.log

goto start
: newops

echo off
cls
	echo (1) DISM online \ off line chocie
	echo (2) Set DISM offlilne image path 
	echo (3) Remote execution of windows update
	echo (4) List remote machine installed updates
	echo (5) Colours for settings
	pause
	echo off
	cls
	goto start

:showinfo
		cls
	systeminfo >> %LUP%\%computername%_WindowsUpdatelog%dateglobal%.txt
 	call %LUP%\%computername%_WindowsUpdatelog%dateglobal%.txt
	
goto start
: winv7810
	echo Updates installed on %computernamae% > %LUP%\InstalledindowsUpdatelog%dateglobal%.txt
	
	wmic qfe list full  >> %LUP%\InstalledindowsUpdatelog%dateglobal%.txt
	wmic qfe list full
	echo output sent to %LUP%\InstalledWindowsUpdatelog%dateglobal%.txt
	pause
	echo off
	goto start
:cmd
	cmd
:dismc
	cls
	DISM /Online /Cleanup-Image /CheckHealth	> %LUP%\%computername%_check_health_WindowsUpdatelog%dateglobal%.log
	call notepad %LUP%\%computername%_check_health_WindowsUpdatelog%dateglobal%.log
	echo off
	goto start

:dismr
	cls
	DISM /Online /Cleanup-Image /RestoreHealth	> %LUP%\%computername%_restore_health_WindowsUpdatelog%dateglobal%.log
	call notepad %LUP%\%computername%_restore_health_WindowsUpdatelog%dateglobal%.log
	pause
	echo off
	goto start

REM Make log file directory
:log

	set LUP=
	set /P LUP=Enter full path to new log directory: %=%
	if exist "%LUP% " ( 
        echo %LUP% already exists
	) else mkdir %LUP%

	echo %LUP%\
	echo off
	goto start

:licence 
cls
echo  *******************************************************************************************************************
echo    Version 0.6 Beta Version 				  					            
echo    No warranty offered or implied 								                    
echo    GNU General Public License v2.0 
echo    Any issues bugs or faults please contact me https://linkedin.com/in/rcwadsworth                                                                
echo    You use at your own risk. This is a beta version only windows 10 is supported                           
echo  *******************************************************************************************************************
echo.
pause
cls

	echo off
goto start
:end

	exit /b

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i