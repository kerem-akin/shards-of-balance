// Move the fireball
x += hsp; // Apply horizontal movement
y += vsp; // Apply vertical movement

// Collision with walls
if (place_meeting(x, y, Object12)) { // If it collides with the collision object
    instance_destroy(); // Destroy it
}

// Collision with player
if (place_meeting(x, y, OPlayer)) { // If it collides with the player
var player = instance_place(x, y, OPlayer); // takes player as the variable
if (player != noone) { // If player exists
health -= 1; // Damage the player by 1
player.invincibility_frames = 60; // Provide invincibility for 1 second
instance_destroy(); // Destory the fire shot
}
}

// Destroy after lifespan
life -= 1; // Lifespan decreases every frame
if (life <= 0) { // If it reaches below zero
    instance_destroy(); // destory the fire shot 
}

// System to emit particles when moving
if ((hsp != 0 || vsp != 0) && random(100) < 42) { // 42 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 orange particle for the fireshot
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);

    // Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);

    // Handles where the particles are emitted, their spawn position is around the objects center
    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);
	
    // Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);
}

