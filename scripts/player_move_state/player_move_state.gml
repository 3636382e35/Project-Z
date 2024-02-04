// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_move_state(target){
//code




		// if input.lock_mode {

		// 	lock_mode = !lock_mode;
		// 	target = instance_nearest(x, y, o_knight);
			
		// }




		//with(o_knight) if distance_to_object(o_Player)<400 {visible=true} else {visible=false}
		
		apply_gravity("move");
		get_input_states(obj_target, image_angle, direction); //inputs
	
}