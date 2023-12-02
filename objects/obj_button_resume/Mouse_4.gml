// Play the button sound
event_inherited();

// Set the paused status to false
global.paused = false;

// Destroy the menu by destroying the individual components that make it up
if(instance_exists(obj_menu_pause))
{
	instance_destroy(obj_menu_pause);
}

if(instance_exists(obj_button_menupurple))
{
	instance_destroy(obj_button_menupurple);
}

if(instance_exists(obj_button_restart))
{
	instance_destroy(obj_button_restart);
}

// Including this one
instance_destroy();