
lifetime--; // Decrease lifetime
if (lifetime <= 0) { // If lifetime finishes
    instance_destroy();  // Destroy the effect 
}
