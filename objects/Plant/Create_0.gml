// Movement variables
vsp = 0; // Vertical movement, starts out at 0.
grv = 0.3; // Gravity applied to the plant, directly affects vertical speed
speed_walk = 2; // Walking speed, original
hsp = speed_walk * -1; // Horizontal speed of plant, moves left initially because of the -1

hp = 4; // Default health of plant
flash = 0; // Toggled off at starts, plays when plant is damaged by player
hitfrom = 0; // Tracks direction and source of damage

chasing = false; // Doesn`t chase the player at the start, set to true when has sight of the player
is_attacking = false; // Determines if plant is attacking, happens when near player
attack_timer = 0; // Timer that controls its attack behavior
attack_duration = 30; // Duration of attack
damage_frame = 15; // Frame when the attack actually does damage

// Sets the original health of the plant at a diffeent value for different rooms, used to balance out the game and make it harder with progression
if (room == R2) {
    hp = 8;
} else if (room == R3) {
    hp = 11;
} else if (room == R4) {
	hp = 13;
} else if (room == R5) {
	hp = 15;
} else {
    hp = 12; // For all other rooms
}

chase_timer = 0; // Timer tracking how long the plant chases the player after losing sight, toggled off at starts since it doedn`t see the player

is_dying = false; // Tracks if the plant is in its dying state

part_system = part_system_create();  // Creates particles system
part_glitter = part_type_create();  // Creates new particle type for glitter

part_type_size(part_glitter, 0.15, 0.03, 0.015, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second.

particles_sprites = [PGreen]; // Use PGreen sprite for the particle which I created in sprite editor

textboxE = noone; // No active textbox when starting the room, it is created when plant is chasing

damage = 1; // Default damage the plant deals if no other damage value is set in its creation code