if (file_exists(SAVEFILE)) file_delete(SAVEFILE); // Checks if there is a saved file, deletes if it exists. To reset file.

var file;
file = file_text_open_write(SAVEFILE); // Opens file writing, creatinga file at SAVEFILE
file_text_write_real(file,room); // Takes the room
file_text_close(file); // Saves it

instance_create_layer(OPlayer.x, OPlayer.y - 85, "SpawnInEffect", SpawnIn); // Creates an effect 85 pixels above the player when starting the room

// Handles the titles I have for my rooms, displays the name of the room for 8 seconds before fading out.
switch (room) {
    case R1:
        global.levelTitle = LevelOne; // Sprite for Level One
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent
		audio_play_sound(ForestBackground, 10, true); // Play the forest background music when the room is entered
		audio_sound_gain(ForestBackground, 0.05, 0); // Play it at 5% of original volume
        break;
    case R2:
        global.levelTitle = LevelTwo; // Sprite for Level Two
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent
		audio_play_sound(ForestBackground, 10, true); // Play the forest background music when the room is entered
		audio_sound_gain(ForestBackground, 0.05, 0); // Play it at 5% of original volume
        break;
    case R3:
	    global.levelTitle = LevelThree; // Sprite for Level Three
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent
		audio_play_sound(ForestBackground, 10, true); // Play the forest background music when the room is entered
		audio_sound_gain(ForestBackground, 0.05, 0); // Play it at 5% of original volume
		break;
	case R3Cave:
	    global.levelTitle = CaveOne; // Sprite for Level Threecave
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent
		audio_play_sound(CaveBackground, 10, true);// Play the cave background music when the room is entered
		audio_sound_gain(CaveBackground, 0.5, 0); // Play it at 50% of original volume
		break;
	case R4:
	    global.levelTitle = LevelFour; // Sprite for Level Four
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent
		audio_play_sound(ForestBackground, 10, true); // Play the forest background music when the room is entered
		audio_sound_gain(ForestBackground, 0.05, 0); // Play it at 5% of original volume
		break;
	case R5:
	    global.levelTitle = LevelFive; // Sprite for Level Five
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent	
		audio_play_sound(ForestBackground, 10, true); // Play the forest background music when the room is entered
		audio_sound_gain(ForestBackground, 0.05, 0); // Play it at 5% of original volume
		break;
	case BossFight:
	    global.levelTitle = LevelBossFight; // Sprite for Level Five
        global.levelTitleTimer = room_speed * 8; // Display for 8 seconds
        global.levelTitleAlpha = 0; // Start fully transparent
		audio_play_sound(BossFightBackground, 10, true); // Play the bossfight background music when the room is entered
		audio_sound_gain(BossFightBackground, 0.1, 0); // Play it at 10% of original volume
		break;
}


