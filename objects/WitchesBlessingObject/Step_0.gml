x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 540; // Left of x-axis
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 + 365; // Bottom of y-axis

if (image_alpha < 1) { // If not fully faded in
    image_alpha += 0.015; // Fade in the ability screen
}

if (fadingOut) { // If fading out
    image_alpha -= 0.03; // Fade out the ability screen
    if (image_alpha <= 0) { // If fully faded in
        instance_destroy(); // Destroy the ability screen
    }
}
