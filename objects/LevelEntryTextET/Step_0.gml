if (global.levelTitle != noone) { // If the title is displayed
    if (global.levelTitleTimer > 0) { // And hasnt faded out yet
        global.levelTitleTimer--; // Decrease until its timer is over and it starts to fade out
        
        // Fade in
        if (global.levelTitleAlpha < 1) { // If not fully visible
            global.levelTitleAlpha += global.fadeInSpeed; // Fade in 
            if (global.levelTitleAlpha > 1) global.levelTitleAlpha = 1; // Clamp at 1 when fully visible
        }
    } else {
        // Fade out
        global.levelTitleAlpha -= global.fadeOutSpeed; // Fade out
        if (global.levelTitleAlpha < 0) { // If fully invisible
            global.levelTitleAlpha = 0; // Clamp at 0 when invisible
            global.levelTitle = noone; // Remove it from the room so it doesnt exist
        }
    }
}

// Handle enemy defeat message fade
if (global.enemyDefeatTimer > 0) { // If the title is still dispalyed
    global.enemyDefeatTimer--; // Decrease its timer to fade out

    if (global.enemyDefeatAlpha < 1) { // If not fully visible
        global.enemyDefeatAlpha += global.fadeInSpeed; // fade in 
        if (global.enemyDefeatAlpha > 1) global.enemyDefeatAlpha = 1; // Clamp at 1 when fully visible
    }
} else {
	// Fade out
    global.enemyDefeatAlpha -= global.fadeOutSpeed; // Fade out
    if (global.enemyDefeatAlpha < 0) { // If fully invisible
        global.enemyDefeatAlpha = 0; // Clamp at 0 when invisible
    }
}

// Handle ExilionDisplay fade 
if (global.exilionDisplay != noone) { // If ExilionDisplay is shown
    if (global.exilionDisplayTimer > 0) { // And the timer is still active
        global.exilionDisplayTimer--; // Decrease the timer to fade out

        // Fade in
        if (global.exilionDisplayAlpha < 1) { // If not fully visible
            global.exilionDisplayAlpha += global.fadeInSpeed; // Fade in
            if (global.exilionDisplayAlpha > 1) global.exilionDisplayAlpha = 1; // Clamp at 1
        }
    } else {
        // Fade out
        global.exilionDisplayAlpha -= global.fadeOutSpeed; // Fade out
        if (global.exilionDisplayAlpha < 0) { // If fully invisible
            global.exilionDisplayAlpha = 0; // Clamp at 0
            global.exilionDisplay = noone; // Remove Exilion display
        }
    }
}

