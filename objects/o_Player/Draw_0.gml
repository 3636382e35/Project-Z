if o_Player.DEBUG_MODE {
	if input.hold_l_key || state = "judgement_cut" {
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
		draw_set_alpha(0.5);
		// draw_circle_colour(x, y, jce_range, c_red, c_red, false)
		draw_set_alpha(1);
		draw_circle(x, y, jce_range, true)
	}

  if state = "lowtime_loop" {
    if instance_exists(target) {
      draw_line(x, y, target.x, target.y-23);
    }  
  }
}

if enable_grapple {
  if instance_exists(target) {
   draw_line(x, y, target.x, target.y-23); 
  } else {
    draw_line(x, y, mouse_x, mouse_y);
  }
}


// if sprite_index == s_parry {
// 	draw_text(x, y-50 , string(image_index));
// }

// draw_text(x, y-50 , "Consecutive Kills: " +string(consecutiveKills));
// draw_text(x, y-70 , "Timer: " +string(timer));
//draw_text(x, y-70 , "HP: " +string(hp));

draw_self();
