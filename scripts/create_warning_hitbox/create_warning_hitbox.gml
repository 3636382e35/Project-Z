// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_warning_hitbox(_x,_y, creator, sprite,  hitbox_id,lifespan,  xscale, _angle, _dir){

	var warning_hitbox = instance_create_layer(_x, _y,"projectiles", o_warning_hitbox);
	//warning_hitbox.image_alpha = 0.1;
	warning_hitbox.sprite_index = sprite;
	warning_hitbox.creator = creator;
	warning_hitbox.alarm[0] = lifespan;
	warning_hitbox.image_xscale = xscale;
	warning_hitbox.image_angle = _angle;
	warning_hitbox.direction = _dir;
	warning_hitbox.hitbox_id = hitbox_id;




}