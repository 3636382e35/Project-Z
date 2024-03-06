function player_lowtime_state(){
		state_set_sprite(s_low_time, 0);
		if animation_hit_frame(1){
			create_hitbox(x,y,self, s_lowtime_effect_hitbox, 3, "lowtime",4, 5, image_xscale, image_angle, direction);
			audio_play_sound(sword_sound_2_36274, 1, false);
		}

		enable_cancel_animation();

		if animation_end(){
			// if input.high_attk_hold && input.hold_s{
			if input.high_attk_hold {
				state = "lowtime_loop";
			} else {
				state = "move";
			}
		}
}