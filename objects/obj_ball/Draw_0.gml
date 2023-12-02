// Draw the trail if we're not locked to the bat
if(!_locked_to_bat)
{
	// We don't want the trail to change if we're paused
	if(!global.paused)
	{
		// Log the current position with a slight offset to make it look better
		array_push(_trail_points, y);
		array_push(_trail_points, x + hspeed);
	
		var _trail_length = array_length(_trail_points);
	
		// We remove the oldest item in the list once we hit 
		// the maximum trail length
		if(_trail_length > 40)
		{
			array_delete(_trail_points, 0, 2);
		}
	}
	
	// Even if the game is paused, we want to draw the trail
	// First, we find how long the trail is
	var _trail_length = array_length(_trail_points);
	
	// Now for every position in our trail list we
	// draw our trail sprite
	for(var i = 0; i < _trail_length-1; i += 2) {
		var _trail_x = array_get(_trail_points, i);
		
		var _trail_y = array_get(_trail_points, i+1);
		
		// We want the alpha to gradually fade so we base it on the
		// current position in the list
		draw_sprite_ext(spr_ball_final35, 0, _trail_x, _trail_y, 1, 1, 0, c_fuchsia, i/30);
	}
}

draw_self();