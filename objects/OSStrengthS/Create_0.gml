// Find the nearest skeleton
target = instance_nearest(x, y, Skeleton);

// Set the initial position
if (instance_exists(target)) {
    x = target.x; // Position it in the same x-axis as the enemy
    y = target.y - 40;  // Position it 40 pixels above the skeleton
}

image_speed = 0.8; // Animation speed is 80% of original speed
image_xscale = 0.9; // Scaled down x0.9
image_yscale = 0.9; // Scaled down x0.9
