cam = view_camera[0]; // Use the first camera in the viewport as the camera 
follow = OPlayer; // Camera follows the player 
view_w_half = camera_get_view_width(cam) * 0.5; // Get half of the widht of the camera
view_h_half = camera_get_view_height(cam) * 0.5; // Get half of the height of the camera
xTo = xstart; // Initialize the x position of target
yTo = ystart; // Initialize the y position of target

shake_length = 60 // Camera shakes for a second
shake_magnitude = 3 // CAmera shake intensity
shake_remain = 3 // How long the shake remains
buff = 16 // For positioning
