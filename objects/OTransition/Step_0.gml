if (mode != TRANS_MODE.OFF) // If a transition is active 
{
	if(mode == TRANS_MODE.INTRO) // If its intro
	{
		percent = max(0,percent - max((percent/10),0.005)); // Gradually decrease percent toward 0
	}
	else // If transitioning to a different room 
	{
		percent = min(1.2,percent + max(((1.2-percent)/10),0.005)); // Gradually increase percent toward 1.2
	}
	
	if (percent == 1.2) || (percent == 0) // If transition is complete
	{
		switch (mode) 
		{
			case TRANS_MODE.INTRO: // If in INTRO mode 
			{
				mode = TRANS_MODE.OFF; // Disable transition
				break;
			}
			case TRANS_MODE.NEXT: // If transitioning toa new room 
			{
				mode = TRANS_MODE.INTRO; // Start fade in effect
				room_goto_next(); // go to next room
				break;
			}
			case TRANS_MODE.GOTO: // If transitioning into a specific room 
		    {
				mode = TRANS_MODE.INTRO; // Start fade in effect
				room_goto(target); // go to target room 
				break;
			}
			case TRANS_MODE.RESTART: // If restarting the game 
			{
				game_restart(); // restart game
				break;
			}
		}
	}
}

