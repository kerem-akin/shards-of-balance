var cameraW = 1256; // Width of camera
var cameraH = 924; // Height of camera

if (global.levelTitle != noone) { // if room title exists
    if (sprite_exists(global.levelTitle)) { // if it exists
        var spriteW = sprite_get_width(global.levelTitle); // get its width
        var spriteX = (cameraW / 2) - (spriteW / 2) + global.levelTitleXOffset; // Use the offset to position in horizontal center of camera
        var spriteY = 20; // 20 pixels below the top of the camera

        draw_sprite_ext(global.levelTitle, 0, spriteX, spriteY, 1, 1, 0, c_white, global.levelTitleAlpha); // Draw the title
    }
}

// Draw "Defeat All Enemies First" message
if (global.enemyDefeatAlpha > 0) { // If the message is visible
    if (sprite_exists(global.enemyDefeatSprite)) { // If it exists
        var spriteW = sprite_get_width(global.enemyDefeatSprite); // get its width
        var spriteX = (cameraW / 2) - (spriteW / 2) + global.levelTitleXOffset; // Use the offset to position in horizontal center of camera
        var spriteY = 20; // 20 pixels below the top of the camera

        draw_sprite_ext(global.enemyDefeatSprite, 0, spriteX, spriteY, 1, 1, 0, c_white, global.enemyDefeatAlpha); // Drawthe message
    }
}

// Draw Exilion Display
if (global.exilionDisplay != noone) { // If ExilionDisplay is active
    if (sprite_exists(global.exilionDisplaySprite)) { // If sprite exists
        var spriteW = sprite_get_width(global.exilionDisplaySprite); // Get width
        var spriteX = (cameraW / 2) - (spriteW / 2) + global.levelTitleXOffset; // Position it in the center with offset
        var spriteY = 20; // Position it just below the top of the camera

        // Draw sprite with fade effect
        draw_sprite_ext(global.exilionDisplaySprite, 0, spriteX, spriteY, 1, 1, 0, c_white, global.exilionDisplayAlpha); 
    }
}

