function player_lowtime_loop_state(){
	//enable_cancel_animation();
	sprite_index = s_player_lowtime_loop ;
	image_speed = 1;

	var knockback = 1; //3
	var damage = 1.5
	var lifespan = 4; 

	if input.high_attk_hold && input.hold_s {
		apply_gravity("lowtime_loop")
		enable_cancel_animation();
		if animation_hit_frame(4) or animation_hit_frame(6){
			create_hitbox(x,y,self,sprite_index,knockback,"hightime_loop",lifespan,damage,image_xscale, image_angle, direction);
			audio_play_sound(mixkit_dagger_woosh_1487, 1, false);
		}

		loopAnimation(o_Player, 4, 6);

		if on_ground state = "move" 

		if input.jump {
			state = "jump";
		}

	} else {
		state = "move";
		image_speed = 1.5;
	}
}
