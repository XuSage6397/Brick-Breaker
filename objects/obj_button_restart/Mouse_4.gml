// Play the button sound
event_inherited();

// And restart the room

score = 0;
global.old_score = 0;
remove_all_bricks();

room_goto(rm_infinity)