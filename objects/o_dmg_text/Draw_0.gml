	
	
	var _dir = point_direction(x, y, x, y-100);
	var acce = 0.5;
	motion_add(_dir, acce);
	draw_text(x, y-50, "-"+string(dmg_text));

