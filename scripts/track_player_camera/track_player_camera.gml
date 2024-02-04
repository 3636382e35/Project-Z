// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function track_player_camera(){
	
	if (x <= get_camera_border_x() || x >= room_width - get_camera_border_x() || y <= get_camera_border_y() || y >= room_height - get_camera_border_y()) {
    // Set new camera position to ensure the player is at the new bottom left corner
    view_xview[0] = max(0, min(room_width - view_wview[0], x - view_wview[0] / 2));
    view_yview[0] = max(0, min(room_height - view_hview[0], y - view_hview[0] / 2));
}
}
