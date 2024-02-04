// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function create_hitbox_parry(_x,_y, creator, sprite, hitbox_id, lifespan,  xscale, _angle, _dir){
	var hitbox_parry = instance_create_layer(_x, _y,"Instances", o_hitbox_parry);
	hitbox_parry.sprite_index = sprite;
	hitbox_parry.creator = creator;
	hitbox_parry.alarm[0] = lifespan;
	hitbox_parry.image_xscale = xscale;
	hitbox_parry.image_angle = _angle;
	hitbox_parry.direction = _dir;
	hitbox_parry.hitbox_id = hitbox_id;
}