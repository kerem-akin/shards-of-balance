if (done == 0) { // If hasnt completed its action
    vsp += grv; // Applies gravity to vertical speed 
    
    if (place_meeting(x + hsp, y, Object12)) { // If the dead object is going to collide with the collision object horizontally
        while (!place_meeting(x + sign(hsp), y, Object12)) { // Moves horixontally until it is not colliding with collision object
            x += sign(hsp);  // Moves the object in the horizontal direction
        }
        hsp = 0; // Stop horizontal movement once the colliding stops
    }
    
    x += hsp; // Applies horizontal movement
    
    if (place_meeting(x, y + vsp, Object12)) { // If the object is going to collide with a collision object vertically this time
        if (vsp > 0) { // If the object is falling
            done = 1; // Action is completed
            image_speed = 0.4; // PLay animation at 40% the original speed
            sprite_index = PlantA2; // Start the gas release animation
            image_index = 0; // Animation goes back to first frame
        }
        while (!place_meeting(x, y + sign(vsp), Object12)) { // Moves vertically until it is not colliding with the collision object
            y += sign(vsp); // Moves the object in the vertical direction
        }
        vsp = 0; // Stop vertical movement
    }
    
    y += vsp; // Applies vertical movement
    
    hsp = 0; // No horizontal movement after death
}

// Once the PlantA2 animation finishes, switch to the PlantA2C gas spreasing animation
if (done == 1 && sprite_index == PlantA2 && image_index >= sprite_get_number(sprite_index) - 1) {
    sprite_index = PlantA2C; // Use the animation of thegas spreading
    image_index = 0; // Start animation from first frame
    image_speed = 0.4; // Play at 40% the original animation speed
}

// Once PlantA2C finishes, destroy the plant
if (done == 1 && sprite_index == PlantA2C && image_index >= sprite_get_number(sprite_index) - 1) {
    instance_destroy(); // Destroy the plant 
}
