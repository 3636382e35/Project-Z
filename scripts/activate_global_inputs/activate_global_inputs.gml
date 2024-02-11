// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function activate_global_inputs(){

	if input._debug_mode {
		DEBUG_MODE = !DEBUG_MODE;
	}

	if input.restart { 
		restart_player_pos(); 
	}

	if input.addEnemyDeath {
		//randomize();
		instance_create_layer(mouse_x,mouse_y,"Entities",o_death_mob);
	}

	if input.addEnemyKnight {
		//randomize();
		instance_create_layer(mouse_x,mouse_y,"Entities",o_knight);
	}
	
	if input.right_click or input.K{
		check_fire_projectile(target, image_angle, direction);
	}

	if (place_meeting(x, y-10, obj_wall)) {
		vspeed = 0;	
		vspeed += grv;		
		vspeed = clamp(vspeed, -2, 2);			
	}

	if keyboard_check(221){
		if VOLUME < 1 VOLUME += 0.01;
		audio_master_gain(VOLUME);
	}

	if keyboard_check(219){
		if VOLUME > 0 VOLUME -= 0.01;
		audio_master_gain(VOLUME);
	}
	
	if keyboard_check_pressed(vk_f12) {
		FULL_SCREEN_MODE = !FULL_SCREEN_MODE;
	}
	
	window_set_fullscreen(FULL_SCREEN_MODE);


	if keyboard_check_pressed(vk_lcontrol) {
		slowMode = !slowMode;
	}

	if slowMode {
		// game_set_speed(2222, gamespeed_microseconds);
		// show_debug_message("[DEBUG] SLOW MOTION ACTIVATED");
	} else {
		// game_set_speed(60, gamespeed_fps);
		// show_debug_message("[DEBUG] SLOW MOTION DEACTIVAED");
	}

	timer -= 1;

	if (timer <= 0) {
	    comboMeter = 0;
	    consecutiveKills = 0;
	    timer = timer_max;
	}

	if input.hold_l_key {
		if not instance_exists(o_charge_sprite) {
			charge_sprite = instance_create_layer(x + (8 * image_xscale), y-23, layer, o_charge_sprite);
		}
		
		if instance_exists(o_charge_sprite) {
		    charge_sprite.depth = depth - 1;
		    charge_sprite.x = x + (8 * image_xscale);
		    charge_sprite.y = y - 23;

		    if charge_sprite.image_index == 4 {
		        charge_pressed = 1;
		    }

		    if charge_sprite.image_index == 11 {
		        charge_pressed = 2;
		    }
		    
		    if charge_sprite.image_index >= 18 {
		        charge_pressed = 3;
		    }

		    if charge_pressed == 3 {
		    	loopAnimation(charge_sprite, 13, 19);
		    }
		}
	}


	if input.released {
		if charge_pressed == 1 {
			if on_air vspeed = -0.1 * jump_mod;
			jce_dmg = 10;
			state = "charge1";
		}

		if charge_pressed == 2 {
			if on_air vspeed = -0.1 * jump_mod;
			jce_dmg = 20;
			state = "charge1";
		}

		if charge_pressed == 3 {
			if on_air vspeed = -0.1 * jump_mod;
			jce_dmg = 30;
			state = "charge1";
		}
		
		selected_charge_out = charge_pressed;
		charge_pressed = 0;
		instance_destroy(o_charge_sprite);
		charge_sprite = noone;
	}



	var target_object_types = [o_knight, o_death_mob]; // Array containing object types

	if input.lock_mode {
	    if (lock_mode) {
	        // If locked, set target to mouse_x
	        target = mouse_x;
	    } else {
	        // If not locked, find the nearest object among specified types as the new target
	        var nearest_target = noone;
	        var nearest_distance = -1; // Initialize with a large value

	        for (var i = 0; i < array_length_1d(target_object_types); i++) {
	            var current_type = target_object_types[i];
	            var current_target = instance_nearest(x, y, current_type);

	            if (current_target != noone) {
	                var distance_to_target = point_distance(x, y, current_target.x, current_target.y);

	                if (nearest_target == noone || distance_to_target < nearest_distance) {
	                    nearest_target = current_target;
	                    nearest_distance = distance_to_target;
	                }
	            }
	        }

	        target = nearest_target;
	    }

	    lock_mode = !lock_mode; // Toggle lock mode
	}

	// Default values
	obj = noone;
	obj_target = mouse_x;
	target_name = "none";

	// Assigning values based on target existence
	if instance_exists(target) {
	    if (target != noone) {
	        obj = target;
	        obj_target = target.x;
	        target_name = string(target);
	    }
	}




}