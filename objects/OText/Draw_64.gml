draw_set_color(c_white);

draw_set_color(c_white);  
draw_set_halign(fa_center);  
draw_set_valign(fa_top);

if (room == R1) {
    draw_text_transformed(room_width / 6, 24, "", 1.2, 1.2, 0);
} else if (room == R2) {
    draw_text_transformed(room_width / 7, 24, "", 1.3, 1.3, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(FMenu);