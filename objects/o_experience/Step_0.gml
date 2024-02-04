if !instance_exists(o_Player) exit;



//var _dir = point_distance(x,y, o_Player.x, o_Player.y) <= ;
if !direction_lock exp_gravity(grv);

var _dir = point_direction(x, y, o_Player.x, o_Player.y-23);
var acce = 0.75;

var max_speed = 6;
if speed > max_speed {
	speed = max_speed;
}


if !direction_lock && point_distance(x,y, o_Player.x, o_Player.y) <= 200 {
	direction_lock = true;	
}


if direction_lock motion_add(_dir, acce);

// with(instance_create_depth(x, y, depth+1, o_eye_trail)){	
// 	//sprite_index = eye_trail_sprite;
// 	x = other.x;
// 	y = other.y;
// 	image_alpha = 0.3;
// 	sprite_index = other.sprite_index;
// 	image_xscale = other.image_xscale;
// 	image_blend = c_gray;
// 	//image_angle = point_direction(x, y, other.x-25 * other.image_xscale, other.y-25 * other.image_xscale);
// 	//image_alpha = 1;
// }



