// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_charge_state(target, selected_charge_out){
		state_set_sprite(charged_attack_bodysword_movement_Sheet_strip3, 0);
		if lock_mode {
				if (obj_target > x) image_xscale = 1 else image_xscale = -1;
			} else {
				image_xscale = 1;
			}

		enable_cancel_animation();
		if animation_hit_frame(0){
			check_charge_projectiles(target, image_xscale, selected_charge_out);
		}

		if animation_end(){
			state = "move";
		}

}