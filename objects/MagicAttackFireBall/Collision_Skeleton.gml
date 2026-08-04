with (other) // When colliding with the archer
{
	hp-=6; // Decrease health by 6
	flash = 3; // Apply flash effect
	hitfrom = other.direction; // Store direction of the hit
}
instance_create_layer(x, y, layer, FireBallExplodes); // Create the explosion affect after contact with enemies
instance_destroy() ; // Destroy the magicshot after the hit