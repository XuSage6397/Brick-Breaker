// The first thing we want to do is randomise the game's seed
randomize();

// Hide the cursor
window_set_cursor(cr_none);

// Set the game state variables to their defaults
score = global.old_score

if !variable_global_exists("last_room") {
	global.last_room = rm_infinity
}
global.paused = false;

// And start the music! Also creating the effect for muffled audio
if (!audio_is_playing(Music_Ingame))
{
	audio_play_sound(Music_Ingame, 0, true);
	var lpf = audio_effect_create(AudioEffectType.LPF2, {cutoff: 300, q:1.5});
	audio_bus_main.effects[0] = lpf;
	audio_bus_main.bypass = true;
}

create_interval = game_get_speed(gamespeed_fps) * 5;

if !variable_global_exists("speed_increment_threshold") {
	global.speed_increment_threshold = 5000;
}

if !variable_global_exists("death_count") {
	 global.death_count = 0
}

_timer = 0

move_interval = game_get_speed(gamespeed_fps) * global.spawn_rate;

create_counter = create_interval;
