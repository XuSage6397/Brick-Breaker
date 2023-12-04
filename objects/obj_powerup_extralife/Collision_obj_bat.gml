// This powerup gives the player an extra life
if(lives < 3)
{
	lives += 1;
}
else
{
	var _popup = instance_create_layer(x, y, "Instances", obj_popup);
	_popup.popup = "+1000";
	score += 1000;
}

// Then it plays a sound and destroys itself
event_inherited();