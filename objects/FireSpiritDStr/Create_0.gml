hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;

image_speed = 0; // Stop the animation initially

// Shake the screen (optional, if desired)
ScreenShake(9, 36);

var nearby_textbox = instance_nearest(x, y, TextBoxE);
if (nearby_textbox != noone) {
    instance_destroy(nearby_textbox);
}

audio_play_sound(DeathSound,1,false)

