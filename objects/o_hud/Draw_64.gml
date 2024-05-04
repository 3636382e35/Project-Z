if not instance_exists(o_Player) exit;

var hp_x = 8;
var hp_y = 340;

var hp_width = 198;
var hp_height = 6;
if instance_exists(o_Player){
	draw_hp = lerp(draw_hp, o_Player.hp, 0.1);
	draw_max_hp = o_Player.max_hp;
} else {
	draw_hp = lerp(draw_hp, 0, 0.2);
	hp_percent = draw_hp;
}

var hp_percent = draw_hp / draw_max_hp;

draw_rectangle_color(hp_x, hp_y, hp_x + (hp_width * hp_percent), hp_y + hp_height,c_white, c_white, c_white, c_white, false);
draw_rectangle_color(hp_x, hp_y, hp_x + hp_width, hp_y + hp_height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, true);

var dash_counter_x = 8;
var dash_counter_y = 350;
var dash_counter_width = 150;
var dash_counter_height = 2;

if instance_exists(o_Player){
  draw_dash_counter = lerp(draw_dash_counter, o_Player.dash_counter, 0.1); 
  draw_max_dash_counter = o_Player.max_dash_counter;
} else {
  draw_dash_counter = lerp(draw_dash_counter, 0, 0.2);
  dash_counter_percent = draw_dash_counter;
}

var dash_counter_percent = draw_dash_counter / draw_max_dash_counter;

  draw_rectangle_color(dash_counter_x, dash_counter_y, dash_counter_x + (dash_counter_width * dash_counter_percent), dash_counter_y + dash_counter_height,c_white, c_white, c_white, c_white, false);
draw_rectangle_color(dash_counter_x, dash_counter_y, dash_counter_x + dash_counter_width, dash_counter_y + dash_counter_height, c_dkgray, c_dkgray, c_dkgray, c_dkgray, true);

draw_text(hp_x+200, hp_y-3, string(o_Player.hp));
draw_text(dash_counter_x+158, dash_counter_y-3, string(o_Player.dash_counter));

// if o_Player.DEBUG_MODE {
	var text = "Kills: " + string(o_Player.kills);
	var text_width = string_width(text);
	var text_height = string_height(text);
	var start_x = 8;
	var start_y = 16;
	var padding_x = 4;
	var padding_y = 6;
	draw_rectangle_color(start_x, start_y, start_x + text_width+padding_x, start_y + text_height + padding_y, c_dkgray,c_dkgray,c_dkgray,c_dkgray, false);
	draw_text(start_x+padding_x, start_y+padding_y, text);

	var text = "Level: " + string(o_Player.level);
	start_x += text_width + padding_x * 3;
	var text_width = string_width(text);
	var text_height = string_height(text);
	draw_rectangle_color(start_x, start_y, start_x + text_width+padding_x, start_y + text_height + padding_y, c_dkgray,c_dkgray,c_dkgray,c_dkgray, false);
	draw_text(start_x+padding_x, start_y+padding_y, text);
// }

draw_set_color(c_white);
if o_Player.DEBUG_MODE {
	_text = o_Player._input;
	var  offset = x - 250;
	draw_text(offset, y-60, "INPUT = " +_text);
	draw_text(offset, y-40, "o_Player_pos = "+string(o_Player.x)+" , " + string(o_Player.y));
	draw_text(offset, y-20, "STATE = "+ string(o_Player.state));
	draw_text(offset, y, "onair: " + string(o_Player.on_air) + " onground: "+ string(o_Player.on_ground));
	draw_text(offset, y +20, "Current Instances created: " + string(instance_count));
	draw_text(offset, y +40, "Lock Mode: " + string(o_Player.lock_mode)+" Curr Target: "+o_Player.target_name);
	draw_text(offset, y +60, string(o_Player.experience)+" / "+string(o_Player.max_exp));
	draw_text(offset, y +100, "WINDOW WIDTH: "+string(window_get_width())+" | WINDOW HEIGHT: "+string(window_get_height()));
	draw_text(offset, y +120, "DISPLAY_GET_HEIGHT: "+string(display_get_height())+"| DISPLAY_GET_WIDTH: "+string(display_get_width()));
	draw_text(offset, y +140, "VIEW_HVIEW[0]: "+string(view_hview[0])+"| VIEW_WVIEW[0]: "+string(view_wview[0]));
	draw_text(offset, y +160, "VIEW_HPORT[0]: "+string(view_hport[0])+"| VIEW_WPORT[0]: "+string(view_wport[0]));
	draw_text(offset, y +180, "camera_get_view_width: "+string(camera_get_view_width(view_camera[0]))+"| camera_get_view_height: "+string(camera_get_view_height(view_camera[0])));
	draw_text(offset, y +200, "CAMERA_ZOOM_LEVEL: "+string(o_Player.ZOOM_LEVEL));
}
