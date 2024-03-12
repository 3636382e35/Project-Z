event_inherited();

type = "Player";
input = instance_create_layer(0,0,layer, o_input);
ctrl = instance_create_layer(0,0,layer, oController);

SLOW_MODE = false; 
HP_ENABLED = true;
FULL_SCREEN_MODE = false;
GORE_MODE = true;
DEBUG_MODE = false; 
EXP_PARTICLE_MODE = true;
ANNOUNCER_MODE = false; 
CONTRAST_HIT_MODE = false;
ZOOM_LEVEL = ctrl.ZOOM_LEVEL;
VOLUME = 0;
charge_pressed = 0;
selected_charge_out = 0;

jce_dmg = 0;
jce_range = 500;

s_idle = s_idle_v2_Sheet__chromatic_with_outline_strip24;//
s_run = s_running_v2_Sheet_with_outline_strip4;//
s_atk1 = s_basic_attack1_v2_Sheet_chromatic_with_outline_strip4;//
s_atk2 = S_basic_attack_2_v2_Sheet_chromatic_with_outline_strip5;//
s_atk3 = S_basic_attack_3_1_v2_Sheet_chromatic_with_outline_strip8;//
s_dash_tracks = s_dash_tracks_Sheet_chromatic_strip10;//
s_jump = s_jump3_Sheet_with_outline_strip15; //
s_high_time = s_high_time_v2_Sheet_chromatic_with_outline_strip9; //
s_low_time = s_lowtime_Sheet_v2_chromatic_with_outline_strip6; //
s_high_time_loop = s_high_time_continous_loop_Sheet_chromatic_v2_with_outline_strip4; //
s_parry = s_sword_parry_Sheet_chromatic_with_outline_strip7;
s_sword_throw_on_air = s_sword_throw_on_air_Sheet_with_outline_strip6;
s_sword_throw_on_ground = s_sword_throw_on_ground_Sheet_with_outline_strip8;
s_sword_throw_spinning_projectile = sword_throw_spinning_projectile_Sheet_with_outline_strip4;
s_atk1_hitbox = s_basic_attack_1_hitbox_1; 
s_dash = s_dash2_v2_Sheet_strip10;
s_atk2_hitbox = s_basic_attack_2_hitbox;
s_atk3_hitbox = S_basic_attack_3_1_hitbox_v2_chromatic;
s_charge_hitbox = charged_attack_hitbox_Sheet_strip7;
s_player_lowtime_loop = s_lowtime_loop_chromatic_strip7;
s_player_lowtime_loop_hitbox = s_lowtime_loop_hitbox_strip7 

on_air = 0;
on_ground = 1

aim_dir = 0;
projectile_dist = 300;
fire_rate = 5;
can_fire = true;
projectile_speed = 80;

lock_mode = false;
obj_target = noone;
target_name = "none";
target = noone;

vspeed = 0;
hspeed = 0;
invincibility = false;
move_speed = 0;
grounded = 0;
jump = -10;
// can_jump = true;
// jump_timer = 0;
// jump_delay = 30;

jump_mod = 2; //default is 1.6
grv = 0.3; // //default is 0.2
vsp_max = 10;

can_attack = true;
input_delay = 0;
input_delay_max_sec = 200;

kills = 0;
level = 0;
experience = 0;
max_exp = 10;
strength = 5;

_id = self;
_input = "";

// Variables for combo timer
timer_max = 360;
comboMeter = 0;
timer = timer_max;
consecutiveKills = 0;
firstBloodPlayed = false;

state = "move";

//BELOW ARE EXPERIMENTAL
is_drawing = false;

// stateFree = function(){
// 		__hsp = (input.right - input.left) * __hspWalk;
// 		__vsp = __vsp + __grv;

// 		if __canJump-- > 0 and input.jump {
// 			__vsp = __vspJump;
// 		}

// 		if (place_meeting(x + __hsp, y, obj_wall)){ 
// 			while (abs(__hsp) > 0.1){
// 				__hsp *= 0.5;
// 				if (!place_meeting(x + __hsp, y, obj_wall)) x += __hsp;
// 			}
// 			__hsp = 0;
// 		}

// 		x += __hsp;

// 		if(place_meeting(x, y + __vsp, obj_wall)){
// 			if(__vsp > 0) __canJump = 10;
// 			while (abs(__vsp) > 0.1){
// 				__vsp *= 0.5;
// 				if(!place_meeting(x, y + __vsp, obj_wall)) y += __vsp;
// 			}
// 			__vsp = 0;
// 		}

// 		y += __vsp;

// } 
	
// stateAttack = function(){

// 		if !can_attack {
// 			sprite_index = 0;
// 			state = stateFree;
			
