
global.particle_sys = part_system_create(); // create the particle system
part_system_depth(global.particle_sys, -10); // In front of background

// PBlue particles
global.p_dust = part_type_create();
part_type_sprite(global.p_dust, PPurple, false, false, false); // Use the animated sprite
part_type_color1(global.p_dust, c_white); // set color to white
part_type_alpha3(global.p_dust,	0, 1, 0); // FAdes in randomly until fully visible, then fades out
part_type_size(global.p_dust, 0.3, 0.8, 0, 0); // Size of particles, any value fom this range
part_type_life(global.p_dust, 240, 540); // stays 4-9 seconds
part_type_speed(global.p_dust, 3.0, 7.5, -0.6, 0); // Speed of particles, can be between these values
part_type_direction(global.p_dust, 180, 360, -30, 30); // direction
part_type_gravity(global.p_dust, -0.3, 270); // Slight lift effect, they travel upwards
part_type_blend(global.p_dust, true); // Soft fade

// PWhite particles
global.p_light = part_type_create();
part_type_sprite(global.p_light, PPink, false, false, false); // Use the animated sprite
part_type_color1(global.p_light, c_white); // set color to white
part_type_alpha3(global.p_light, 0, 1, 0); // FAdes in randomly until fully visible, then fades out
part_type_size(global.p_light, 0.4, 0.9, 0, 0); // Size of particles, any value fom this range
part_type_life(global.p_light, 180, 420); // stays 3-7 seconds
part_type_speed(global.p_light, 3, 7.5, -0.6,0); // Speed of particles, can be between these values
part_type_direction(global.p_light, 180, 360, -30, 30); // direction
part_type_gravity(global.p_light, -0.3,270); // Slight lift effect, travels upwards
part_type_blend(global.p_light, true); // Soft fade

