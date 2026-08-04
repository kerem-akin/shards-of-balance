if(showing_dialog == true) { // if dialogue is shown
    var padding = 38; // Use this padding between lines and edges of the textbox
    var textbox_height = 215; // Height of the textbox 
    
    var x_pos = 0; // X position of textbox, in the left
    var y_pos = display_get_gui_height() - textbox_height; // Y position of the textbox at the bottom
    var box_width = display_get_gui_width(); // Stretch the textbox to the maximum width of the screen
    
    draw_set_alpha(alpha); // Set the transparency
    
    // Draw the textbox sprite stretched to full width and increased height
    draw_sprite_stretched(Textbox, 0, x_pos, y_pos, box_width, textbox_height);
    
    if(current_dialog.sprite != -1) { // If there is a sprite that can be displayed
        var char_scale = min(1, (textbox_height - padding * 2) / sprite_get_height(current_dialog.sprite)); // Calculate to fit within textbox
        var char_y = y_pos + (textbox_height - sprite_get_height(current_dialog.sprite) * char_scale) / 2; // Center it vertically 
        draw_sprite_ext(current_dialog.sprite,0, x_pos + padding, char_y, char_scale, char_scale, 0, c_white, alpha); 
    }
    
    draw_set_font(Font3); // Use this font for the dialogue
    draw_set_color(c_white); // Set the color of text to white
    
    var text_x = x_pos + padding + (current_dialog.sprite != -1 ? sprite_get_width(current_dialog.sprite) * char_scale + padding : 0); 
    var text_y = y_pos + padding; // Set y position, taking padding into account
    var max_width = box_width - (text_x - x_pos) - padding; // Calculate maximum width available for the text
    
    var text_to_draw = string_copy(current_dialog.message, 1, char_current); // Copy the text from the message 
    draw_text_ext(text_x, text_y, text_to_draw, 40, max_width); // Draw the text
    
    // Reset the font to default
    draw_set_font(-1);
    
    alpha = lerp(alpha, 1, 0.06); // Slowly decrease transparency
}