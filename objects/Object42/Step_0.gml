// Random movement
direction += random_range(-turn_speed, turn_speed);
speed = min(speed + random_range(-0.1, 0.1), max_speed);

// Keep within boundaries
var margin = 20;
if (x < swarm_x + margin || x > swarm_x + swarm_width - margin || 
    y < swarm_y + margin || y > swarm_y + swarm_height - margin) {
    direction = point_direction(x, y, swarm_x + swarm_width/2, swarm_y + swarm_height/2);
    speed = max_speed;
}

// Wrap around room if somehow escaped
x = (x + room_width) % room_width;
y = (y + room_height) % room_height;

