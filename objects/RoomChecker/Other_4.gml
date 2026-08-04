if (!ds_map_exists(global.room3_state, "initialized")) {
    // First time entering Room 3
    ds_map_add(global.room3_state, "initialized", true);
} else {
    // Returning to Room 3
    var enemy_list = ds_map_find_value(global.room3_state, "enemies");
    if (enemy_list != undefined) {
        for (var i = 0; i < ds_list_size(enemy_list); i++) {
            var enemy_data = enemy_list[| i];
            var enemy = instance_create_layer(enemy_data[0], enemy_data[1], "Instances", asset_get_index(enemy_data[2]));
            enemy.hp = enemy_data[3];
            // Add any other necessary enemy properties here
        }
    }
}
