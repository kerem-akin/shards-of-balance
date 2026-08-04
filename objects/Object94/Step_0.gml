if (distance_to_object(OPlayer) <= 50) { // If the player is within 50 pixels or less of object
    if (!instance_exists(textbox)) { // If textbox instance doesnt exist
        textbox = instance_create_depth(x - 10, y - sprite_height - 50, depth - 1, Object51); // Create the textbox
    }
    
    // Update textbox position
    if (instance_exists(textbox)) { // If the textbox exists
        textbox.x = x - 10; // Keep it at the correct x offset
        textbox.y = y - sprite_height - 50; // Keep it at the correct y offset
        
        textbox_alpha += fade_in_speed; // fade in using the fade in speed in the create event
        if (textbox_alpha > 1) textbox_alpha = 1; // Clamp at 1 when it is fully visible
    }

    // Player can press E to inspect
    if (keyboard_check_pressed(ord("E"))) { 
        if (!instance_exists(ODialogParent)) { // If dialogue doesnt exist
            var dialog_instance = instance_create_depth(x, y, 0, ODialogParent); // Create dialogue
			// Dialogue displays these texts subsequently, and then closes
            dialog_instance.dialog.add(DialoguePlayer, "Wha... what happened here?");
			dialog_instance.dialog.add(DialoguePlayer, "This must be Exilion`s doing...");
        }
    }
} else {
    // Fade out if player isnt within 50 pixels
    textbox_alpha -= fade_out_speed;
    if (textbox_alpha < 0) { // If it goes under alpha 0, 
        textbox_alpha = 0; // Clamp it at 0 so it remains invisible
        if (instance_exists(textbox)) { // If the textbox exists
            instance_destroy(textbox); // Destroy it
            textbox = noone; // Remove it from the room so it doesnt exist
        }
    }
}

// Apply transparency to Inspect Symbol 
if (instance_exists(textbox)) {
    textbox.image_alpha = textbox_alpha;
}
