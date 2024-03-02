if not instance_exists(other) exit;
with (other) {
	experience += 1;
	if(experience >= max_exp){
		level += 1;
		experience = experience - max_exp;
		max_exp += max_exp;
		max_hp += 5;
		hp = max_hp;
		strength += 5;
	}
}
instance_destroy();