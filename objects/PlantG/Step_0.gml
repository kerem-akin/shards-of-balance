// Check if the player is colliding with the gas spreading object
var player = instance_place(x, y, OPlayer); // checks for the collision
if (player != noone && player.invincibility_frames == 0) { // If the player exists and isnt invincible
    player.health -= 1; // deal 1 damage
    player.invincibility_frames = 60; // give invinciblity for 1 second
} // Doesn`t work at the moment, doesn`t damage the player since its not defined in the player step event

image_alpha -= 0.02; // Slowly fade out after
if (image_alpha <= 0) { // If fully faded out
    instance_destroy(); // Destroy the object
}