if (instance_exists(target)) {
    // Follow the target plant
    x = target.x;
    y = target.y - 30;  // Keep it 30 pixels above the plant while moving

    // Loop the animation
    if (image_index >= image_number - 1) {
        image_index = 0;  // Reset the animation to the first frame
    }
} else {
    // Destroy the object if plant doesnt exist, if it`s defeated
    instance_destroy();
}
