if (instance_exists(target)) {
    // Follow the target strongfirespirit
    x = target.x;
    y = target.y - 60; // Keep it 60 pixels above the strongfirespirit while following the skeleton

    // Loop the animation
    if (image_index >= image_number - 1) {
        image_index = 0;  // Reset the animation to the first frame
    }
} else {
    // Destroy the object if the fire spirit is defeated
    instance_destroy();
}
