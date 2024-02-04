// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hightime_state(){
		//if !audio_is_playing(knife_slice_41231) audio_play_sound(knife_slice_41231, 1, false);
		sprite_index = s_high_time;
		state_set_sprite(s_high_time, 0);



		if animation_hit_frame(1) {
			attack3_smoke_dust = instance_create_layer(x,y, layer, o_attack3_smoke_dust);
	       	attack3_smoke_dust.y = y;
	       	attack3_smoke_dust.image_speed = 1;
	       	attack3_smoke_dust.depth = depth - 1;
	       	attack3_smoke_dust.image_xscale = image_xscale * -1;
			create_hitbox(x,y,self, s_high_time_hitbox, 1, "hightime", 4, 5, image_xscale, image_angle, direction);
			audio_play_sound(knife_slice_41231, 1, false);
		}


		enable_cancel_animation();
		if animation_end(){
			if input.high_attk_hold {
				state = "hightime_loop";
			} else {
				state = "move";
			}


		}
}