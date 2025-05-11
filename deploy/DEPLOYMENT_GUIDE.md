# AI Virtual Keyboard Deployment Guide

## Installation Instructions

### For macOS Users:
1. Download the `AI_Virtual_Keyboard.dmg` file from the latest release
2. Double-click the DMG file to mount it
3. Drag the AI Virtual Keyboard app to your Applications folder
4. Launch the application from your Applications folder
5. When prompted, grant camera permissions to the application

### For Windows Users:
1. Download the `AI_Virtual_Keyboard_Setup.exe` file from the latest release
2. Run the installer and follow the on-screen instructions
3. Launch the application from the Start menu or desktop shortcut
4. When prompted, grant camera permissions to the application

## Usage Instructions

1. Launch the application
2. Position yourself in front of your camera
3. The virtual keyboard will appear on screen
4. Move your hand to position your index finger over the desired key
5. Press 'c' to click the key under your finger
6. Press 'q' to quit the application

## Troubleshooting

### Camera Access Issues:
- macOS: Go to System Preferences > Security & Privacy > Camera and ensure the application has permission
- Windows: Go to Settings > Privacy & Security > Camera and ensure the application has permission

### Application Not Starting:
1. Ensure you have a working webcam connected
2. Check that all required permissions are granted
3. Try restarting the application
4. If issues persist, try reinstalling the application

### Performance Issues:
1. Ensure good lighting conditions
2. Keep your hand within the camera frame
3. Avoid rapid movements
4. Ensure your camera is working at a good resolution

## Building from Source

### Prerequisites:
- Python 3.9 or higher
- pip (Python package manager)
- Git

### For macOS:
1. Install required tools:
```bash
brew install create-dmg
```

2. Clone the repository:
```bash
git clone https://github.com/yourusername/AI-Virtual-Keyboard.git
cd AI-Virtual-Keyboard
```

3. Build the application:
```bash
chmod +x deploy/build_macos.sh
./deploy/build_macos.sh
```

### For Windows:
1. Install required tools:
- Install NSIS from https://nsis.sourceforge.io/Download
- Install Python from https://www.python.org/downloads/

2. Clone the repository:
```bash
git clone https://github.com/yourusername/AI-Virtual-Keyboard.git
cd AI-Virtual-Keyboard
```

3. Build the application:
```bash
deploy\build_windows.bat
```

## Creating a New Release

1. Update version numbers in:
   - `setup.py`
   - `AI_Virtual_Keyboard.nsi`

2. Create and push a new tag:
```bash
git tag v1.0.0
git push origin v1.0.0
```

3. The GitHub Actions workflow will automatically:
   - Build the macOS DMG
   - Build the Windows EXE
   - Create a new release
   - Upload the installers

## Support

For issues and feature requests, please create an issue on the GitHub repository. 