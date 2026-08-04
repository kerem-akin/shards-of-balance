hsp = 0; // Horizontal movement is set to 0
vsp = 0; // Vertical movement is set to 0
grv = 0.3; // Gravity applied to the dead archer object
done = 0; // Checks if the dead archer object finished its action

ScreenShake(10,40); // Shakes the screen when the archer transitions to this object

image_speed = 0; // Animation doesnt play

var nearby_textbox = instance_nearest(x, y, TextBoxE); // Checks if the textbox exists
if (nearby_textbox != noone) { // If a textbox exixts
    instance_destroy(nearby_textbox); // destroys the textbox
}

audio_play_sound(SkeletonArcherDeath, 1, false); // Plays the death effect sound once
