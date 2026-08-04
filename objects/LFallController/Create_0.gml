// Different chances of leaves being spawned every frame for every room
switch (room) {
    case R1:
        leaf_spawn_chance = 12; 
        break;
    case R2:
        leaf_spawn_chance = 14; 
        break;
    case R3:
        leaf_spawn_chance = 16; 
        break;
	 case R4:
        leaf_spawn_chance = 18; 
		break;
	 case R5:
        leaf_spawn_chance = 20;
		break;
    default:
        leaf_spawn_chance = 18; 
}
