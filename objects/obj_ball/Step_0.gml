// If the ball is locked to the bat, we want it to follow the bat's position
if(_locked_to_bat)
{
	x = obj_bat.x;
	y = obj_bat.y - 28;

	// If the player has pressed the left mouse button then they want to start the game so start the ball moving
	if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space))
	{
		direction = choose(135,90,45);
	
		speed = _move_speed;
	
		_locked_to_bat = false;
	}
}
// When the game is paused but the ball is currently moving, we want the ball to stop moving
else
{
	if(global.paused)
	{
		speed = 0;
	}

	else
	{
		speed = _move_speed;
		
		// We could destroy the ball if it intersects with the room's boundaries or leaves the room
		// but we want it to draw its trail while it leaves the room so we only destroy it when it's
		// far enough outside the room. We can check like this because the ball can only be moving downwards
		// at this point because of the boundary objects
		if(y > room_height + 400)
		{
			instance_destroy();
		}
	}
}