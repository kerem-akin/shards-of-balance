// Fading in logic
if (!instance_exists(Exilion) && !instance_exists(ExilionD)) { // If Exilion is completely gone
if (distance_to_object(OPlayer) <= 25) { // If within 25 pixels of player
    if (timer < fade_delay) {
        timer++; // start the fade in
    } else if (image_alpha < 1) { // check to keep increasing alpha if its less than 1
        if (image_alpha == 0) { // If invisible
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
		audio_play_sound(CrystalAppears1, 1, false);
		audio_sound_gain(CrystalAppears1, 0.5, 0);
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nAt last, explorer... you have triumphed over the darkness.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nThe crystal is restored, and with it, peace will return to the realms.");
		crystal_mentioned = true; // To make the crystal object appear
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nYour journey was one of great hardship, but you've proven yourself worthy.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nYour actions will echo through time... but remember, even in victory, new challenges may arise.");
        dialog_instance.dialog.add(Vorthion_1, "Vorthion:\nGo now, with the knowledge that you have shaped the fate of many. Farewell, explorer.");
        dialogue_started = true; // dialog has started
    }
}

if (crystal_mentioned && !instance_exists(CrystalOfBalance)) {
    // Create the CrystalOfBalance object at the specified position
    var crystal = instance_create_layer(3540, 270, "Player", CrystalOfBalance);
    crystal.image_alpha = 0; // Start fully transparent
    crystal.fade_in_speed = 0.02;  // Speed of fading in
    crystal.fade_out_speed = 0.02; // Speed of fading out
    crystal.fade_delay = room_speed * 5; // 5-second delay before fading out
    crystal.timer = 0;             // Timer to track duration before fade out
    crystal.faded_out = false;     // Tracks if the object has faded out
    
    crystal_mentioned = false; // Prevent the crystal from being created again
}

// Portal creation after dialogue ends
if (dialogue_started && !instance_exists(ODialogParent)) { // checks dialogue started which is after the dialogue ends
    portal_timer++; // time for portal to appear after text finishes
    if (portal_timer == room_speed * 2) { // 2 seconds after dialogue ends
        // Create BossFightTP
        var portal = instance_create_layer(3535, 699, "Player", BossFightTP); // Creates the object at this position
		audio_play_sound(VorthionPortalSpawn, 1, false); // PLay portal creation sound
		audio_sound_gain(VorthionPortalSpawn, 0.5, 0); // With 50& of originak volume
        portal.image_alpha = 0; // Invisible at the start
        portal.fade_in_speed = 0.0025; // Slowly fades in
        
        // Create BossFightPortalNoCond
        var portal_no_cond = instance_create_layer(3535, 699, "Player", BossFightPortalBack); // Creates object at that position
        portal_no_cond.image_alpha = 0; // Invisible at the start
        portal_no_cond.image_xscale = 0.8; // 0.8 scale, smaller to fit inside the big portal
        portal_no_cond.image_yscale = 0.8; // This one doesn`t have fade in since it`s invisible
    }
}
}