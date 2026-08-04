firingdelay = 0; // Resets delay before the next shot can be fired
recoil = 0; // Bounce back after shots
shotCount = 0;
charging = false;

// Ensure the global variable is initialized before using it
if (!variable_global_exists("fireballUnlocked")) {
    global.fireballUnlocked = false; // Create it here if not initialized
}

// Now it's safe to check
if (!global.fireballUnlocked) {
    // Do something if the ability is not unlocked
}
