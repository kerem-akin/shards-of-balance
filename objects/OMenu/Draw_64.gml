draw_set_font(FMenu); // Use this font 
draw_set_halign(fa_right); // Alignt text to the right of the screen
draw_set_valign(fa_bottom); // Align text to bottom of the screen

for (var i = 0; i < menu_items; i++) //  Draw the menu text, the items
{
	var offset = 2; // With an offset betwene
	var txt = menu[i];
	if (menu_cursor == i) // Check if on the selected menu item
	{
		txt = string_insert("> ", txt, 0); // Add this symbol on left 
			var col = c_white; // Use white colour
	}
	else
	{
		var col = c_gray; // Default colour for non-selected items
	}
	var xx = menu_x; // x position for the menu text
	var yy = menu_y - (menu_itemheight * (i * 1.5)); // y position for each item
	draw_set_color(c_black); // Use black colour 
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy+offset,txt);
	draw_text(xx,yy-offset,txt); // Draws text shadow
	draw_set_color(col); // Use the colour to draw the text 
	draw_text(xx,yy,txt); // Draw menu item text
}
