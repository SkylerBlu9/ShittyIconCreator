ECHO OFF
CLS
echo [94m __ _     _ _   _            _____                    ___               _             
echo / _\ ^|__ (_) ^|_^| ^|_ _   _    \_   \___ ___  _ __     / __\ __ ___  __ _^| ^|_ ___  _ __ 
echo \ \^| '_ \^| ^| __^| __^| ^| ^| ^|    / /\/ __/ _ \^| '_ \   / / ^| '__/ _ \/ _\ ^| __/ _ \^| '__^|
echo _\ \ ^| ^| ^| ^| ^|_^| ^|_^| ^|_^| ^| /\/ /_^| (_^| (_) ^| ^| ^| ^| / /__^| ^| ^|  __/ (_^| ^| ^|^| (_) ^| ^|   
echo \__/_^| ^|_^|_^|\__^|\__^|\__, ^| \____/ \___\___/^|_^| ^|_^| \____/_^|  \___^|\__,_^|\__\___/^|_^|   
echo                     ^|___/                                                   
echo    ___         __ _          _            ___ _        ___  
echo   / __\_   _  / _\ ^| ___   _^| ^| ___ _ __ / __\ ^|_   _ / _ \ 
echo  /__\// ^| ^| ^| \ \^| ^|/ / ^| ^| ^| ^|/ _ \ '__/__\// ^| ^| ^| ^| (_) ^|
echo / \/  \ ^|_^| ^| _\ \   ^<^| ^|_^| ^| ^|  __/ ^| / \/  \ ^| ^|_^| ^|\__, ^|
echo \_____/\__, ^| \__/_^|\_\\__, ^|_^|\___^|_^| \_____/_^|\__,_^|  /_/ 
echo        ^|___/           ^|___/                                 [0m
:MENU
ECHO ...............................................
ECHO 1 - Install ImageMagick (REQUIRED!)
ECHO 2 - Create PlayStation 1 Icons
ECHO 3 - EXIT
SET /P M=Type your choice, then press ENTER.
IF %M%==1 GOTO INS_IM
IF %M%==2 GOTO PS1
IF %M%==3 GOTO EOF
PAUSE

mkdir output
ECHO Output Folder creation attempt made!
PAUSE

:PS1
ECHO Attempting to create output folder!
if exist output\ (
  echo Already exists!
) else (
  mkdir output
  ECHO Folder created!
)
ECHO Converting Images into 256x256 and applying PlayStation 1 banner...
::converts any input images into 256x256, applies the PS1 banner, then puts it in the output folder
magick convert ".\input\*.*" -resize 256x256! -draw "image Over 0,0 0,0 '.\banners\ps1.png'" -gravity south -set filename:fn "%%t" ".\output\%%[filename:fn]_ps1banner.png"
ECHO Completed!
PAUSE
GOTO MENU

:INS_IM
winget install ImageMagick
ECHO Completed!
pause
GOTO MENU