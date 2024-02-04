// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_sword_throw_projectiles(_target, _angle){
		if can_fire == true {
			can_fire = false;
			alarm[0] = fire_rate;
			
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

}