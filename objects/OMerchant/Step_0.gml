 if (distance_to_object(OPlayer) <= 35 && keyboard_check_pressed(ord("E"))) { // If she is within 35 ppixels of player and the key e is pressed
    if (!instance_exists(ODialogParent)) { // If dilaogue box doesnt exist
        // Create the dialog object
        var dialog_instance = instance_create_depth(x, y, 0, ODialogParent); // Create dialogue object
		audio_play_sound(DialogueOpenSatella, 1, false); // Play the dialogur box appearing sound
        audio_sound_gain(DialogueOpenSatella, 0.5, 0); // At 50% of original volume
        // Check if Satella has spoken in this room
        var has_spoken = ds_map_find_value(global.Satella_spoken, room_get_name(room));
        
        if (has_spoken) { // If she has
            dialog_instance.dialog.add(Satella_1, "Satella:\nTime is precious. Don't waste mine.");
			// Display this text every time you try speaking to her
        } else {         
            switch(room) {
				// Display these unique texts for each room, they subsequently follow each other after one ends.
	case R1:
dialog_instance.dialog.add(Satella_1,"Ahh... another explorer, are you? Hehehe... I am Satella. Let's see how long you last in this realm...");
dialog_instance.dialog.add(Satella_1,"Satella:\nAfter the Crystal of Balance was shattered, the very fabric of this world twisted. Our goal now is to collect its scattered pieces... to restore what was broken.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThe shards lie at the end of this cursed forest. A long path... And Exilion? He's watching... Maybe.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThis forest? Oh, it doesn't take kindly to outsiders. Step carefully... or you might not step at all.");
dialog_instance.dialog.add(Satella_1,"Satella:\nHere, take this magic wand... for now. Don`t get any ideas, it won`t save you from what`s ahead.. If you survive long enough, you might find more...");
dialog_instance.dialog.add(Satella_1,"Satella:\nWell then, off you go. It will be a grueling journey.");
  break;
  case R2:
dialog_instance.dialog.add(Satella_1,"Satella:\nOh? You're still breathing? Maybe you aren't as hopeless as you seemed...");
dialog_instance.dialog.add(Satella_1,"Satella:\nTell me, explorer... Do you wonder what caused all this ruin?");
dialog_instance.dialog.add(Satella_1,"Satella:\nWell, don't get too comfortable. A new enemy lurks ahead... slow and relentless, crushing those who let their guard down.");
  break;
  case R3:
dialog_instance.dialog.add(Satella_1,"Satella:\nYou've proven yourself... to an extent. But strength alone won't save you from what lies ahead.");
dialog_instance.dialog.add(Satella_1,"Satella:\nTell me, explorer... Have you seen the souls? Where do you think their cries come from?");
dialog_instance.dialog.add(Satella_1,"Satella:\nDo you wish to proceed, or let this realm crumble like Exilion intended?");
dialog_instance.dialog.add(Satella_1,"Satella:\nThe enemies grow stronger. Sharpen your wits, and steel your resolve. You'll need both.");
  break;
  case R3Cave:
dialog_instance.dialog.add(Satella_1,"Satella:\nAhhh... so you've stumbled upon one of them. How delightfully reckless.");
dialog_instance.dialog.add(Satella_1,"Satella:\nWandering into a cave... How curious. Are you truly prepared for the unknown?");
dialog_instance.dialog.add(Satella_1,"Satella:\nOh, and before you get any ideas, beware the haunted skulls. They'll leech your speed, leaving you vulnerable... one misstep, and it's over.");
dialog_instance.dialog.add(Satella_1,"Satella:\nDon`t be fooled by the silence... Exilion keeps watch of every corner. Maybe?");
  break;
  case R4:
dialog_instance.dialog.add(Satella_1,"Satella:\nSo, you've made it this far... but don't think for a moment that the worst is behind you.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThe landscape shifts in subtle ways. Paths you once trusted may not be the same.");
dialog_instance.dialog.add(Satella_1,"Satella:\nAnd the enemies? They, too, have changed. Stronger. Smarter. More relentless.");
dialog_instance.dialog.add(Satella_1,"Satella:\nBut the real threat? A new kind of fire soul. Burning wraith, fueled by an endless flame...");
dialog_instance.dialog.add(Satella_1,"Satella:\nThey drift through the air, waiting... and when they strike, their flames do not merely burn. They consume.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThis is all Exilion`s doing, each fallen enemy empowers his wraith...");
dialog_instance.dialog.add(Satella_1,"Satella:\nKeep moving, explorer. The fire does not forgive hesitation."); 
break;
    case R5:
dialog_instance.dialog.add(Satella_1,"Satella:\nHah... You've made it. Or at least, you think you have.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThe air here is heavy with finality. Every enemy, every shadow, every whisper of the wind is telling you to turn back.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThis place... it's where the strongest fall. Where the most determined are broken.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThe creatures here-they do not just fight. They *hunt*.");
dialog_instance.dialog.add(Satella_1,"Satella:\nThe shards of balance you seek lie beyond this test. If you survive, that is.");
dialog_instance.dialog.add(Satella_1,"Satella:\nBut tell me, little explorer... do you *really* think this is the end?");
dialog_instance.dialog.add(Satella_1,"Satella:\nHeheheh... No. The greatest truth remains unseen. If you have the strength to see it... then you will know who truly controls this land.");
dialog_instance.dialog.add(Satella_1,"Satella:\nNow go. Face the trial, or be consumed by it.");
break;
   case BossFight:
dialog_instance.dialog.add(Satella_1,"Satella:\nHah... So you actually made it. I didn't think you would.");
dialog_instance.dialog.add(Satella_1,"Satella:\nI kept this place a secret,not out of cruelty, but because I never thought anyone would come this far.");
dialog_instance.dialog.add(Satella_1,"Satella:\nI've been here before. I fought in this very abyss... and I lost.");
dialog_instance.dialog.add(Satella_1,"Satella:\nI barely made it out alive. This is where your fate is determined...");
dialog_instance.dialog.add(Satella_1,"Satella:\nExilion's power isn't just in his strength,it's in his soul.");
dialog_instance.dialog.add(Satella_1,"Satella:\nHe doesn't just have one soul... Just defeating him won't be the end...");
dialog_instance.dialog.add(Satella_1,"Satella:\nThose archers you've seen? They're not just enemies... they are fragments of his soul, bound to his will.");
dialog_instance.dialog.add(Satella_1,"Satella:\nHis soul fosters every enemy... Every little corner of this realm.");
dialog_instance.dialog.add(Satella_1,"Satella:\nWhen he begins to summon, strike. Strike then, or he will become unstoppable.");
dialog_instance.dialog.add(Satella_1,"Satella:\nIf you manage to free this realm from his reign, Vorthion will be waiting for you at the end of the fight.");
dialog_instance.dialog.add(Satella_1,"Satella:\nNow go. No more riddles, no more warnings. Either you win... or you don't.");
break;
}
            
            // Mark that Satella has spoken in this room when the diloague is completed
            ds_map_replace(global.Satella_spoken, room_get_name(room), true);
        }
    }
}

