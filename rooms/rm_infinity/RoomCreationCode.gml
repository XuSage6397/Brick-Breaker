if instance_number(obj_base_brick) <= 0 {
	init_bricks(5);
}

var _cols = array_length(global.insts[0])

for (var _c = 0;_c < _cols;_c++) {
	if (instance_exists(global.insts[0,_c])) {
		global.insts[0,_c].sprite_index = spr_brick_blue
	}
}


highscore_load()