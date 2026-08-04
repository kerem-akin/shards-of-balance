
if (instance_exists(OPlayer)) {
if (random(100) < leaf_spawn_chance) { // Spawn leaves with the unique chances for each room
    var leaf = instance_create_layer(random(room_width), -10, "Instances_1", LFall); // Create the leaf object in thetop of the room in a random x position
    leaf.image_speed = 0.6; // Play animation at 60% of original speed
    }
}

