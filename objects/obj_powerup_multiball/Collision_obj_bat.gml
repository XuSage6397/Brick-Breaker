// This powerup creates a new ball at every current ball's location
// This makes it look like they've split into two
with(obj_ball)
{
	if (instance_number(obj_ball) < 4) {
		instance_create_layer(x , y, "Instances", obj_ball);
	}
}

// Then it plays a sound and destroys itself
event_inherited();