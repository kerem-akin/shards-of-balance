
if (instance_exists(follow)) { // if the follow object so the player exists 
    xTo = follow.x; // sets the target x position to the players x position, following it
    yTo = follow.y; // sets the target y position to the players y position, following it
}

x += (xTo - x) / 25; // Gradually move the camera towards the players x position
y += (yTo - y) / 25; // Gradually move the camera towards the players y position

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff); // Dont let the camera show outside the room on the x axis
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff); // Dont let the camera show outside the room on the y axis

x += random_range(-shake_remain,shake_remain); // Adds random shake effect on x axis
y += random_range(-shake_remain,shake_remain); // Adds random shake effect on y axis
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude)); // Determines the shake length and magnitude

camera_set_view_pos(cam, x - view_w_half, y - view_h_half); // Sets cameras position

if (layer_exists("Trees")) // If this layer exists in the room
{
	layer_x("Trees",x/2); // Set the x position of thr layer to move at half the speed of the camera, creating a smooth following effect
}