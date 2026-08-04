active = false; // Tracks if spwaner is active or not, isn't at the start
spawn_timer = 0; // Timer for spawn, not triggered at start
spawn_phase = 0; // Timer for spawn phase, notr triggered at start
image_speed = 0; // Doesnt play animation at the start
dialogue_shown = false;

skeleton_count = 0;  // Initialises skeleton count
plant_count = 0; // Initialises plant count
created_enemies = ds_list_create(); // Set created enemies as a list

