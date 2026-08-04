if (done == 0) // If hasnt completed its action
{
    vsp = vsp + grv; // Increases its vertical speed using gravity

    if (place_meeting(x + hsp, y, Object12)) // If the dead object is going to collide with the collision object horizontally
    {
        while (!place_meeting(x + sign(hsp), y, Object12)) // Moves horixontally until it is not colliding with collision object
        {
            x += sign(hsp); // Moves the object in the horizontal direction
        }
        hsp = 0; // Stop horizontal movement once the colliding stops
    }

    x += hsp; // Applies horizontal movement

    if (place_meeting(x, y + vsp, Object12)) // If the object is going to collide with a collision object vertically this time
    {
        if (vsp > 0) // If its falling
        {
            done = 1; // The action is done
            image_speed = 0.7; // Play animation speed to %70 of original speed
        }
        while (!place_meeting(x, y + sign(vsp), Object12)) // Moves vertically until it is not colliding with the collision object
        {
            y += sign(vsp); // Moves the object in the vertical direction
			// Sign is used to modify an objects position by a small amount 0-1, so here it moves vertically by 1 pixel until not colliding
        }
        vsp = 0; // Stop vertical movement
    }

    y += vsp; // Applies vertical movement 
}

if (done == 1 && image_index >= sprite_get_number(sprite_index) - 1 && !is_dialogue_shown) { // if completed his action, is in the last frame of the animation and the dialogue hasnt been showed yet
	var player = OPlayer; // Set player as variable
    if (player != noone && point_distance(x, y, player.x, player.y) <= 1000) { // If player exists and is within 1000 pixels
        // Create dialogue only if it doesn't exist and prevent it from being shown again
        if (!instance_exists(ODialogParent)) {
            var dialog_instance = instance_create_depth(x, y - sprite_height - 50, depth - 1, ODialogParent); // Create the dialogue
            // Display the dialogue
            dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nNo... this can't be... How could this happen? No one can defeat me...");
            dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nI... I was eternal...! I am the ruler of this realm...");
            dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nMy soul... I feel it drifting away... My life... ");
            dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nYou... How could you?! No mere explorer should have the power to bring me down...");
			dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nPerhaps... you truly are strong...");
			dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nMaybe... you are worthy after all... Go, retrive the crystal. it lies at the end of this chamber... Take it, and see the truth for yourself...");
            dialog_instance.dialog.add(DialogueWizardBoss, "Exilion:\nBut... my will lingers still.... The darkness... will not end with me...!");

            // Mark the dialogue as shown to prevent it from showing again
            is_dialogue_shown = true;
        }
    }
}

// Continue the animation after dialogue has been shown
if (is_dialogue_shown && !instance_exists(OCutsceneCrystal)) {
    var cutscene_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2); // get horizontal middle value of camera
var cutscene_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2); // get vertical middle value of camera
// Create the cutscene at the middle of the camera
var cutscene = instance_create_layer(cutscene_x, cutscene_y, "MagicAttack", OCutsceneCrystal);
cutscene.cutscene_active = true; // Set cutsceen active to true
    instance_destroy(); // Destroy Dead Exilion
}




