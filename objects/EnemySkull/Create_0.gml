hspeed = 2; // Horionztal speed of skull enemy
move_range = 128; // Range of movement, 128 to the right and 128 to the left
start_x = x; // Tracks the movement range

hsp = 0; // Tracks horionztal movement of object
vsp = 0; // Tracks vertical movement of object

sprite_index = Sprite85; // Use sprite 85 for the animtion
image_speed = 0.5; // 50% of original animation speed
image_xscale = 1.7; // Width scaled by x1.5
image_yscale = 1.7; // height scaled by x1.5

part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.2, 0.2, 0, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0);  // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0);  // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second.

particles_sprites = [PBlue];  // Use PBlue sprite for the particle which I created in sprite editor