if (cutscene_active) { // if cutscene is activated
    if (!cutscene_started) { // if it hasnt started yet
        cutscene_started = true; // Start it
        
        if (!instance_exists(OBackgroundBlack)) { // If the background dimmer doesnt exist
            var dimmer = instance_create_layer(0, 0, "SpawnInEffect", OBackgroundBlack); // create it
            dimmer.fade_to_dark = true; // Start the dimming/fading
        }

        // Deactivate all non-persistent instances EXCEPT OBackgroundBlack and ParticleControllerBossFight
        instance_deactivate_all(true);
        instance_activate_object(OBackgroundBlack);
        instance_activate_object(ParticleControllerBossFight);

        // Stop boss fight background music
        audio_sound_gain(BossFightBackground, 0, 0);

        // Play the sound effects at specific frames for precision
        alarm[0] = 60;
        alarm[1] = 540;
		alarm[2] = 651;
		alarm[3] = 703;
		alarm[4] = 754;
		alarm[5] = 823;
		alarm[6] = 938;
    }
}

// Make the cutscene visible and start animation
image_alpha = 1;
image_speed = 1;

if (image_index >= image_number - 1) { //If at last frame
    cutscene_active = false; // set cutscene active state to false so it ends

    // Reactivate all instances
    instance_activate_all();

    if (instance_exists(OBackgroundBlack)) { // If backgoround dimmer still exists
        with (OBackgroundBlack) instance_destroy(); // destroy it
    }

    instance_destroy(); // Remove the cutscene object
}