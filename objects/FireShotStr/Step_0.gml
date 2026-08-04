// Move the fireball
x += hsp;
y += vsp;

// Collision with walls
if (place_meeting(x, y, Object12)) {
    instance_destroy();
}

// Collision with player
if (place_meeting(x, y, OPlayer)) {
    var player = instance_place(x, y, OPlayer);
    if (player != noone) {
        health -= 2;  // Damage player
        player.invincibility_frames = 60; // Prevents instant re-hit
        instance_destroy();
    }
}

// Destroy after lifespan
life -= 1;
if (life <= 0) {
    instance_destroy();
}

if ((hsp != 0 || vsp != 0) && random(100) < 42) {
    var randomized_sprite_index = irandom(array_length(particles_sprites) - 1);

    part_type_sprite(part_glitter, particles_sprites[randomized_sprite_index], false, false, false);

    var px = x + random_range(-16, 16);
    var py = y + random_range(-16, 16);

    part_particles_create(part_system, px, py, part_glitter, 1);
}

