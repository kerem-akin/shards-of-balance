image_alpha -= 0.05; // The spawner fades out 
if (image_alpha <= 0) { // if fully invisible
    var potion_type = choose(OPotion, OPotionSpeed); // Choose from one of the potions
    instance_create_layer(x, y + 60, "Instances_1", potion_type); // Spawn one of them 60 pixels below the spawner
    
    ds_list_destroy(created_enemies); // Destroy list to prevent memory leaks
    instance_destroy(); // Destroy the potion
} else {
    alarm[4] = 1; // Trigger alarm 4 at the next step
}