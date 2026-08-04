if (variable_instance_exists(id, "spawner_instance")) { 
    if (instance_exists(spawner_instance)) {
        if (object_index == FireSpirit) {
            spawner_instance.firespirit_count -= 1;
        } else if (object_index == Plant) {
            spawner_instance.plant_count -= 1;
        }
    }
}

