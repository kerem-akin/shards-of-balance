
var heart_spacing = 32; // Horizontal spacing between the hearts used in the top left to show the players health 
var start_x = 10; // 10 pixels to the right of top left
var start_y = 10; // 10 pixels down of top left, these 2 values make the hearts appear at top left oif screen

for (var i = 0; i < max_health; i++) { // Determines how mnay heart icons should be drawn and if they should be the empty or filled one
    var sprite_to_draw;
    if (i < health) {
        sprite_to_draw = char_heart // Filled heart sprite if player has that health
    } else {
        sprite_to_draw = char_heart_1 // Empty one if the player doesn`t have that health
    }
    draw_sprite(sprite_to_draw, 0, start_x + i * heart_spacing, start_y); // Draw the hearts
}


