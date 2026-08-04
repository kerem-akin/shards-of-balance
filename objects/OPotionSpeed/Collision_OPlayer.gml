var player = instance_place(x, y, OPlayer); // If colliding with the player
audio_play_sound(PotionPickup,1,false)

if (player != noone) { // If player exists
    // Increase the player's speed temporarily
    player.walksp = 10.4;  // Set the player's speed to 10.4 from 8, 30% increase
    player.speed_buff_timer = 4.5 * room_speed;  // Speed boost last 4.5 seconds, room_speed is 1 second

    // Adds a visual effect for the speed potion above the player object
    instance_create_layer(player.x, player.y - 90, "PotionEffectSpeed", Object31); // Creates the effect object 90 pixels above the player

    // Destroy the potion object after the player picks it up
    instance_destroy();
}