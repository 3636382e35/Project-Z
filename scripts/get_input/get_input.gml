function get_input(){

	// NOTE: USE https://cherrytree.at/misc/vk.htm for other keys

	lock_mode = keyboard_check_pressed(vk_tab);

 // debugging 
	addEnemyDeath = keyboard_check_pressed(ord("2"));
	addEnemyKnight = keyboard_check_pressed(ord("1"));
	_del = keyboard_check_pressed(vk_f2);

	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	dash = keyboard_check_pressed(vk_shift);

	parry = keyboard_check_pressed(ord("H"));
	hold_w = keyboard_check(ord("W"));
	hold_s = keyboard_check(ord("S"));

	high_attk = keyboard_check_pressed(ord("F"));
	sword_throw = keyboard_check_pressed(ord("C"));
	jump = keyboard_check_pressed(vk_space);
	restart = keyboard_check_pressed(ord("R"));
	tab = keyboard_check_pressed(vk_tab);

	hold_l_key = keyboard_check(ord("L"));
	released = keyboard_check_released(ord("L"));
	ctrl_hold = keyboard_check(vk_control);
	_debug_mode = keyboard_check_pressed(vk_f4);

	attk = mouse_check_button_pressed(mb_left); 
	grapple = keyboard_check_pressed(ord("I"));

	right_click = mouse_check_button_pressed(mb_right);
	K = keyboard_check_pressed(ord("K"));
	high_attk_hold = keyboard_check(ord("F"));

	attk2 = keyboard_check_pressed(ord("J"));
	holdW = keyboard_check(ord("W"));

}
