// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_camera_border_y(){
/// scr_get_camera_border_y()
// Custom function to get the y-coordinate of the camera viewport border
var border_y = view_yview[0]; // Initialize with the default view_yview value
if (view_yview[0] > 0) {
    border_y += view_hview[0]; // Adjust if the view is not at the room's top edge
}
return border_y;
}