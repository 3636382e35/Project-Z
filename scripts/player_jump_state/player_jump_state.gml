// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_jump_state(){
	
    can_jump = false;
		// if input.right { 
		// 	image_xscale = 1;
		// 	move_n_collide(4,0);
		// }
		
		// if input.left {
		// 	image_xscale = -1;
		// 	move_n_collide(-4, 0);
		// }

		// //state = "move";
		sprite_index = s_jump;
		image_index = 0;
		
		apply_gravity("move");
}
