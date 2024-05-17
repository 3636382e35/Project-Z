

var camera_id = view_camera[0];
var view_width = camera_get_view_width(camera_id);
var view_height = camera_get_view_height(camera_id);
display_set_gui_size(view_width, view_height);


if not instance_exists(o_Player) exit;
draw_hp = 0;
draw_max_hp = o_Player.hp;

draw_dash_counter = 0;
draw_max_dash_counter = o_Player.dash_counter;

draw_combo_counter = 0;
// draw_max_combo_counter = o_Player.combo_counter;
draw_max_combo_counter = o_Player.combo_counter;

draw_consec_kills_timer = o_Player.timer;
draw_consec_kills_max_timer = o_Player.timer_max;

draw_set_font(f_one);
