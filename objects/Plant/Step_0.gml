vsp += grv; // Applies gravity to the vertical speed of the plant

if (instance_exists(OPlayer)) { // If player exists
var player_distance = point_distance(x, y, OPlayer.x, OPlayer.y); // Checks distance between plant and player
var has_line_of_sight = !collision_line(x, y, OPlayer.x, OPlayer.y, Object12, false, true); // Checks for any collision boxes between

// Plant starts to change if the player is within 500 pixels and there is no collision boxes blocking its vision
if (player_distance < 500 && has_line_of_sight) {
    chasing = true;
    chase_timer = 120; // Chases for an extra 2 seconds after losing sight
} else {
    if (chase_timer > 0) {  // Checks if its still chasing
        chase_timer--; // Decreases timer until hitting zero if plant doesn`t have sight of player
    } else {
        chasing = false; // Stops chasing player when timer reaches 0
		is_attacking = false;
	}
}
} else {
	chasing = false;
	is_attacking = false;
}

if (chasing) {
    var chase_speed = speed_walk * 1.5; // Uses the walk speed increased by 50 percent when chasing the player. Increased from 2 to 3
    if (OPlayer.x > x) {
        hsp = chase_speed; // uses the faster walkspeed
    } else {
        hsp = -chase_speed; // Moves in opposite direction
    }
    sprite_index = PlantW; // Plays the walking animation when chasing, doesnt change just faster
    image_speed = 1; // In its original animation speed
} else {
    hsp = speed_walk * sign(hsp); // If walking so not chasing, use normal walking speed
    sprite_index = PlantW; // Play the walking animtion
}

if (!chasing) {
    var ground_ahead = place_meeting(x + sign(hsp) * 8, y + 1, Object12); // Checks if there is a collision object in front of the plant
    if (!ground_ahead) { // If there is no ground ahead
        hsp *= -1; // Change horizontal movement direction. This code makes it so the plant doesnt fall off the platform it was placed in, even when chasing
    }
}

if (place_meeting(x + hsp, y, Object12)) { // Checks for horizontal collision
    while (!place_meeting(x + sign(hsp), y, Object12)) {
        x += sign(hsp); // Stops plant at the edge of an obstacle
    }
    
    if (!place_meeting(x, y + 1, Object12)) { // If there is no collision box below the plant
        hsp = 0; // Sets horizontal movement speed to 0
    } else {
        hsp *= -1; // Reverses direction if there is ground below
    }
}

x += hsp; // Plant moves horizontally based on its horizontal speed

if (place_meeting(x, y + vsp, Object12)) { // Checks for vertical collision
    while (!place_meeting(x, y + sign(vsp), Object12)) {
        y += sign(vsp); // Stops when colliding vertically
    }
    vsp = 0; // Sets vertical movement speed to 0
}

y += vsp; // Plant moves vertically based on its vertical speed

if(instance_exists(OPlayer)) { // If player exists
if (point_distance(x, y, OPlayer.x, OPlayer.y) < 66 && !is_attacking) { // Checks if plant is within 66 pixels of the player
    is_attacking = true; // It attacks if it is
    attack_timer = 0; // Resets attack timer
    sprite_index = PlantA1; // Uses attacking animation
    image_index = 0; // Goes back to first frame after the animation plays
    image_speed = 1; // Plays at original animation speed
}
}

// During the attack, count the timer and then check for damage if player is still in range
if (is_attacking) {
    attack_timer++; // Attack timer 
    if (attack_timer >= attack_duration) { // Check for attack timer to se if it passed
        is_attacking = false;
        if (point_distance(x, y, OPlayer.x, OPlayer.y) < 66) { // If still within 66 pixels of player
            var player = instance_place(x, y, OPlayer); // Checks if player is in the same position as the plant
            if (player != noone && player.invincibility_frames == 0) { // If the player isnt invincible and exists
                player.health -= damage; // Does damage, 1 in default but can be increased in creation code
                player.invincibility_frames = 60; // Gives invincibility for a second
            }
        }
    }
}

if (!is_attacking) { // If not attacking 

    if (!place_meeting(x, y + 1, Object12)) { // If plant is midair
        sprite_index = PlantW; // Play the walking animation
        image_speed = 1; // Original animation speed 
    } else {
        image_speed = 1; // Original animation speed if is touching the ground
        sprite_index = PlantW; // Play the walking animation
    }
}

