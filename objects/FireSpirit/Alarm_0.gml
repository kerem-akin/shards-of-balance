// Alarm[0]: Resume movement after attack ends
if (alarm[0] == 0 && is_attacking) {
    is_attacking = false;
    sprite_index = FireW; // Reset walking animation
}