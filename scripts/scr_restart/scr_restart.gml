// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_restart(){
	global.speed_increment_threshold = 5000;
	score = 0;
	global.old_score = 0;
	global.death_count = 0;
	global.spawn_rate = 5;
	remove_all_bricks();
}