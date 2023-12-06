/// @description Update death timer clock
// You can write your code in this editor
if _timer > 0 {
	alarm_set(2, game_get_speed(gamespeed_fps))
}
_timer--;