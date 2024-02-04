




if instance_exists(o_Player){
	if place_meeting(x,y, o_knight) or place_meeting(x,y, o_death_mob){
		create_hitbox(x,y,o_Player._id, sprite_index, 1, "charge_attack", 4, 1, image_xscale, image_angle, direction);
	}








}