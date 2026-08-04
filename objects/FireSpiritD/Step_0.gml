// The object does not fall, it stays in place
if (done == 0) { // If action isnt completed yet
    if (vsp == 0) { // If stationary
        done = 1; // Mark as done
        image_speed = 0.4; // Play the animation at 40% of original speed
    }

    x += hsp;  // No horizontal movement
    y += vsp;  // No vertical movement
}

// Destroy the object after the death animation finishes
if (done == 1 && image_index >= sprite_get_number(sprite_index) - 1) { // If has completed action and in last frame
    instance_destroy(); // Destroy the object
}