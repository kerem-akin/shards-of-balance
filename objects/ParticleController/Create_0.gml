
global.particle_sys = part_system_create(); // create the particle system
part_system_depth(global.particle_sys, -10); // In front of background

// PBlue particles
global.p_dust = part_type_create();
part_type_sprite(global.p_dust, PBlue, false, false, false); // Use the animated sprite
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
part_type_sprite(global.p_light, PWhite, false, false, false); // Use the animated sprite
part_type_color1(global.p_light, c_white); // set color to white
part_type_alpha3(global.p_light, 0, 1, 0); // FAdes in randomly until fully visible, then fades out
part_type_size(global.p_light, 0.4, 0.9, 0, 0); // Size of particles, any value fom this range
part_type_life(global.p_light, 180, 420); // stays 3-7 seconds
part_type_speed(global.p_light, 3, 7.5, -0.6,0); // Speed of particles, can be between these values
part_type_direction(global.p_light, 180, 360, -30, 30); // direction
part_type_gravity(global.p_light, -0.3,270); // Slight lift effect, travels upwards
part_type_blend(global.p_light, true); // Soft fade

// Fog Particle
global.p_fog = part_type_create(); // create the fog particle
part_type_shape(global.p_fog, pt_shape_cloud); // Built in fog particles
part_type_color3(global.p_fog, c_gray, c_black, c_dkgray); // Transitions between these colours
part_type_alpha3(global.p_fog, 0, 0.4, 0); // Fades in until 40% visible, fades out
part_type_size(global.p_fog, 1.5, 3, 0.1, 0); // Any size between these values
part_type_life(global.p_fog, 150, 250); // stays for 2.5 to 4.16 seconds
part_type_speed(global.p_fog, 0.2, 0.3, -0.1, 0); // Slow movement
part_type_direction(global.p_fog, 180, 200, 0, 0); // Direction of particles
part_type_blend(global.p_fog, true); // Soft fog look

