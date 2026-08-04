if (!instance_exists(OPlayer)) { 
    chasing = false; // Stop chasing the player
    is_attacking = false; // Stop attacking
    if (instance_exists(textboxFireE)) {
        instance_destroy(textboxFireE); // Remove textbox if it exists
        textboxFireE = noone;
    }
}

if (!is_dying) {
    // === BASIC MOVEMENT ===
    if (!is_attacking && !chasing) {
        // Hovering logic: Maintain hover height above Object12
        var ground_y = y;
        while (!place_meeting(x, ground_y + 1, Object12) && ground_y < room_height) {
            ground_y++;
        }

        if (ground_y < room_height) {
            y = ground_y - hover_height;
            vsp = 0;
        } else {
            vsp += grav; // Apply gravity if no ground is found
            y += vsp;
        }

        // Check for edge or collision with Object12
              if (!place_meeting(x + hsp, y + hover_height + 1, Object12) || place_meeting(x + hsp, y, Object12)) {
    hsp = -hsp; // Reverse movement direction
}

// Always face movement direction when not attacking
if (!is_attacking) {
    if (hsp != 0) {
        image_xscale = sign(hsp); // Ensure sprite faces movement direction
    }
}
        x += hsp; // Move horizontally

        // Set walking animation when not chasing or attacking
        sprite_index = FireW;
        image_speed = 1;
    }

    if (instance_exists(OPlayer)) {
    var player_distance = point_distance(x, y, OPlayer.x, OPlayer.y);
    var has_line_of_sight = !collision_line(x, y, OPlayer.x, OPlayer.y, Object12, false, true);

    if (player_distance < 500 && has_line_of_sight) {
        chasing = true;
    } else {
        chasing = false;
    }
	}
		if (chasing && hp > 0) {  // Show textbox when FireSpirit can see the player
        if (!instance_exists(textboxFireE)) {
			audio_play_sound(EnemyNotices,1,false);
            textboxFireE = instance_create_layer(x, y, "Enemies", TextBoxE);
            textboxFireE.sprite_index = Sprite181E;
            textboxFireE.image_speed = 1;
            textboxFireE.image_xscale = image_xscale * 2;  // Mirror based on direction
            textboxFireE.image_yscale = 2;
        }
        if (instance_exists(textboxFireE)) {
            // Position calculation
            var x_offset = 20 * image_xscale;  // Adjust horizontal offset
            textboxFireE.x = x + x_offset;
            textboxFireE.y = y - 50;           // Adjust vertical offset
            textboxFireE.image_xscale = 2 * sign(image_xscale);  // Keep proper mirroring
        }
    } else {
        if (instance_exists(textboxFireE)) {
            instance_destroy(textboxFireE);
            textboxFireE = noone;
        }
    }


    // === ATTACK LOGIC ===
    if (chasing && !is_attacking && attack_timer <= 0) {
        is_attacking = true;
        attack_timer = 60; // Fire every second
		

        if (instance_exists(OPlayer)) {
        if (OPlayer.x < x) {
            image_xscale = -abs(image_xscale); // Flip sprite to face left
        } else {
            image_xscale = abs(image_xscale); // Face right
        }
		}

        sprite_index = FireA; // Attack charge animation
        image_index = 0;
        image_speed = 1;
        fireball_shot = false; // Reset fireball shot flag
    }

    // === SPAWN FIREBALL (Only Once Per Attack) ===
    if (is_attacking && !fireball_shot) {
        if (sprite_index == FireA && image_index >= sprite_get_number(FireA) - 1) {
				if(instance_exists(OPlayer)) {
            var fireball = instance_create_layer(x, y, layer, FireShotStr);
			audio_play_sound(FireballShot, 1, false);
            fireball.direction = point_direction(x, y, OPlayer.x, OPlayer.y);
            fireball.speed = 4;
            fireball.image_angle = fireball.direction; // Rotate the sprite to match movement

            fireball_shot = true; // Prevent multiple shots

            // Wait before resuming movement
            alarm[0] = 30; // Wait 0.5 seconds before moving again
        }
    }
}

    // === ATTACK COOLDOWN ===
    if (attack_timer > 0) {
        attack_timer--;
    }

    // === DEATH LOGIC ===
if (hp <= 0 && !is_dying) {
    is_dying = true;
    is_attacking = false;
			    var death_anim = instance_create_layer(x, y - 102 , "Enemies", Death);
    death_anim.image_xscale = image_xscale; // Flip correctly

    // Spawn the death animation object at the FireSpirit's position
    var death_animation = instance_create_layer(x, y, layer, FireSpiritDStr);
    death_animation.image_index = 0; // Set the animation to start from the first frame

    instance_destroy(); // Destroy the FireSpirit object immediately after spawning the death animation
}

    // === IDLE ANIMATION BETWEEN SHOTS (when chasing but not attacking) ===
    if (chasing && !is_attacking) {
        // Determine direction for idle animation (flip if needed)
        if (OPlayer.x < x) {
            image_xscale = -abs(image_xscale); // Flip sprite to face left
        } else {
            image_xscale = abs(image_xscale); // Face right
        }

        sprite_index = FireI; // Idle animation while chasing but not attacking
    }
}

if ((hsp != 0 || vsp != 0) && random(100) < 42) {
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);

    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);

    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);

    part_particles_create(part_system, px, py, part_glitter, 1);
}

