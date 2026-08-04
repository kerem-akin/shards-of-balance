// Check if healthPoints has increased (reset the timer when health increases)
if (healthPoints > healthPointsPrev) {
    followUpTimer = followUpTimerMax; // Reset the timer if health increased
}

// Decrease the timer each frame
followUpTimer = clamp(followUpTimer - 1, 0, followUpTimerMax);

// Apply lerp smoothly only when the timer reaches 0
if (followUpTimer == 0) {
    // Lerp towards the current healthPoints slowly
    healthPointsPrev = lerp(healthPointsPrev, healthPoints, 0.0075); // Slowly lerp
} 
// If the timer is still active, keep healthPointsPrev unchanged
else {
    healthPointsPrev = healthPointsPrev;
}
 

vsp += grv; // Gravity is applied to Exilion

// Player Detection and Chasing
if (instance_exists(OPlayer)) { // If the player exists
    var player_distance = point_distance(x, y, OPlayer.x, y); // Checks distance between Exilion and player
    var has_line_of_sight = !collision_line(x, y, OPlayer.x, y, Object12, false, true); // Checks for any collision boxes inbetween them

    if (player_distance < 1000 && has_line_of_sight) { // if Exilion is within 1000 pixels and there is no collision boxes blocking its vision
        if (!has_seen_player) { // If hasnt sen player yet
            has_seen_player = true; // He sees him
        }

        // Dialogue 
        var player = instance_nearest(x, y, OPlayer); // Sets player as the variable

        // Checks if the player is within 1000 pixels
        if (player != noone && point_distance(x, y, player.x, player.y) <= 1000) { 
            // Create dialogue only if it doesn't exist 
            if (!instance_exists(ODialogParent) && !is_dialogue_shown) { // If dialogue doesnt exist and isnt show yet
                var dialog_instance = instance_create_depth(x, y - sprite_height - 50, depth - 1, ODialogParent); // Create the dialogue
				audio_play_sound(ExilionAppears, 1, false); // Play the dialogue appearing sound effect once
                // Display the dialogue
                dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nAh... so you are the explorer they whisper of...");
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nA lone wanderer, standing against the tide of my power");
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nDefeating a fraction of my soul means nothing...");
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nThis land bends to my will, its very essence bound to me.");
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nI have shattered my soul, weaving its fragments into my soldiers...")
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nEvery single one of them carries a piece of my undying wrath.")
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nAnd yet, you stand here, a mere wanderer, trying to challenge me...")
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nCome then, struggle in vain...")
				dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nThe shards of balance will remain shattered... forever.");

                
                // Mark the dialogue as shown to prevent it from showing again
                is_dialogue_shown = true;
            }
        }

        // Ensure Exilion only chases the dialogue is completely finished
        if (is_dialogue_shown && !instance_exists(ODialogParent)) { // If dialogue finished and destroyed
            chasing = true; // Start chasing player
			if (!audio_is_playing(ExilionBossMusic)) { // If the boss musc theme isnt playing
            audio_play_sound(ExilionBossMusic, 10, true); // Play boss theme music
			}
            audio_sound_gain(BossFightBackground, 0, 0); // Mute the other background music
        } else {
            chasing = false; // Stay idle if dialogue is still active
        }
    } else {
        chasing = false; // If player is not in range, stop chasing
    }
} else {
    chasing = false;
    is_attacking = false;
}


// Check for Health levels 
// Check if Exilion is not idle and health drops below certain values
if ((healthPoints == 150 || healthPoints == 100 || healthPoints == 75 || healthPoints == 50) && !is_idle) { // If he is in any of these health values and isnt idle
    // If health is 50, spawn 2 archers instead of 1
    if (healthPoints == 50) {
        instance_create_layer(x + 80, y - 20, layer, BossArcher); // First archer
        instance_create_layer(x - 80, y - 20, layer, BossArcher); // Second archer
		audio_play_sound(ExilionSpawns, 1, false); // Play the Exilion spawning sound effect once
    } else if (healthPoints == 75) { // If he has 75 health
if (!instance_exists(Object108)) {
    var animation = instance_create_layer(x, y, "Player", Object108); // Play the enraged effect above him
}
    } else {
        instance_create_layer(x + 80, y - 20, layer, BossArcher); // Spawn 1 BossArcher if hp is 150 or 100
		audio_play_sound(ExilionSpawns, 1, false); // Play the Exilion spawning sound effect once
    }

    hsp = 0; // Stop horizontal movement (This will be reset later if needed)
    chasing = false; // Stop chasing

    is_idle = true; // Mark as idle
    idle_timer = 0; // Reset idle timer
    sprite_index = WizardBI; // Set Exilion to idle animation
    image_speed = 1; // original animation speed

    // Face the Player
    if (instance_exists(OPlayer)) {
        if (OPlayer.x > x) {
            image_xscale = 1;  // Face right
        } else {
            image_xscale = -1; // Face left
        }
    }

    y -= 46; // Higher y offset so properly stands on the ground
    image_alpha = 1; // Fully visible
}


