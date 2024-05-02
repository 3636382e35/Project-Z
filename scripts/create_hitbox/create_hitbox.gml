///@arg _x
///@arg _y
///@arg creator
///@arg sprite
///@arg knockback
///@arg hitbox_id
///@arg lifespan
///@arg damage
///@arg xscale
///@arg _agnle
///@arg _dir

function create_hitbox(_x,_y, creator, sprite, knockback, hitbox_id,lifespan, damage,  xscale, _angle, _dir){

	var hitbox = instance_create_layer(_x, _y,"Instances", o_hitbox);
	hitbox.sprite_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;
	hitbox.image_angle = _angle;
	hitbox.direction = _dir;
	hitbox.hitbox_id = hitbox_id;

}


//TODO: change the hitbox to this one
// var _inst = instance_place(x, y, obj_Enemy);
// if _inst != noone
// {
//     hp -= _inst.dmg;
//     instance_destroy(_inst);
// }
