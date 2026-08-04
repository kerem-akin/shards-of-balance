
if (image_alpha < 1) { // If not fully visible
    image_alpha += fade_in_speed; // Fade in the portal
    if (image_alpha > 1) image_alpha = 1; // Clamp at 1 when fully visible
}
