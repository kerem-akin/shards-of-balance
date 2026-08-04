// Find Exilion
target = instance_nearest(x, y, Exilion);

// Set the initial position
if (instance_exists(target)) {
    x = target.x; // Position it in the same x-axis as the enemy
    y = target.y - 100;  // Position it 35 pixels above Exilion
}

image_speed = 0.8; // Animation speed is 80% of original speed
image_xscale = 1; // Scaled down x1
image_yscale = 1; // Scaled down x1