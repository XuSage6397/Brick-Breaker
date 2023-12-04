// We don't want the paddle to move when the game is paused
// or when the lose menu is open
// or when the win menu is open
if(global.paused || instance_exists(obj_menu_win) || instance_exists(obj_menu_lose))
{
	exit;
}

// We only want to check if the bat should be reset if it is already in its large bat state
// to save on processing time. And because we set it as the large bat when its timer is above
// zero, this is the best check
if(large_bat_timer > 0)
{
	// If it is above zero, set it to the large bat
	sprite_index = spr_bat_large;
	image_index = 0;
	
	// Decrease the timer by 1
	large_bat_timer--;
	
	// And then if it is zero, it's time to reset the bat
	if(large_bat_timer == 0)
	{
		sprite_index = spr_bat_final;
		image_index = 0;
	}
}

// We don't want the paddle to go past the game
// boundary, so we keep track of the boundary location
// and the width of the paddle
var _bound = 120 + (sprite_width/2);

// The bat should only move to the mouse's position if the mouse has been moved. This stops the
// bat from stutter stepping. For now, we check if the mouse has moved, log its new position,
// and move the bat accordingly
if(mouse_x != _prev_mouse_x)
{
	_prev_mouse_x = mouse_x;
	x = clamp(mouse_x, _bound, room_width - _bound);
}