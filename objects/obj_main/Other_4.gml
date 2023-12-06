/// @description Insert description here
if global.last_room == rm_death {
	
	var _rows = array_length(global.insts);
	var _cols = array_length(global.insts[0]);
	var _rows_removed = global.remove_rows;
	
	show_debug_message("Delete rows!")
	
	for (var _r = _rows-1;_r > _rows-1-_rows_removed;_r--) {
		show_debug_message("Row: " + string(_r))
		for (var _c = 0;_c < _cols;_c++) {
			if instance_exists(global.insts[_r,_c]) {
				instance_destroy(global.insts[_r,_c])
			}
		}
	}
}

if room == rm_infinity {
	alarm[0] = move_interval;
	audio_bus_main.bypass = true;	
}
else if room == rm_death {
	//added muffled audio
	audio_bus_main.bypass = false;
	
	// Set death timer
	global.death_timer = 70 - (10 * global.death_count)
	if global.death_timer <= 10 {
		global.death_timer = 10
	}
	alarm[1] = global.death_timer * game_get_speed(gamespeed_fps)
	_timer = global.death_timer
	alarm[2] = game_get_speed(gamespeed_fps)
}	
else audio_bus_main.bypass = true;