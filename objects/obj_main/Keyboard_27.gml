// We don't want to be able to pause while menus are open or if we're already paused
if(instance_exists(obj_menu_win) || instance_exists(obj_menu_lose) || global.paused)
{
	exit;
}

// Pause the game
global.paused = true;

// Create the sequence to play the animation
layer_sequence_create("Sequences", room_width / 2, room_height / 2, seq_menu_paused);