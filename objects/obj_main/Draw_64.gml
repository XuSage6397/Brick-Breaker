// To draw the heart sprites, we want to draw as many as the player has lives remaining
// And we give all of them after the first an offset so that they appear next to each other
// That offset is based on how wide the sprites are
//var _offset = sprite_get_width(spr_life);
//for(var _i = 0; _i < lives; _i++) {
//	draw_sprite(spr_life, 0, 600 + _offset * _i, 85);
//}

// Then we draw the score caption
draw_sprite(spr_Score, 0, 100, 25);

// Now we want to draw the score all in white so for ease of changing that colour, we store it
var _draw_colour = c_white;

// We also want to change the font so we store the old one before we change it
var _font_old = draw_get_font();
draw_set_font(fnt_font);

// Then we draw the score to the screen
draw_text_color(300, 13, string(score), _draw_colour, _draw_colour, _draw_colour, _draw_colour, 1);

if room == rm_death {
	draw_set_halign(fa_right)
	draw_text(room_width, 13, "Time left: " + string(_timer))	
	draw_set_halign(fa_left)
}

// And reset the font
draw_set_font(_font_old);

// Draw line to show play where is limit for the bricks
if room == rm_infinity || room == rm_death {
	var _y = global._height * global.max_rows + global._min_y - global._height/2
	var _offset_x = 110
	
	draw_set_color(c_red)
	draw_line(0 + _offset_x,_y,room_width - _offset_x,_y)
}
