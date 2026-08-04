x = OPlayer.x;  // Follow the player's x position
y = OPlayer.y - 85;  // Follow the player's y position, keeping it 85 pixels above

// Check if the animation finished
if (image_index == image_number - 1) {
    instance_destroy();  // Destroy the object when the animation is done
}
