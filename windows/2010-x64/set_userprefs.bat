:script courtesy of John P. Neumann
:john@animateshmanimate.com

@echo off

:use the userprofile variable to gain access to the folder
:and then copy your user preferences into it
:this script assumes your prefs folder is in the
:root directory of where you run the script from

:get the users input for the version of windows they're using
:windowsVersion
echo What version of windows are you using?
echo Enter 1 for XP and lower
echo Enter 2 for Vista and higher
set windowsVersion=
set /P windowsVersion=1 or 2?

if "%windowsVersion%" == "" (
echo Nothing is entered
goto windowsVersion
)
if /I "%WindowsVersion%" == "1" (
set docLoc=MyDocu~1
) else (
if /I "%WindowsVersion%" == "2" (
set docLoc=Documents
) else (
echo You've entered an invalid option
echo exiting
goto exit
)
)

:copy your entire prefs directory
:the benefit to this is that all of your hotkeys
:will be copied as well as any other prefs you have
:this does NOT copy empty directories which is more
:intelligent and less intensive
:*****
echo Copying prefs directory...
%systemroot%\system32\xcopy.exe /S /R /Y /C /V 2010-x64 "%userprofile%\%docLoc%\maya\2010-x64"

if errorlevel 0 goto success
if errorlevel 1 goto nofiles
if errorlevel 4 goto nomem
if errorlevel 5 goto diskerr

:nofiles
echo no files found to be copied
echo this will tell you the file was copied
echo but the file did not. it is a problem with
echo microsofts implementation of xcopy and errror levels
goto exit

:nomem
echo no memory available or invalid drive name
goto exit

:diskerr
echo disk error occurred. contact your system admin
goto exit

:success
echo prefs folder copied...
echo *******************
echo ...WARNING...
echo if this script returned with 0 files copied it's because 
echo your file doesn't exist. this script will tell you the file was copied 
echo but the file did not. it is a problem with microsofts implementation 
echo of xcopy and error levels
echo *******************
echo New versions of this script can be downloaded from https://www.creativecrash.com/maya/downloads/scripts-plugins/utility-external/export/c/user-preferences-saver-loader
echo Any issues please email john@animateshmanimate.com with the details
echo This work is licensed under the 3-clause BSD ("New BSD License") license. 
echo Full license information can be attained at:
echo http://animateshmanimate.com/rigs_n_scripts/script-licensing/
echo *******************
goto exit

:abort 
echo You pressed CTRL+C to end the copy operation. 
goto exit 

:exit
pause