if (distance_to_object(OPlayer) <= 35 && keyboard_check_pressed(ord("E"))) { // If he is within 35 ppixels of player and the key e is pressed
    if (!instance_exists(ODialogParent)) { // If the dilaogue box doesnt exist
        var dialog_instance = instance_create_depth(x, y, 0, ODialogParent); // Create dialogue box
		audio_play_sound(DialogueOpenAltair, 1, false); //Play the dialogue appearing sound effect once
        audio_sound_gain(DialogueOpenAltair, 0.5, 0); // At 50% of original volume
        
        var has_spoken = ds_map_find_value(global.Altair_spoken, room_get_name(room)); // Track if he has spoken in this room

        if (has_spoken) {
            dialog_instance.dialog.add(Altair_1, "Altair:\nThe light above guides some... and condemns others..."); // Use this dilaogue if he has
        } else {
            switch(room) {
				// Display these unique texts for each room, they subsequently follow each other after one ends.
                case R2:
                    dialog_instance.dialog.add(Altair_1, "Well, I was waiting for you. The stars whispered of your arrival. I am Altair, the Divine Messenger...");
				    dialog_instance.dialog.add(Altair_1, "Altair:\nBut I come with a warning... something unnatural stirs in this land...");
					dialog_instance.dialog.add(Altair_1, "Altair:\nIt moves with unnatural speed, shrouded in a pulsating blue aura...");
					dialog_instance.dialog.add(Altair_1, "Altair:\nWhen you see that glow, be ready. Your instincts must match its speed...");
					dialog_instance.dialog.add(Altair_1, "Altair:\nDo not falter. Hesitation will be your downfall...");
					dialog_instance.dialog.add(Altair_1, "Altair:\n...I have a feeling we will meet again.");
                    break;
                case R4:
                    dialog_instance.dialog.add(Altair_1, "Altair:\nHello again... I knew our paths would cross once more.");
					dialog_instance.dialog.add(Altair_1, "Altair:\nThe stars have not settled since we last met... their light flickers, disturbed. The balance shifts once more...");
					dialog_instance.dialog.add(Altair_1, "Altair:\nBeware those who burn with a crimson radiance, wreathed in an ominous, fiery glow.");
					dialog_instance.dialog.add(Altair_1, "Altair:\nThey strike with overwhelming force, shattering anything that stands in their way.");
					dialog_instance.dialog.add(Altair_1, "Altair:\nYou cannot face them carelessly. Stay sharp, or you will not stand a chance...");
                    break;
				case R5:
                    dialog_instance.dialog.add(Altair_1, "Altair:\nNo... No, this cannot be...");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nI have gazed upon the stars for countless nights, and yet... they never foresaw *this*.");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nThe shards of balance... They are not here. The end of the forest holds nothing.");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nThen... what was it all for? Have we been chasing a false hope?");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nThe land... remains broken. The cycle remains unhealed. This cannot be the fate we were bound to...");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nBut wait...");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nSomething stirs... something beyond even my sight...");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nA presence... immense, unfathomable... divine.");
                    dialog_instance.dialog.add(Altair_1, "Altair:\nThis... this is no ordinary force. This is an intervention.");
					dialog_instance.dialog.add(Altair_1, "Altair:\nTry.. try standing between those flames...");
            }
            // mark that Altair has spoken in this room after the dialogues
            ds_map_replace(global.Altair_spoken, room_get_name(room), true);
        }
    }
}

// Create or update textbox
if (distance_to_object(OPlayer) <= 35) { // If player is withing 35 pixels or closer
    if (!instance_exists(textbox)) { // If textbox doesnt exists
        textbox = instance_create_depth(x + 10, y - sprite_height - 20, depth - 1, textbox_object); // Create the textbox object
    }
    if (instance_exists(textbox)) { // If the textbox exists
        textbox.x = x + 10; // Ensure it remains in the correct horizontal offset
        textbox.y = y - sprite_height - 20; // Ensure it remains in the correct vertical offset
        
        textbox_alpha += fade_in_speed; // Fade it in with the fade in speed in create event
        if (textbox_alpha > 1) textbox_alpha = 1; // Clamp at 1 whwn fully visible
    }
} else {
    //If player isnt within 35 pixels
    textbox_alpha -= fade_out_speed; // Fade out the textbox
    if (textbox_alpha < 0) { // If transparency goes below 0
        textbox_alpha = 0; // Ensure it remains invisible
        if (instance_exists(textbox)) { // If the textbox still exists
            instance_destroy(textbox); // destroy it
            textbox = noone; // rempve it from the room so it doesnt exist
        }
    }
}

// Apply alpha to textbox
if (instance_exists(textbox)) {
    textbox.image_alpha = textbox_alpha;
}

if (!instance_exists(ODialogParent) && distance_to_object(OPlayer) > 35) { // if the player is 35 pixels or farther away
    if (!instance_exists(textbox_animation)) { // If textbox animation doesnt exist
        textbox_animation = instance_create_layer(x + sprite_width - 150, y - sprite_height + 120, "Instances_1", TextBox);
		// Create it at the specified position with the offsets
        textbox_animation.sprite_index = Sprite181; // Use sprite 181 for the textbox
        textbox_animation.image_speed = 1; // Original animation speed

        textbox_animation.image_xscale = 2; // Scale width by 2
        textbox_animation.image_yscale = 2; // Scale height by 2
    }
} else {
    if (instance_exists(textbox_animation)) { // If the player is within 35 pixels
        instance_destroy(textbox_animation); // destory the textbox
        textbox_animation = noone; // Remove it so it doesnt exist
    }
}

// Update textbox animation position if it exists
if (instance_exists(textbox_animation)) {
    textbox_animation.x = x + sprite_width - 52;
    textbox_animation.y = y - sprite_height + 58;
}


