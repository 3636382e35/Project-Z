
var _dist = point_distance(xstart, ystart, x ,y);
with(instance_create_depth(x, y, depth+1, o_eye_trail)){	
	//sprite_index = eye_trail_sprite;
	sprite_index = other.sprite_index;
	image_xscale = other.image_xscale;
	image_blend = c_purple;
	image_alpha = 0.01;
	direction = other.direction;
	image_angle = other.image_angle;
}

if _dist > range {	
	//instance_destroy();
	projectile_die();
}

if place_meeting(x, y, o_knight) or place_meeting(x,y, o_death_mob){
	create_hitbox(x,y, o_Player.id, projectile_mockup2, 1, "SummonSwords",2, 2, image_xscale, image_angle, direction);
	summoon_sword_hit = instance_create_layer(x, y, layer+1, o_player_sword_melee_hit);
	summoon_sword_hit.sprite_index = s_hit_vfx_with_red_outline_Sheet_strip6;
	summoon_sword_hit.image_speed = o_Player.SLOW_MODE ? 0.1 : 1;	 
	summoon_sword_hit.x = other.x;
	summoon_sword_hit.y = other.y;
	summoon_sword_hit.image_angle = other.image_angle;
	summoon_sword_hit.image_index = 0;
	summoon_sword_hit.depth = other.depth - 1;
	projectile_die();
}

