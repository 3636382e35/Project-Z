// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_camera_border_x(){
var border_x = view_xview[0]; // Initialize with the default view_xview value
if (view_xview[0] > 0) {
    border_x += view_wview[0]; // Adjust if the view is not at the room's left edge
}
return border_x;
}