// Textbox
if (distance_to_object(OPlayer) <= 35) { // If she is within 35 pixels of the player,
    if (!instance_exists(textbox)) { // If textbox doesnt exist
        textbox = instance_create_depth(x + 10, y - sprite_height + 35, depth - 1, Object52 // Create textbox at the specified location with the offsets
		);
    }
    if (instance_exists(textbox)) { // If the textbox exists
        textbox.x = x + 10; // Stay 10 pixels to the right of the witch NPC
        textbox.y = y - sprite_height + 35; // Stay 35 pixels above the witch NPC
        
        // Fade in
        textbox_alpha += fade_in_speed; // Gradually fade the textbox in 
        if (textbox_alpha > 1) textbox_alpha = 1; // Until 1, clamps alpha at 1
    }
} else {
    // Fade out 
    textbox_alpha -= fade_out_speed; // Gradually fade out using fade out speed specified in create event
    if (textbox_alpha < 0) { // If the textbox decreases to 0
        textbox_alpha = 0; // Keep it invisible, clamps it at 0
        if (instance_exists(textbox)) { // If it still exists after reaching alpha 0
            instance_destroy(textbox); // destroy it
            textbox = noone; // Remove it from the room so doesnt exist anymore
        }
    }
}

// Apply alpha to the textbox
if (instance_exists(textbox)) { // If it exists
    textbox.image_alpha = textbox_alpha; // Use the alpha values
}

// The smaller textbox displayed on her top right when not interacting
if (!instance_exists(ODialogParent) && distance_to_object(OPlayer) > 35) { // If the witch is 35 pixels or more away from the player
    if (!instance_exists(textbox_animation)) { // If textbox doesnt exist
        textbox_animation = instance_create_layer(x + sprite_width - 150, y - sprite_height + 120, "Instances_1", TextBox); 
		// Create it at the specified position with the offsets
        textbox_animation.sprite_index = Sprite181; // Use sprite 181 for the textbox
        textbox_animation.image_speed = 1; // Original animation speed

        // Scale the animation
        textbox_animation.image_xscale = 2; // Scale width by 2
        textbox_animation.image_yscale = 2; // Scale height by 2
    }
} else {
    if (instance_exists(textbox_animation)) { // if the player is within 35 pixels
        instance_destroy(textbox_animation); // Destroy the textbox object
        textbox_animation = noone; // Remove it from the room so it doesnt exist
    }
}

// Update textbox animation position if it exists
if (instance_exists(textbox_animation)) { // If textbox exixts
    textbox_animation.x = x + sprite_width - 150;
    textbox_animation.y = y - sprite_height + 120; // Ensure it remains in its original x and y offsets accurately
}
