// Check if Exilion has seen the player
if (has_seen_player) {
    // Smoothly increase the alpha value to create a fade-in effect
    if (fade_alpha < 1) {
        fade_alpha += fade_speed; // Increase alpha value gradually
    }
    
    // Draw the Exilion object
    draw_self(); 

    // If flash effect exists
    if (flash > 0) { 
        flash--; // Decrease the timer
        shader_set(ShWhite); // Apply the ShWhite effect
        draw_self(); // Draw the Exilion object with flash effect
        shader_reset(); // Reset the shader
    }

    // Drawing Health Bar
    var spr = HealthBarExilion;
    var spriteWidth = sprite_get_width(spr);
    var spriteHeight = sprite_get_height(spr);

    // Get the camera's position
    var camX = camera_get_view_x(view_camera[0]); // Camera X position
    var camY = camera_get_view_y(view_camera[0]); // Camera Y position

    // Centering the health bar in the middle of the camera view
    var xPosition = camX + (camera_get_view_width(view_camera[0]) / 2) + 17;
    var yPosition = camY + (camera_get_view_height(view_camera[0]) / 2) - 75 ; // 300 pixels up from the center

    // Adjusting the xOffset to center the bar horizontally
    var xOffset = (xPosition - round(spriteWidth / 2));
    var yOffset = (yPosition - round(spriteHeight / 2));

    // Draw the health bar with fading effect
    draw_sprite_ext(spr, 0, xOffset, yOffset, 1, 1, 0, c_white, fade_alpha);
    draw_sprite_ext(spr, 1, xOffset, yOffset, (healthPointsPrev / healthPointsMax), 1, 0, c_white, fade_alpha);
    draw_sprite_ext(spr, 2, xOffset, yOffset, (healthPoints / healthPointsMax), 1, 0, c_white, fade_alpha);
    draw_sprite_ext(spr, 3, xOffset, yOffset, 1, 1, 0, c_white, fade_alpha);

    // Draw markers every 25%
    var xLength = 996;
    var markerValue = 25; // Each marker represents 50 HP (25%)
    var markerCount = (healthPointsMax / markerValue);
    var markerOffset = (xLength / markerCount);

    // Drawing the markers on the health bar
// Drawing the markers on the health bar
for (var i = 1; i < markerCount; i++) {
    var markerX = xOffset + (markerOffset * i);
    draw_sprite_ext(HealthBarDivider, 0, markerX, yOffset, 1, 1, 0, c_white, fade_alpha);
}
}