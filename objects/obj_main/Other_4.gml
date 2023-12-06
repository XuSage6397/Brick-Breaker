/// @description Insert description here


if global.last_room == rm_death {
	var _rows = array_length(global.insts);
	var _cols = array_length(global.insts[0]);
	
	for (var _r = _rows-floor(_rows/4);_r < _rows;_r++) {
		for (var _c = 0;_c < _cols;_c++) {
			var _grid_slot = global.insts[_r,_c]
			instance_destroy(_grid_slot);
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
}	
else audio_bus_main.bypass = true;