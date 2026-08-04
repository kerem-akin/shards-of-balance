spd = 8; // the arrow speed
direction = point_direction(x, y, OPlayer.x, OPlayer.y); // faces the direction of the player
hsp = lengthdir_x(spd, direction); // Horizontal movement towards the direction of player
vsp = lengthdir_y(spd, direction); // Vertical movement towards the direction of player

life = 75; // Lasts 1.25 seconds

part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.2, 0.2, 0, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second. (Life Span)

particles_sprites = [PPink]; // Use PPink sprite for the particle which I created in sprite editor


