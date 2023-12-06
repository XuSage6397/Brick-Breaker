global.max_rows = 10;
global.max_cols = 10;
global.insts = [global.max_rows][global.max_cols];
global.rows = 5;
global.cols = 15;
global.total = 0;
global.init_count = 60;

// Min locations for the bricks
//global._min_x = 211;
global._min_x = 200;
//global._min_y = 185;
global._min_y = 148;
// Height and Width of the bricks
global._width = 75;
global._height = 37;

for (var i = 0; i < global.max_rows; i++) {
	for (var j = 0; j < global.max_cols; j++) {
		global.insts[i, j] = noone;
	}
}

// Function to add a brick to the grid on (_r == Row) and (_c == Column)
function create_brick(_r,_c) {
	var _array;
	_array[1] = spr_brick_blue;
	_array[2] = spr_brick_pink;
	_array[3] = spr_brick_green;
	_array[4] = spr_brick_yellow;
	
	global.insts[_r,_c] = instance_create_layer(global._min_x + _c * global._width, global._min_y + _r * global._height, "Bricks", obj_brick_blue);
	global.insts[_r,_c]._row = _r;
	global.insts[_r,_c]._col = _c;	
}

// Function to create solid layers of bricks at the start
function init_bricks(_start_height) {
	// Spawning bricks
	for (var _r = 0;_r < _start_height;_r++) {
		for(var _c = 0;_c < global.max_cols;_c++) {
			create_brick(_r,_c);
		}
	}
}

// Function to move down the bricks
function move_bricks() {
	// Variable to control if move to death level
	var _dead = false;
	
	// Get rows and columns
	var _rows = array_length(global.insts);
	var _cols = array_length(global.insts[0]);
	
	// Check if dead
	for (var _c = 0;_c < _cols;_c++) {
		if instance_exists(global.insts[_rows-1,_c]) {
			_dead = true;
			break;
		}
	}
	
	// Code part
	if !_dead {
		// Shift all rows down by 1,
		for (var _r = _rows-1;_r > 0;_r--) {
			for (var _c = 0; _c < _cols; _c++) {
				global.insts[_r,_c] = global.insts[_r-1,_c];
			}
		}
		
		// Update location of the instances
		for (var _r = 0; _r < _rows; _r++) {
		    for (var _c = 0; _c < _cols; _c++) {
		        if (instance_exists(global.insts[_r, _c])) {
		            // Calculate the new position in room
					var _new_x = global._min_x + _c * global._width;
		            var _new_y = global._min_y + _r * global._height;
					global.insts[_r,_c]._row = _r;
					global.insts[_r,_c]._col = _c;
		            global.insts[_r, _c].x = _new_x;
		            global.insts[_r, _c].y = _new_y;
		        }
		    }
		}
		
		// Add to new bricks at the top row
		for (var _c = 0;_c < _cols;_c++) {
			create_brick(0,_c);
		}
		
	} else {
		// Infinite level -> death level
		if room == rm_infinity {
			room_goto_next()
		} 
		// Death level -> nfinite level
		else if room == rm_death {
			room_goto_previous()
		}
	}
}

function remove_all_bricks() {
	var _rows = array_length(global.insts);
	var _cols = array_length(global.insts[0]);
	
	for (var _r = 0; _r < _rows;_r++) {
		for (var _c = 0;_c < _cols;_c++) {
			instance_destroy(global.insts[_r,_c]);
			global.insts[_r,_c] = noone;
		}
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