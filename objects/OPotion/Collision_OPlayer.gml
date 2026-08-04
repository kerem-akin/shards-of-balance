	if (place_meeting(x, y, OPlayer)) { // if colliding with player
	    // Checks if the player has less than max health
	    if (health < OPlayer.max_health) {
	        // If he has less, increase health
			audio_play_sound(PotionPickup,1,false)
	        health += potion_health; // Increases by 1
	        health = min(health, OPlayer.max_health);  // Health doesn't exceed the max health 5

	        instance_create_layer(OPlayer.x, OPlayer.y - 85, "PotionEffect", Object29); // Create an effect 85 pixels above the player
        
	        // Destroy the potion upon being picked up
	        instance_destroy();
	    }
	}
