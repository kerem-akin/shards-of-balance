// Emit floating blue particles
if (random(100) < 14) { // 24 percent chance to spawn the blue particle every frame
    part_particles_create(global.particle_sys, // Spawn in front of background 
x + irandom_range(-room_width/1, room_width/1), // Any horiontal position in the room
    y + irandom_range(0, room_height), // Any vertical position in the room
        global.p_dust, 1); // create one blue particle
}

// Emit fog particles at the bottom
if (random(100) < 4) { // 4 percent chance to spawn the fog particle every frame
    part_particles_create(global.particle_sys, // Spawn in front of background
        x + irandom_range(-room_width/2, room_width/2), // Random horizontal position between
        room_height - 50, // Bottom of the room
        global.p_fog, 1); // create one fog particle
}
