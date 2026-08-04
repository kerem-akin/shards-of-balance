// Slowly fade out before disappearing
repeat (30) {
    image_alpha -= 0.03;
}
instance_destroy(); // Destroy the particle
