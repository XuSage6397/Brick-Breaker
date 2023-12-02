// Stop the ingame music
audio_stop_all();

// Play the button sound
event_inherited();

// Return to the main menu
room_goto(rm_menu);