// To draw the heart sprites, we want to draw as many as the player has lives remaining
// And we give all of them after the first an offset so that they appear next to each other
// That offset is based on how wide the sprites are
var _offset = sprite_get_width(spr_life);
for(var _i = 0; _i < lives; _i++) {
	draw_sprite(spr_life, 0, 600 + _offset * _i, 85);
}

// Then we draw the score caption
draw_sprite(spr_Score, 0, 100, 50);

// Now we want to draw the score all in white so for ease of changing that colour, we store it
var _draw_colour = c_white;

// We also want to change the font so we store the old one before we change it
var _font_old = draw_get_font();
draw_set_font(fnt_font);

// Then we draw the score to the screen
draw_text_color(300, 40, string(score), _draw_colour, _draw_colour, _draw_colour, _draw_colour, 1);

// And reset the font
draw_set_font(_font_old);

