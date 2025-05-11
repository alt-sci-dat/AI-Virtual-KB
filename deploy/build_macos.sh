#!/bin/bash

# Clean previous builds
rm -rf build dist

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
    pip install py2app
else
    source venv/bin/activate
fi

# Build the application
python setup.py py2app

# Create DMG
create-dmg \
    --volname "AI Virtual Keyboard" \
    --volicon "deploy/icon.icns" \
    --window-pos 200 120 \
    --window-size 800 400 \
    --icon-size 100 \
    --icon "AI Virtual Keyboard.app" 200 190 \
    --hide-extension "AI Virtual Keyboard.app" \
    --app-drop-link 600 185 \
    "dist/AI_Virtual_Keyboard.dmg" \
    "dist/AI Virtual Keyboard.app" 