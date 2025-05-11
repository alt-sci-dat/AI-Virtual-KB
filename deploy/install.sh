#!/bin/bash

echo "Installing AI Virtual Keyboard..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3.7 or higher."
    exit 1
fi

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -r requirements.txt

# Build the application
python setup.py py2app

echo "Installation complete!"
echo "You can find the application in the dist folder."
echo "Please grant camera permissions when running the application." 