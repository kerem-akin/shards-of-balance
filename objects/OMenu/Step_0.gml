menu_x += (menu_x_target - menu_x) / menu_speed; // Move menu towards target position

if (menu_control) // if there is control so navigation is enbaled for the player
{
	if(keyboard_check_pressed(vk_up)) // If up key is pressed 
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0; // Go up
	}
	
	if(keyboard_check_pressed(vk_down)) // If down key is pressed
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1; // Go down 
	}
	
	if(keyboard_check_pressed(vk_enter)) // If enter key is pressed 
	{
		menu_x_target = gui_width+200; // MOve menu to the right by 200 pixels
		menu_committed = menu_cursor; // Store the selected option
		ScreenShake(4,30) // Add screenshake
		menu_control = false; // Disable the menu controls
	}
}

if (menu_x > gui_width+150) && (menu_committed != -1) // If an option is selected
{
	audio_stop_sound(MenuBackground);
	switch (menu_committed)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT); break; // Start new game
		case 1:
		{
			if (!file_exists(SAVEFILE)) // If no savefile, make a new game
			{
				SlideTransition(TRANS_MODE.NEXT);
			}
			else
			{
				var file = file_text_open_read(SAVEFILE); // Open the data
				var target = file_text_read_real(file); // Read the data
				file_text_close(file); // choose the file
				SlideTransition(TRANS_MODE.GOTO,target); // go to the saved room
				
			}
		}
		break;
		case 0: game_end(); break; // Quit the game
	}
}
