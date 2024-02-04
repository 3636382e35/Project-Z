/// @description Insert description here
// You can write your code in this editor

var target_angle = 0;

var stiffness = 1/160;
var damping = 1/20;


var displacement = (target_angle - image_angle);

sway_speed += (stiffness * displacement);

sway_speed -= (damping * sway_speed);

image_angle += sway_speed;




var wind_direction = 1;
var gust_interval = 60;

if (x + timer) mod gust_interval == 0 {
	var rand = random_range(-0.5, 0.5);
	sway_speed += wind_direction + rand;
}



var actor = instance_place(x, y, o_Player);
if actor != noone {
	if actor.x != 0 {
		sway_speed = -actor.x * 2;
	}
}




