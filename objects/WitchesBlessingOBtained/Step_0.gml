// Step Event
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2; // Get the centre x-axis of camera
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2; // Get the centre y-axis of camera

if (!fadingOut) { // If isnt fading, out, doesnt at the start
    if (image_alpha < 1) { // If not fully faded in
        image_alpha += 0.005; // Slowly fade it in
        
        // Create dimmer if it doesn't exist
        if (!instance_exists(DeathScreenDimmer)) {
            var dimmer = instance_create_layer(0, 0, "SpawnInEffect", DeathScreenDimmer);
            dimmer.fade_to_dark = true; // Statr fading the background to black
        }
    } else if (keyboard_check_pressed(vk_anykey)) { // If any key is pressed
        fadingOut = true; // Start fading out 
    }
} else {
    image_alpha -= 0.01; // Fade out the pickup screen
    if (image_alpha <= 0) { // If pickup screen is fully faded out
        // Destroy the dimmer
        if (instance_exists(DeathScreenDimmer)) {
            instance_destroy(DeathScreenDimmer);
        }
        instance_destroy();
    }
}
