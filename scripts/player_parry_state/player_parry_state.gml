// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_parry_state(){

		state_set_sprite(s_parry, 0);
		image_speed = 1;
		apply_gravity("parry");

		//if !audio_is_playing(sword_sound_2_36274) audio_play_sound(sword_sound_2_36274, 1, false);
		
		if keyboard_check(ord("H")){

			//create_hitbox_parry(x, y, self, s_parry, "parry", 1,image_xscale, image_angle, direction);
			//loopAnimation(o_Player, 2, 3);
			if ceil(image_index) > 4 image_speed = 0;


		} else {
			state = "move";
		}
}