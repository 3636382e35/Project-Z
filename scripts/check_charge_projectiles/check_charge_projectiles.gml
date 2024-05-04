function check_charge_projectiles(_target, xscale, selected_charge_out){
		if can_fire == true {
			speed = 0;
			// vspeed = 0;
			// hspeed = 0;

			can_fire = false;
			alarm[0] = fire_rate;

			// if !instance_exists(_target) {
			// 	var _dir = point_direction(x, y, mouse_x, mouse_y);	
			// } else {
			// 	var _dir = point_direction(x, y, _target.x, _target.y);
			// }

			var _dir = !instance_exists(_target) ? point_direction(x, y, mouse_x, mouse_y) : point_direction(x, y, _target.x, _target.y);
			var opposite_dir = !instance_exists(_target) ? point_direction(mouse_x, mouse_y, x, y) : point_direction(_target.x, _target.y, x, y)

			// move_n_collide(opposite_dir, 10);
			
			if selected_charge_out == 1 state = "judgement_cut"; //var inst = instance_create_layer(x, y-23, "projectiles", o_charge_projectile);
			if selected_charge_out == 2 state = "judgement_cut"; //var inst = instance_create_layer(x, y-23, "projectiles", o_charge_projectile2);
			if selected_charge_out == 3 state = "judgement_cut"; //var inst = instance_create_layer(x, y-23, "projectiles", o_charge_projectile3);
				//var inst = instance_create_layer(x, y-5, "projectiles", o_charge_projectile);
			// audio_play_sound(judgement_cut_sfx_cutted, 1, false);
			//motion_add(opposite_dir, 2);

			// with(inst){


			// 	image_speed = 0.7;
			// 	speed = 5;
			// 	direction = _dir;
			// 	image_angle = _dir;
			// 	//owner_id = other;
			// 	//create_hitbox(x,y, self, charged_attack_hitbox_Sheet_strip7, 4, 4, 1, image_xscale, image_angle, direction);
			// }
			
		}
} 
