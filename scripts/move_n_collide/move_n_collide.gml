///@arg a
///@arg b
///@arg 
/*
function move_n_collide(a, b, _object){
	if _object == o_knight{
		if not place_meeting(x+a, y, obj_wall) and not place_meeting(x+a, y, o_knight) x += a;
		if not place_meeting(x, y+b, obj_wall) and not place_meeting(x, y+b, o_knight) x += b;
	} else {
		if not place_meeting(x+a, y,obj_wall) x += a;
		if not place_meeting(x,y+b, obj_wall) y += b;
	}
	
}
*/

function move_n_collide(a, b){

		// if id == o_Player.id {

		// 	if not place_meeting(x+a, y,obj_wall) x += a;
		// 	if not place_meeting(x,y+b, obj_wall) y += b;

		// } else {
			
		// 	if not place_meeting(x+a, y,obj_wall) and not place_meeting(x+a, y,o_lifeform) x += a;
		// 	if not place_meeting(x,y+b, obj_wall) and not place_meeting(x,y+b, o_lifeform) y += b;
		// 	if not place_meeting(x,y-b, obj_wall) and not place_meeting(x,y-b, o_lifeform) y -= b;
		// }


			if not place_meeting(x+a, y,obj_wall) x += a;
			if not place_meeting(x,y+b, obj_wall) y += b;
		


	
}