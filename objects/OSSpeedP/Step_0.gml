if (instance_exists(target)) {
    // Follow the target plant
    x = target.x; 
    y = target.y - 35;  // Keep it 35 pixels above the plant while it is moving

    // Loop the animation
    if (image_index >= image_number - 1) {
        image_index = 0;  // Reset the animation to the first frame
    }
} else {
    // Destroy the effect if the plant is defeated
    instance_destroy();
}




