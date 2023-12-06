/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_Score, 0, 100, 25);
draw_sprite(spr_Highscore, 0, 100,100);

var _draw_colour = c_white;

// We also want to change the font so we store the old one before we change it
var _font_old = draw_get_font();
draw_set_font(fnt_font);

// Then we draw the score to the screen
draw_text_color(320, 13, string(score), _draw_colour, _draw_colour, _draw_colour, _draw_colour, 1);
draw_text_color(430, 86, _highscore, _draw_colour, _draw_colour, _draw_colour, _draw_colour, 1);

draw_set_font(_font_old);