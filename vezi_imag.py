import cv2
import numpy as np
import matplotlib.pyplot as plt
import math

# Load image
img = cv2.imread("/home/ubuntu/Downloads/imag4.jpeg")  # update path as needed
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
plt.imshow(img_rgb)
plt.title("Imagine Original")
plt.axis("off")
plt.savefig("Imagine Original.png")

# Preprocessing
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray, (5, 5), 0)
edges = cv2.Canny(blurred, 75, 130)


# Detect lines
lines = cv2.HoughLinesP(edges, 1, np.pi / 180, threshold=75, minLineLength=90, maxLineGap=10)

# Define filter criteria
filtered_lines = []
angle_threshold_min = 45   # degrees
angle_threshold_max = 230   # degrees
min_length = 150         # pixels (adjust based on your image resolution)

for line in lines:
    x1, y1, x2, y2 = line[0]
    dx = x2 - x1
    dy = y2 - y1
    length = math.hypot(dx, dy)
    angle = abs(math.degrees(math.atan2(dy, dx)))

    # Normalize angle between 0 and 180
    angle = angle if angle <= 180 else 360 - angle

    if min_length < length and angle_threshold_min < angle < angle_threshold_max:
        filtered_lines.append((x1, y1, x2, y2))

# Draw only filtered lines
img_lines = img.copy()
for x1, y1, x2, y2 in filtered_lines:
    cv2.line(img_lines, (x1, y1), (x2, y2), (0, 255, 0), 2)

# Display result
img_rgb_lines = cv2.cvtColor(img_lines, cv2.COLOR_BGR2RGB)
plt.imshow(img_rgb_lines)
plt.title("Linii detectate filtrate")
plt.axis("off")
plt.savefig("Linii_filtrate.png")

# Calculate and display angle for the longest filtered line (assumed to be the needle)
x = None
if filtered_lines:
    longest_line = max(filtered_lines, key=lambda l: math.hypot(l[2] - l[0], l[3] - l[1]))
    x1, y1, x2, y2 = longest_line
    dx = x2 - x1
    dy = y2 - y1
    angle = math.degrees(math.atan2(dy, dx))
    x = round(angle,2)
    print(f"Unghiul estimat al acului: {angle:.2f} grade")
else:
    print("Nu a fost detectată nicio linie potrivită.")


if x < 0:
    x = -x
else:
    x = 180 - x
print(x)
