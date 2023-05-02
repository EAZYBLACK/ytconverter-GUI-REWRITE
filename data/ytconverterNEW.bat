:: EazyMods Made by Eazyblack Developer
@echo off
echo Logs:
echo Keep This Open
:c1
set cres1=-200
set cres2=-200
set wres1=200
set wres2=200
set a1=Video (mp4),Audio (mp3),Exit App& set title=YT Converter
set msgvar=Choose Video or Audio Download
call :choice "YT Converter" "%a1%" CH
if not defined CH exit /b

:d8
if "%CH%"=="Video (mp4)" goto :video1
if "%CH%"=="Audio (mp3)" goto :audio1
if "%CH%"=="Exit App" exit /b
if not defined CH exit /b

:video1
set a3=Simple,Advanced,Exit App
set msgvar=Choose Simple Or Advanced
call :choice "YT Converter" "%a3%" CH2
if not defined CH2 exit /b
if "%CH2%"=="Simple" goto :simplevideo
if "%CH2%"=="Advanced" goto :advancedvideo
if "%CH2%"=="Exit App" exit /b
if not defined CH2 exit /b

:simplevideo
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter youtube link to download:', 'YT Converter')}" > %TEMP%\outeazymodsyt1.tmp
set /p linkmp4=<%TEMP%\outeazymodsyt1.tmp
if not defined linkmp4 exit /b
echo %linkmp4%
pause
set wres1=200
set wres2=360
set a7=144,240,360,480,720,1080,1440,2160,4320
set msgvar=Choose quality
call :choice "YT Converter" "%a7%" CH3
if "%CH3%"=="144" set qtmp4=144
if "%CH3%"=="240" set qtmp4=240
if "%CH3%"=="360" set qtmp4=360
if "%CH3%"=="480" set qtmp4=480
if "%CH3%"=="720" set qtmp4=720
if "%CH3%"=="1080" set qtmp4=1080
if "%CH3%"=="1440" set qtmp4=1440
if "%CH3%"=="2160" set qtmp4=2160
if "%CH3%"=="4320" set qtmp4=4320
if not defined CH3 exit /b
echo %qtmp4%
echo %linkmp4%
pause

:advancedvideo
echo Not Ready yet
echo press any key to exit
pause >nul
exit /b

:audio1
echo Not Ready yet
echo press any key to exit
pause >nul
exit /b
:: HTA File in a variable , so no temp files
:choice
setlocal & set "rd=about:<title>%~1</title><head><script language='javascript'>window.moveTo(%cres1%,%cres2%);window.resizeTo(%wres1%,%wres2%);"
set "rd=%rd% </script><hta:application innerborder='no' sysmenu='yes' scroll='no'><style>body{background-color:#157a74;}"
set "rd=%rd% br{font-size:14px;vertical-align:-4px;} .button{background-color:#faac02;border:2px solid #faac02; color:black;"
set "rd=%rd% padding:4px 4px;text-align:center;text-decoration:none;display:inline-block;font-size:16px;cursor:pointer;"
set "rd=%rd% width:100%%;display:block;}</style></head><script language='javascript'>function choice(){"
set "rd=%rd% var opt=document.getElementById('options').value.split(','); var btn=document.getElementById('buttons');"
set "rd=%rd% for (o in opt){var b=document.createElement('button');b.className='button';b.onclick=function(){
set "rd=%rd% close(new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(this.value));};"
set "rd=%rd% b.appendChild(document.createTextNode(opt[o]));btn.appendChild(b);btn.appendChild(document.createElement('br'));};"
set "rd=%rd% btn.appendChild(document.createElement('br'));var r=window.parent.screen;"
set "rd=%rd% window.moveTo(r.availWidth/3,r.availHeight/6);window.resizeTo(r.availWidth/3,document.body.scrollHeight);}</script>"
set "rd=%rd% <body onload='choice()'><h1>Welcome to YTConverter</h1><p>%msgvar%</p><div id='buttons'/><input type='hidden' name='options' value='%~2'></body>"
for /f "usebackq tokens=* delims=" %%# in (`mshta "%rd%"`) do set "choice_var=%%#"
endlocal & set "%~3=%choice_var%" & exit /b





