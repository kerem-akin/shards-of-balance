if image_alpha < 1 { // If isnt fully visible
	image_alpha += .01; // Slowly fade in
}

if image_alpha == 1 { // If fully visible
	if keyboard_check_pressed(vk_anykey) // if any key is pressed
	room_restart(); // Restart the room
}

x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2; // Take horixontal center of camera
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2; // Take vertical center of camera

if (global.is_spawning) { // If the death effect screen animation started spawning
    // Increase its timer to later destroy we lifespan is 0
    global.spawn_timer++;

    // Spawn an effect every 5-10 frames so every 0.085-0.017 seconds
    if (global.spawn_timer > random_range(5, 10)) { 
        var cam_x = camera_get_view_x(view_camera[0]); // Get starting x position of camera
        var cam_y = camera_get_view_y(view_camera[0]); // Get starting y position of camera
        var cam_width = camera_get_view_width(view_camera[0]); // get width of camera
        var cam_height = camera_get_view_height(view_camera[0]); // get height of camera

        // Randomize position inside the camera view
        var rand_x = cam_x + random(cam_width);
        var rand_y = cam_y + random(cam_height);

        // Randomly create DeathEffect1 or DeathEffect2
        if (random(1) < 0.6) { // Create the first effect 60% of the time and the other 40% of the time
            instance_create_layer(rand_x, rand_y, "AttackingCrsytal", DeathScreenEffect1);
        } else {
            instance_create_layer(rand_x, rand_y, "AttackingCrsytal", DeathScreenEffect2);
        }

        // Reset timer
        global.spawn_timer = 0;
    }
}

