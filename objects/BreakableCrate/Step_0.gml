if (distance_to_object(OPlayer) <= 50) { // If the player is within 50 pixels or less of object
    if (!instance_exists(textbox)) { // If textbox instance doesnt exist
        textbox = instance_create_depth(x + 5, y - sprite_height - 50, depth - 1, Object51); // Create the textbox ( Inspect symbol)
    }
    
    // Update textbox position
    if (instance_exists(textbox)) { // If the textbox exists
        textbox.x = x + 5; // Keep it at the correct x offset
        textbox.y = y - sprite_height - 50; // Keep it at the correct y offset
        
        textbox_alpha += fade_in_speed; // fade in using the fade in speed in the create event
        if (textbox_alpha > 1) textbox_alpha = 1; // Clamp at 1 when it is fully visible
    }

    // Player can press E to inspect
    if (keyboard_check_pressed(ord("E"))) {
        if (!instance_exists(ODialogParent)) { // If dialogue doesnt exist
            var dialog_instance = instance_create_depth(x, y, 0, ODialogParent); // Create dialogue
            dialog_instance.dialog.add(DialoguePlayer, "This box seems rather strange... Perhaps I should try shooting it?"); 
			// Display the dialogue with this text
        }
    }
} else {
    // Fade out if player isnt within 50 pixels
    textbox_alpha -= fade_out_speed; // fade out using the fade out speed in the create event
    if (textbox_alpha < 0) { // If it goes under alpha 0,
        textbox_alpha = 0; // Clamp it at 0 so it remains invisible
        if (instance_exists(textbox)) { // If the textbox still exists
            instance_destroy(textbox); // destroy it
            textbox = noone; // Remove from the room
        }
    }
}

// Apply transparency to Inspect Symbol
if (instance_exists(textbox)) {
    textbox.image_alpha = textbox_alpha;
}

if (hp <= 0) { // If the crate object is broken
if (instance_exists(other.textbox)) { // If the textbox still exists
	instance_destroy(other.textbox); // Destroy it
}
var drop_potion = choose(OPotion, OPotionSpeed); // Randomly choose between HPotion or OPotionSpeed
    
    // Create the potion at the crate's position
    var potion = instance_create_layer(x, y, "Instances_1", drop_potion);

    instance_destroy();  // Destroy the crate
}