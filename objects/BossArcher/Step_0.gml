vsp += grv; // Apply gravity to archer

if (instance_exists(OPlayer)) { // if player exists
var player_distance = point_distance(x, y, OPlayer.x, OPlayer.y); // Checks distance between Exilion and player
var has_line_of_sight = !collision_line(x, y, OPlayer.x, OPlayer.y, Object12, false, true); // Checks for any collision boxes inbetween them

if (player_distance < 500 && has_line_of_sight) { // if archer is within 500 pixels and there is no collision boxes blocking its vision
    chasing = true; // Start chasing
    chase_timer = 120; // Chase for 2 moreseconds after losing sight
} else {
    if (chase_timer > 0) { // If chase timer hasnt run out
        chase_timer--; // decrease it
    } else {
        chasing = false; // if chase timer is zero, stop chasing
        is_attacking = false; // Set attacking state to false
    }
}
} else {
	chasing = false;
	is_attacking = false;
}

if (instance_exists(ExilionD)) { // if Exilions dead object exists
    instance_destroy(); // Destroy the archer immediately
    return; // Skip further logic, just get rid of the archer
}

if (chasing) { // If chasing
    hsp = 0;  // Stop horizontal movement when chasing

    if (!is_attacking && alarm[0] <= 0) { // if isnt attacking and alarm 0 is finished so can attack
        is_attacking = true; // Start attacking
        if (OPlayer.x < x) { // face the player
            image_xscale = -1; // Flip to face left
        } else {
            image_xscale = 1; // Face right
        }
        sprite_index = BossSpawnA;  // Use attack animation
        image_index = 0; // Start from first frame
        image_speed = 1; // Play at original animation speed
        arrow_shot = false; // Set arrow shot to false
    }
} else {
    // When not chasing, move with walk speed and play running animation
    is_attacking = false; // Ensure attacking state is reset
    hsp = speed_walk * sign(image_xscale); 
    sprite_index = BossSpawnR; // Use running animation
    image_speed = 1; // At original animation speed

    // Flip direction if there's no ground ahead or hitting a wall
    var ground_ahead = place_meeting(x + sign(hsp) * 8, y + 1, Object12); // Checks if there is a collision object in front of the archer
    var wall_ahead = place_meeting(x + hsp, y, Object12); // Check for collsiion
    if (!ground_ahead || wall_ahead) {
        hsp *= -1; // reverse horizontal movement direction 
        image_xscale *= -1; // Flip the sprite
    }
}

// Apply horizontal movement
x += hsp;

if (place_meeting(x, y + vsp, Object12)) {// Checks for vertical collision box above the archer
    while (!place_meeting(x, y + sign(vsp), Object12)) { // Moves archer above until it doesnt collide with the collision object
        y += sign(vsp);
    }
    vsp = 0;  // Stop vertical movement if colliding
}

y += vsp; // Apply vertical movement

if (chasing && !is_attacking && alarm[0] <= 0) { // If chasing but isnt attacking and alarm has finished
    is_attacking = true; // Start attacking
    alarm[0] = 60; // 1 second attack cooldown

    if (OPlayer.x < x) { // Face the player
        image_xscale = -1; // Flip sprite to face left
    } else {
        image_xscale = 1; // Face right
    }

    sprite_index = BossSpawnA; // Use the attack charge animation
    image_index = 0; // Start from first frame
    image_speed = 1; // Play attack animation at original speed
    arrow_shot = false; // Reset arrow shot state
}

if (is_attacking && !arrow_shot) { // If is attacking but hasnt shot its arrow yet
    if (sprite_index == BossSpawnA && image_index >= sprite_get_number(BossSpawnA) - 1) { // if in last frame of attacking animation
        var arrow = instance_create_layer(x, y, layer, BossArcherArrow); // Create the arrow
		audio_play_sound(ArcherShoots, 1, false); // PLay the arrow shooting sound once
        arrow.direction = point_direction(x, y, OPlayer.x, OPlayer.y); // Arrow gets shot towards player
        arrow.speed = 8; // Its speed
        arrow.image_angle = arrow.direction; // Align its image angle with its direction

        arrow_shot = true; // Set arrow shot state to true
        sprite_index = BossSpawnI; // Switch to idle after shooting
        alarm[0] = 60; // Set the alarm for 1 second idle time
    }
}


if (attack_timer > 0) { // if it still has attack cooldown
    attack_timer--; // Decrease the attack cooldown
}

if (chasing && hp > 0) { // if chasing and alive
    if (!instance_exists(textboxArcherE)) { // If the textbox doesnt exist
		audio_play_sound(EnemyNotices,1,false); // Okat the alerted sound effect once
        textboxArcherE = instance_create_layer(x, y, "Enemies", TextBoxE); // Create the textbox
        textboxArcherE.sprite_index = Sprite181E; // use this sprite for it
        textboxArcherE.image_speed = 1; // Plays at original animation speed
        textboxArcherE.image_xscale = image_xscale * 2; // Scale it up horizontally by x2
        textboxArcherE.image_yscale = 2; // Scale it up vertically by x2
    }
    if (instance_exists(textboxArcherE)) { // if the textbox exists
        var x_offset = 20 * image_xscale; // use the x offset
        textboxArcherE.x = x + x_offset;
        textboxArcherE.y = y - 50;
        textboxArcherE.image_xscale = 2 * sign(image_xscale); // use the y offset, these are used to properly align the sprite
    }
} else {
    if (instance_exists(textboxArcherE)) { // if not chasing or dead
        instance_destroy(textboxArcherE); // destroy textbox
        textboxArcherE = noone; // Set back to noone so doesnt exists anymore
    }
}

// Particle system for movement
if ((hsp != 0 || vsp != 0) && random(100) < 33) { // 33 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 pink particle for the archer
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);
	// Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);
	// Handles where the particles are emitted, their spawn position is around the objects center
    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);
	 // Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);
}

if (hp <= 0 && !is_dying) { // If is dead but the dying state isnt true
    is_dying = true; // Prevent multiple deaths

    var death_anim = instance_create_layer(x, y - 128 , "Enemies", Death); // Create death animation effect above archer
    death_anim.image_xscale = image_xscale; // Flip correctly

    var dead_archer = instance_create_layer(x, y, "Enemies", BossArcherDead); // Create dead archer object
    dead_archer.image_xscale = image_xscale; // Flip corpse correctly
    dead_archer.hsp = lengthdir_x(2, hitfrom); 
    dead_archer.vsp = lengthdir_y(1, hitfrom) - 1; // Slight knockback effect

    // Destroy this archer
    instance_destroy();
}


