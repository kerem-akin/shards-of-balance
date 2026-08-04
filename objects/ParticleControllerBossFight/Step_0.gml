// Emit floating purple particles
if (random(100) < 24) { // 24 percent chance to spawn the purple particle every frame
    part_particles_create(global.particle_sys, // Spawn in front of background
x + irandom_range(-room_width/1, room_width/1), // Any horiontal position in the room
    y + irandom_range(0, room_height), // Any vertical position in the room
        global.p_dust, 1); // create one purple particle
}

// Emit glowing pink particles
if (random(100) < 17) { // 17 percent chance to spawn the pink particle every frame
    part_particles_create(global.particle_sys, // Spawn in front of background
x + irandom_range(-room_width/1, room_width/1), // Any horiontal position in the room
    y + irandom_range(0, room_height), // Any vertical position in the room
        global.p_light, 1); // create one pink particle
}
