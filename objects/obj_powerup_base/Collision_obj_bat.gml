// Regardless of the actual powerup, we want it to play a sound
if (!audio_is_playing(sfx_powerup_pickup))
{
	audio_play_sound(sfx_powerup_pickup, 0, false);
}

// And then destroy itself
instance_destroy();