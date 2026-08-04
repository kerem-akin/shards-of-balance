if (hascontrol) // If player has control
{
// Movement of player, pressing these keys move it.
key_left = keyboard_check(vk_left)  || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)  || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space)  || keyboard_check(ord("W"));
}
else
{
	// Cancels all movement if the player doesn`t have control
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
var move = key_right - key_left; // Determines movement direction
	
hsp = move * walksp; // Calculates the horizontal speed of the player

vsp = vsp + grv; // Gravity, applies it to the vertical speed of the player

// Jump control, player jumps if in ground (Object 12 is my collision object)
if ((place_meeting(x, y+1, Object12)) && key_jump)
{
    vsp = -19.5; // The jump force, increase to get higher jumping power.
}
// Collisions
if (place_meeting(x + hsp, y, Object12)) // If colliding horizontally
{
    while (!place_meeting(x + sign(hsp), y, Object12)) 
    {
        x = x + sign(hsp); // Stops the player
    }
    hsp = 0; // Stops the horizontal movement of player if colliding with collision object, like running into the collision block
}

x = x + hsp; // Applies horizontal movement to player

// Vertical collisions
if (place_meeting(x, y + vsp, Object12))  // If colliding vertically
{
    while (!place_meeting(x, y + sign(vsp), Object12)) 
    {
        y = y + sign(vsp); // Stops the player
    }
    vsp = 0; // Stops vertical movement on collision, like colliding with the collision block above you after a jump
}

y = y + vsp; // Applies vertical movement to player

if (hsp != 0 && place_meeting(x, y + 1, Object12)) { // If player is moving on the collision object
    if (!audio_is_playing(PlayerWalks1) && !audio_is_playing(PlayerWalks2) && !audio_is_playing(PlayerWalks3)) { // If the walking sound isnt playing
        var randomSound = choose(PlayerWalks1, PlayerWalks2, PlayerWalks3); // Sets 3 sounds as the variable
		audio_sound_gain(randomSound, 0.05, 0); // Chooses one of the stored sounds and decreases volume to 7.5%
        audio_play_sound(randomSound, 1, false); // Plays the sound once 
	}
}

if (!place_meeting(x, y + 1, Object12)) // If player is in air, not touching thr ground
{
    sprite_index = BlueGuyJ; // Uses the jump animation
    image_speed = 0;
    if (sign(vsp) > 0) // If falling
        image_index = 1; // Plays the falling frame
    else 
        image_index = 0; // If not, plays jumping frame
}
else
{
    image_speed = 1; // Normal animation speed
    if (hsp == 0) // If not moving
    {
        sprite_index = BlueGuyI; // Idle animation of player
    }
    else
    {
        sprite_index = BlueGuyR; // If moving, running animation
    }
}

if (hsp != 0) // If player has horizontal movement, so is moving
    image_xscale = sign(hsp) / 0.285714286; // Flips the player object based on its direction
	
// Handles invincibility time of player, decreases until it reaches 0. (60 originally, 1 second)	
if (invincibility_frames > 0) { 
    invincibility_frames--; // Decrease if not zero 
}

// Handles shader after taking damage, decreasing until it reaches 0.
if (shader_timer > 0) {
    shader_timer--; // Decrease if not zero
}

if (place_meeting(x, y, Skeleton) && invincibility_frames == 0) { // Collision with skeleton
    var enemy = instance_nearest(x, y, Skeleton);
    health -= enemy.damage; // Skeleton does damage, 1 in default but can be changed in creation code. Only works if player doesn`t have invincibility
    invincibility_frames = 60; // 1 second invinciblity
    shader_timer = 30; // 0.5 second shader effect after taking damage
    
	// Player gets knockback
    var dir = point_direction(enemy.x, enemy.y, x, y);
    hsp = lengthdir_x(6, dir);
    vsp = lengthdir_y(6, dir) - 4; // Player gets knockback up 
}


if (place_meeting(x, y, Plant) && invincibility_frames == 0) { // If colliding with plant enemy
    var enemy = instance_nearest(x, y, Plant);
    health -= enemy.damage; // Plant does damage if 
    invincibility_frames = 60; // 1 second invinciblity
    shader_timer = 30; // 0.5 second shader effect after taking damage
    
	// Player gets knockback
    var dir = point_direction(enemy.x, enemy.y, x, y);
    hsp = lengthdir_x(6, dir);
    vsp = lengthdir_y(6, dir) - 4; // Player gets knockback up
}

if (place_meeting(x, y, Exilion) && invincibility_frames == 0) { // If colliding with plant enemy
    var enemy = instance_nearest(x, y, Exilion);
    health -= enemy.damage; // Plant does damage if 
    invincibility_frames = 60; // 1 second invinciblity
    shader_timer = 30; // 0.5 second shader effect after taking damage
    
	// Player gets knockback
    var dir = point_direction(enemy.x, enemy.y, x, y);
    hsp = lengthdir_x(6, dir);
    vsp = lengthdir_y(6, dir) - 4; // Player gets knockback up
}

// If player dies
if (health <= 0) {
 if (!instance_exists(DeathScreenDimmer)) { // If object that dims backgroud doesnt exist
        var dimmer = instance_create_layer(0, 0, "SpawnInEffect", DeathScreenDimmer); // Create it
        dimmer.fade_to_dark = true; // Start fading it 
    }
	
    instance_create_layer(0, 0, "MagicAttack", DeathScreen); // Create the death screen 
    instance_destroy(); // destroy player, wand is destroyed with him
	
	global.is_spawning = true; // Start the death effect screen animation spawning
    global.spawn_timer = 0;
}	

// System to emit particles when moving
if (health > 0 && (hsp != 0 || vsp != 0) && random(100) < 25) { // 25 percent to emit particles every frame if moving
    // Get a random sprite from the provided ones in create event, there is only 1 blue particle for the player
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);

    // Changes part_glitter to the particle sprite chosen
    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);

    // Handles where the particles are emitted, their spawn position is around the objects center
    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);

    // Creates the actual particle
    part_particles_create(part_system, px, py, part_glitter, 1);
}

// Handles speed debuff from an enemy I have
if (speed_debuff_timer > 0) { // If the timer isn`t at zero
    speed_debuff_timer -= 1; // Decrease by one every fame
    if (speed_debuff_timer <= 0) { // If timer reaches zero, debuff is over
        walksp = original_speed; // Set the walksp back to normal, 8 is the normal for the player
    }
}

// Stop movement when the dialogue is created on the screen
if (instance_exists(ODialogParent)) {
    hsp = 0;
} 

// Andles speed buff this time for a speed potion I have
if (speed_buff_timer > 0) { // If timer hasnt reached zero
    speed_buff_timer--; // Decrease the timer

    // Revert the speed when the timer ends
    if (speed_buff_timer <= 0) {
        walksp = original_speed;  // Speed back to normal, 8.
    }
}




