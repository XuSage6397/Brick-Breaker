global.max_rows = 20;
global.max_cols = 21;
global.insts = [global.max_rows][global.max_cols];
global.rows = 5;
global.cols = 15;
global.total = 0;
global.init_count = 60;

for (var i = 0; i < global.max_rows; i++) {
	for (var j = 0; j < global.max_cols; j++) {
		global.insts[i, j] = noone;
	}
}

function createBrick() {

	var delta_hits = 1;
	var min_x = 211;
	var min_y = 185;

	var width = 75;
	var height = 37;

	var brick_sprite;
	brick_sprite[1] = spr_brick_blue;
	brick_sprite[2] = spr_brick_pink;
	brick_sprite[3] = spr_brick_green;
	brick_sprite[4] = spr_brick_yellow;
	var count = 1;
	var rows = global.rows;
	var cols = global.cols;
	if (global.total == 0) {
		count = global.init_count;
	}
	else {
		count = min(3, 1 + round(power((score / 1000), 1/2)));
		rows = min(global.rows + count, global.max_rows);
		cols = min(global.cols + count, global.max_cols);
	}
	if (global.total / (rows * cols) > 1.5) {
		count = count / 2;
	}
	var min_row = round((global.max_rows - rows) / 2);
	if (rows < 8) {
		min_row = max(min_row - 3, 0);
	}
	var min_col = round((global.max_cols - cols) / 2);
	for (i = 0; i < count; i ++) {
		var row = round(random(rows) + 0.5) - 1 + min_row;
		var col = round(random(cols) + 0.5) - 1 + min_col;
		global.total ++;
		if (global.insts[row, col] != noone) {
			if (global.insts[row, col]._hitpoints > 3) {
				i --;
				continue;
			}
			else {
				global.insts[row, col]._hitpoints ++;
				global.insts[row, col].image_index ++;
				global.insts[row, col].sprite_index = brick_sprite[global.insts[row, col]._hitpoints];
			}
		}
		else {
			global.insts[row, col] = instance_create_layer(min_x + col * width, min_y + row * height, "Instances", obj_brick_blue);
			global.insts[row, col]._row = row;
			global.insts[row, col]._col = col;
		}
	
	}
}