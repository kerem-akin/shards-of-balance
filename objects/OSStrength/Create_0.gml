// Find the nearest strongfirespirirt
target = instance_nearest(x, y, FireSpiritStr);

// Set the initial position of effect
if (instance_exists(target)) {
    x = target.x; // Position it in the same x-axis as the enemy
    y = target.y - 60;  // Position it 60 pixels above the firespirit
}

image_speed = 0.8; // Animation speed is 80% of original speed
image_xscale = 0.9; // Scaled down x0.9
image_yscale = 0.9; // Scaled down x0.9
