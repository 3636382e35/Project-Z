///@arg _sprite
///@arg _state
///@arg _object
function knockback_state(_sprite, _state){

		state_set_sprite(_sprite,0);
		
		if other.image_xscale == -1 move_n_collide(knockback_speed, 0);
		else move_n_collide(-knockback_speed, 0);		
		knockback_speed = approach(knockback_speed,0,0.3);
		if knockback_speed == 0 {
			knockback_speed = 0;
			state = _state;
		}

}