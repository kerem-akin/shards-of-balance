image_speed = 1; // Use original animation speed

// Initialize global variables to track if satella has spoken in the room
if (!variable_global_exists("Satella_spoken")) { // Global variable tracking if she spoke
    global.Satella_spoken = ds_map_create(); // Tracks her spoken status in rooms
}

// Ensure the current room has a tracked value in the map
if (!ds_map_exists(global.Satella_spoken, room_get_name(room))) { // If she hasn`t spoken 
    ds_map_add(global.Satella_spoken, room_get_name(room), false); // Tracks and sets her spoken status to false
}

// Textbox 
textbox = noone; // Doesnt exist at the start 
fade_in_speed = 0.015; // Slower fade in speed
fade_out_speed = 0.03; // Faster fade out speed
textbox_alpha = 0; // Starts invisible

textbox_animation = noone; // The little textbox playing on her top right when not interacting with the player


