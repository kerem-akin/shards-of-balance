if (healthPoints <= 0) // If Exilion is defeated
{
		    var death_anim = instance_create_layer(x, y - 192 , "Enemies", DeathB); // Play death animation of Exilion
    death_anim.image_xscale = image_xscale; // Flip correctly
	with(instance_create_layer(x,y - 64,layer,ExilionD)) // Create the dead version of Exilion
	{
		direction = other.hitfrom; // Set its position based on the last attack the Exilion received
		hsp = lengthdir_x(2,direction); // New horizontal movemental 
		vsp = lengthdir_y(1,direction)-1; // New vertical movemental 
		image_xscale = other.image_xscale; // Flips accurately
	}
	
	
	instance_destroy(); // Destroys the dead Exilion
}
