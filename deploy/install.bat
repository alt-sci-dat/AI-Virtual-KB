@echo off
echo Installing AI Virtual Keyboard...

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed. Please install Python 3.7 or higher.
    exit /b 1
)

REM Create virtual environment
python -m venv venv
call venv\Scripts\activate.bat

REM Install requirements
pip install -r requirements.txt

REM Build the application
pyinstaller --onefile --windowed --name "AI_Virtual_Keyboard" main.py

echo Installation complete!
echo You can find the executable in the dist folder.
echo Please grant camera permissions when running the application.
pause 