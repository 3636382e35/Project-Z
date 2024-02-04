
function restart_player_pos(){
	o_Player.x = xstart;
    o_Player.y = ystart;
	o_Player.vspeed = 0;
	o_Player.hspeed = 0;
	game_restart();
}