#!/bin/bash

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This installer is for macOS only"
    exit 1
fi

# Create Applications directory if it doesn't exist
mkdir -p ~/Applications

# Copy the app to Applications
cp -R "AI_Virtual_Keyboard.app" ~/Applications/

# Set permissions
chmod +x ~/Applications/AI_Virtual_Keyboard.app/Contents/MacOS/AI_Virtual_Keyboard

echo "Installation complete! You can find AI Virtual Keyboard in your Applications folder." 