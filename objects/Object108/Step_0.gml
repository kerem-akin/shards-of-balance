if (instance_exists(target)) {
    // Follow Exilion
    x = target.x; 
    y = target.y - 100;  // Keep it 35 pixels above Exilion while it is moving

    // Loop the animation
    if (image_index >= image_number - 1) {
        image_index = 0;  // Reset the animation to the first frame
    }
} else {
    // Destroy the effect if Exilion is defeated
    instance_destroy();
}
