 if (instance_number(Skeleton) == 0 && instance_number(SkeletonD) == 0 && instance_number(Plant) == 0 && instance_number(PlantDe) == 0) {
    global.can_transition = true;  
} else {
    global.can_transition = false;
}