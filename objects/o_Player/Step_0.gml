activate_global_inputs();
//show_debug_message("y: " + string(y) + " | vspeed: " + string(vspeed) + " | grv: " + string(grv));
	
on_ground = place_meeting(x, y + 1, obj_wall);
on_air = !on_ground && !place_meeting(x, y - 1, obj_wall);
//show_debug_message("image_speed: " + string(image_speed))

		with(instance_create_depth(x+4, y-30, depth+1, o_eye_trail)){	
			//sprite_index = eye_trail_sprite;
			x = other.x;
			y = other.y;
			image_alpha = 0.1;
			sprite_index = other.sprite_index;
			image_xscale = other.image_xscale;
			image_blend = c_ltgray;
			//image_angle = point_direction(x, y, other.x-25 * other.image_xscale, other.y-25 * other.image_xscale);
			//image_alpha = 1;
		}



//TODO: add parry state

switch(state){
	case "move":
		player_move_state(target);
	break;

	case "parry":
		player_parry_state();
	break;

	case "charge1":
		player_charge_state(target, selected_charge_out);
	break;

	case "judgement_cut":
		player_judgement_cut_state(jce_dmg);
	break

	case "sword_throw":
		player_sword_throw_state(target, image_angle, direction);
	break;

	case "dash":
		player_dash_state(target);
	break;

	case "attk1":
		player_attack_1_state(target);
	break;
	
	case "attk2":
		 player_attack_2_state(target);
	break;

	case "attk3":
		player_attack_3_state(target);
	break;
	
	case "hightime":
		player_hightime_state();
	break;
	
	case "lowtime":
		player_lowtime_state();
	break;
	
	case "jump":
		player_jump_state();
	break;
	
	case "knockback":
		player_knockback_state();
	break;

	case "hightime_loop":
		player_hightime_loop_state();
	break;
	
	default:
		show_debug_message("State "+state+" does not exist" );
		state = "move";
		break;
		
}


//THE CODE BELOW ARE EXPERIMENTATION AND REFACTORING


// state();
// get_input_states(image_angle, direction);












