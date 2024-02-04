// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function exp_gravity(grv){
    var on_ground = place_meeting(x, y + 1, obj_wall);
    var on_air = !on_ground && !place_meeting(x, y - 1, obj_wall);
	

    if (on_air) {
            vspeed += grv;
            vspeed = clamp(vspeed, -5, 5);


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
        //show_debug_message("onground");
		vspeed = 0;
		hspeed = 0;
        //y = (y div 32) * 32; // Snap to grid (Adjust this based on your needs)
    }
}