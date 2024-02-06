 var _dist = point_distance(xstart, ystart, x ,y);

with(instance_create_depth(x, y, depth+1, o_eye_trail)){	
	//sprite_index = eye_trail_sprite;
	sprite_index = other.sprite_index;
	image_xscale = other.image_xscale;
	image_blend = c_gray;
	image_alpha = 0.01;
	direction = other.direction;
}


if place_meeting(x, y, o_knight) or place_meeting(x,y, o_death_mob){

	speed = 0;

	if animation_hit_frame(0) or animation_hit_frame(2) {
			create_hitbox(x,y, o_Player._id, sword_throw_spinning_projectile_Sheet_with_outline_strip4, 1, "Spinning Sword", 2, damage, image_xscale, image_angle, direction);
			// summoon_sword_hit = instance_create_layer(x, y, layer+1, o_player_sword_melee_hit);
			// summoon_sword_hit.sprite_index = s_hit_vfx_with_red_outline_Sheet_strip6;
			// summoon_sword_hit.x = other.x;
			// summoon_sword_hit.y = other.y;
			// summoon_sword_hit.image_angle = other.image_angle;
			// summoon_sword_hit.image_index = 0;
			// summoon_sword_hit.depth = other.depth - 1;

	}


	
	


}


