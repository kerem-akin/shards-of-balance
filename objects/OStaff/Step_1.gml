if (instance_exists(WitchesBlessingOBtained)) { // If the ability obtaining screen exists
    image_alpha = 0; // Make it invisible
} else {
    image_alpha = 1; // Make it visible
}

if (instance_exists(OPlayer)) { // if the player exists
    x = OPlayer.x - 20; // Set the wand`s x position
    y = OPlayer.y + 30; // Set the wand`s y position
} else {
    instance_destroy(); // Destroy if player doesnt exist
}

if (instance_exists(OPlayer)) { // if the player exist
    image_angle = point_direction(OPlayer.x, OPlayer.y, mouse_x, mouse_y) - 50; // Point the wand in the mouse`s direction.
} else {
    instance_destroy(); // Destroy if player doesnt exist
}

// Reduce firing delay and recoil
firingdelay = max(0, firingdelay - 1);
recoil = max(0, recoil - 1);

// Only shoot when clicking and firing delay is over
if (instance_exists(OPlayer) && mouse_check_button(mb_left) && firingdelay <= 0) {
    shotCount += 1; // Increase shot count every time an attack is released

    recoil = 4; // Default reciol for the normal magic attack
    firingdelay = 6; // Small firing delay for normal shots
    ScreenShake(2, 10); // Small screenshake

    with (instance_create_layer(x, y, "MagicAttack", MagicAttack)) { // Create the attack
        speed = 25; // Deafult speed at which it travels
        direction = point_direction(OPlayer.x, OPlayer.y, mouse_x, mouse_y) + random_range(-3, 3); 
		// Travel towards mouse position with a slight offset for small randomization
        image_angle = direction; // Set its rotation to the movement direction
    }
}


// Ensure fireball is always usable in Room 4, Room 5, and Boss Fight
if (room == R4 || room == R5 || room == BossFight) {
    global.fireballUnlocked = true; // Set the fireball unlocked status needed to use it to true
}

if (global.fireballUnlocked) { // If the status is unlocked
    if (room == R4 || room == R5 || room == BossFight || room == R3Cave) { // If in these rooms
        if (shotCount >= 30) { // If shot count exceeded thirty
            if (keyboard_check_pressed(vk_lshift)) { // Ifleft shift is pressed

                shotCount = 0; // Reset shot counter after releasing the fireball
                recoil = 60; // Massive recoil, wand jumps back a lot
                firingdelay = room_speed; // 1 seconddelay after shooting it, not other shots can be fired
                ScreenShake(15, 60); // Massive screenshake

                with (instance_create_layer(x, y, "MagicAttack", MagicAttackFireBall)) { // Cretae the fireball
                    audio_play_sound(FireBall2,1,false); // Play the fireball created sound once
                    audio_sound_gain(FireBall2,5,0); // PLay it louder than the original volume
                    speed = 7; // Deafult speed at which it travels, quite slow
                    direction = point_direction(OPlayer.x, OPlayer.y, mouse_x, mouse_y); // Travels towards mouse position
                    image_angle = direction; // Set its rotation to the movement direction
                }
            }
        }

        // Create WitchesBlessingObject only if the ability is unlocked and in the correct room
        if (shotCount >= 30) { // If shotcount is currently exceeding thirty
            if (!instance_exists(WitchesBlessingObject)) { // If the ability icon doesnt exist
                instance_create_layer(0, 0, "Player", WitchesBlessingObject); // Create it
            }
        } else {
            if (instance_exists(WitchesBlessingObject)) { // if it still exists
                WitchesBlessingObject.fadingOut = true; // Fade it out
            }
        }
    }
}


// Apply recoil movement
x -= lengthdir_x(recoil, image_angle); // Opposite direction of wand
y -= lengthdir_y(recoil, image_angle); // Opposite direction of wand. (Bounces back)

// Flip the sprite if pointing downwards
if (image_angle > 90 && image_angle < 270) {
    image_yscale = -2; // Flip vertically
} else {
    image_yscale = 2; // Normal scale
}
