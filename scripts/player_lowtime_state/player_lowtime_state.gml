// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_lowtime_state(){
		//if !audio_is_playing(knife_slice_41231) audio_play_sound(knife_slice_41231, 1, false);
		//sprite_index = s_low_time;
		state_set_sprite(s_low_time, 0);
		if animation_hit_frame(1){
			create_hitbox(x,y,self, s_lowtime_effect_hitbox, 3, "lowtime",4, 5, image_xscale, image_angle, direction);
			audio_play_sound(knife_slice_41231, 1, false);
		}
		enable_cancel_animation();
		if animation_end() state = "move";
}