// Just like how mouse movement still doesn't let the bat move beyond the boundaries, the arrows
// shouldn't either, so for ease of use, we calculate the boundary point once
var _bound = 120 + (sprite_width/2);

// Now we can move the bat while keeping it within the boundaries
x = clamp(x - 10, _bound, room_width - _bound);

// If the mouse is within the play area, we also move it so that when the player moves their mouse
// again, the bat doesn't suddenly jump to its position
if(_bound < mouse_x && mouse_x < room_width - _bound && _bound < mouse_y && mouse_y < room_height)
{
	display_mouse_set(x, display_mouse_get_y());
}

// And then we set the mouse's tracked position to the position we moved it to so that we don't get
// any false flags that the mouse has been moved
_prev_mouse_x = mouse_x;