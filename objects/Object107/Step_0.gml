// Step Event

// Follow the BossArcher's position as it moves
if (instance_exists(target)) {
    x = target.x; 
    y = target.y - 85;  // Keep it 85 pixels above the BossArcher while it moves
}

// Loop the animation until it finishes once
if (image_index >= image_number - 1) {
    instance_destroy();  // Destroy the effect after the animation finishes
}
