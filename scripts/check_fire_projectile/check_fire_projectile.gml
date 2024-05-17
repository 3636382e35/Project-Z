function check_fire_projectile(_target, _angle, xdir){
	
		if can_fire == true {
			can_fire = false;
			alarm[0] = fire_rate;
			
			if !instance_exists(_target) {
				var _dir = point_direction(x, y, mouse_x, mouse_y);	
			} else {
				var _dir = point_direction(x, y, _target.x, _target.y-15);
			}
			
			var inst = instance_create_layer(x,y-15, "Instances", o_projectile);

			// audio_play_sound(judgement_cut_sfx_cutted, 1, false);
			// audio_play_sound(_10, 1, false);
			
			with(inst){
				speed = other.projectile_speed;
				direction = _dir;
				image_angle = _dir; 
				
			}
		}
}
