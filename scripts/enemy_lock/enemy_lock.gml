///@arg target
draw_self();
function enemy_lock(target){
			
		
		
		if input.right {
			move_n_collide(4, 0);
			sprite_index = s_run;
			image_speed = 1.5;
			//image_xscale = 1;
			if (target.x > x) image_xscale = 1 else image_xscale = -1;
			global.textz = "D";
		}

		if  input.left{
			move_n_collide(-4, 0);
			sprite_index = s_run;
			//image_xscale = -1;
			if (target.x > x) image_xscale = 1 else image_xscale = -1;
			global.textz = "A";
		}
			
		
		if not input.left && not input.right{
			sprite_index = s_idle;
			if (target.x > x) image_xscale = 1 else image_xscale = -1;
		}

		
		if input.dash {
			if input.right image_xscale = 1;
			if input.left image_xscale = -1;
			image_index = 0;
			global.textz = "SHIFT";
			state = "dash";
		}
			
		
		if input.attk{
			if on_air {
				if (target.x > x) hspeed = 0.1; else hspeed = -0.1;
				vspeed = -0.1 * jump_mod;
			}
			image_index = 0;
			global.textz = "J";
			state = "attk1";
		}
		
		if input.attk2 {
			if (target.x > x) image_xscale = 1 else image_xscale = -1;
			if on_air {
				vspeed = -0.1 * jump_mod;
			}
			image_index = 0;
			global.textz = "J";
			state = "attk1";
		}
		
		if input.high_attk{
			if on_air {
				state_set_sprite(s_low_time,0);
				if (target.x > x) image_xscale = 1 else image_xscale = -1;
				vspeed = -0.1 * jump_mod;
				enable_cancel_animation();
				state = "lowtime";
			} else {  
				state_set_sprite(s_high_time,0);
				if (target.x > x) image_xscale = 1 else image_xscale = -1;
				global.textz = "F";
				state = "hightime";
			}

		}
		
		if input.jump{
			if (place_meeting(x, y-sign(vspeed), obj_wall)){
				
					//y = (y div 32) * 32;
					vspeed = 0;	
					vspeed += grv;
					
			
			} else {
					vspeed = 0;
					vspeed = jump * jump_mod;
					global.textz = "SPACE";
					state = "jump";
			}

		}
}