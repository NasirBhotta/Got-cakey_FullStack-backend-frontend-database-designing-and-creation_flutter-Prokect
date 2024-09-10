from PIL import Image, ImageDraw

# Define the size of the image
width = 1350  # Adjust the width as needed
height = 50
ball_radius = width // 26  # There are 13 half balls, so 26 half-ball diameters

# Create a new image with a white background
image = Image.new('RGBA', (width, height), (0,0,0,0))
draw = ImageDraw.Draw(image)
color = (80, 12, 127, 255)
# Draw the half balls
for i in range(13):
    x0 = i * (2 * ball_radius+2.5) - 2
    y0 = 0
    x1 = (x0 + 2 * ball_radius + 5) - 9
    y1 = 2 * ball_radius
    draw.pieslice([x0, y0, x1, y1], 180, 0, fill=color)

# Save the image with a proper filename and extension
image.save(r'C:\Users\Nasir Bhutta\OneDrive - Higher Education Commission\Desktop\python\border.png')
