draw_self();

if instance_exists(o_Player){
	draw_text(x+30, y-30, "- " + string(o_Player.charge_pressed));
}