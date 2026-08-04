if (fade_to_dark) { // if fading started
    darkness_alpha += 0.1; // Start the fading
    if (darkness_alpha > 1) { // If fully visible
        darkness_alpha = 1; // Stop when fully visible 
    }
}
