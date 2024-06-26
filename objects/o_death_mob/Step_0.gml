// image_speed = o_Player.SLOW_MODE ? 0.1 : 1.0;
event_inherited()
var distance_to_player = point_distance(x,y, o_Player.x, o_Player.y);

within_jce_range = distance_to_player <= o_Player.jce_range;
var direction_facing = image_xscale;

if instance_exists(o_Player){
	if o_Player.is_drawing { // Check for the "L" key, change it to your desired key
	    is_drawing = true;
	} else {
	    is_drawing = false;
	}
}

with(instance_create_depth(x, y, depth+1, o_eye_trail)){	
	sprite_index = other.sprite_index;
	image_xscale = other.image_xscale;
	image_blend = c_black;
	image_alpha = 0.1;
}

switch(state){

	case "idle":
	#region
		state_set_sprite(s_death_mob_idle_final_Sheet_strip4, 0.1);
		apply_gravity("idle");
		if distance_to_player < 500 state = "chase";
		if distance_to_player <= attack_range and on_ground state = "attack";

	#endregion	
	break;
	
	case "chase":
	#region
		apply_gravity("chase");			
		state_set_sprite(s_death_mob_idle_final_Sheet_strip4, 0.1);
		if not instance_exists(o_Player){
			break;
		};
		image_xscale = sign(o_Player.x - x);
		if image_xscale == 0 {
			image_xscale = 1;
		}
	
		distance_to_player = point_distance(x,y, o_Player.x, o_Player.y);
		direction_facing = image_xscale;
		
		if distance_to_player > 250 state = "idle";
		if distance_to_player <= attack_range and on_ground state = "attack";
		if !on_air {
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
		
	#endregion
	break;

	case "attack":
	#region Attack
		
		if can_attack {
			state_set_sprite(s_death_mob_attack1_Sheet_strip12, 0.1);
			if animation_hit_frame(1) {
				//TODO: must have warning hitbox here :>
				warning_hitbox_is_active = true;
			}

			if animation_hit_frame(3) {
				warning_hitbox_is_active = false;
			}

			if animation_hit_frame(4){
				create_hitbox(x, y, self, s_death_mob_attack1_hitbox, 4, "death_mob_attack", 4,10, image_xscale, image_angle, direction);
			}
			if animation_end() {
				state = "idle";
				can_attack = false;
				alarm[0] = 60; //default = 120
			}
		} else {
			state_set_sprite(s_death_mob_idle_final_Sheet_strip4, 0.1);
			state = "idle";
		}

	#endregion
	break;

	case "knockback":
	#region Knockback	
		knockback_state(s_death_mob_knockback_temp_strip4, "chase");	
		if animation_hit_frame(1) {
			bs = instance_create_layer(x, y-23, layer-1, o_blood_splatter);
			bs.image_xscale = -image_xscale;
			bs.direction = direction	
		}	

	#endregion
	break;
}
