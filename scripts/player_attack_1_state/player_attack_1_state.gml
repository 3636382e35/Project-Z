// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_attack_1_state(target){
		image_speed = 1.5;
		if !can_attack {
			sprite_index = 0;
			state = "move";
			
		}
		//if !audio_is_playing(sword_sound_2_36274) audio_play_sound(sword_sound_2_36274, 1, false);
		state_set_sprite(s_atk1, 0);
		if animation_hit_frame(0){
			audio_play_sound(sword_sound_2_36274, 1, false);
			create_hitbox(x,y,self, s_atk1_hitbox, 1, "attk1",4, 5, image_xscale, image_angle, direction);
		}


		if input.attk or input.attk2{
			state = "attk2";
		}
		
		if animation_end() state  = "move";
}