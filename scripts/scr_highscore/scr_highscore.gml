// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function highscore_load(){
	var _file = working_directory + "highscore";
	
	try {
		var _handle = file_text_open_read(_file);
		
		global.highscore = file_text_read_real(_handle);
		
		file_text_close(_handle);
	} catch (_error) {
		global.highscore = 0;
	}
}

function highscore_save() {
	var _file = working_directory + "highscore";
	
	var _handle = file_text_open_write(_file);
	
	file_text_write_real(_handle, global.highscore);
	
	file_text_close(_handle);
}