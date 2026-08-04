hsp = 2; // Horizontal speed
vsp = 0; // Vertical speed
grav = 0.5; // Gravity
hover_height = 40; // Hover height above Object12

hp = 12;
if (room == R4) hp = 20;
if (room == R5) hp = 22;

flash = 0;
chasing = false;
is_attacking = false;
attack_timer = 0;
attack_duration = 30;
damage_frame = 15;

is_dying = false;

sprite_index = FireW; // Walking animation by default
image_speed = 1;

part_system = part_system_create();
part_glitter = part_type_create();

part_type_size(part_glitter, 0.2, 0.2, 0, 0);
part_type_alpha2(part_glitter, 1, 0);
part_type_speed(part_glitter, 0.2, 1, 0, 0);
part_type_direction(part_glitter, 0, 360, 0, 0);
part_type_life(part_glitter, 30, 60);

particles_sprites = [POrange]; 

textboxFireE = noone; // Variable to track the textbox instance
textbox_offset_x = 20; // Horizontal offset for textbox
textbox_offset_y = - 50; // Vertical offset for textbox (above FireSpirit's head)
