// We don't want the random directions to be too close to horizontal
// But we do want it to be completely random, so we create two ranges
var _random_direction_1 = (random_range(45, 135));
var _random_direction_2 = (random_range(225, 315));

// And randomly choose between them
var _random_direction = choose(_random_direction_1, _random_direction_2);

direction = _random_direction;
speed = _move_speed;

// We want the ball to not start locked to the bat if it was created with the multiball powerup
_locked_to_bat = false;

// But if this is the only ball, it's either the beginning of the game or a life has been lost
// so lock this one to the bat
var _count = instance_number(obj_ball);

if(_count == 1)
{
	speed = 0;
	
	_locked_to_bat = true;
	
	// When the player loses a life, obj_main spawns a new ball but it doesn't run its step event so it
	// isn't moved to the bat and there is a frame where it isn't locked on. This fixes that.
	if(instance_exists(obj_bat))
	{
		x = obj_bat.x;
		y = obj_bat.y - 28;
	}
}