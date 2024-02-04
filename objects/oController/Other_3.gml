 //game end

var _width1 = window_get_width();
var _height1 = window_get_height();
var _zoom_level;

var _zoom_level = instance_exists(o_Player) ? o_Player.ZOOM_LEVEL : -5;

ini_open("conf.ini"); //open file

//WINDOW SIZE
ini_write_real("conf", "window_width_size",  _width1);
ini_write_real("conf", "window_heght_size", _height1);

//OBJECT PLAYER VARIABLES
ini_write_real("conf", "player_hp",  _player_hp);
ini_write_real("conf", "knight_hp",  _knight_hp);
ini_write_real("conf", "zoom_level",  _zoom_level);

ini_close(); //close file