if (is_idle) { // if is idle
    idle_timer++; // Increase the timer

    if (instance_exists(OPlayer)) { 
        if (OPlayer.x > x) { // Face the player while idle
            image_xscale = 1;  // Face right
        } else {
            image_xscale = -1; // Face left
        }
    }

if (instance_exists(OPlayer)) { // If player exists
    if (idle_timer >= 120) { // stay idle for 2 seconds
        is_idle = false; // Exit idle state
        chasing = true; // Resume chasing the player
        sprite_index = WizardBR; // Switch back to running animation
        y += 46; // Reset the Y offset to the original position for the running animation
        hsp = (OPlayer.x > x) ? speed_run : -speed_run; // Sets movement speed towards the player
    }
}
}

if (!is_idle) { // If isnt idle
    if (chasing) { // And is chasing
        // Determine horizontal speed based on player position if player exists, otherwise maintain momentum
        if (instance_exists(OPlayer)) {
            if (OPlayer.x > x) { // Based on players position
                hsp = speed_run; // Set running speed to right 
            } else {
                hsp = -speed_run ; // Set running speed to left 
            }
        }
        sprite_index = WizardBR; // Use the runnign animation
        image_speed = 1; // Play at original animation speed
    } else {
        hsp = 0;
        sprite_index = WizardBI; // Idle animation when not chasing
    }
}

var ground_ahead = place_meeting(x + sign(hsp) * 8, y + 1, Object12); // Checks if there is a collision object in front of Exilion
if (!chasing && !ground_ahead) { // If its not chasing the player and there is no ground ahead
    hsp *= -1; // Change horizontal speed direction
}

if (chasing && place_meeting(x + sign(hsp), y, Object12) && !place_meeting(x, y - 16, Object12)) { 
//Checks if there is a collision object in front Exilion when chasing, also if there is one above
    vsp = -6; // Jumps if there is one in front and none at the top, following the player. 
}

if (place_meeting(x + hsp, y, Object12)) { // Checks for horizontal collision
    hsp *= -1; // reverses movement direction
    image_xscale *= -1; // Flips sprite animation
}

x += hsp; // Exilion moves horizontally based on its horizontal speed

// Vertical Collision
if (place_meeting(x, y + vsp, Object12)) {
    while (!place_meeting(x, y + sign(vsp), Object12)) {
        y += sign(vsp); // Moves until there is a collision
    }
    vsp = 0; // Sets vertical speed to 0
}

y += vsp; // Moves vertically based on its vertical speed

if (instance_exists(OPlayer)) { // if player exists
    if (point_distance(x, y, OPlayer.x, y) < 100 && !is_attacking) { // if within a 100 pixels and isnt attacking
        is_attacking = true; // Start attacking
        attack_timer = 0; // Resets attack timer
    }
}

if (is_attacking) { // If Exilion is attacking
    attack_timer++;
    if (attack_timer >= attack_duration) {  // Check for attack timer to see if it passed
        is_attacking = false;
        if (instance_exists(OPlayer) && point_distance(x, y, OPlayer.x, y) < 100) { // If within 100 pixels of player
            var player = instance_place(x, y, OPlayer); // Set player as the varibale
            if (player != noone && player.invincibility_frames == 0) { // If player exists and doesnt have invincibility
                player.health -= damage; // Does damage, 1 damage set in create event
                player.invincibility_frames = 60; // Gives the player invincibility for a second
            }
        }
    }
}

if (!is_attacking) { // if isnt attacking
    sprite_index = WizardBR;  // Switch to running animation after attack
}

if (is_idle) { // if is idle
    sprite_index = WizardBI; // use idle animation
    image_speed = 1; // At original animation speed
    image_alpha = 1; // Make sure the idle sprite is fully visible
} else if (!is_attacking) { // if not attacking
    if (!chasing) { // And not chasing
        sprite_index = WizardBI; // use idle animation 
    } else {
        sprite_index = WizardBR; // Running animation
    }
}

if (hsp != 0 && place_meeting(x, y + 1, Object12) && !is_attacking) { // If Exilion is moving horizontally, not standing on the ground and isnt attacking
    image_xscale = sign(hsp); // Set sprite direction based on direction of its movement
}

// System to emit particles when moving
if ((hsp != 0 || vsp != 0) && random(100) < 25) { // 25 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 death particle for Exilion
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1); 
	// Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);
	
	// Handles where the particles are emitted, their spawn position is in the center of Exilions staff 
    var px = x + random_range(-16, 16);
    var py = y + random_range(-40, 0);
	// Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);
}

if (healthPoints <= 0) { // if Exilion is dead
	audio_stop_sound(ExilionBossMusic); // Stop the boss fight theme music
    with(instance_create_layer(x, y - 64, layer, ExilionD)) { // Create the dead Exilion object
        direction = other.hitfrom; // Set its position based on the last attack the Exilion received
        hsp = lengthdir_x(3, direction); 
        vsp = lengthdir_y(2, direction)-2; // Slight knockback effect
        if (sign(hsp) != 0) image_xscale = sign(hsp) * other.image_xscale; // Makes sure it faces the right direction
    }
    instance_destroy(); // Destroy dead Exilion
}

if (!instance_exists(OPlayer)) { // If player doesnt exist
	image_alpha = 0; // Make Exilion invisible
	if (instance_exists(Object108))  // If his enraged effect exists
		instance_destroy() // Destroy it
	}