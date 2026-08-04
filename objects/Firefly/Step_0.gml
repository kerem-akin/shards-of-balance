// Random movement
direction += random_range(-turn_speed, turn_speed); // Alter the direction within the range
speed = min(speed + random_range(-0.1, 0.1), max_speed); // Vary the speed

// Keep within boundaries
var margin = 20; // They cant go less than 20 pixels away from walls of the room, cant go too close
if (x < swarm_x + margin || x > swarm_x + swarm_width - margin || // Checks if the firefly is close to right or left
    y < swarm_y + margin || y > swarm_y + swarm_height - margin) { // Checks if firefly is close to top or bottom
    direction = point_direction(x, y, swarm_x + swarm_width/2, swarm_y + swarm_height/2); // If too close, quickly move towards center of the room
    speed = max_speed; // With the maximum speed
}

x = (x + room_width) % room_width; // Ensure firefly stays within the room horizontally
y = (y + room_height) % room_height; // Ensure firefly stays within the room vertically

