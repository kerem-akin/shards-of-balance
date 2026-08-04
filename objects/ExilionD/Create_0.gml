hsp = 0; // Horizontal movement is set to 0
vsp = 0; // Vertical movement is set to 0
grv = 0.3; // Gravity applied to the dead exilion object
done = 0; // Checks if the dead Exilion object finished its action

ScreenShake(9,36); // Shakes the screen when the exilion transitions to this object

image_speed = 0; // Animation doesnt play 

is_dialogue_shown = false; // Tracks whether the dialogue has been shown or not

dialogue_instance_ref = noone; // 

audio_sound_gain(BossFightBackground, 0.1, 0); // Play the backgrounf music at 10% original volume
audio_play_sound(ExilionDies, 1, false); // Play the death sound of exilino
audio_stop_sound(ExilionBossMusic); // Stop the boss fight theme music

fade_alpha = 1;  // Start with fully visible (1 = opaque)
fade_speed = 0.01;