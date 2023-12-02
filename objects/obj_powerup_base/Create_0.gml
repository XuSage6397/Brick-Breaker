// The powerup should move towards the bottom of the screen
vspeed = 4;

// We only want to play the powerup sound if it isn't playing already
if (!audio_is_playing(sfx_powerup_spawn))
{
	audio_play_sound(sfx_powerup_spawn, 0, false);
}