// Reset the old score variable so it doesn't affect the new score
global.old_score = 0;

// Stop the menu music
audio_stop_all();
room_set_persistent(rm_infinity, false);

// Play the button sound
event_inherited();

// And then move to the first level
// room_goto(rm_level_1);
room_goto(rm_infinity);