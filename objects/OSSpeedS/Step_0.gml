if (instance_exists(target)) {
    // Follow the target skeleton
    x = target.x;
    y = target.y - 35;  // Keep it 35 pixels above the skeleton while moving

    // Loop the animation
    if (image_index >= image_number - 1) {
        image_index = 0;  // Reset the animation to the first frame
    }
} else {
    // Destroy the object if skeleton is defeated, it no lomger exists
    instance_destroy();
}




