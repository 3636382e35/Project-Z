// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshake_camera(intensity, duration){
	if not instance_exists(oCamera) exit;
	with(oCamera){
		screenshake = intensity;
		alarm[3] = duration;
	}



}