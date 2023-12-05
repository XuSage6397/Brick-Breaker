// The first thing we want to do is randomise the game's seed
randomize();

// Hide the cursor
window_set_cursor(cr_none);

// Set the game state variables to their defaults
score = global.old_score

lives = 1;

global.last_room = noone

global.paused = false;

// And start the music!
if (!audio_is_playing(Music_Ingame))
{
	audio_play_sound(Music_Ingame, 0, true);
}

create_interval = game_get_speed(gamespeed_fps) * 5;

move_interval = game_get_speed(gamespeed_fps) * 5;

create_counter = create_interval;
