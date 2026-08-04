if (spawn_phase < 3) { // If not all enemies are spawned
    var enemy;
    if (spawn_phase < 2) { // If less than 2 enemies spawned
        enemy = instance_create_layer(x, y, "Instances_1", Skeleton); // Spawn a skeleton
        skeleton_count += 1; // INcrease skeleton count by 1
    } else {
        enemy = instance_create_layer(x, y, "Instances_1", Plant); // If at phase 2, spawn a plant
        plant_count += 1; // Increase plant count by 1
    }

    if (enemy != noone) { // If enemies exist
        ds_list_add(created_enemies, enemy); // Add them to the list of spawned enemies
        enemy.spawner_instance = id; // Assign the spawner's ID to the enemy
    }

    spawn_phase += 1; // Move to next spawn phase
    if (spawn_phase < 3) { // If hasnt spawned every enemy yet
        alarm[1] = room_speed // Alarm 1 triggers after a second
    }
}
