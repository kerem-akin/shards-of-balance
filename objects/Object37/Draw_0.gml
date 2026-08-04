if(surface_exists(lighting_surface) == false) { // if lighting surface doesnt exist
	lighting_surface = surface_create(room_width,room_height); // Create it with the rooms dimensions
}

surface_set_target(lighting_surface); // Set traget surface for lighting 

draw_clear_alpha(c_black, 0.3); // Dim the surface by 30%


with(Object38) { // For object 38 which is my light texture
	
	var wobble_amount_x = image_xscale + random_range(-wobble, wobble); // Apply random horizontal wobble
	var wobble_amount_y = image_yscale + random_range(-wobble, wobble); // Apply random vertical wobble
	
	gpu_set_blendmode(bm_subtract); // Set blend mode to subtract for the lighting effects
	draw_sprite_ext(sprite_index, image_index,x,y, wobble_amount_x, wobble_amount_y, 0, c_white, 1); // Draw the light effect for object 38
	
	gpu_set_blendmode(bm_add); // Set blend mode to create a glow effect
	draw_sprite_ext(Sprite107, 0,x,y, wobble_amount_x, wobble_amount_y, 0, color, intensity); // Draw the effect with sprite 107
	
	gpu_set_blendmode(bm_normal); // reset blend mode back to normal
	
	
}

with(Object44) { // For object 38 which is another light texture
	
	var wobble_amount_x = image_xscale + random_range(-wobble, wobble); // Apply random horizontal wobble
	var wobble_amount_y = image_yscale + random_range(-wobble, wobble); // Apply random vertical wobble
	
	gpu_set_blendmode(bm_subtract); // Set blend mode to subtract for the lighting effects
	draw_sprite_ext(sprite_index, image_index,x,y, wobble_amount_x, wobble_amount_y, 0, c_white, 1); // Draw the light effect for object 44
	
	gpu_set_blendmode(bm_add); // Set blend mode to create a glow effect
	draw_sprite_ext(Sprite112, 0,x,y, wobble_amount_x, wobble_amount_y, 0, color, intensity); // Draw the effect with sprite 112
	
	gpu_set_blendmode(bm_normal);  // reset blend mode back to normal
	
}

var particle_wobble = 0.05;
with(Object41) {
	
	var wobble_amount_x = image_xscale + random_range(-particle_wobble, particle_wobble);
	var wobble_amount_y = image_yscale + random_range(-particle_wobble, particle_wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index,x,y, wobble_amount_x, wobble_amount_y, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(Sprite107, 0,x,y, wobble_amount_x, wobble_amount_y, 0, color, image_alpha);
	
	gpu_set_blendmode(bm_normal);
	
}

var particle2_wobble = 0.05;
with(Object42) {
	
	var wobble_amount_x = image_xscale + random_range(-particle2_wobble, particle2_wobble);
	var wobble_amount_y = image_yscale + random_range(-particle2_wobble, particle2_wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index,x,y, wobble_amount_x, wobble_amount_y, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index,x,y, wobble_amount_x, wobble_amount_y, 0, color, image_alpha);
	
	gpu_set_blendmode(bm_normal);
	
}



surface_reset_target(); //Reset drawing target back to the default surface 

draw_surface(lighting_surface, 0,0); // Draw the lighting surface at psotion 0,0
