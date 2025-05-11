from setuptools import setup

APP = ['main.py']
DATA_FILES = []
OPTIONS = {
    'argv_emulation': True,
    'packages': ['cv2', 'numpy', 'pynput'],
    'plist': {
        'CFBundleName': 'AI Virtual Keyboard',
        'CFBundleDisplayName': 'AI Virtual Keyboard',
        'CFBundleGetInfoString': "Virtual Keyboard controlled by hand gestures",
        'CFBundleIdentifier': "com.aivirtualkeyboard.app",
        'CFBundleVersion': "1.0.0",
        'CFBundleShortVersionString': "1.0.0",
        'NSHumanReadableCopyright': u"Copyright © 2024, All Rights Reserved"
    },
    'iconfile': 'deploy/icon.icns',
}

setup(
    app=APP,
    data_files=DATA_FILES,
    options={'py2app': OPTIONS},
    setup_requires=['py2app'],
) 