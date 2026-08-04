// Randomized falling speed between these values
y += 1 + random_range(0.5, 1.5); 

// Horizontal movement with wind and sway 
x += sin(degtorad(image_angle)) * random_range(0.3, 0.6); 

// The leaves sometimes rotate
image_angle += random_range(-0.1, 0.5); 

// randomized vertical movement with small variations in speed
y += random_range(1.5, 2.0); 

// Random small horizontal drift influenced by wind speed
x += random_range(-2.2, -1.1); // Leaves shift left 
x += global.wind_speed * 0.5; // Apply wind speed with a slight effect

// Gradual fading of the leaf
image_alpha -= 0.00075;
if (image_alpha <= 0) { // When fully invisible
    instance_destroy(); // Destroy leaf when fully transparent
}

// Destroy the leaf if it falls below the room
if (y > room_height) {
    instance_destroy(); // destroy the leaf
}
