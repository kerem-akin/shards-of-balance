spd = 6; // Fireball speed
if (!instance_exists(OPlayer)) {
    instance_destroy(); // Destroy the fireball if the player doesn't exist
} else {
    direction = point_direction(x, y, OPlayer.x, OPlayer.y); // Faces the player
}
hsp = lengthdir_x(spd, direction);
vsp = lengthdir_y(spd, direction);

// Lifespan (prevents infinite projectiles)
life = 75; // Lasts 1.25 seconds

part_system = part_system_create();
part_glitter = part_type_create();

part_type_size(part_glitter, 0.2, 0.2, 0, 0);
part_type_alpha2(part_glitter, 1, 0);
part_type_speed(part_glitter, 0.2, 1, 0, 0);
part_type_direction(part_glitter, 0, 360, 0, 0);
part_type_life(part_glitter, 30, 60);

particles_sprites = [POrange]; 

