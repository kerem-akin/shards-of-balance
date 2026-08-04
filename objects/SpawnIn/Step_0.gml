x = OPlayer.x;  // Follow the player's x position
y = OPlayer.y - 85;  // Follow the player's y position, keeping it 85 pixels above like intended

// Check if the animation has finished
if (image_index == image_number - 1) {
    instance_destroy();  // Destroy the object when the animation is finished
}
