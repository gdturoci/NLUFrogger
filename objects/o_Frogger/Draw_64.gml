///@desc Game Over
draw_set_font(f_GOFont);
draw_set_color(c_white);
draw_set_halign(fa_center); draw_set_valign(fa_middle);
if (g_o) {
	draw_text(view_wport[0]*.5, view_hport[0]*.3, "GAME OVER!");
	draw_text(view_wport[0]*.5, view_hport[0]*.4, "Press [ENTER] to restart");
} else if (win) {
	draw_text(view_wport[0]*.5, view_hport[0]*.3, "YOU WIN!\n"+
	"Score:\n"+
	"Lanes: 13x100 = 1300\n"+
	"+ Time: "+string(time_remaining/SEC)+ "x60 = " + string(time_remaining)+"\n"+
	"+ Lives: "+string(p_lives)+"x250 = "+string(p_lives*250)+"\n"+
	"- Moves: "+string(moves)+"x25 = "+string(moves*25)+"\n"+
	"= FINAL: "+string(p_score));
	draw_text(view_wport[0]*.5, view_hport[0]*.6, "Press [ENTER] to restart");
}