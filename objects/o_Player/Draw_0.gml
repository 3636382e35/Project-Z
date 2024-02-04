//DRAW EVENT FOR OBJECT PLAYER





/*
//for grappling shits
if active{
	draw_line(x,y, mouse_x, mouse_y);
	
}
*/


if o_Player.DEBUG_MODE {

	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);


}

// if sprite_index == s_parry {
// 	draw_text(x, y-50 , string(image_index));
// }


// draw_text(x, y-50 , "Consecutive Kills: " +string(consecutiveKills));
// draw_text(x, y-70 , "Timer: " +string(timer));

//draw_text(x, y-70 , "HP: " +string(hp));

draw_self();