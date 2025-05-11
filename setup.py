from setuptools import setup

APP = ['main.py']
DATA_FILES = []
OPTIONS = {
    'argv_emulation': True,
    'packages': ['cv2', 'cvzone', 'mediapipe', 'numpy', 'pynput'],
    'plist': {
        'CFBundleName': 'AI Virtual Keyboard',
        'CFBundleDisplayName': 'AI Virtual Keyboard',
        'CFBundleGetInfoString': "Virtual Keyboard using Hand Gestures",
        'CFBundleIdentifier': "com.aivirtualkeyboard.app",
        'CFBundleVersion': "1.0.0",
        'CFBundleShortVersionString': "1.0.0",
        'NSHumanReadableCopyright': u"Copyright © 2024, All Rights Reserved"
    }
}

setup(
    name="AI Virtual Keyboard",
    app=APP,
    data_files=DATA_FILES,
    options={'py2app': OPTIONS},
    setup_requires=['py2app'],
) 