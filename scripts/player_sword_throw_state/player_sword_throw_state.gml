// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_sword_throw_state(_target, _angle, xdir){

		enable_cancel_animation();
		vspeed = 0;
		image_speed = 1.5;
		
		if on_air vspeed = -0.1 * jump_mod;
		state_set_sprite(on_ground ? s_sword_throw_on_ground : s_sword_throw_on_air, 0);
		// show_debug_message("sword_throw image index: " + string(ceil(image_index)))

		if (ceil(image_index) == 1 && sprite_index == s_sword_throw_on_ground) or (ceil(image_index) = 1 && sprite_index == s_sword_throw_on_air){
			// audio_play_sound(sword_sound_2_36274, 1, false);
			// create_hitbox(x,y,self, s_atk1_hitbox, 1, "attk1",4, 5, image_xscale, image_angle, direction);
			// check_sword_throw_projectiles(_target, _angle, xdir);
			if !instance_exists(_target) {
				var _dir = point_direction(x, y, mouse_x, mouse_y);	
			} else {
				var _dir = point_direction(x, y, _target.x, _target.y);
			}
			var inst = instance_create_layer(x,y-15, "Instances", o_spinning_sword_throw);
			// audio_play_sound(judgement_cut_sfx_cutted, 1, false);
			with(inst){
				speed = 50;
				direction = _dir;
				//image_angle = _dir; 
			}
		}

		if animation_end() {
			image_speed = 1.5;
			state  = "move";
		}
}
