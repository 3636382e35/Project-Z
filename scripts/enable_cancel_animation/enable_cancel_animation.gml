function enable_cancel_animation(){
	if keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")){
			 state = "move";
			//state = stateFree;
		}
	
}