if (hsp != 0 && place_meeting(x, y + 1, Object12) && !is_attacking) { // If plant has horizontal movement and isnt attacking
    image_xscale = sign(hsp); // Flip its sprite based on its movement direction
}

draw_self(); // Draw the plant object

if (flash > 0) { // Check if flash is still active 
    flash--; // Decrease its timer
    shader_set(ShWhite); // Apply the ShWhite effect 
    draw_self(); // Draw the plant object
    shader_reset(); // Reset the shader to the default state
}

if (hp <= 0 && !is_dying) { // Check if plant is defeated, so has zero hp
    is_dying = true; // Set it to the dying state
    is_attacking = false;  // Ensure it stops attacking
    hsp = 0;  // Stop horizontal movement
    vsp = 0; // Stop vertical movement
    
    sprite_index = PlantA2;  // Start the gas release animation after the death
    image_index = 0; // Start from the first frame of the animtion
    image_speed = 1; // Original animation speed 
}
  
// When PlantA2 finishes, plant PlantA2C which is thegas spreading animation
if (is_dying && sprite_index == PlantA2 && image_index >= sprite_get_number(sprite_index) - 1) {
// Switch to the gas spreading animation if the plant is dead and finished playing the previous animation
    sprite_index = PlantA2C;  // Switch to the gas spreading effect
    image_index = 0; // Start from the first frame of the animtion
    image_speed = 1; // Original animation speed 
}

// If PlantA2C finishes, destroy the plant
if (is_dying && sprite_index == PlantA2C && image_index >= sprite_get_nuber(sprite_index) - 1) { 
// if thee plant is dead and the gas spreading animtion is played
    instance_destroy(); // destroy the gas spreading animtion 
}

// System to emit particles when moving
if ((hsp != 0 || vsp != 0) && random(100) < 12) { // 12 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 green particle for the plant
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);

    // Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);

    // Handles where the particles are emitted, their spawn position is around the objects center
    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);
	
    // Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);
}

    // Handles enemy textbox animation 
	if (chasing && !is_attacking && hp > 0) { // If the plant is chasing, not attacking and is alive (More than 0 hp)
	    if (!instance_exists(textboxE)) { // If the textbox doesnt already exist
			audio_play_sound(EnemyNotices,1,false); // Play alerted sound effect
	        textboxE = instance_create_layer(x, y, "Enemies", TextBoxE); // Create a new textbox in the plants position
	        textboxE.sprite_index = Sprite181E;  // Use this sprite for the textbox
	        textboxE.image_speed = 1;  // Original animation speed 
	        textboxE.image_xscale = -2; // Initially flipped, this is to make it face the right direction, scaled up x2
	        textboxE.image_yscale = 2; // Scaled x2
	    }
	    if (instance_exists(textboxE)) { // If the textbox exists
	        var textbox_width = sprite_get_width(Sprite181E) * 2;  // gets width of textbox 
	        if (image_xscale > 0) {  // Plant facing right
	            textboxE.x = x + sprite_width - 145 ; // Position it on the right of the plant
	            textboxE.image_xscale = -2;          // Flip it horizontally, makes it face the right direction
	        } else {  // Skeleton facing left
	            textboxE.x = x - textbox_width + 60;  // Position on the left of the plant, the offset decides where it is
	            textboxE.image_xscale = 2;            // Flip horizontally, makes it face the right direction
	        }
	        textboxE.y = y - sprite_height + 120; // Set its vertical position based on plants position
	    }
	} else {
	    if (instance_exists(textboxE)) { // If the plant isnt chasing
	        instance_destroy(textboxE); // Destroy the textbox
	        textboxE = noone; // Sets it back to noone, doesnr exist anymore
	    }
	}

	if (hp <= 0) { // If defeated, hp is 0
	    if (instance_exists(textboxE)) { // If it still exists
	        instance_destroy(textboxE); // Destroy it
	    }
	    // Create the death object if plant is killed
	    with(instance_create_layer(x, y, layer, PlantDe)) {
	        direction = other.hitfrom; // Set its position based on the last attack the plant received
	        hsp = lengthdir_x(3, direction); // New horizontal movement
	        vsp = lengthdir_y(2, direction)-2; // Vertical movement
	        if (sign(hsp) != 0) image_xscale = sign(hsp) * other.image_xscale; // Makes sure it faces the right direction
	    }
	    instance_destroy(); // Destroys the dead object
	}
