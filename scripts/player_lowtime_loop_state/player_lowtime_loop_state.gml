function player_lowtime_loop_state(){
	//enable_cancel_animation();
	// sprite_index = s_lowtime_loop_chromatic_strip_rescaled7119;
  show_debug_message("player_lowtime_loop_state");
  var target_dir;
  if instance_exists(target)
    // target_dir = point_direction(o_Player.x, o_Player.y, target.x, target.y);
    target_dir = point_direction(o_Player.x, o_Player.y, target.x, target.y);
  else
    target_dir = point_direction(o_Player.x, o_Player.y, o_Player.x + 5*image_xscale, o_Player.y + 10);

  // apply_gravity("lowtime_loop");

  // motion_add(point_direction(o_Player.x, o_Player.y, o_Player.x + 0.1*image_xscale, o_Player.y - 10), 1);
	sprite_index = s_player_lowtime_loop;
	image_speed = 1;

	var knockback = 1; //3
	var damage = 1.5
	var lifespan = 4; 

	if input.high_attk_hold{
		enable_cancel_animation();
    if animation_hit_frame(4) or animation_hit_frame(6){
      // NOTE: temporary speed for this animation is 2, can change later
      motion_add(target_dir, 2);
			create_hitbox(x,y,self,sprite_index,knockback,"hightime_loop",lifespan,damage,image_xscale, image_angle, direction);
			audio_play_sound(mixkit_dagger_woosh_1487, 1, false);
		}

		loopAnimation(o_Player, 4, 6);
		if on_ground state = "move";

		if input.jump {
			state = "jump";
		}

	} else {
		state = "move"
		image_speed = 1.5;
    speed = 0;
	}
}
