import cv2
import numpy as np
from pynput.keyboard import Controller
import sys

# Initialize the webcam
cap = cv2.VideoCapture(0)
if not cap.isOpened():
    print("Error: Could not open webcam. Please check camera permissions in System Settings > Privacy & Security > Camera and allow Terminal/Python access.")
    sys.exit(1)

# Set the webcam resolution
cap.set(3, 1280)
cap.set(4, 720)

# Initialize keyboard controller
keyboard = Controller()

# Define the keyboard layout
keys = [["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L", ";"],
        ["Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "<"]]
finalText = ""

def drawAll(img, buttonList):
    for button in buttonList:
        x, y = button.pos
        w, h = button.size
        cv2.rectangle(img, button.pos, (x + w, y + h), (255, 0, 255), cv2.FILLED)
        cv2.putText(img, button.text, (x + 20, y + 65),
                    cv2.FONT_HERSHEY_PLAIN, 4, (255, 255, 255), 4)
    return img

class Button():
    def __init__(self, pos, text, size=[85, 85]):
        self.pos = pos
        self.size = size
        self.text = text

# Create button list
buttonList = []
for i in range(len(keys)):
    for j, key in enumerate(keys[i]):
        buttonList.append(Button([100 * j + 50, 100 * i + 50], key))

print("Starting Virtual Keyboard...")
print("Instructions:")
print("1. Move your hand in front of the camera")
print("2. Position your index finger over a key")
print("3. Press 'c' to click the key under your finger")
print("4. Press 'q' to quit")

# Variables for click detection
clicked = False
click_cooldown = 0

while True:
    success, img = cap.read()
    if not success or img is None:
        print("Error: Could not read frame from webcam.")
        break
    
    # Flip the image horizontally for more intuitive interaction
    img = cv2.flip(img, 1)
    
    # Convert to grayscale for motion detection
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray = cv2.GaussianBlur(gray, (21, 21), 0)
    
    # Draw the keyboard
    img = drawAll(img, buttonList)
    
    # Get the center of the frame
    center_x = img.shape[1] // 2
    center_y = img.shape[0] // 2
    
    # Draw a crosshair at the center
    cv2.line(img, (center_x - 20, center_y), (center_x + 20, center_y), (0, 255, 0), 2)
    cv2.line(img, (center_x, center_y - 20), (center_x, center_y + 20), (0, 255, 0), 2)
    
    # Draw the text box
    cv2.rectangle(img, (50, 350), (700, 450), (175, 0, 175), cv2.FILLED)
    cv2.putText(img, finalText, (60, 430),
                cv2.FONT_HERSHEY_PLAIN, 5, (255, 255, 255), 5)
    
    # Show the frame
    cv2.imshow("Virtual Keyboard", img)
    
    # Handle key presses
    key = cv2.waitKey(1) & 0xFF
    if key == ord('q'):
        break
    elif key == ord('c'):
        # Find the key under the center point
        for button in buttonList:
            x, y = button.pos
            w, h = button.size
            if x < center_x < x + w and y < center_y < y + h:
                keyboard.press(button.text)
                if button.text == '<':
                    if len(finalText) != 0:
                        finalText = finalText[0:len(finalText)-1]
                else:
                    finalText += button.text
                break

# Clean up
cap.release()
cv2.destroyAllWindows()    
