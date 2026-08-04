hsp = 0; // Horizontal movement, starts out at 0.
vsp = 0; // Vertical movement, starts out at 0.
grv = 0.65; // Gravity applied to the player, directly affects vertical speed
walksp = 8; // Walking speed, original
speed_debuff_timer = 0; // The timer used for the speed debuff from enemy, at 0 originally so not active
speed_buff_timer = 0; // The timer used for the speed buff from potion, at 0 originally so not active
original_speed = walksp; // Original walkspeed of player, 8. 

window_set_cursor (cr_none) // Doesn`t use original cursor, hides it
cursor_sprite = CCursor; // Insated of the original cursor, uses a custom one I made in the sprite editor

health = 3; // Default health of player
max_health = 5; // Can go up to 5

hascontrol = true; // Determines if the player can control the character, which he can at starts
invincibility_frames = 0; // Timer for invincibility, at 0 originally so not triggered
shader_timer = 0; // Timer for shader, at 0 originally so not triggered

// Particle emitting system
part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.2, 0.04, 0.02, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second.

particles_sprites = [PBlue]; // Use PBlue sprite for the particle which I created in sprite editor

death_timer = -1; // -1 means the timer is inactive

global.is_spawning = false;  // Initialize the variable
global.spawn_timer = 0; // Tracks if the death effect animations are spawning


