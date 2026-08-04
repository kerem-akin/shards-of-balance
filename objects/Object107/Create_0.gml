// Find the nearest archer
target = instance_nearest(x, y, BossArcher);

// Set the initial position
if (instance_exists(target)) {
    x = target.x; // Position it in the same x-axis as the enemy
    y = target.y - 85;  // Position it 35 pixels above the archer
}

image_speed = 0.8; // Animation speed is 80% of original speed