// In order to draw the message with its centre at the same x and y as the object's location
// we have to set its alignments.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// We also want to change the font to something more fitting. But we don't want to just get
// rid of the old font so we temporarily store it and set the font to our new font
var _font_old = draw_get_font();
draw_set_font(fnt_font);

// To change the colour of the text, we can specify what colour it should be at each corner
// and create a gradient, but here we just want it to be fully white and at full opacity
var _draw_colour = c_white;

draw_text_colour(x, y, popup, _draw_colour, _draw_colour, _draw_colour, _draw_colour, 1);

// Now restore the old font and reset the alignments to their defaults
draw_set_font(_font_old);

draw_set_halign(fa_left);
draw_set_valign(fa_top);