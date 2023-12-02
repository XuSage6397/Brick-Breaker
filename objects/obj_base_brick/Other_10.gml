// We do the brick's hit code in a user event so that we can call it from the ball's
// collision event with the brick. This is because we want to change the brick's sprite
// to show how damaged the brick is by colour. Each colour corresponds to a health value
// Blue: 1, Pink: 2, Green: 3, Yellow: 4, Grey: indestructible
_hitpoints--;

image_index++;

// If its hitpoints are at zero, it has no health and should be destroyed
if(_hitpoints <= 0)
{
	// Add the appropriate reward to the player's score
	score += _reward;

	// We also want to randomly spawn a powerup so we get a random number between 0 and 99
	var _chance = floor(irandom(99));

	// if it's exactly 0, spawn an extra life
	if(_chance == 0)
	{
		instance_create_layer(x, y, "Instances", obj_powerup_extralife);
	}
	
	// If it's 1 - 14, we create either a largebat or points powerup
	else if(_chance < 15)
	{
		instance_create_layer(x, y, "Instances", choose(obj_powerup_largebat, obj_powerup_pointball));
	}

	// if it's 16-19, we spawn a multiball powerup
	else if(_chance < 20)
	{
		instance_create_layer(x, y, "Instances", obj_powerup_multiball);
	}
	
	// And now we finally destroy the brick. We could do this at any time during this destruction part
	// of the event but at the end makes the most sense for if you want to do anything else relating
	// to this object first
	instance_destroy();
}