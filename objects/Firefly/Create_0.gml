glow_color = make_color_rgb(255, 255, 110); // determines colour for the gloe circle we are goint o create 
glow_radius = sprite_width * 0.4; // size of the glow
glow_intensity = 0.026; // How intense glow is, decrease to make it lighter
glow_circles = 15; // 15 glow circles to blend 

speed = random_range(0.2, 0.5); // Vary the speed of fireflies
direction = random(360); // Can travel in any direction in the room
max_speed = 0.7; // Maxmimum speed they can reach
turn_speed = 0.5; // Speed when turning

swarm_x = room_width * 0.05; // Start position near left side
swarm_y = room_height * 0.05; // Start position neear top
swarm_height = room_height * 0.92; // Can go down 92% from top, can almost go fully down
swarm_width = room_width * 0.92; // Can go 92% from left, can almost go fully right





