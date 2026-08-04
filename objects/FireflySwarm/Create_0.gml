switch (room) {
	// Use these unique number of fireflies for each room, more in bigger rooms
    case R2: firefly_count = 42; break;
    case R3: firefly_count = 60; break;
	case R4: firefly_count = 86; break;
	case R5: firefly_count = 118; break;
    default: firefly_count = 42;
}
swarm_width = room_width * 0.92; // Randomly positioned within the 92% of the room
swarm_height = room_height * 0.92; // Randomly positioned within the 92% of the room
swarm_x = room_width * 0.05; // Cant get too close to the left or right of the room
swarm_y = room_height * 0.05; // CAnt get too close to the top or bottom of the room

for (var i = 0; i < firefly_count; i++) { // Loop though number of fireflies
    var fx = swarm_x + random(swarm_width); // generate a random x position
    var fy = swarm_y + random(swarm_height); // generate a random y position
    instance_create_layer(fx, fy, "Fireflies",Firefly); // Spawn the firefly
}

