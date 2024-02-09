
var distance_to_player = point_distance(x,y, o_Player.x, o_Player.y);
var direction_facing = image_xscale;

within_jce_range = distance_to_player <= o_player.jce_range;



if instance_exists(o_Player){
	if o_Player.is_drawing { // Check for the "L" key, change it to your desired key
	    is_drawing = true;
	} else {
	    is_drawing = false;
	}
}

// if keyboard_check_released(ord("Q")){
// 	hp = 0;
// }





switch(state){
	

	case "idle":
	#region
		state_set_sprite(s_knight_idle_strip3, 0.1);
		apply_gravity("idle");
		if distance_to_player < 250 state = "chase";
		if distance_to_player <= 50 and on_ground state = "attack";


	#endregion	
	break;
	
	case "chase":
	#region
	

		apply_gravity("chase");	
		state_set_sprite(s_knight_walk_strip4, 0.1);
		if not instance_exists(o_Player){
			break;
		};
		image_xscale = sign(o_Player.x - x);
		if image_xscale == 0 {
			image_xscale = 1;
		}
		
	
		distance_to_player = point_distance(x,y, o_Player.x, o_Player.y);
		direction_facing = image_xscale;
		
		if x == o_Player.x
			image_xscale = -1;
		if distance_to_player > 250 state = "idle";
		if distance_to_player <= attack_range and on_ground state = "attack";
		if on_air {
			//do nothing
		} else {
			move_n_collide(direction_facing * chase_speed, 0);
            if (x == o_Player.x && y != o_Player.y) {
                // Use the previous_image_xscale here for comparison
                if (direction_facing == 1) {
                    image_xscale = 1; // Maintain the current direction
                } else {
                    image_xscale = -1; // Reverse direction if not facing right
                }
            }
		}

		//previous_image_xscale = image_xscale;
		
	#endregion
	break;
	
	case "attack":
	#region Attack
		
		state_set_sprite(s_knight_attack_strip12, 0.1);
		if animation_hit_frame(4){
			create_hitbox(x, y, self, s_knight_attack_strip_frame4, 4, "knight_attack", 4,10	, image_xscale, image_angle, direction);
		}
		if animation_end() state = "idle";
	
	#endregion
	break;
	
	
	case "knockback":
	#region Knockback	
		knockback_state(s_knight_hitstun, "idle");	
	#endregion
	break;
	

	
	
	default:
		show_debug_message("State "+state+" does not exist");
		state = "chase";
	break;
	





}


//CODE BELOW IS AN EXPERIMENTATION FOR REFACTORING


// stateFree = function(){
			
// 		state_set_sprite(s_knight_walk_strip4, 0.1);
// 		if not instance_exists(o_Player){
// 			exit;
// 		};
		
// 		image_xscale = sign(o_Player.x - x);
// 		if image_xscale == 0 {
// 			image_xscale = 1;
// 		}
		
	
// 		var direction_facing = image_xscale;
// 		var distance_to_player = point_distance(x,y, o_Player.x, o_Player.y);
		
		
// 		if (distance_to_player <= attack_range and on_ground) state = stateAttack;
// 		if on_air {
// 			//do nothing
// 		} else {
// 			move_n_collide(direction_facing * chase_speed, 0);
//             if (x == o_Player.x && y != o_Player.y) {
//                 // Use the previous_image_xscale here for comparison
//                 if (direction_facing == 1) {
//                     image_xscale = 1; // Maintain the current direction
//                 } else {
//                     image_xscale = -1; // Reverse direction if not facing right
//                 }
//             }
// 		}

// 		apply_gravity(stateFree);


	
// }





// stateAttack = function(){

// 		state_set_sprite(s_knight_attack_strip12, 0.1);
// 		if animation_hit_frame(4){
// 			create_hitbox(x, y, self, s_knight_attack_strip_frame4, 4,4,10	, image_xscale, image_angle, direction);
// 		}
// 		if animation_end() state = stateFree;
// }

// stateKnockback = function(){

// if o_Player.state == stateHightimeAttack {
// 			vspeed = 0;
// 			vspeed = jump + 2;
			
// 		}
// 		if o_Player.state == stateLowtimeAttack {
// 			vspeed = 0;
// 			vspeed = -0.6 * jump_mod;
// 			move_n_collide_y(jump);
// 		}	
// 		//add summonswords
// 		if (o_Player.state == stateAttack or o_Player.state == stateAttack2 or o_Player.state == stateDash) and on_air {
// 			vspeed = 0;
// 			vspeed = -0.6 * jump_mod;
// 		}
		
		
		
// 		knockback_state(s_knight_hitstun, stateFree);	

// }


// state = stateFree;
// state();