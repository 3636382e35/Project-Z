// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_attack_2_state(target){
		if !audio_is_playing(mixkit_dagger_woosh_1487) audio_play_sound(mixkit_dagger_woosh_1487, 1, false);
		state_set_sprite(s_atk2, 0);
		if animation_hit_frame(0) create_hitbox(x,y,self, s_atk2_hitbox, 3, "attk2",4, 5, image_xscale, image_angle, direction);


		if on_ground {
			if input.attk or input.attk2{
				state = "attk3";
			}

		}

		//input_delay = 0
		if animation_end() state  = "move";
}