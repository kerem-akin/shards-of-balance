// Find the nearest plant
target = instance_nearest(x, y, Plant);

// Set the initial position
if (instance_exists(target)) {
    x = target.x; // Position it in the same x-axis as the enemy
    y = target.y - 30;  // Position it 30 pixels above the plant enemy
}

image_speed = 0.8;  // Animation speed is 80% of original speed
image_xscale = 0.9; // Scaled down x0.9
image_yscale = 0.9; // Scaled down x0.9
