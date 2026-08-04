var enemy_list = ds_list_create();
with (all) {
    if (object_index == oEnemy1 || object_index == oEnemy2) { // Add all your enemy object types here
        ds_list_add(enemy_list, [x, y, object_get_name(object_index), hp]);
        // Add any other necessary enemy properties to save
    }
}
ds_map_replace(global.room3_state, "enemies", enemy_list);
