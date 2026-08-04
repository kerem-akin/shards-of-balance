if (!cutscene_played) { // if cutscene hasnt been played yet
    var cutscene_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
	// Get horizontal center of camera
    var cutscene_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
	// Get vertical center of camera

    var cutscene = instance_create_layer(cutscene_x, cutscene_y, "MagicAttack", OCutsceneEnd); // create the cutscene at the center of the camera
    cutscene.cutscene_active = true; // Set the cutscene started condition to true
    cutscene.portal_target = target; // Store the target room
    cutscene_played = true; // Prevent the cutscene playing again
}

