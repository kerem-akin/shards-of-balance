if (other.invincibility_frames <= 0) { // player doesnt have invincibility
    health -= 1; // deal 1 damage
    other.invincibility_frames = room_speed * 1; // provide 1 second of invincibility after dealing damage
}