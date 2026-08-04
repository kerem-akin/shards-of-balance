if (image_alpha < 1 && !faded_out) { // if not fully visible and not faded out 
    image_alpha += fade_in_speed; // Fade in the crystal
}

if (timer >= fade_delay && !faded_out) { // if the 5 second passed and hasnt faded out yet
    // Start fading out after 5 seconds
    image_alpha -= fade_out_speed;
    if (image_alpha <= 0) { // If fully faded out so invisible
        faded_out = true; // Set faded out to true
        instance_destroy(); // Destroy the crystal once fully faded out
    }
}

// Timer for the fade out delay
timer += 1;