// The object does not fall, it stays in place
if (done == 0) {
    // Once the object is "done" with falling or gravity (which is not applied here), we start the animation
    if (vsp == 0) {
        done = 1; // Mark as done once it's in place
        image_speed = 0.4; // Play the death animation
    }

    // The object stays in place, so no movement here
    x += hsp;  // Keep it stationary
    y += vsp;  // No vertical movement
}

// Destroy the object after the death animation finishes
if (done == 1 && image_index >= sprite_get_number(sprite_index) - 1) {
    instance_destroy(); // Destroy the object after the death animation completes
}