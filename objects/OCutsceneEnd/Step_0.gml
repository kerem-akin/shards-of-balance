if (cutscene_active) { // If 
    if (!cutscene_started) { // if it hasnt started yet
        cutscene_started = true; // Start cutscene

        // Position at center of camera
        x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2); // get horixontal center of camera
        y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2); // get vertical center of camera

        if (!instance_exists(OBackgroundBlack)) { // If the background dimmer doesnt exist
            var dimmer = instance_create_layer(0, 0, "SpawnInEffect", OBackgroundBlack); // Create the object
            dimmer.fade_to_dark = true; // Start the fadung/dimming
        }

        // Deactivate all non-persistent instances EXCEPT OBackgroundBlack
        instance_deactivate_all(true);
        instance_activate_object(OBackgroundBlack);
        
        sprite_index = sprite_list[current_sprite]; // Set initial sprite for cutscene
        image_alpha = 0; // Start fully invisible
        timer = room_speed * 8; // 8 seconds per sprite
        sound_played = false; // Tracks if sound has been played
    }

    if (timer > room_speed * 6) { // Until 6 seconds remaining
        image_alpha = min(image_alpha + 0.0075, 1); // Increase alpha smoothly

        // Play sound effect when fade-in starts (only once per image)
        if (!sound_played) { // if sound hasnt been played yet
            switch (current_sprite) {
                case 0: audio_play_sound(EndScene3, 1, false); break; // Play sound for first sprite (I changed the sound of the 3rd to 1st later)
                case 1: audio_play_sound(EndScene2, 1, false); break; // PLay the sound for the sprte
                case 2: audio_play_sound(EndScene1, 1, false); break; // Play the sound for the sprite
            }
            sound_played = true; // Prevent playing mutiple times
        }
    } 
    // Until 2 seconds remaining
    else if (timer > room_speed * 2) {
        image_alpha = 1; // fully visible
    } 
    else {
        image_alpha = max(image_alpha - 0.01, 0); // Decrease alpha smoothly
    }

    // Countdown
    if (timer > 0) { // if timer hasnt finished
        timer--; // decrease it every frame
    } else {
        current_sprite++; // if finished, move to next sprite

        if (current_sprite < array_length(sprite_list)) { // If there are more frames left still
            sprite_index = sprite_list[current_sprite]; // Switch to next sprite
            timer = room_speed * 8; // reset the 8 second timer for new sprite
            image_alpha = 0; // Reset fade for next sprite
            sound_played = false; // Reset sound trigger for next sprite
        } else {
            // When the cutscene ends, reactivate instances but destroy the dimming object, so game is visible again
            instance_activate_all();
            if (instance_exists(OBackgroundBlack)) {
                with (OBackgroundBlack) instance_destroy();
            }
            
            // Transition to menu
            room_goto(portal_target);

            instance_destroy(); // Destroy cutscene object
        }
    }
}

