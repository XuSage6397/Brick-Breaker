var _cols = array_length(global.insts[0])

for (var _c = 0;_c < _cols;_c++) {
	if (instance_exists(global.insts[0,_c])) {
		global.insts[0,_c].sprite_index = spr_brick_phoenix
	}
}


highscore_load()