// Don't do anything if a menu is open. We don't need to check for the pause menu because
// the ball should not be moving anyway
if(instance_exists(obj_menu_win) || instance_exists(obj_menu_lose))
{
	exit;
}

// If there are no balls left...
if(!instance_exists(obj_ball))
{
	// Lose a life.
	lives -= 1;

	// If there are no lives left you lose
	if(lives < 0)
	{
		if(!instance_exists(obj_menu_lose))
		{
			layer_sequence_create("Sequences", room_width / 2, room_height / 2, seq_menu_lose);
		
			instance_destroy(obj_ball);
		
			instance_destroy(obj_powerup_base);
		}
	}
	// But if there are lives left...
	else
	{
		// Create a new ball!
		instance_create_layer(obj_bat.x, obj_bat.y - 48, "Instances", obj_ball);
		
		// And play a sound
		audio_play_sound(sfx_ball_spawn, 0, false);
	}
}

// Count ALL bricks.
var _bricks_remaining = instance_number(obj_base_brick);

// If no destroyable blocks remain, you win!
if(_bricks_remaining <= 0)
{
	if(!instance_exists(obj_menu_win))
	{
		// If it's the final level we don't spawn the next button sequence
		if(room == room_last)
		{
			layer_sequence_create("Sequences", room_width / 2, room_height / 2, seq_menu_end_game);
		}
		else
		{
			layer_sequence_create("Sequences", room_width / 2, room_height / 2, seq_menu_end_level);
		}
	
		instance_destroy(obj_ball);
	
		instance_destroy(obj_powerup_base);
	}
}