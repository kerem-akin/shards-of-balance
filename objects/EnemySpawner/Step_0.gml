	var player = instance_nearest(x, y, OPlayer); // Set player as the variable
	if (player != noone && point_distance(x, y, player.x, player.y) <= 250) { // If the player exists and is within 250 pixels of player
	    if (!active) { // If not activated
	        active = true; // Activate 
	        image_speed = 1; // Play the animation at original speed 
	        alarm[0] = room_speed * 1; // Alarm 0 to triggers after 1 seond

	        if (!dialogue_shown) { // If no dialogue
	            var dialog_instance = instance_create_depth(x, y - sprite_height - 50, depth - 1, ODialogParent); // Create the dialogue
	            dialog_instance.dialog.add(DialoguePlayer, "What...What are those lights? I sense something ominous..."); // Display this text
	            dialogue_shown = true; // Mark dialogue shown as true, preventing it from repeating
	        }
	    }
	}

if (active && spawn_phase >= 3) { // If all enemies are defeated and is active
    var all_dead = true; // Set the variable to true
    
    for (var i = ds_list_size(created_enemies) - 1; i >= 0; i--) { // Lists the created enemies
        var enemy = created_enemies[| i];
        if (instance_exists(enemy)) { // If an enemy exists
            all_dead = false; // If even one enemy is alive, spawner remains active
            break;
        } else {
            ds_list_delete(created_enemies, i); // Clean up list of dead enemies
        }
    }

    if (all_dead && ds_list_size(created_enemies) == 0) { // If all enemies aare defeated and there is no left
        active = false; // Portal is deactivated
        image_speed = 0; // Stops playing its animation
		image_index = 0; // Continue playing until first frame
        alarm[3] = room_speed * 1; // Alarm 3 triggers after a second
    }
}


