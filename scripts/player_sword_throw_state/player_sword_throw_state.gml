// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_sword_throw_state(_target, _angle, xdir){

		enable_cancel_animation();


		vspeed = 0;
		image_speed = 1;



		
		if on_air {
			vspeed = -0.1 * jump_mod;
			sprite_index = s_sword_throw_on_air;
		} else {
			sprite_index = s_sword_throw_on_ground;
		}



		// state_set_sprite(on_ground ? s_sword_throw_on_ground : s_sword_throw_on_air, 0);

		if (ceil(image_index) == 1 && sprite_index == s_sword_throw_on_ground) or (ceil(image_index) = 1 && sprite_index == s_sword_throw_on_air){
			// audio_play_sound(sword_sound_2_36274, 1, false);
			// create_hitbox(x,y,self, s_atk1_hitbox, 1, "attk1",4, 5, image_xscale, image_angle, direction);
			check_sword_throw_projectiles(_target, _angle, xdir);

		}

	
		if animation_end() {
			image_speed = 1.5;
			state  = "move";
				
		}
}