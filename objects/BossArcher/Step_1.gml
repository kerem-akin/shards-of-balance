if (hp <= 0) // If archer is defeated
{
	    var death_anim = instance_create_layer(x, y - 128 , "Enemies", Death); // Play the death animation above archer
    death_anim.image_xscale = image_xscale; // Flip correctly

	with(instance_create_layer(x,y,layer,BossArcherDead)) // Create the dead version of archer
	{
		direction = other.hitfrom; // Set its position based on the last attack the archer received
		hsp = lengthdir_x(2,direction); 
		vsp = lengthdir_y(1,direction)-1; // Slight knockback
		image_xscale = other.image_xscale; // Flips accurately
	}
	
	
	instance_destroy(); // Destroys the dead archer
}
