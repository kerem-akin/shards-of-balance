var player = instance_nearest(x, y, OPlayer);
if (player != noone && point_distance(x, y, player.x, player.y) <= 250) { 
    if (!active) {
        active = true;
        image_speed = 1; 
        alarm[0] = room_speed * 1; 

        if (!dialogue_shown) {
            var dialog_instance = instance_create_depth(x, y - sprite_height - 50, depth - 1, ODialogParent);
            dialog_instance.dialog.add(DialoguePlayer, "What...What are those lights? I sense something ominous...");
            dialogue_shown = true;
        }
    }
}

// **Check if all spawned enemies are dead**
if (active && spawn_phase >= 3) {
    var all_dead = true;
    
    for (var i = ds_list_size(created_enemies) - 1; i >= 0; i--) {
        var enemy = created_enemies[| i];
        if (instance_exists(enemy)) {
            all_dead = false; // If even one enemy is alive, spawner remains
            break;
        } else {
            ds_list_delete(created_enemies, i); // Clean up list of dead enemies
        }
    }

    // If all enemies are dead, trigger fade out and destruction
    if (all_dead && ds_list_size(created_enemies) == 0) {
        active = false;
        image_speed = 0;
		image_index = 0;
        alarm[3] = room_speed * 1;
    }
}


