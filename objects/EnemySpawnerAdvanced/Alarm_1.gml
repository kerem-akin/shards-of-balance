if (spawn_phase < 3) {
    var enemy;
    if (spawn_phase < 2) {
        enemy = instance_create_layer(x, y, "Instances_1", FireSpirit);
        firespirit_count += 1;
    } else {
        enemy = instance_create_layer(x, y, "Instances_1", Plant);
        plant_count += 1;
    }

    if (enemy != noone) {
        ds_list_add(created_enemies, enemy);
        enemy.spawner_instance = id; // Assign the spawner's ID to the enemy
    }

    spawn_phase += 1;
    if (spawn_phase < 3) {
        alarm[1] = room_speed;
    }
}
