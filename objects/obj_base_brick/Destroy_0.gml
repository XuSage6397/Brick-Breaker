// Regardless of the type of block, if it is destroyed, it should play the break sound
if (!audio_is_playing(sfx_brick_break))
{
	audio_play_sound(sfx_brick_break, 0, false);
}

global.insts[_row][_col] = noone;