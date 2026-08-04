// If the chest has been opened and the animation has finished
if (opened && image_index >= image_number - 1) {
    if (!instance_exists(WitchesBlessingOBtained)) { // If the ability pickup screen doesnt exist
        instance_create_layer(x, y, "MagicAttack", WitchesBlessingOBtained); // Create it
    }
    instance_destroy(); // Remove the chest after opening
}