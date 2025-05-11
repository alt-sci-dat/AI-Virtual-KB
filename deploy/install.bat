@echo off
echo Installing AI Virtual Keyboard...

:: Create Program Files directory if it doesn't exist
if not exist "%ProgramFiles%\AI Virtual Keyboard" mkdir "%ProgramFiles%\AI Virtual Keyboard"

:: Copy files
xcopy /E /I /Y "AI_Virtual_Keyboard" "%ProgramFiles%\AI Virtual Keyboard"

:: Create desktop shortcut
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\AI Virtual Keyboard.lnk');$s.TargetPath='%ProgramFiles%\AI Virtual Keyboard\AI_Virtual_Keyboard.exe';$s.Save()"

echo Installation complete! You can find AI Virtual Keyboard in your Start menu and desktop.
pause 