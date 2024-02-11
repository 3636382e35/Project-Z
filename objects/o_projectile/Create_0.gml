damage = 5;
range = 600;
owner_id = noone;
knockback_time = 5;

function projectile_die(){
	speed = 0;
	instance_destroy();
}

function projectile_collide_wall() {
	speed = 0;
	instance_change(o_projectile_explosion, false);

}