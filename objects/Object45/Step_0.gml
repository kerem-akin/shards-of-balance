// In the Step Event of obj_logo
if (zooming_in) {
    zoom_factor += zoom_speed;  // Increase zoom_factor
    if (zoom_factor >= 1.05) {  // Max zoom in
        zooming_in = false;
    }
} else {
    zoom_factor -= zoom_speed;  // Decrease zoom_factor
    if (zoom_factor <= 0.95) {  // Min zoom out (normal size)
        zooming_in = true;
    }
}
