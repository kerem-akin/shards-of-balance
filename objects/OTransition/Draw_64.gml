if(mode != TRANS_MODE.OFF) // If transitioning
{
	draw_set_color(c_black); // Use black colour 
	draw_rectangle(0,0,w,percent*h_half,false); // draw rectangle from top to downwards
	draw_rectangle(0,h,w,h-(percent*h_half),false); // draw rectangle from downwards to top 
}

	
