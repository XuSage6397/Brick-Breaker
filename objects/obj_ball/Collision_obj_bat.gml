if(!_locked_to_bat)
{
	// If the ball is moving downwards, onto the bat...
	if(vspeed > 0)
	{
		// Bounce back up.
		vspeed = -vspeed;

		// Adjust horizontal speed based on where the ball
		// landed on the bat.
		// This effectively alters the direction of the ball.
		// But changes the total speed, which we fix next.
		hspeed += (x - other.x) / 10;

		// Here we limit how close to horizontal the ball can move
		// This makes the game keep moving along at a satisfying pace
		direction = clamp(direction, 15, 165);

		// Setting total speed here, actually "normalizes"
		// hspeed and vspeed. So regardless of what we set
		// hspeed to in the previous action, total speed will
		// now be 5 but the new direction will be maintained.
		speed = 5;

		if(!_locked_to_bat)
		{
			// BOOSH! (create a little hit effect)
			instance_create_layer(x, other.y - 48, "Effects", obj_hit_1);
	
			audio_play_sound(sfx_bathit, 0, false);
		}
	}

	createBrick();
	// This doesn't use the move_bounce functions because we don't want the bat to snap back
	// to its previous position and frustrate the player
}