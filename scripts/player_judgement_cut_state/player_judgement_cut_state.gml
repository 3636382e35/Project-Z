function player_judgement_cut_state(damage){
		state_set_sprite(charged_attack_bodysword_movement_Sheet_strip3, 0);
		is_drawing = true;

		if on_air vspeed = -0.8 * jump_mod;
		image_speed = 1.5;
		if !can_attack {
			sprite_index = 0;
			state = "move";
		}

		// TODO: fix the sprite. must have 5-10 more strips to get fixed speed
		// show_debug_message("sprite index: " + string(sprite_index)+ " | image index: " + string(image_index))

		if animation_hit_frame(1){
			audio_play_sound(heavy_slash, 1, false);
			with(o_lifeform){
				if point_distance(x, y, o_Player.x, o_Player.y) <= o_Player.jce_range {
					if self.id != o_Player.id {	
						create_hitbox(x-2, y-10, o_Player.id, single_blood, 3, "judgement_cut", 10, damage, image_xscale, image_angle, direction);	
						oCamera.screenshake = 10;	
						oCamera.shakeDuration = 1;
						oCamera._xyshake = true;
						vspeed = -0.8 * jump_mod;
					}
				}	
			}
		}

		if animation_end(){
			state  = "move";
		}
}
