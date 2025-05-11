# AI Virtual Keyboard - Deployment Guide

## Quick Start

### For macOS Users
1. Navigate to the `macos` folder
2. Double-click `AI_Virtual_Keyboard.app`
3. Grant camera permissions when prompted
4. Use the keyboard:
   - Move your hand to position the crosshair over a key
   - Press 'c' to click the key
   - Press 'q' to quit

### For Windows Users
1. Navigate to the `windows` folder
2. Double-click `AI_Virtual_Keyboard.exe`
3. Grant camera permissions when prompted
4. Use the keyboard:
   - Move your hand to position the crosshair over a key
   - Press 'c' to click the key
   - Press 'q' to quit

## System Requirements

### macOS
- macOS 10.13 or later
- Webcam
- Camera permissions enabled

### Windows
- Windows 10 or later
- Webcam
- Camera permissions enabled

## Installation from Source

If you want to build the application from source:

1. Install Python 3.7 or higher
2. Install required packages:
```bash
pip install -r requirements.txt
```

3. Run the application:
```bash
python main.py
```

## Troubleshooting

### Camera Access Issues
1. Check System Settings > Privacy & Security > Camera
2. Ensure the application has camera permissions
3. Try closing other applications that might be using the camera

### Application Not Starting
1. Ensure all dependencies are installed
2. Check if your webcam is properly connected
3. Try running the application with administrator privileges

### Performance Issues
1. Ensure good lighting conditions
2. Keep your hand steady
3. Close other applications using the camera

## Building from Source

### For macOS
```bash
# Install py2app
pip install py2app

# Build the application
python setup.py py2app
```

### For Windows
```bash
# Install PyInstaller
pip install pyinstaller

# Build the executable
pyinstaller --onefile --windowed --name "AI_Virtual_Keyboard" main.py
```

## Support

If you encounter any issues:
1. Check the troubleshooting section
2. Ensure your system meets the requirements
3. Try running from source for detailed error messages

## License

This project is licensed under the MIT License. 