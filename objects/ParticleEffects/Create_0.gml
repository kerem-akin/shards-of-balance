image_speed = random_range(0.1, 0.3); // Random animation speed between 10-30% of original speed
image_alpha = 0; // Start invisible
alarm[0] = irandom_range(80, 150); // Lifetime of the particle, randomized between these values

// Movement of particles
direction = irandom_range(260, 280); // Slightly rising upwards
speed = random_range(0.2, 0.8); // Random slow speed between these values

// Give it a floating effect
hsp = random_range(-0.2, 0.2);
vsp = random_range(-0.1, -0.5);

// Randomly choose between PBlue and PWhite which are the particles I created in sprite editor
sprite_index = choose(PBlue, PWhite);
