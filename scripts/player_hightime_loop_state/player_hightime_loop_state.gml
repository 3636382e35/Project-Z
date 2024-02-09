// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hightime_loop_state(){
	//enable_cancel_animation();
	sprite_index = s_high_time_loop;
	image_speed = 2;
	//image_index = 0;
	//image_speed = 1;

	if input.high_attk_hold{
		if animation_hit_frame(0) or animation_hit_frame(2){
			 attack3_smoke_dust = instance_create_layer(x,y, layer, o_attack3_smoke_dust);
	       
	       attack3_smoke_dust.y = y;
	       attack3_smoke_dust.image_speed = slowMode ? 0.1 : 1;
	       // attack3_smoke_dust.image_speed = 1;
	       attack3_smoke_dust.depth = depth - 1;
	       attack3_smoke_dust.image_xscale = image_xscale * -1;


			create_hitbox(x,y,self,s_high_time_continous_loop_hitbox, 3,"hightime_loop",4,1.5,image_xscale, image_angle, direction);
			audio_play_sound(knife_slice_41231, 1, false);
		}
		loopAnimation(o_Player, 0, 3);
		if input.jump {
			state = "jump";
		}
	} else {
		state = "move";
		image_speed = 1.5;
	}
}