image_alpha = 0; // Invisible at the start

audio_stop_all(); // Stop all audio playing when player dies
audio_play_sound(PlayerDeath, 1, false); // Play the players death sound effect
