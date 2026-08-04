w = display_get_gui_width(); // Get width of display
h = display_get_gui_height(); // Get height of display 
h_half = h * 0.5; // Get hald the height of the display
enum TRANS_MODE // define the enum for the transition mode
{
	OFF, // No transition
	NEXT, // Next room 
	GOTO, // Specific room 
	RESTART, // Restart the room
	INTRO // Introdcution screen
}
mode = TRANS_MODE.INTRO; // Initially in the introduction mode
percent = 1; // Transition progress at 100%
target = room; // Transitin traget is set to next room

mode = TRANS_MODE.OFF; // Transition mode off, no transition
target = noone; // remove the target for transition so it doesnt exist

