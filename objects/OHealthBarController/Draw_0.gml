var spr = HealthBarExilion;
var spriteWidth = sprite_get_width(spr);
var spriteHeight = sprite_get_height(spr);

var xPosition = (room_width / 2);
var yPosition = (room_height / 2);

var xOffset = (xPosition - round(spriteWidth / 2) + 8);
var yOffset = (yPosition - round(spriteHeight / 2));

// Draw background
draw_sprite_ext(spr, 0, xOffset, yOffset, 1, 1, 0, c_white, 1);

// Draw follow-up bar (frame 1)
draw_sprite_ext(spr, 1, xOffset, yOffset, (healthPointsPrev / healthPointsMax), 1, 0, c_white, 1);

// Draw actual health bar (frame 2)
draw_sprite_ext(spr, 2, xOffset, yOffset, (healthPoints / healthPointsMax), 1, 0, c_white, 1);

// Draw outline (frame 3)
draw_sprite_ext(spr, 3, xOffset, yOffset, 1, 1, 0, c_white, 1);

// Draw markers every 25%
// Your bar is 498 pixels long
var xLength = 498;
var markerValue = 50; // Each marker represents 50 HP (25%)
var markerCount = (healthPointsMax / markerValue);
var markerOffset = (xLength / markerCount);

for (var i = 1; i < markerCount; i++)  // Fixed loop
{
    draw_sprite_ext(HealthBarDivider, 0, xOffset + (markerOffset * i) - 1, yOffset, 1, 1, 0, c_white, 1);
    draw_text_ext_transformed(xOffset + (markerOffset * i) - 1, yOffset + 1, string(markerValue * i), 1, 600, .1, .1, 0);
}