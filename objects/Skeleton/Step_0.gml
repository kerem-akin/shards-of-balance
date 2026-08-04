vsp += grv; // Applies gravity to the vertical speed of the skeleton, used when it jumps or falls to chase the player

if (instance_exists(OPlayer)) { // If player exists
var player_distance = point_distance(x, y, OPlayer.x, OPlayer.y); // Checks distance between skeleton and player
var has_line_of_sight = !collision_line(x, y, OPlayer.x, OPlayer.y, Object12, false, true); // Checks for any collision boxes between

// Skeleton starts to change if the player is within 500 pixels and there is no collision boxew blocking its vision
if (player_distance < 500 && has_line_of_sight) { 
    chasing = true;
	chase_timer = 120; // Chases for an extra 2 seconds after losing sight
} else {
	if (chase_timer > 0) { // Checks if its still chasing
		chase_timer--; // Decreases timer until hitting zero if skeleton doesn`t have sight of player
	} else {
		chasing = false; // Stops chasing player whwn timer reaches 0
		is_attacking = false;
	}
}
} else {
	chasing = false;
	is_attacking = false;
}
	

if (chasing) {
    if (OPlayer.x > x) {
        hsp = speed_run; // Uses the run speed instead of walk when chasing, 4 in default. This can be changed in creation code
    } else {
        hsp = -speed_run; // Moves in other direction 
    }
	sprite_index = SkellyR; // Plays running animtion when chasing
	image_speed = 1; // At original animation speed
} else {
    hsp = speed_walk * sign(hsp); // If walking, uses walking speed
	sprite_index = SkellyW; // Plays the walking animation insatead of running
}

var ground_ahead = place_meeting(x + sign(hsp) *8,y+1,Object12); // Checks if there is a collision object in front of the skeleton
if (!chasing && !ground_ahead) { // If its not chasing the player and there is no ground ahead
	hsp *= -1; // Change horizontal movement direction. This code makes it so the skeleton doesnt fall off the platform it was placed in unless chasing
}

if (chasing && place_meeting(x + sign(hsp), y, Object12) && !place_meeting(x, y - 16, Object12)) {
//Checks if there is a collision object in front of skeleton when chasing, also if there is one above
    vsp = -6; // Jumps if there is one in front and none at the top, following the player
}

if (place_meeting(x + hsp, y, Object12)) { // Checks for horizontal collision
    while (!place_meeting(x + sign(hsp), y, Object12)) {
        x += sign(hsp); // Stops skelton at the edge of an obstacle
    }
    
    if (!place_meeting(x, y + 1, Object12)) { // If there is no collision box below the skeleton
        hsp = 0; // Sets horizontal movement speed to 0
    } else {
        hsp *= -1; // Reverses direction if there is ground below
    }
}

x += hsp; // Skeleton moves horizontally based on its horizontal speed

if (place_meeting(x, y + vsp, Object12)) { // Checks for vertical collision box above the skeleton
    while (!place_meeting(x, y + sign(vsp), Object12)) { // Moves skeleton above until it doesnt collide with the collision object
        y += sign(vsp); // Moves until there is a collision
    }
    vsp = 0; // Vertical movement is 0 if there if it collides with collision object
}

y += vsp; // Moves vertically based on its vertical speed

if(instance_exists(OPlayer)) { // if player exists
if (point_distance(x, y, OPlayer.x, OPlayer.y) < 20 && !is_attacking) { // Checks if skeleton is within 20 pixels of the player
    is_attacking = true; // It attacks if it is
    attack_timer = 0; // Resets attack timer
    sprite_index = SkellyA; // Uses attacking animation
    image_index = 0; // Goes back to first frame after the animation plays
    image_speed = 1;  // Plays at original animation speed
}
}

// During the attack, count the timer and then check for damage if player is still in range
if (is_attacking) {
    attack_timer++; // Attack timer 
    if (attack_timer >= attack_duration) { // Check for attack timer to see if it passed
        is_attacking = false;
        if (point_distance(x, y, OPlayer.x, OPlayer.y) < 20) { // If still within 20 pixels of player
            var player = instance_place(x, y, OPlayer); // Checks if skeleton is in the position of player
            if (player != noone && player.invincibility_frames == 0) { // If the player isnt invincible and exists
                player.health -= damage; // Does damage, 1 in default but can be increased in creation code
                player.invincibility_frames = 60; // Gives invincibility for a second
            }
        }
    }
}


