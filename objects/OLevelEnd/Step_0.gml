if (place_meeting(x, y, OPlayer)) {
    if (instance_number(Skeleton) == 0 &&
        instance_number(SkeletonD) == 0 &&
        instance_number(Plant) == 0 &&
        instance_number(PlantDe) == 0 &&
        instance_number(FireSpirit) == 0 &&
        instance_number(FireSpiritD) == 0 &&
        instance_number(FireSpiritStr) == 0 &&
        instance_number(FireSpiritDStr) == 0) { 
		// Checks there is no enemies left in the room
        
        global.can_transition = true;  // Allows transition to next room if there isnt
        global.enemyDefeatAlpha = 0;   // Hides the defeat all enemies message
        global.enemyDefeatTimer = 0;   // Resets timer
    } else {
        global.can_transition = false; // It can`t transition if there are enemies left
        global.enemyDefeatTimer = 180; // Play the defeat all enemies message for 3 seconds
    }

    if (global.can_transition) { // If transition is allowed
        room_goto(global.next_room); // Go to the next room
    }
}

// If the defeat timer hasnt reached zero so the essage didnt disappear
if (global.enemyDefeatTimer > 0) {
    global.enemyDefeatTimer--; // decrease untill it reaches 0

    // Fade in
    if (global.enemyDefeatAlpha < 1) { // If not every single enemy is defeated and defeat all enemies text isnt displayed
        global.enemyDefeatAlpha += 0.0075; // Start fading in the message
        if (global.enemyDefeatAlpha > 1) global.enemyDefeatAlpha = 1; // Until it reaches alpha 1 so fully visible, clamp it at 1.
    }
} else {
    // Fade out the message
    if (global.enemyDefeatAlpha > 0) { // If is still visible so not at 0,
        global.enemyDefeatAlpha -= 0.015; // FAde out the message
        if (global.enemyDefeatAlpha < 0) global.enemyDefeatAlpha = 0; // Clamp it at zero so it remains invisible
    }
}
