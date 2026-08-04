// Save blend mode and set to additive
var original_blend = gpu_get_blendmode(); // Store current blend mode
gpu_set_blendmode(bm_add); // Allow glow to go on top of each other

// Draw many circles for a smoother transition
for (var i = 0; i < glow_circles; i++) {
    var progress = i / glow_circles; // calculate progress of circles from 0-1
    var current_radius = glow_radius * (1 - progress); // Slowly decrease radious of each subsequent circle
    var current_alpha = glow_intensity * (1 - progress); // Slowly decrease glow intensity of each subsequent circle
    
    draw_set_alpha(current_alpha); // Set alpha transparency for glow
    draw_set_color(glow_color); // Use the colour in create event  
    draw_circle(x, y, current_radius, false); // Draw a circle with the calculated radius
}

// Reset draw settings
gpu_set_blendmode(original_blend); // Restore original blend
draw_set_alpha(1); // Alpha 1, fully visible for the next drawing
draw_set_color(c_white); // Reset the color to white

// Draw the firefly on top of the glow effect 
draw_self();


