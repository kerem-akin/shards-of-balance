
vsp = 0; // Vertical movement, starts out at 0.
grv = 0.3; // Gravity applied to the skeleton, directly affects vertical speed
speed_walk = 2; // Walking speed, original
hsp = speed_walk * -1; // Horizontal speed of skeleton, moves left initially beacuse of the -1

hp = 4; // Default health of skeleton
flash = 0; // Toggled off at starts, plays when skeleton is damaged by player
hitfrom = 0; // Tracks direction and source of damage
chasing = false; // Doesn`t chase the player at the start, set to true when has sight of the player
speed_run = 4;// Runs twice as fast than its walking speed, this is activated when he is chasing

is_attacking = false; // Determines if skeleton is attacking, happens when near player
attack_timer = 0; // Timer that controls its attack behavior
attack_duration = 30; // Duration of attack
damage_frame = 15; // Frame when the attack actually does damage

// Sets the original health of the skeleton at a diffeent value for different rooms, used to balance out the game and make it harder with progression
if (room == R1) {
    hp = 3; 
} else if (room == R2) {
    hp = 4;
} else if (room == R3) {
    hp = 4;
} else if (room == R3Cave) {
    hp = 6;
} else if (room == R4) {
	hp = 5;
} else if (room == R5) {
	hp = 6;
} else {
    hp = 4; // For all other rooms
}

//
chase_timer = 0; // Timer tracking how long the skeleton chases the player after losing sight, toggled off at starts since it doedn`t see the player

part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.15, 0.02, 0.015, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second.

particles_sprites = [PGold]; // Use PGold sprite for the particle which I created in sprite editor

textboxE = noone; // No active textbox when starting the room, it is created when skeleton is chasing

damage = 1; // Default damage the skelton deals if no other damage value is set in its creation code
