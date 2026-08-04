
vsp = 0; // Vertical movement, starts out at 0.
grv = 0.3; // Gravity applied to the archer, directly affects vertical speed
speed_walk = 5; // Walking speed, original
hsp = 5; // Horizontal speed of archer, moves left initially beacuse of the -1

hp = 20; // Default health of archer
flash = 0; // Toggled off at starts, plays when archer is damaged by player
hitfrom = 0; // Tracks direction and source of damage
chasing = false; // Doesn`t chase the player at the start, set to true when has sight of the player

is_attacking = false; // Determines if archer is attacking, happens when near player
attack_timer = 0; // Timer that controls its attack behavior
attack_duration = 30; // Duration of attack
damage_frame = 15; // Frame when the attack actually does damage

chase_timer = 0; // Timer tracking how long the archer chases the player after losing sight, toggled off at starts since it doedn`t see the player

part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.15, 0.02, 0.015, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second.

particles_sprites = [PPink]; // Use PPink sprite for the particle which I created in sprite editor

textboxArcherE = noone; // No active textbox when starting the room, it is created when archer is chasing

damage = 1; // Default damage the archer deals if no other damage value is set in its creation code

arrow_shot = false; // Tracks whether the archer shot its arrow or not

is_dying = false; // Tracks if archer is in dying state

if (!instance_exists(Object107)) { // If the spawn in animation doesnt exist
    var animation = instance_create_layer(x, y - 50, "Enemies", Object107); // Create it above the archer
    animation.image_speed = 1; // Play at original animation speed
    animation.image_xscale = 0.7; // Scaled down x0.7 horizontally
    animation.image_yscale = 0.7; // Scaled down x0.7 vertically
    animation.image_index = 0; // Start the animation at the first frame
}