function player_dash_state(target){
		enable_cancel_animation();
		speed = 0;
		sprite_index = s_dash;
    
		with(instance_create_depth(x, y, depth+1, o_eye_trail)){	
			sprite_index = other.sprite_index;
			image_xscale = other.image_xscale;
			// image_blend = c_dkgray;
			image_blend = c_purple;
			image_alpha = 0.45; //0.45
		}

		image_speed = 2;

		if animation_hit_frame(0){
			if on_air {
				magic_circle_instance_dash = instance_create_layer(x, y, layer, o_magic_circle_dash);
				magic_circle_instance_dash.x = x;
        magic_circle_instance_dash.y = y;
        magic_circle_instance_dash.image_speed = o_Player.SLOW_MODE ? 0.1 : 1; 
				magic_circle_instance_dash.depth = depth - 1;
				magic_circle_instance_dash.image_xscale = image_xscale;
			} else {
				dust_particles = instance_create_layer(x,y, layer, o_dash_dust_particles);
				dust_particles.x = x;
        dust_particles.y = y;
        dust_particles.image_speed = o_Player.SLOW_MODE ? 0.1 : 1; 
				dust_particles.depth = depth - 1;
				dust_particles.image_xscale = image_xscale;
			}

			// trail_instance = instance_create_layer(x, y, layer, o_dash_trail2); 
			// trail_instance.image_alpha = 1;
   //    trail_instance.x = x;
   //    trail_instance.y = y; //-5
   //    trail_instance.image_speed = 1;
			// trail_instance.depth = depth - 1;
			// trail_instance.image_xscale = image_xscale;

			audio_play_sound(clean_fast_swooshaiff_14784, 1, false);
		}

		if animation_hit_frame(1){
			create_hitbox(x,y,self, s_dash, 4, "dash",4, 1, image_xscale, image_angle, direction);
		}

		move_n_collide(20 * image_xscale, 0); //16

		if animation_end() {
			//instance_destroy(trail_instance);
			state = "move";
		}
}
