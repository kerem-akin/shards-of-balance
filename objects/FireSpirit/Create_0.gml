hsp = 2; // Horizontal speed
vsp = 0; // Vertical speed
grav = 0.5; // Gravity effecting the object
hover_height = 40; // Hover height above the collision object

hp = 12; // Deafault health if health value isnt set for the room
// The health of the fire spirit varies depending on which room itis in
if (room == R3Cave) hp = 15;
if (room == R4) hp = 20;
if (room == R5) hp = 22;

flash = 0; //
chasing = false; // Tracks if it is chasing the player or not, false initially
is_attacking = false; // Tracks if it is attacking the player or not, false initially
attack_timer = 0; // Timer that controls its attack behavior
attack_duration = 30; // Duration of its attack
damage_frame = 15; // Frame where it damages the player

is_dying = false; // Tracks if the firespirirt is in its dying state or not

sprite_index = FireW; // uses walking animation by default
image_speed = 1; // Uses the original speed of animation

part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.2, 0.2, 0, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second. (Life Span)

particles_sprites = [POrange]; // Use POrange sprite for the particle which I created in sprite editor

textboxFireE = noone; // Variable to track if the textbox exists or not
textbox_offset_x = 20; // Horizontal offset for textbox
textbox_offset_y = - 50; // Vertical offset for textbox



