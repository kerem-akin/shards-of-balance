	if (hp <= 0) { // If plant is defeated
				    var death_anim = instance_create_layer(x, y - 102 , "Enemies", Death); // Create the death animation above plant
    death_anim.image_xscale = image_xscale; // Flip correctly
	    with (instance_create_layer(x, y, layer, PlantDe)) {  // Create the dead version of plant
	        direction = other.hitfrom; // Set its position based on the last attack the skeleton received
	        hsp = lengthdir_x(2, direction); // New horizontal movemental 
	        vsp = lengthdir_y(1, direction) - 1; // New vertical movemental 
	        image_xscale = other.image_xscale; // Flips accurately
	    }
	    instance_destroy(); // Destroys the dead pplant object
	}
