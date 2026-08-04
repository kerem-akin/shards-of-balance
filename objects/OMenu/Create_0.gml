#macro SAVEFILE "Save.sav" // Set the save file name

gui_width = display_get_gui_width(); // get width of display
gui_height = display_get_gui_height(); // get height of displau
gui_margin = 32; // 32 pixels margin from edge

menu_x = gui_width - 200; // 200 pixels to the right of screen 
menu_y = gui_margin + 600; // 600 pixels down the top of the screen
menu_x_target = gui_width - gui_margin; // x position for animation
menu_speed = 25; // Sliding speed in the menu
menu_font =FMenu; // Dont used for the text
menu_itemheight = font_get_size(FMenu); // Use same fontsize as the one FMenu uses
menu_committed = -1; // Track the selected menu option
menu_control = true; // Enable control

menu[2] = "New Game" // Restart a new game
menu[1] = "Continue" // Continue from previous room
menu[0] = "Quit" // Quit the game

menu_items = array_length(menu); // get the menu items 
menu_cursor = 2; // Set the cursor position

audio_play_sound(MenuBackground, 10, true); // Play the forest background music when the room is entered
audio_sound_gain(MenuBackground, 0.1, 0); // Play it at 10% of original volume



	
