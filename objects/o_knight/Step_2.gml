
//end step
if hp <= 0 {

	if o_Player.CONTRAST_HIT_MODE {
		layer_clear_fx("Instances");
		// layer_set_visible("grass_front_blur", true);
		// layer_set_visible("poles", true);
		// layer_set_visible("tree1", true);
		// layer_set_visible("tree2", true);
		// layer_set_visible("mountain1", true);
		// layer_set_visible("mountain2", true);

	}


	audio_play_sound(knife_stab31, 1, false);
	//audio_play_sound(choose(knife_stab, knife_stab31), 1, false);
	//audio_play_sound(choose(knife_stab31), 1, false);
	// if instance_exists(o_Player) and instance_exists(oCamera){
	// 	oCamera._xyshake = true;
	// 	var bs = instance_create_layer(x, y-23, layer, o_blood_splatter);
	// 	with(bs){

	// 		image_xscale = o_Player.image_xscale;
	// 		direction = o_Player.direction;

	// 	}
	// }
	var r_offset = 16;
	if o_Player.EXP_PARTICLE_MODE {
		randomize();
		
		repeat (exp_val){
			instance_create_layer(x+random_range(-r_offset, r_offset), y+random_range(-r_offset,-r_offset), "projectiles", o_experience);
		}	
	}


	
	
	if o_Player.GORE_MODE {
		repeat(100) {	
			blud = instance_create_layer(x, y, layer,oBlood);
			blud.x = other.x+random_range(-r_offset,r_offset);
			blud.y = other.y+random_range(0, 48);
			blud.direction = random(360);
		}
	} else {
		var bs = instance_create_layer(x, y-23, layer, o_blood_splatter);
		with(bs){

			image_xscale = o_Player.image_xscale;
			direction = o_Player.direction;

		}
	}

	death_sprite = instance_create_layer(x, y, "projectiles",death_hit_sprite);
	death_sprite.x = other.x;
	death_sprite.y = other.y-23;
	death_sprite.image_angle = random_angle;


	// knight_death_sprite_effect = instance_create_layer(x, y-23, "projectiles",o_knight_death_sprite_effect);
	// knight_death_sprite_effect.x = other.x;
	// knight_death_sprite_effect.y = other.y-23;
	




	oCamera.screenshake = 25;	
	oCamera.shakeDuration = 5;
	oCamera._xyshake = true;




	o_Player.lock_mode = false;
	o_Player.target_name = "none";
	o_Player.obj = noone;
	o_Player.obj_target = mouse_x;







	instance_destroy();
	//ds_grid_destroy(hp_grid);
}

