x += hspeed; // Apply horizontal movement

if (abs(x - start_x) >= move_range) { // If going out of the movement range
    hspeed = -hspeed; // Turn the opposite way
    image_xscale = -image_xscale; // Change direction of animation
}

var player = instance_place(x, y, OPlayer); // Set player as the variable
if (player != noone && player.speed_debuff_timer <= 0) { // If player exists and doesnt have debuff active
    // Reduce player's speed
    player.walksp = 2.4; // 30% of the players normal speed which is 8
    player.speed_debuff_timer = 3.5 * room_speed; // slows down player for 3.5 seconds
	
	 instance_create_layer(OPlayer.x, OPlayer.y - 90, "PotionEffectSlow", Object31); // Creates the slow effect 90 pixels above the player
	 
    instance_destroy(); //destroys the skull enemy
}

if (random(100) < 42) { // 42 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 blue particle for the player
	var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);
	
    // Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);
	
	// Handles where the particles are emitted, their spawn position is around the objects center
    var px = x + random_range(-8, 8);
    var py = y + random_range(-8, 8);
	
	// Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);	
}
