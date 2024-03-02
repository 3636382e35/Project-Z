draw_self();
draw_set_color(c_white);

if instance_exists(o_Player){
	if o_Player.DEBUG_MODE {
		if instance_exists(self){
			if point_distance(x,y, o_Player.x, o_Player.y) < 250 {
				draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true);
			} else {
				draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_green,c_green,c_green,c_green,true);
			}
			draw_text(x, y-40,string(id));
			draw_text(x, y-80, string(state));
			draw_text(x, y-100, "X= "+ string(x)+ " Y= " + string(y));
		}
	}

	if o_Player.HP_ENABLED {
		var x_offset;
		var temp_offset = 50;

		if temp_offset * image_xscale < 0 {
			x_offset = temp_offset * image_xscale;
		} else {
			x_offset = temp_offset+100 * image_xscale;
		}

		//var x_offset = 50 * image_xscale;
		var entity_line_offset = 25 * image_xscale;
		var height = sprite_height;

		var _hp_width = 100;
		var hp_width = max_hp;

		draw_hp = lerp(draw_hp, hp, 1);
		draw_max_hp = max_hp;
		var hp_percent = draw_hp / draw_max_hp;

		draw_red_hp = lerp(draw_red_hp, hp, 0.05);
		draw_red_max_hp = draw_max_hp;
		var red_hp_percent = draw_red_hp / draw_red_max_hp;

		if entity_line_offset < 0 {
			draw_line_width_colour(x-(x_offset-entity_line_offset), y-23 , x-x_offset, y-(height-2), 1, c_black, c_black);
		} else {
			draw_line_width_colour(x-(entity_line_offset), y-23 , (x-x_offset)+100, y-(height-2), 1, c_black, c_black);
		}

		draw_rectangle_color(x-x_offset, y-height, x-x_offset + (_hp_width * red_hp_percent), y-(height-2), c_red, c_red, c_red, c_red, false);
		draw_rectangle_color(x-x_offset,  y-height, (x-x_offset) + _hp_width, y-(height-2), c_black, c_black, c_black, c_black, true);
		draw_rectangle_color(x-x_offset, y-height, x-x_offset + (_hp_width * hp_percent), y-(height-2), c_white, c_white, c_white, c_white, false);
		draw_text(x-x_offset, y-(height-2),string(hp));
	}
}