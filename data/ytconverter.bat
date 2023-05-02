@echo off
if "%1"=="--developer-mode" GOTO devmode
title YT MP4/MP3 Converter
color 3
echo Welcome To YT Converter
echo ---------------------------------------
echo Choose MP4 or MP3
echo 1 = MP4
echo 2 = MP3
choice /c:12
IF ERRORLEVEL 2 GOTO mp3
IF ERRORLEVEL 1 GOTO mp4
:mp4
echo Choose For Simple Or Advanced Options
echo S = Simple
echo A = Advanced
choice /c:SA
IF ERRORLEVEL 2 GOTO advanced
IF ERRORLEVEL 1 GOTO simple
:simple
echo Enter Youtube link:
set /p ytlink=
:svq
echo Select Video Quality:
echo Quality Options:
echo 144 (Blurry)
echo 240
echo 360
echo 480
echo 720 (Default, Good for 26inch tvs)
echo 1080 (recommend)
echo 1440 (2K QHD)
echo 2160 (4K UHD)
echo 4320 (8K UHD)
echo If the quality you chose is not available in the video it will choose the highest possible
echo Type One of these above below
echo 720 Is the default
echo note : dont add p to the end of the quality 720 not 720p
echo Enter Below:
set ytquality=720
set /p ytquality=
if /i "%ytquality%"=="144" goto filename
if /i "%ytquality%"=="240" goto filename
if /i "%ytquality%"=="360" goto filename
if /i "%ytquality%"=="480" goto filename
if /i "%ytquality%"=="720" goto filename
if /i "%ytquality%"=="1080" goto filename
if /i "%ytquality%"=="1440" goto filename
if /i "%ytquality%"=="2160" goto filename
if /i "%ytquality%"=="4320" goto filename
if /i "%ytquality%"=="8640" goto filename
echo Invalid Quality Input Setting Default to 720
set ytquality=720
:filename
echo What name will the file have
echo Type the filename below:
set /p filename=
echo Choose Folder to save
echo 1 Downloaded Videos in Videos Folder
echo 2 Download Videos in Desktop
echo 3 Custom path
choice /c:123
IF ERRORLEVEL 3 GOTO mp4simplecustom
IF ERRORLEVEL 2 GOTO mp4simpledesktop
IF ERRORLEVEL 1 GOTO mp4simplevideos
:mp4simplevideos
if not exist "%userprofile%\Videos\Downloaded Videos\" mkdir "%userprofile%\Videos\Downloaded Videos"
set mp4simplepathvideos=%userprofile%\Videos\Downloaded Videos
echo Press any key to download.
pause >nul
echo Downloading...
yt-dlp -S res:%ytquality%,ext:mp4:m4a --ffmpeg-location ffmpeg\ --recode mp4 %ytlink% -o "%mp4simplepathvideos%\%filename%"
echo Done
goto :end
:mp4simpledesktop
if not exist "%userprofile%\Desktop\Downloaded Videos\" mkdir "%userprofile%\Desktop\Downloaded Videos"
set mp4simplepathdesktop=%userprofile%\Desktop\Downloaded Videos
echo Press any key to download.
pause >nul
echo Downloading...
yt-dlp -S res:%ytquality%,ext:mp4:m4a --ffmpeg-location ffmpeg\ --recode mp4 %ytlink% -o "%mp4simplepathdesktop%\%filename%"
echo Done
goto :end
:mp4simplecustom
echo Enter Custom Path without quotes even if it has space and without \ at the end
set /p mp4simplepathcustom=
echo Press any key to download.
pause >nul
echo Downloading...
yt-dlp -S res:%ytquality%,ext:mp4:m4a --ffmpeg-location ffmpeg\ --recode mp4 %ytlink% -o "%mp4simplepathcustom%\%filename%"
echo Done
goto :end
:advanced
echo Not ready yet
goto :end
:mp3
echo Choose For Simple Or Advanced Options
echo S = Simple
echo A = Advanced
choice /c:SA
IF ERRORLEVEL 2 GOTO advanced2
IF ERRORLEVEL 1 GOTO simple2
:simple2
echo Enter Youtube link:
set /p ytlink2=
echo What name will the file have
echo Type the filename below:
set /p filename=
echo Choose Folder to save
echo 1 Downloaded Music in Music Folder
echo 2 Download Music in Desktop
echo 3 Custom path
choice /c:123
IF ERRORLEVEL 3 GOTO mp3simplecustom
IF ERRORLEVEL 2 GOTO mp3simpledesktop
IF ERRORLEVEL 1 GOTO mp3simpleMusic
:mp3simpleMusic
if not exist "%userprofile%\Music\Downloaded Music\" mkdir "%userprofile%\Music\Downloaded Music"
set mp3simplepathMusic=%userprofile%\Music\Downloaded Music
echo Press any key to download.
pause >nul
echo Downloading...
yt-dlp --audio-format mp3 -x --ffmpeg-location ffmpeg\ %ytlink2% -o "%mp3simplepathMusic%\%filename%"
echo Done
goto :end
:mp3simpledesktop
if not exist "%userprofile%\Desktop\Downloaded Music\" mkdir "%userprofile%\Desktop\Downloaded Music"
set mp3simplepathdesktop=%userprofile%\Desktop\Downloaded Music
echo Press any key to download.
pause >nul
echo Downloading...
yt-dlp --audio-format mp3 -x --ffmpeg-location ffmpeg\ %ytlink2% -o "%mp3simplepathdesktop%\%filename%"
echo Done
goto :end
:mp3simplecustom
echo Enter Custom Path without quotes even if it has space and without \ at the end
set /p mp3simplepathcustom=
echo Press any key to download.
pause >nul
echo Downloading...
yt-dlp --audio-format mp3 -x --ffmpeg-location ffmpeg\ %ytlink2% -o "%mp3simplepathcustom%\%filename%"
echo Done
goto :end
:advanced2
echo Not ready yet
goto :end
:end
echo Thanks For using My Free YT Converter
echo By EAZYBLACK , from eazy mods
echo https://eazymods.cf
echo Press any key to exit
pause >nul
exit
:devmode
cls
color 2
echo Welcome to developer mode for yt-dlp.exe
echo Add any parameters to the input box 
echo You dont need to add ffmpeg location its already there
echo README will open
start notepad devmode.txt
echo Input Below:
set /p parameters=
yt-dlp --fmpeg-location ffmpeg/ %parameters%
pause
goto :end