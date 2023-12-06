// Reset the old score variable so it doesn't affect the new score
global.old_score = 0;
global.death_count = 0

// Stop the menu music
audio_stop_all();

// Play the button sound
event_inherited();

// And then move to the first level
// room_goto(rm_level_1);
scr_restart();
room_goto(rm_infinity);