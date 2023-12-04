// We only want the button sound to play if it isn't already
if (!audio_is_playing(sfx_button_click))
{
	audio_play_sound(sfx_button_click, 0, false);
}