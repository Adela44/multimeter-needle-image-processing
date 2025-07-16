This README is in English.
For the Romanian version, see README.md

# Multimeter Needle Image Processing

The program estimates the current value in mA indicated by the needle of an analog multimeter using OpenCV and MATLAB.
In the folder "poze_dem" there are several images corresponding to known needle positions.
An interpolation function was build based on those values and the angle indicated by the needle.
The angle (in degrees) is calculated using Python (version 3.10.12), and the interpolation function is implemented in MATLAB.

In short, the program extracts the needle angle from an image, puts it into the function, and the result is the estimated value in mA.
For better accuracy, more images are recommended.

A few notes:
vezi_imag.py is the final Python script.
