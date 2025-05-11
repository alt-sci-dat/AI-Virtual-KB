# AI Virtual Keyboard

A virtual keyboard controlled by hand gestures using computer vision. This application allows you to type using your hand movements captured through your webcam.

## Features

- Real-time hand gesture recognition
- Virtual keyboard interface
- Click detection using thumb and index finger
- Visual feedback for hand tracking
- Support for all basic keyboard characters
- Accessibility-focused design for differently-abled users

## Project Overview

This project aims to bridge the gap between the real world and augmented environment by creating a mixed-reality system. It provides an immersive augmented experience that is gesture-enabled, using only a webcam and OpenCV libraries.

### Key Objectives
- Create a virtual keyboard that can type letters by detecting hand movements
- Implement hand position and gesture recognition using OpenCV, MediaPipe, and CVZone
- Enable text input at cursor position using pynput
- Move beyond traditional physical input technologies

## Quick Download

### For macOS Users
1. Download the latest release from the [Releases](https://github.com/alt-sci-dat/AI-Virtual-KB/releases) page
2. Download the `AI_Virtual_Keyboard.dmg` file
3. Double-click the DMG file to mount it
4. Drag the app to your Applications folder
5. Launch from Applications
6. Grant camera permissions when prompted

### For Windows Users
1. Download the latest release from the [Releases](https://github.com/alt-sci-dat/AI-Virtual-KB/releases) page
2. Download the `AI_Virtual_Keyboard_Setup.exe` file
3. Run the installer and follow the installation wizard
4. Launch from the Start menu or desktop shortcut
5. Grant camera permissions when prompted

## Usage

1. Position yourself in front of the webcam
2. Move your hand to position the crosshair over a key
3. Press 'c' to click the key
4. Press 'q' to quit the application

## Technical Implementation

### Keyboard Layout Model
- Implements QWERTY layout using cv2.rectangle
- Creates semi-transparent virtual layout
- Superimposes on video feed

### Palm Detection Model
- Uses MediaPipe for palm detection
- Efficient bounding box estimation
- Handles two-hand self-occlusion cases
- Optimized for palm detection using square bounding boxes

### Hand Detection Model
- Precise keypoint localization of 21 3D hand-knuckle coordinates
- Robust to partially visible hands and self-occlusions
- Uses MediaPipe for accurate hand tracking

### Click Detection
- Measures distance between thumb and index finger landmarks
- Registers click when distance is less than 30 pixels
- Maps click position to keyboard layout
- Updates text input accordingly

## System Requirements

- Python 3.7 or higher (for building from source)
- Webcam
- Operating System: Windows 10+ or macOS 10.13+
- Camera permissions enabled

## Building from Source

1. Clone the repository:
```bash
git clone https://github.com/alt-sci-dat/AI-Virtual-KB.git
cd AI-Virtual-KB
```

2. Install dependencies:
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

### Performance Issues
1. Ensure good lighting conditions
2. Keep your hand steady
3. Close other applications using the camera

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- OpenCV for computer vision capabilities
- MediaPipe for hand tracking
- CVZone for simplified computer vision implementation

# AI-Virtual-Keyboard

In this project, we have tried to reduce the gap between the real world and the augmented environment to produce a mixed-reality system. 
For that purpose, we created a virtually controllable keyboard system which is created and implemented using OpenCV libraries and Python. 
To provide an easy immersive augmented experience that is also gesture-enabled, we employ a web camera that is integrated with OpenCV libraries through a compiler. 
Using our system, users can control a virtual keyboard using their finger movements and fingertips.

This project describes the way of implementing a virtual keyboard without any additional hardware but by using the webcam available in the system. The webcam simply captures the consecutive frames and compares them to recognize it as a click if there is a difference in the contour

## Issue in existing system

One of the rising problems with VR industry is there aren't many devices which are being utilized for helping disabled or especially abled people. Recent years have marked a sharp increase in the number of ways in which people interact with computers. Where the keyboard and mouse were once the primary interfaces for controlling a computer, users now utilize touch screens, infrared cameras, and accelerometers (for example, within the iPhone) to interact with their technology.

## Problem statement
In light of these changes and the proliferation of small cameras in many phones and tablets, human-computer interface researchers have investigated the possibility of implementing a keyboard style interface using a camera as a substitute for actual keyboard hardware.

The camera may observe the hands from above the surface, or at an angle. The virtual keyboard's software analyses those images in real-time to determine the sequence of keystrokes chosen by the user.

## Objective
+ To make a virtual keyboard which can type letters from detecting our hands.
+ With the help of opencv, mediapipe and cvzone make functions such that they can recognize hand position and gesture of when it is clicked.
+ With the help of pynput, print the selected letters to the selected cursor point.
+ Moving away from primitive methods of physical input technologies like mechanical keyboards.

## Proposed Methodology
### Keyboard Layout Model
First of all, we make an array of the keyboard layout we want to display, i.e. , the QWERTY layout. To display that, we use the cv2.rectangle function to create a semi-transparent virtual layout of the whole keyboard and superimpose it on the video feed.
### Palm Detection Model
Before using a hand detection model, we use a palm detection model by MediaPipe, since estimating bounding boxes of rigid objects like palms and fists is significantly simpler than detecting hands with articulated fingers. In addition, as palms are smaller objects, the non-maximum suppression algorithm works well even for two-hand self-occlusion cases, like handshakes. Moreover, palms can be modelled using square bounding boxes (anchors in ML terminology) ignoring other aspect ratios, and therefore reducing the number of anchors by a factor of 3-5.
### Hand Detection Model
After the palm detection over the whole image the subsequent hand landmark model (Again, done using MediaPipe in Python) performs precise keypoint localization of 21 3D hand-knuckle coordinates inside the detected hand regions via regression, i.e,  direct coordinate prediction. The model learns a consistent internal hand pose representation and is robust even to partially visible hands and self-occlusions.

![image](https://github.com/vinit714/AI-Virtual-Keyboard/assets/52816788/6a0fa029-c01d-4c9b-ae73-d4a63a1ea809)

### Click Detection
Using the landmarks given in the hand detection model, we use a distance measuring function called detector.findDistance between the thumb and index finger landmarks to detect a click. When the distance between these points is less than 30 pixels, the function registers it as a click and records its position. The position recorded is then used in analogous with the keyboard layout model to determine the key pressed, which in-turn is added to the final textbox.