// 		}
// 		//if !audio_is_playing(sword_sound_2_36274) audio_play_sound(sword_sound_2_36274, 1, false);
// 		state_set_sprite(s_atk1, 0);
// 		if animation_hit_frame(0){
// 			audio_play_sound(sword_sound_2_36274, 1, false);
// 			create_hitbox(x,y,self, s_atk1_hitbox, 1, 4, 5, image_xscale, image_angle, direction);
// 		}

// 		if input.attk or input.attk2{
// 			state = stateAttack2;
// 		}
		
// 		if animation_end() state  = stateFree;


// }

// stateAttack2 = function(){
// 		if !audio_is_playing(mixkit_dagger_woosh_1487) audio_play_sound(mixkit_dagger_woosh_1487, 1, false);
// 		state_set_sprite(s_atk2, 0);
// 		if animation_hit_frame(0) create_hitbox(x,y,self, s_atk2_hitbox, 3, 4, 5, image_xscale, image_angle, direction);

// 		//input_delay = 0
// 		if animation_end() state  = stateFree;
// }
	
// stateDash = function(){
	
// 	if (!instance_exists(o_dash_trail2)){
// 			        // Create the trail object when dashing
  
// 			        	trail_instance = instance_create_layer(x, y, layer, o_dash_trail2); // Change "obj_trail" to the name of your trail object


// 			        //Set the position of the trail object to follow the player
// 			        	trail_instance.x = x;
// 			        	trail_instance.y = y;
// 			        	trail_instance.image_speed = 2.5;
// 						trail_instance.depth = depth - 1; 	


// 			        // Set the trail object's depth (if needed) to display behind the player
// 			         // Adjust this value as needed
// 			        // Other code for dash state...

// 			        // Check if dash animation is finished
// 			        // if (image_index >= image_number - 1){
// 			        //     state = "move"; // Change state to move or another appropriate state
// 			        // }
// 			}

// 			// if instance_exists(o_dash_trail2){
// 			// 	trail_instance.x = x;
// 			//     trail_instance.y = y;
// 			// 	trail_instance.depth = depth - 1; 	

// 			// }

// 			//enable_cancel_animation();
		
// 			sprite_index = s_dash;
// 			if animation_hit_frame(0){
// 				audio_play_sound(clean_fast_swooshaiff_14784, 1, false);
// 				create_hitbox(x,y,self, s_dash_tracks, 4, 4, 1, image_xscale, image_angle, direction);
// 			}

// 			if image_xscale == 1 { 
// 				trail_instance.image_xscale = 1;
// 				move_n_collide(20, 0);
// 				}
// 			if image_xscale == -1 { 
// 				trail_instance.image_xscale = -1;	
// 				move_n_collide(-20, 0);
			
// 			}

// 			if animation_end() {
			
// 				//instance_destroy(trail_instance);
// 				state = stateFree;
// 			}
// 	}
	
// stateCharge = function(){
// 		state_set_sprite(charged_attack_bodysword_movement_Sheet_strip3, 0);
// 		if lock_mode {
// 				if (obj_target > x) image_xscale = 1 else image_xscale = -1;
// 			} else {
// 				image_xscale = 1;
// 			}

// 		//enable_cancel_animation();
// 		if animation_hit_frame(0){
// 			check_charge_projectiles(target, image_xscale, selected_charge_out);
// 		}

// 		if animation_end(){
// 			state = stateFree;
// 		}

// }

// stateLowtimeAttack = function(){
	
// 			//if !audio_is_playing(knife_slice_41231) audio_play_sound(knife_slice_41231, 1, false);
// 		sprite_index = s_low_time;
// 		state_set_sprite(s_low_time, 0);
// 		if animation_hit_frame(1){
// 			create_hitbox(x,y,self, s_lowtime_effect_hitbox, 3, 4, 5, image_xscale, image_angle, direction);
// 			audio_play_sound(knife_slice_41231, 1, false);
// 		}
// 		//enable_cancel_animation();
// 		if animation_end() state = stateFree;



// }

// stateHightimeAttack = function(){
// 			//if !audio_is_playing(knife_slice_41231) audio_play_sound(knife_slice_41231, 1, false);
// 		sprite_index = s_high_time;
// 		state_set_sprite(s_high_time, 0);
// 		if animation_hit_frame(1) {
// 			create_hitbox(x,y,self, s_high_time_hitbox, 3, 4, 5, image_xscale, image_angle, direction);
// 			audio_play_sound(knife_slice_41231, 1, false);
// 		}
// 		//enable_cancel_animation();
// 		if animation_end() state = stateFree;
// }
	
// stateKnockback = function(){
// 	knockback_state(s_idle, stateFree);
// }	

	
// state = stateFree;
 
