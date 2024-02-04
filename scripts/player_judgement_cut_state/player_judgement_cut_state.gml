// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_judgement_cut_state(damage){

		//var damage = 10;
		is_drawing = true;
		alarm[1] = 20;

		if on_air vspeed = -0.8 * jump_mod;


		image_speed = 1.5;
		if !can_attack {
			sprite_index = 0;
			state = "move";
			
		}
		
		//if !audio_is_playing(sword_sound_2_36274) audio_play_sound(sword_sound_2_36274, 1, false);
		state_set_sprite(charged_attack_bodysword_movement_Sheet_strip3, 0);
		if animation_hit_frame(1){

			audio_play_sound(heavy_slash, 1, false);

			with(o_lifeform){
				//if point_distance(x,y, o_Player.x, o_Player.y) < 500 //   <------ TODO: FIX THIS SHIT - REFACTOR THE CODE - THE HITBOX MUST DEPEND ON THE MAIN CAMERA
				create_hitbox(x-2, y-10, o_Player._id, single_blood, 3, "judgement_cut", 10, damage, image_xscale, image_angle, direction);
					
			}
		}
		
		if animation_end() state  = "move";
}