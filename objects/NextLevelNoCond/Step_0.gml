var player = instance_nearest(x, y, OPlayer); // Sets player as the variable

// Checks if the player is within 200 pixels
if (player != noone && point_distance(x, y, player.x, player.y) <= 200) { 
    // Create dialogue only if it doesn't exist and also prevent it from being shown again
    if (!instance_exists(ODialogParent) && !is_dialogue_shown) {
        var dialog_instance = instance_create_depth(x, y - sprite_height - 50, depth - 1, ODialogParent); // Create the dialogue
		// Display the dialogue
        dialog_instance.dialog.add(DialoguePlayer, "Hmm... This must be the portal? Something dark must lie beyond...");
        
        // Mark the dialogue as shown to prevent it from showing again
        is_dialogue_shown = true;
    }
}
