
lifetime--; // Decrease lifetime
if (lifetime <= 0) { // if lifetime finishes
    instance_destroy();  // Destroy the effect
}
