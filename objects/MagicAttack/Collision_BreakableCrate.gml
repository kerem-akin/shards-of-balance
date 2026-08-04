with (other) // When colliding with the crate
{
	hp--; // Decrease health by 1
	flash = 3; // Apply flash effect
	hitfrom = other.direction; // Store direction of the hit
}

instance_destroy() ; // Destroy the magicshot after the hit