image_speed = 1; // Play its animation in original speed

if (!variable_global_exists("Altair_spoken")) { // Global variable tracking if altair spoke
    global.Altair_spoken = ds_map_create(); // Tracks his spoken status in rooms
}

// Ensure the current room has a tracked value in the map
if (!ds_map_exists(global.Altair_spoken, room_get_name(room))) { // If he hasn`t spoken 
    ds_map_add(global.Altair_spoken, room_get_name(room), false); // Set his spoken to false
}

// Initialize textbox
textbox = noone; // TRacks whether the textbox exists or not, doesnt initially
fade_in_speed = 0.015; // Speed in which interact sysmbol fades in
fade_out_speed = 0.03; // Speed in which interac symbol fades out
textbox_alpha = 0;

textbox_animation = noone; // TRacks whether the animated textbox exists or not, doesnt initally

if (room == R2 || room == R4) { // If in room 2 or 4,
    textbox_object = Object52Altair; // Use this recoloured version of the interact symbol
} else if (room == R5) {
    textbox_object = Object52; // If in room 5, use the original interact symbol
} else {
    // Default interact symbol for other rooms
    textbox_object = Object52Altair;
}