hsp = 0; // Horizontal movement is set to 0
vsp = 0; // Vertical movement is set to 0
grv = 0.3; // Gravity applied to the dead skeleton object
done = 0; // Checks if the dead skeleton object finished its action

ScreenShake(9,36); // Shakes the screen when the skeleton transitions to this object

image_speed = 0; // Animation doesnt play 

var nearby_textbox = instance_nearest(x, y, TextBoxE); // Checks if the textbox exists
if (nearby_textbox != noone) { // If a textbox exixts
    instance_destroy(nearby_textbox); // destroys the textbox
}

audio_play_sound(SkeletonArcherDeath, 1, false); // Play death effect sound
