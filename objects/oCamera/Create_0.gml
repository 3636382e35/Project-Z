 /// @description Insert description here
// You can write your code in this editor



camWidth = view_wview[0];
camHeight = view_hview[0];
focus_speed = 50;


cam = view_camera[0];
cleft = camera_get_view_x(cam);
ctop = camera_get_view_y(cam);


//show_debug_message("camera view x : " + string(camWidth));
//show_debug_message("camera view y : " + string(camHeight));


if instance_exists(o_Player){

	follow = o_Player;

	xTo = x;
	yTo = y;

	_xyshake = false;


	//default screensha
	screenshake = 3; // Adjust the magnitude of screenshake
	shakeDuration = 3; // Adjust the duration of screenshake
	shakeTimer = 0;


	camera_to_player_speed = 40; //40 //the lower the value, the fastest the camera panned to player

}












