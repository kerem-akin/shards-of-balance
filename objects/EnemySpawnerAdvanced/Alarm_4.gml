image_alpha -= 0.05;
if (image_alpha <= 0) {
    var potion_type = choose(OPotion, OPotionSpeed);
    instance_create_layer(x, y + 60, "Instances_1", potion_type);
    
    ds_list_destroy(created_enemies); // Destroy list to prevent memory leaks
    instance_destroy();
} else {
    alarm[4] = 1;
}