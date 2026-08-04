if (instance_exists(target)) {
    // Follow the target skeleton
    x = target.x;
    y = target.y - 40;  // Keep it 40 pixels above the skeleton while following the skeleton

    // Loop the animation
    if (image_index >= image_number - 1) {
        image_index = 0;  // Reset the animation to the first frame
    }
} else {
    // Destroy the object if skeleton is defeated,no longer exists
    instance_destroy();
}
