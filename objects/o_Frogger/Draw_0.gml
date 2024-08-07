///@desc Draw lives, score, and time
draw_self();

//Draw score at top of screen
draw_set_font(f_Font);
draw_set_color(c_white);
if (!win) {
	draw_set_halign(fa_center); draw_set_valign(fa_middle);
	draw_text(room_width*.5, 8, "Score: "+string(p_score));
}

//Draw lives at bottom left of screen
for (var i=0; i<p_lives; ++i)
	draw_sprite(s_Frogger, 0, 8+(i*16), room_height-8);

//Draw remaining time at bottom right of screen
draw_set_halign(fa_left);
draw_text(room_width-32, room_height-8, string(max(0, time_remaining/SEC)));