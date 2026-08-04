// When colliding with Exilion
{
    if (other.healthPoints > 0) { // Ensure Exilion still has HP left
        other.healthPoints--; // Decrease Exilion’s health
        other.flash = 3; // Apply flash effect
        other.hitfrom = direction; // Store direction of the hit
    }
}

instance_destroy(); // Destroy the magic shot after the hit
