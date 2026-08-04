
speed_run = 4; // Exilions horizontal running speed
vsp = 0; // Vertical movement, starts out at 0.
grv = 0.3; // Gravity applied to Exilion, directly affects vertical speed
hsp = speed_run; // Horizontal speed of Exilion, moves left initially beacuse of the -1

flash = 0; // Toggled off at starts, plays when Exilion is damaged by player
hitfrom = 0; // Tracks direction and source of damage
chasing = false; // Doesn`t chase the player at the start, set to true when has sight of the player

is_attacking = false; // Determines if Exilion is attacking, happens when near player

attack_duration = 30; // Duration of attack
damage_frame = 15; // Frame when the attack actually does damage

chase_timer = 0; // Timer tracking how long the Exilion chases the player after losing sight, toggled off at starts since it doedn`t see the player

part_system = part_system_create(); // Creates particles system
part_glitter = part_type_create(); // Creates new particle type for glitter

part_type_size(part_glitter, 0.15, 0.02, 0.014, 0); // Determines the size of the particles
part_type_alpha2(part_glitter, 1, 0); // Determines visibility of particles, they start by being fully visible and fade out
part_type_speed(part_glitter, 0.2, 1, 0, 0); // The particle speed, varies between those values
part_type_direction(part_glitter, 0, 360, 0, 0); // Particle direction, 360 means they can move in all directions randomly
part_type_life(part_glitter, 30, 60); // Particles last between 0.5-1 second.

particles_sprites = [DeathAnimationBF]; // Use the death particles which I created in sprite editor

damage = 1; // Default damage Exiliion deals if no other damage value is set in its creation code

is_idle = false; // Whether Exilion is in idle state
idle_timer = 0; // Tracks Exilion`s idle state

has_seen_player = false; // Tracks whether Exilion has seen the player or not

is_dialogue_shown = false; // Tracks whether Exilion spoke his dialogu or nor

healthPointsMax = 200;
healthPoints = healthPointsMax; // Set the initial health to maximum
healthPointsPrev = healthPointsMax;

followUpTimerMax = 180;
followUpTimer = 0;

fade_alpha = 0;  // Start with completely transparent health bar
fade_speed = 0.01;
