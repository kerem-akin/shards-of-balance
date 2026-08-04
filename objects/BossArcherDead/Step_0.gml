if (done == 0) // If hasnt completed its action
{
    vsp = vsp + grv; // Increases its vertical speed using gravity

    if (place_meeting(x + hsp, y, Object12)) // If the dead object is going to collide with the collision object horizontally
    {
        while (!place_meeting(x + sign(hsp), y, Object12)) // Moves horixontally until it is not colliding with collision object
        {
            x += sign(hsp); // Moves the object in the horizontal direction
        }
        hsp = 0; // Stop horizontal movement once the colliding stops
    }

    x += hsp; // Applies horizontal movement

    if (place_meeting(x, y + vsp, Object12)) // If the object is going to collide with a collision object vertically this time
    {
        if (vsp > 0) // If its falling
        {
            done = 1; // The action is done
            image_speed = 0.4; // Play animation speed to %40 of original speed
        }
        while (!place_meeting(x, y + sign(vsp), Object12)) // Moves vertically until it is not colliding with the collision object
        {
            y += sign(vsp); // Moves the object in the vertical direction
			// Sign is used to modify an objects position by a small amount 0-1, so here it moves vertically by 1 pixel until not colliding
        }
        vsp = 0; // Stop vertical movement
    }

    y += vsp; // Applies vertical movement 
}

if (done == 1 && image_index >= sprite_get_number(sprite_index)) // if the action and animation is done
{
    instance_destroy(); // Destroy the dead object
}

