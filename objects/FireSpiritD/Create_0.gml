hsp = 0; // Horizontal movement
vsp = 0; // Vertical movement
grv = 0.3; // Gravity effecting the object
done = 0; // Tracks if the objects has completed its action, hasnt yet

image_speed = 0; // Stop the animation initially

// Shake the screen when transitiong from fire spirit to this object
ScreenShake(9,36);

var nearby_textbox = instance_nearest(x, y, TextBoxE); // Checks if the textbox exists
if (nearby_textbox != noone) { // If a textbox exists
    instance_destroy(nearby_textbox); // Destroys it
}

audio_play_sound(DeathSound,1,false)



