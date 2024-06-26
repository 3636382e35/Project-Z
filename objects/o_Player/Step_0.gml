activate_global_inputs();

on_ground = place_meeting(x, y + 1, obj_wall);
on_air = !on_ground && !place_meeting(x, y - 1, obj_wall);
if on_ground can_jump = true;
dash_counter += 0.02;
combo_counter -= 0.01;
if dash_counter >= 3 {dash_counter = 3;}
if dash_counter <= 0 {dash_counter = 0;}

if combo_counter <= 0 { combo_counter = 0;}
if combo_counter >= 360 { combo_counter = 360;}


// with(instance_create_depth(x+4, y-30, depth+1, o_eye_trail)){	
// 	sprite_index = eye_trail_sprite;
// 	x = other.x;
// 	y = other.y;
// 	image_alpha = 0.1;
// 	sprite_index = other.sprite_index;
// 	image_xscale = other.image_xscale;
// 	image_blend = c_white;
// 	//image_angle = point_direction(x, y, other.x-25 * other.image_xscale, other.y-25 * other.image_xscale);
// 	//image_alpha = 1;
// }

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

	case "lowtime_loop":
		player_lowtime_loop_state()
	break;

	default:
		show_debug_message("State "+state+" does not exist" );
		state = "move";
		break;
}
