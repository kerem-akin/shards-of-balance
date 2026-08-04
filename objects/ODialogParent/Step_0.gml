
if (showing_dialog == false) { // if dialogue isnt displayed
    if (dialog.count() <= 0) { // if there is no messages left 
        instance_destroy(); // destroy the dialogue 
        return; // Exit function
    }

    current_dialog = dialog.pop(); // Get the next dialog
    showing_dialog = true; // Dilalog is shown 
    char_current = 1; // Starts from the first letter
    animating_textbox = true; // Start typing animation

    // Start the TalkingSound (looped)
    if (!audio_is_playing(TalkingSound)) { // if talking sound isnt already playing
        audio_play_sound(TalkingSound, 1, true); // Play the sound on loop
    }
} else { // if dialogue is shown 
    if (char_current < string_length(current_dialog.message)) { // if there are still character to type
        char_current += char_speed; // Type them with the type speed on create event
        char_current = min(char_current, string_length(current_dialog.message)); // preventr exceeding max message length 
        animating_textbox = true; // Animate the textbox as characters are still being typed
    } else {
        animating_textbox = false; // Stop the animation if dialogue isnt shown 
        
        if (audio_is_playing(TalkingSound)) { // if the talking dialogue sound is playing
            audio_stop_sound(TalkingSound); // Stop the sound
        }
    }

    if (keyboard_check_released(key_next)) { // if any key is pressed
        if (char_current < string_length(current_dialog.message)) { // if the entire message isnt displayed
            char_current = string_length(current_dialog.message); // Skip the typing and display entire dialogue
            animating_textbox = false; // Set tyoing animation to false
            
            // Ensure the sound stops when text is fully revealed
            if (audio_is_playing(TalkingSound)) {
                audio_stop_sound(TalkingSound); // Stop the sound
            }
        } else {
            showing_dialog = false; // hide the dialogue box
            alpha = 0; // remain invisible 
        }
    }
}
