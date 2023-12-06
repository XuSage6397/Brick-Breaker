// Don't do anything if a menu is open. We don't need to check for the pause menu because
// the ball should not be moving anyway
if(instance_exists(obj_menu_win) || instance_exists(obj_menu_lose))
{
	exit;
}

// If there are no balls left...
if(!instance_exists(obj_ball))
{	
	// Create a new ball!
	instance_create_layer(obj_bat.x, obj_bat.y - 48, "Instances", obj_ball);
		
	// And play a sound
	audio_play_sound(sfx_ball_spawn, 0, false);
}

// Increase spawn rate of new bricks based on score
if score >= global.speed_increment_threshold {
	global.speed_increment_threshold *= 1.25
	global.spawn_rate /= 1.1
	move_interval = game_get_speed(gamespeed_fps) * global.spawn_rate;
	show_debug_message("Spawn speed: " + string(move_interval))
}

if global.paused {
	for(var _i = 0;_i < 3;_i++) {
		if alarm[_i] {
			alarm[_i]++;//Stop alarm from happening
		}
	}
}