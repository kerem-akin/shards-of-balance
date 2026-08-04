// Draw a semi-transparent black rectangle over the entire room
draw_set_alpha(darkness_alpha); // Sets the alpha value for its transparency
draw_set_color(c_black); // Use black colour
draw_rectangle(0, 0, room_width, room_height, false); // draws rectangle over the entire room
draw_set_alpha(1); // Reset alpha to default
