// Slowly fade in, starting from invisible to fully transparent
if (image_alpha < 1) {
    image_alpha += 0.02;
}

// Slight random drifting effect
x += hsp;
y += vsp;

// Slow down over time for a natural effect
speed *= 0.99;

// If fully visible,alpha 1, destroy it
if (image_alpha <= 0) {
    instance_destroy();
}
