// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_input_states(obj_target, _angle, _dir){
		if input.jump {
      if can_jump {
        if lock_mode {
          //if (obj_target > x) hspeed = 0.1; else hspeed = -0.1;
          if (obj_target > x) image_xscale = 1 else image_xscale = -1;
        }
        if on_air {
              magic_circle_jump_instance = instance_create_layer(x, y, layer, o_magic_circle_jump)
              magic_circle_jump_instance.x = x;
                  magic_circle_jump_instance.y = y;
                  magic_circle_jump_instance.image_speed = 1;
              magic_circle_jump_instance.depth = depth - 1;
        }
        vspeed = 0;
        vspeed = jump * jump_mod;
        _input = "SPACE";
        state = "jump";
      }
    }
	
		if input.right {

			// image speed = SLOW_MODE ? -4.5 : 1.5;
			image_speed = 1.5;

			if  on_air {
				sprite_index = s_jump;
				if animation_hit_frame(6){
					loopAnimation(o_Player, 5, 6);
				}
			} else {
				sprite_index = s_run;
			}

			if lock_mode {
				if (obj_target > x) image_xscale = 1 else image_xscale = -1;
			} else {
				image_xscale = 1;
			}

			if input.ctrl_hold {
				image_speed = 0.5;
				move_n_collide(2, 0);
			} else {
				image_speed = 1.5;
				move_n_collide(4, 0);
			}

			for(var i=0; i < 5; i += 1){
				if i % 2 == 0 {
					if animation_hit_frame(i) and on_ground {
						randomize();
						audio_play_sound(choose(DIRT___Run_1, DIRT___Run_2, DIRT___Run_3, DIRT___Run_4, DIRT___Run_5, DIRT___Run_6,DIRT___Run_7,DIRT___Run_8), 1, false);
					}
				}
			}

			
			_input = "D";
		}

		if  input.left{
			
			if  on_air {
				sprite_index = s_jump;

				image_speed = 1.5;
				if animation_hit_frame(6){
					loopAnimation(o_Player, 5, 6);
				}
				
			} else {
				sprite_index = s_run;
				image_speed = 1.5;
			}

			if lock_mode {
				if (obj_target > x) image_xscale = 1 else image_xscale = -1;
			} else {
				image_xscale = -1;
			}
			
			if input.ctrl_hold {
				image_speed = 0.5;
				move_n_collide(-2, 0);
			} else {
				image_speed = 1.5;
				move_n_collide(-4, 0);
			}

			for(var i=0; i < 5; i += 1){
				if i % 2 == 0 {
					if animation_hit_frame(i) and on_ground {
						randomize();
						audio_play_sound(choose(DIRT___Run_1, DIRT___Run_2, DIRT___Run_3, DIRT___Run_4, DIRT___Run_5, DIRT___Run_6,DIRT___Run_7,DIRT___Run_8), 1, false);

					}
				}
			}
			_input = "A";
		}
			
		
		if not input.left && not input.right{
			if  on_air {
				sprite_index = s_jump;
				image_speed = 1.5;
				if animation_hit_frame(6){
					loopAnimation(o_Player, 5, 6);
				}
				
			} else {
				sprite_index = s_idle;

			}

			if lock_mode {
				if (obj_target > x) image_xscale = 1 else image_xscale = -1;
			}
		}

		if input.sword_throw and !instance_exists(o_spinning_sword_throw){
			state = "sword_throw";
		}	

		if input.parry {
			state = "parry";
		}
		
		if input.dash {
      if dash_counter >= 1 { 
        if input.right image_xscale = 1;
        if input.left image_xscale = -1;
        image_index = 0;
        _input = "SHIFT";
        state = "dash";
        dash_counter -= 1;
      }
		}
			
		
		if input.attk{

			vspeed = 0;

			if lock_mode {
				if (obj_target > x) image_xscale = 1 else image_xscale = -1;
			}

			if on_air {
				vspeed = -0.02;
			}
			image_index = 0;
			_input = "J";
			state = "attk1";
		}
		
		if input.attk2 {

			vspeed = 0;

			if lock_mode {
					//if (obj_target > x) hspeed = 0.02; else hspeed = -0.02;
					if (obj_target > x) image_xscale = 1 else image_xscale = -1;
			} else {
				if input.right image_xscale = 1;
				if input.left image_xscale = -1;
			}

			if on_air {
				
				vspeed = -0.02;
			}
			image_index = 0;
			_input = "J";
			state = "attk1";
		}
		
		if input.high_attk{
			image_speed = 1.5;
			vspeed = 0;

			if on_air {
				state_set_sprite(s_low_time,0);
				if lock_mode {
					//if (obj_target > x) hspeed = 0.02; else hspeed = -0.02;
					if (obj_target > x) image_xscale = 1 else image_xscale = -1;
				}
				vspeed = -0.02;
				hspeed = 0;
				enable_cancel_animation();
				state = "lowtime";
			} else {  
				state_set_sprite(s_high_time,0);
				_input = "F";
				state = "hightime";
			}
		}
}
