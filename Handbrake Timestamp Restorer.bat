@echo off
:PreInit
set title=Handbrake - Original Timestamp Restorer/Preserver v1.0 by JayMontana36
TITLE %title%
IF NOT EXIST "md5.exe" (goto InitFail) else IF NOT EXIST "touch.exe" (goto InitFail) else IF NOT EXIST "libiconv2.dll" (goto InitFail) else IF NOT EXIST "libintl3.dll" (goto InitFail)
for /f %%m in ('md5.exe md5.exe') do if [%%m] NEQ [1ba73a18cfd52a8b338283d2f532a785] (goto InitFail) else for /f %%t in ('md5.exe touch.exe') do if [%%t] NEQ [a5297e58b61ae30d539e2da2083f2580] (goto InitFail) else for /f %%g in ('md5.exe libintl3.dll') do if [%%g] NEQ [db7aabf38d66b4f8152f12e0f313d00c] (goto InitFail) else for /f %%l in ('md5.exe libiconv2.dll') do if [%%l] NEQ [331f570aa7c20bc93deb7b237b21cc9c] (goto InitFail)

:SetDirFileInfo
cls
echo %title%
echo.
:SetSourceDir
set /p sdir="Source Folder: "
IF NOT EXIST "%sdir%" (goto SetSourceDir)
:SetSourceFileExtension
set /p sfe="Source File Extension: "
IF NOT EXIST "%sdir%\*.%sfe%" (goto SetSourceFileExtension)
:SetOutputDir
set /p odir="Output Folder: "
IF NOT EXIST "%odir%" (goto SetOutputDir)
:SetOutputFileExtension
set /p ofe="Output File Extension: "
IF NOT EXIST "%odir%\*.%ofe%" (goto SetOutputFileExtension)

:RestoreTimestampsSummary
cls
echo %title%
echo.
echo Summary:
echo Ready to copy timestamps whenever you're ready.
echo.
echo - Timestamps will be copied -
echo --From "%sdir%\*.%sfe%"
echo ----To "%odir%\*.%ofe%"
echo.
pause
echo.

:RestoreTimestampsProcess
echo ...
for %%a in ("%sdir%\*.%sfe%") do touch.exe -r "%sdir%\%%~na.%sfe%" "%odir%\%%~na.%ofe%"
echo.
echo Complete!
echo.
echo Successfully copied timestamp information from
echo "%sdir%\*.%sfe%" to "%odir%\*.%ofe%".
echo.
pause
goto end

:InitFail
cls
echo Failed to start %title%:
echo.
echo Could not find and/or successfully verify one or more required binaries.
echo.
pause
exit

:end
cls
echo %title%
echo.
echo Handbrake - Original Timestamp Restorer/Preserver was originally created and maintained by JayMontana36.
echo.
echo Official Website: https://sites.google.com/site/jaymontana36jasen - Bookmark my website for easy access if you'd like,
echo as I will be updating it in the future with new scripts, content, and programs. Site - https://goo.gl/3SCLQN
echo.
echo YouTube: https://www.youtube.com/channel/UCMbJVrfppFn5aAz5C50LoZA - Please subscribe if you haven't already, as 
echo I'll be uploading Tutorials and other content in the future. [JM36] JayMontana36 TV - https://goo.gl/aMknzL
echo.
echo So what do we do now? You may copy more timestamps by typing "setdirfileinfo", open my website by typing "site", open my YouTube channel by typing "yt", or exit with "exit" (or of course, type something invalid to exit)
echo.
set /p sel="%username%@%computername%>"
goto %sel%

:exit
exit

:site
start https://sites.google.com/site/jaymontana36jasen
goto end

:yt
start https://www.youtube.com/channel/UCMbJVrfppFn5aAz5C50LoZA
goto end
