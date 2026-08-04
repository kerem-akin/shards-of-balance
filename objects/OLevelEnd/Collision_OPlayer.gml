if (place_meeting(x, y, OPlayer)) {
    if (instance_number(Skeleton) == 0 &&
        instance_number(SkeletonD) == 0 &&
        instance_number(Plant) == 0 &&
        instance_number(PlantDe) == 0 &&
        instance_number(FireSpirit) == 0 &&
        instance_number(FireSpiritD) == 0 &&
        instance_number(FireSpiritStr) == 0 &&
        instance_number(FireSpiritDStr) == 0) {
		// If no enemies exist in the room

        // If player has control
        if (hascontrol) {
            hascontrol = false;  // Prevent it from advancing to next room 
            SlideTransition(TRANS_MODE.GOTO, target_room);  // Perform transition if all enemies are defeated
        }
    }
}