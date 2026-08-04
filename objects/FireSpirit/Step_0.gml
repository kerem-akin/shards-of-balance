if (!instance_exists(OPlayer)) { // If player exists
    chasing = false; // Stop chasing the player
    is_attacking = false; // Stop attacking
    if (instance_exists(textboxFireE)) {
        instance_destroy(textboxFireE); // Remove textbox if it exists
        textboxFireE = noone;
    }
}

if (!is_dying) { // If the fire spirit is alive
    // === BASIC MOVEMENT ===
    if (!is_attacking && !chasing) { // If isnt attacking or chasing
        // Maintains hover height above collision object
        var ground_y = y;
        while (!place_meeting(x, ground_y + 1, Object12) && ground_y < room_height) { // While there is no collision object beneath it
            ground_y++; // Move downward and find the ground
        }

        if (ground_y < room_height) { // If there is a collision object before the rooms bottom
            y = ground_y - hover_height; // The fire spirirt remains at the hover height 
            vsp = 0; // No vertical movement
        } else {
            vsp += grav; // Apply gravity if no ground is found
            y += vsp; // Move downward according to its vertical speed, so doesnt.
        }

        // Checks for edge or collision with Object12
        if (!place_meeting(x + hsp, y + hover_height + 1, Object12) || place_meeting(x + hsp, y, Object12)) {
    hsp = -hsp; // Reverse movement direction if there is no ground ahead
}

if (!is_attacking) { // If not attacking
    if (hsp != 0) { // If it has horizontal movement
        image_xscale = sign(hsp); // Ensure sprite faces the movement direction
    }
}

        x += hsp; // Move horizontally

        sprite_index = FireW; // Use walking animation if not chasing or attacking
        image_speed = 1; // use original animation speed
    }

    if (instance_exists(OPlayer)) {
    var player_distance = point_distance(x, y, OPlayer.x, OPlayer.y);
	// Calculates distance between firespirit and the player
    var has_line_of_sight = !collision_line(x, y, OPlayer.x, OPlayer.y, Object12, false, true); 
	// Doesnt get line of sight if a collision object blocks vision

    if (player_distance < 500 && has_line_of_sight) { // If it is within 500 pixels and has line of sight
        chasing = true; // It starts chasing the player
    } else {
        chasing = false; // If it doesnt have the line of sight, doesnt chase the player
    }
	}
	
	if (chasing && hp > 0) {  // If it is chasing the player so it can see it and it is alive
        if (!instance_exists(textboxFireE)) { // If the textbox doesnt exist
			audio_play_sound(EnemyNotices,1,false);
            textboxFireE = instance_create_layer(x, y, "Enemies", TextBoxE); // Create the textbox
            textboxFireE.sprite_index = Sprite181E; // Use this sprite for animation
            textboxFireE.image_speed = 1; // Play animation at original speed
            textboxFireE.image_xscale = image_xscale * 2;  // Mirror based on direction
            textboxFireE.image_yscale = 2; // Mirror based on direction
        }
        if (instance_exists(textboxFireE)) { // If the textbox exists
            var x_offset = 20 * image_xscale;  // Adjust horizontal offset
            textboxFireE.x = x + x_offset;
            textboxFireE.y = y - 50;           // Adjust vertical offset
            textboxFireE.image_xscale = 2 * sign(image_xscale);  // Keep proper mirroring
        }
    } else {
        if (instance_exists(textboxFireE)) { // If its not chasing and doesnt have sight of player
            instance_destroy(textboxFireE); // Destroy the textbox
            textboxFireE = noone; // Remove it from the room so it doesnt exist
        }
    }

    if (chasing && !is_attacking && attack_timer <= 0) { // If its chasing the player but not attacking, and has its attack cooldown ended, 
        is_attacking = true; // Being to attack the player 
        attack_timer = 60; // Fire every second
		
if (instance_exists(OPlayer)) { // If plpayer exists
        if (OPlayer.x < x) { //	If the player is in the left
            image_xscale = -abs(image_xscale); // Flip sprite to face left
        } else { // If the player is in right
            image_xscale = abs(image_xscale); // Face right
        }
}

        sprite_index = FireA; // use the attack charge animation while attacking
        image_index = 0; // Start from the first frame of thr animation
        image_speed = 1; // PLay animation at original speed 
        fireball_shot = false; // Reset fireball shot flag after the attack
    }

if (is_attacking && !fireball_shot) { // If its attacking but the fireball isnt shot
if (sprite_index == FireA && image_index >= sprite_get_number(FireA) - 1) { // If its playing the attack animation and reaches the last frame
	if(instance_exists(OPlayer)) {
var fireball = instance_create_layer(x, y, layer, FireShot); // Create the fireshot object
audio_play_sound(FireballShot, 1, false);
fireball.direction = point_direction(x, y, OPlayer.x, OPlayer.y); // Make it follow the direction of the player
fireball.speed = 4; // Travels with this speed
fireball.image_angle = fireball.direction; // Rotate the sprite to match its movement

fireball_shot = true; // Used to prevent multiple being shot

alarm[0] = 30; // Wait 0.5 seconds before moving again
}
}
}

    if (attack_timer > 0) { // If its attack cooldown hasnt ended
        attack_timer--; // Decrease it until it does
    }

if (hp <= 0 && !is_dying) { // If it is defeated and isnt in the dying state
    is_dying = true; // It dies
    is_attacking = false; // It stops attacking
	
			    var death_anim = instance_create_layer(x, y - 102 , "Enemies", Death); // Play the death animation above the firespirit
    death_anim.image_xscale = image_xscale; // Flip correctly

    var death_animation = instance_create_layer(x, y, layer, FireSpiritD); // The dead version of the firespirit is created
    death_animation.image_index = 0; // Its animation plays from the first frame

    instance_destroy(); // Destroy the FireSpirit object immediately after death animation finishes
}

    if (chasing && !is_attacking) { // If chasing but not attacking the player so is waiting between shots
        if (OPlayer.x < x) { // If the player is in the left
            image_xscale = -abs(image_xscale); // Flip sprite to face left
        } else {
            image_xscale = abs(image_xscale); // Face right
        }

        sprite_index = FireI; // Idle animation used while chasing but not attacking
    }
}

// System to emit particles when moving
if ((hsp != 0 || vsp != 0) && random(100) < 42) { // 42 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 orange particle for the firespirit
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);

    // Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);

    // Handles where the particles are emitted, their spawn position is around the objects center
    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);

    // Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);
}




