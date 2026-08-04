cutscene_active = false; // Set cutscene active state to false
cutscene_started = false; // Set cutscene started to false
current_sprite = 0; // Tracks if the sprites of the cutscene has been displayed or not
sprite_list = [ENdCutscene1, EndCutscene2, EndCutscene3]; // Sprites used for cutscene
timer = 0; // Tracks cutscene progression
portal_target = noone; // target destination for portal, currently doesnt exist so cutscene can play before transition to menu
image_speed = 0; // Animatio doesnt play
sound_played = false; // Tracks whetwer the cutscene sound effects have been played or not, hasnt at the start
