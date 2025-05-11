@echo off

REM Clean previous builds
rmdir /s /q build dist

REM Create virtual environment if it doesn't exist
if not exist venv (
    python -m venv venv
    call venv\Scripts\activate.bat
    pip install -r requirements.txt
    pip install pyinstaller
) else (
    call venv\Scripts\activate.bat
)

REM Build the application
pyinstaller --noconfirm --onefile --windowed --icon "deploy/icon.ico" --name "AI_Virtual_Keyboard" main.py

REM Create installer using NSIS
makensis AI_Virtual_Keyboard.nsi 