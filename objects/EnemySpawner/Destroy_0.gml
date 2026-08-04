if (variable_instance_exists(id, "spawner_instance")) { // If the instance has a valid reference
    if (instance_exists(spawner_instance)) { // Ensures the spawner exists
        if (object_index == Skeleton) { // If it a skeleton
            spawner_instance.skeleton_count -= 1; // Decrease the skeleton count
        } else if (object_index == Plant) { // If it a splant
            spawner_instance.plant_count -= 1; // Decrease the plant count
			// This code is used to spawn the right number of enemies 
        }
    }
}

