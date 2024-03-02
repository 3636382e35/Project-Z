
function apply_gravity(_state) {
	

    on_ground = place_meeting(x, y + 1, obj_wall);
    on_air = !on_ground && !place_meeting(x, y - 1, obj_wall);
	

    if (on_air) {
            state = _state;
            vspeed += grv;
            vspeed = clamp(vspeed, -3, 3);


         if(place_meeting(x, y + vspeed, obj_wall)){
             //if(vspeed > 0) __canJump = 10;
             while (abs(vspeed) > 0.1){
                 vspeed *= 0.5;
                 if(!place_meeting(x, y + vspeed, obj_wall)) y += vspeed;
             }
             vspeed = 0;
         }

         y += vspeed; 
    } else if (on_ground) {
		vspeed = 0;
		hspeed = 0;
        state = _state;
        y = (y div 32) * 32; // Snap to grid
    }



   


	
	
}