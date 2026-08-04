if (room == R3Cave) {
    target_alpha = 0.75; // Set target alpha to 0.7 in R3Cave
} else {
    target_alpha = 0.5; // Default target alpha for other rooms
}

if (fade_to_dark) { // If fading starts
    darkness_alpha += 0.01; // Fade at this speed
    if (darkness_alpha > target_alpha) { // Cap at the target alpha value
        darkness_alpha = target_alpha;
    }
}

