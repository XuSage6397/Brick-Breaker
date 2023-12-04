// Save the player's current score
global.old_score = score;

// Hide the cursor
window_set_cursor(cr_none);

// Play the button sound
event_inherited();

// Move to the next room
room_goto_next();