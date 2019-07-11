: Windows 7+
: Inspiration - https://superuser.com/questions/472081/can-i-force-a-greater-screen-brightness-from-windows-command-prompt

@echo off

: Extract Display Brightness GUID
for /f "tokens=*" %%i in ('powercfg -q ^| find "(Display brightness)"') do set displayBrightness=%%i
set displayBrightness=%displayBrightness:~20,36%

: Ask for desired display brightness percentage value
set /P brightness=Please enter desired display brightness (0-100%%): %=%

: Set AC (wall-wart) brightness value
powercfg -SetAcValueIndex SCHEME_CURRENT SUB_VIDEO %displayBrightness% %brightness%

: Set DC (battery) brightness value
:powercfg -SetDcValueIndex %powerScheme% %dsply% %displayBrightness% %brightness%

: Reset current power scheme to the one we've just edited (refresh for Windows' sake)
powercfg -S %powerScheme%