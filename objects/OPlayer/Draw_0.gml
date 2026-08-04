
if (shader_timer > 0) { // If shader is active
    shader_set(ShWhite); // Apply the shWhite effect
}

draw_self(); // Draw the player object

shader_reset(); // Reset the shader to the default state