
///@arg a
function move_n_collide_y(a){
	if not place_meeting(x, y-a, obj_wall){
		y -= a;
	}

}