if (!is_attacking) { // If not attacking
    if (!place_meeting(x, y + 1, Object12)) { // If the skeleton is in the air, not colliding with collision object
        sprite_index = SkellyJ; // Play the jumping animation
        image_speed = 0; // The animation is static, remains in same frame
        image_index = (sign(vsp) > 0) ? 1 : 0; // If falling, set the falling animation 
    } else { 
        image_speed = 1; // Set animation to normal speed if standing in ground
        if (abs(hsp) < 0.1) { // If not moving horizontally
            sprite_index = SkellyI; // Use the idle animation for the skeleton
            hsp = speed_walk * sign(image_xscale); // Set horionztal speed to walkspeed which is 2, based on its direction
        } else {
            sprite_index = SkellyW; // Use the walking animation
        }
    }
}

if (hsp != 0 && place_meeting(x, y + 1, Object12) && !is_attacking) { // If skeleton has horizontal movement and isnt attacking
    image_xscale = sign(hsp); // Flip its sprite based on its movement direction
}

if (chasing) {
    sprite_index = SkellyR; // Use the running animation if the skeleton is chasing the player
    image_speed = 1; // Play animation at original speed
} else {
    sprite_index = SkellyW; // Use the walking animation if the skeleton isnt chasing the player
    image_speed = 1; // Play animation at original speed
}

// System to emit particles when moving
if ((hsp != 0 || vsp != 0) && random(100) < 12) { // 12 percent to emit particles every frame if moving
	// Get a random sprite from the provided ones in create event, there is only 1 gold particle for the skeleton
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
if (chasing && !is_attacking && hp > 0) { // If the skeleton is chasing, not attacking and is alive (More than 0 hp)
    if (!instance_exists(textboxE)) { // If the textbox doesnt already exist
		audio_play_sound(EnemyNotices,1,false);  // Play alerted sound effect
        textboxE = instance_create_layer(x, y, "Enemies", TextBoxE); // Create a new textbox in the skeletons position
        textboxE.sprite_index = Sprite181E; // Use this sprite for the textbox
        textboxE.image_speed = 1; // Original animation speed 
        textboxE.image_xscale = -2; // Initially flipped, this is to make it face the right direction, scaled up x2
        textboxE.image_yscale = 2; // Scaled x2
    }
    if (instance_exists(textboxE)) { // If the textbox exists
        var textbox_width = sprite_get_width(Sprite181E) * 2;  // gets width of sprite
        if (image_xscale > 0) {  // Skeleton facing right
            textboxE.x = x + sprite_width - 140 ;  // Position it on the right of the skeleton 
            textboxE.image_xscale = -2;          // Flip it horizontally, makes it face the right direction
        } else {  // Skeleton facing left
            textboxE.x = x - textbox_width + 55;  // Position on the left of the skeleton, the offset
            textboxE.image_xscale = 2;            // Flip horizontally, makes it face the right direction
        }
        textboxE.y = y - sprite_height + 100; // Set its vertical position based on skeletons position
    }
} else {
    if (instance_exists(textboxE)) { // If its not chasing the player
        instance_destroy(textboxE); // Destroy the textbox
        textboxE = noone; // Sets it back to noone, doesnr exist
    }
}

if (hp <= 0) { // If has less than 0 hp so dead
    if (instance_exists(textboxE)) { // If it still exists
        instance_destroy(textboxE); // Destroy it
    }
    // Create the death object if skeleton is killed
    with(instance_create_layer(x, y, layer, SkeletonD)) {
        direction = other.hitfrom; // Set its position based on the last attack the skeleton received
        hsp = lengthdir_x(3, direction);
        vsp = lengthdir_y(2, direction)-2; // Slight knockback effect
        if (sign(hsp) != 0) image_xscale = sign(hsp) * other.image_xscale; // Makes sure it faces the right direction
    }
    instance_destroy(); // destory the dead skeleton
}
