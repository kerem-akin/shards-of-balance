draw_self(); // Draw the firespirit object
if (flash > 0) { // If flash effect exists
    flash--; // Decrease its timer
    shader_set(ShWhite); // Apply the ShWhite effect 
    draw_self(); // Draw the firespirit object
    shader_reset(); // Reset the shader to the default state
}
