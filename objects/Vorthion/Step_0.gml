if (distance_to_object(OPlayer) <= 25) { // If within 25 pixels of player
    if (timer < fade_delay) {
        timer++; // start the fade in
    } else if (image_alpha < 1) { // check to keep increasing alpha if its less than 1
        if (image_alpha == 0) { // Sound plays only at the start of fade-in
            audio_play_sound(VorthionAppears, 1, false); // Sound plays only at the start of fade-in
        }
        
        image_alpha += fade_in_speed; // fade in 
        if (image_alpha >= 1) { // If it goes over 1, 
            image_alpha = 1; // Clamps alpha at 1, cant go over
            fully_visible = true; // fully visible if its alpha is 1
        }
    }
} else {
    timer = 0; // sets the variable to zero
}

// Handle dialogue after Vorthion is fully visible
if (fully_visible && !dialogue_started && !instance_exists(ODialogParent)) {
    dialogue_timer++;
    if (dialogue_timer == room_speed * 2) { // Wait 2 seconds before starting dialogue
		// Creates dialogue for the object, these subsequently follow each other
        var dialog_instance = instance_create_depth(x, y, 0, ODialogParent);
		audio_play_sound(VorthionTalks, 1, false);
        dialog_instance.dialog.add(Vorthion_1, "Greetings, mortal. I am Vorthion, the Divine Gatekeeper.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nI watch over realms beyond your understanding, and your journey has caught the attention of forces ancient and eternal.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nExilion's shadow looms over this land. The portal to him shall open for you, but beware,his reach extends further than you realize.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nThe shards you seek lie in a world of shadows, guarded by endless souls... Only those with true heart may pass.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nGo now, and see if you are worthy to face the challange. The biggest challenge.");
        dialogue_started = true; // dialog has started
    }
}

// Handle portal creation after dialogue ends
if (dialogue_started && !instance_exists(ODialogParent)) { // checks dialogue started which is after the dialogue ends
    portal_timer++; // time for portal to appear after text finishes
    if (portal_timer == room_speed * 2) { // 2 seconds after dialogue ends
        // Create BossFightTP
        var portal = instance_create_layer(7426, 1724, "Player", BossFightTP); // Creates the object at this position
			audio_play_sound(VorthionPortalSpawn, 1, false); // PLay portal creation sound
			audio_sound_gain(VorthionPortalSpawn, 0.5, 0); // With 50& of originak volume
        portal.image_alpha = 0; // Invisible at the start
        portal.fade_in_speed = 0.0025; // Slowly fades in
        
        // Create BossFightPortalNoCond
        var portal_no_cond = instance_create_layer(7426, 1721, "Player", BossFightPortalNoCond); // Creates object at that position
        portal_no_cond.image_alpha = 0; // Invisible at the start
        portal_no_cond.image_xscale = 0.8; // 0.8 scale, smaller to fit inside the big portal
        portal_no_cond.image_yscale = 0.8; // This one doesn`t have fade in since it`s invisible
    }
}


