
if (alarm[0] == 0 && is_attacking) { // After attacking
    is_attacking = false; // Set attacking to false
    sprite_index = BossSpawnI; // Idle animation after attack ends
}
